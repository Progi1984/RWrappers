XIncludeFile "RW_Cheetah_Inc.pb"

  Global dbfHandle  .l        
  Global idxHandle  .l
  Global tagHandle1 .l
  Global tagHandle2 .l
  Global errcode    .l
  Global sData      .s
                           
  ; CREATE A DBASE COMPATIBLE DATABASE 
  sData = "disk  = Samples\Sample_02.dbf;"    
  sData + "type  = dbase;"            
  sData + "memosize = 512;"           ; always 512 for dBase style databases
  sData + "field = custid,c,8,0;"     ; character
  sData + "field = firstname,c,20,0;" ; character
  sData + "field = lastname,c,20,0;"  ; character
  sData + "field = amountdue,n,12,2;" ; numeric, 2 decimal places
  sData + "field = lastpymt,d,8,0;"   ; date
  sData + "field = isactive,l,1,0;"   ; logical y/n, t/f
  sData + "field = notes,m,10,0;"     ; dbase memos are always size 10 

  ; Create the actual database. A second file with a .dbt extension is
  ; created to hold the memo field text. If no fields were specified 
  ; with the Memo type then the .dbt would not be created.
  errcode = xdbCreateDatabase(sData) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Database created."
  
  
  ; CREATE THE INDEX FILE
  ; In Cheetah, the index file is simply a disk file. It holds one or
  ; more index "TAGS". The Tags are basically the information describing
  ; how the index should be sorted. It is the Tags that you use when
  ; specifying what order to iterate/move through a database.
  sData = "disk = Samples\Sample_02.btx;"  
  errcode = xdbCreateIndex(sData) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Index created"
  
  
  ; OPEN THE DATABASE 
  ; You must open the database and index prior to creating any TAGS. It
  ; is important that you track the ;handles; that are returned from
  ; these processes because it is those handles that you use from now
  ; on to refer to the database, index or Tag.
  sData = "disk=Samples\Sample_02.dbf"
  errcode = xdbOpenDatabase(sData, dbfHandle) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Database opened. Handle ="+ Str(dbfHandle)                  
                 

  ; OPEN THE INDEX
  sData = "disk=Samples\Sample_02.btx"
  errcode = xdbOpenIndex(sData, dbfHandle, @idxHandle) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Index opened. Handle ="+Str(idxHandle)                  

                                                          
                                                          
  ; CREATE TWO INDEX TAGS
  ; We will now create two Tags, each specifying how we want our
  ; main database to be indexed (we can create up to 100 Tags per
  ; index file).                          
  
  ; The first tag, CustId, is created based on the database field
  ; called CustId. We could name it something different if we
  ; wanted to (Tag names can be up to 10 characters long).
  
  ; The Expression is the actual field in the database that we
  ; want to index on. The expression can contain up to 6 different
  ; database fields (e.g. LNAME+FNAME)
  
  ; If UpperCase is set to TRUE then all keys added to the Tag 
  ; will be converted to uppercase. This is useful if you need to
  ; perform case insensitive seeks later.
  
  sData = "TagName=custid; Expression=custid; UpperCase=TRUE"
  errcode = xdbCreateTag(sData, idxHandle) 
  If errcode  : Debug "xdbCreateTag>"+Str(errcode): xdbShutdown():End :EndIf
  Debug "Tag 'custid' created"

  sData = "TagName=fullname; Expression=lastname+firstname; UpperCase=TRUE"
  errcode = xdbCreateTag(sData, idxHandle) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Tag 'fullname' created"


  ; GET THE TAG HANDLES
  ; In order to perform an operation such as moving through a database
  ; in sorted order, we need to retrieve the handle of the Tag that
  ; defines that sorted order.
  errcode = xdbGetTag("custid", idxHandle, tagHandle1) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Tag 'custid'. Handle ="+Str(tagHandle1)
      
  errcode = xdbGetTag("fullname", idxHandle, tagHandle2) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Tag 'fullname'. Handle ="+Str(tagHandle2)


  ; CLOSE THE DATABASE AND INDEX(ES)
  ; Closing the database will automatically close all indexes associated
  ; with it. The xdbShutDown command will also close the databases and
  ; indexes if you fail to remember to close them prior to the program ending.
  errcode = xdbCloseDatabase(dbfHandle) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Database and index closed."
  
  ; SHUTDOWN THE SYSTEM (This will close files and free internal allocated memory)
  xdbShutdown()

  Debug "Demo Completed"

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 78
; FirstLine = 48
; Folding = --