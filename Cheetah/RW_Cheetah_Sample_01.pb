XIncludeFile "RW_Cheetah_Inc.pb"

Declare DisplayRecords(dbfHandle.l, idxHandle.l, tagHandle1.l) 


  Global dbfHandle  .l        
  Global idxHandle  .l
  Global tagHandle1 .l
  Global tagHandle2 .l
  Global errcode    .l
  Global sData      .s
  Global nRecNum    .l
                          
  ; CREATE A DBASE COMPATIBLE DATABASE 
  sData = "disk  = Samples\Sample_01.dbf;"
  sData + "type  = dbase;"
  sData + "memosize = 512;"                ; always 512 for dBase style databases
  sData + "field = custid,c,8,0;"          ; character
  sData + "field = firstname,c,20,0;"      ; character
  sData + "field = lastname,c,20,0;"       ; character
  sData + "field = amountdue,n,12,2;"      ; numeric, 2 decimal places
  sData + "field = lastpymt,d,8,0;"        ; date
  sData + "field = isactive,l,1,0;"        ; logical y/n, t/f
  sData + "field = notes,m,10,0;"          ; dbase memos are always size 10 
  
  ; Create the actual database. A second file with a .dbt extension is
  ; created to hold the memo field text. If no fields were specified 
  ; with the Memo type then the .dbt would not be created.
  errcode = xdbCreateDatabase(sData) 
  If errcode
    xdbShutdown():End
  EndIf
  Debug "Database created."

  ; CREATE THE INDEX FILE
  ; In Cheetah, the index file is simply a disk file. It holds one or
  ; more index "TAGS". The Tags are basically the information describing
  ; how the index should be sorted. It is the Tags that you use when
  ; specifying what order to iterate/move through a database.
  sData = "disk=Samples\Sample_01.btx;"  
  errcode = xdbCreateIndex(sData) 
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Index created"
  
  ; OPEN THE DATABASE
  ; You must open the database and index prior to creating any TAGS. It is important that you track the 
  ; handles that are returned from these processes because it is those handles that you use from now on to 
  ; refer To the database, index Or Tag.
  sData = "disk=Samples\Sample_01.dbf;"
  errcode = xdbOpenDatabase(sData, @dbfHandle)
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Database opened. Handle = "+ Str(dbfHandle)
                  
  ; OPEN THE INDEX
  sData = "disk=Samples\Sample_01.btx;"
  errcode = xdbOpenIndex(sData, dbfHandle, @idxHandle)
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Index opened. Handle = "+Str(idxHandle)

  ; CREATE TWO INDEX TAGS
  ; We will now create two Tags, each specifying how we want our main database to be indexed (we can create 
  ; up To 100 Tags per index file). 
  ; The first tag, CustId, is created based on the database field called CustId. We could name it something
  ; different If we  wanted To (Tag names can be up To 10 characters long). 
  ; The Expression is the actual field in the database that we want To index on. The expression can contain 
  ; up To 6 different database fields (e.g. LNAME+FNAME ). 
  ; If UpperCase is set To TRUE then all keys added To the Tag will be converted To uppercase. This is 
  ; useful If you need To perform Case insensitive seeks later.
  
  sData   = "TagName=custid;Expression=custid;UpperCase=TRUE;"
  errcode = xdbCreateTag(sData, idxHandle)
  If errcode
    Debug "xdbCreateTag>"+Str(errcode)
    xdbShutdown():End
  EndIf
  Debug "Tag 'custid' created"

  sData   = "TagName=fullname; Expression=lastname+firstname; UpperCase=TRUE;"
  errcode = xdbCreateTag(sData, idxHandle) 
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Tag 'fullname' created"

  ; We need to retrieve the Tag handle and feed that value to the move functions.
  errcode = xdbGetTag("custid", idxHandle, tagHandle1) 
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf

  ; // ADD RECORDS TO THE DATABASE
  ; We must clear the existing record buffer prior to adding a new record.
  xdbClearBuffer(dbfHandle)
  
  ; Set the values for some of the database fields. 
  xdbSetField(dbfHandle, "custid",    0, "1000")
  xdbSetField(dbfHandle, "firstname", 0, "Paul")
  xdbSetField(dbfHandle, "lastname",  0, "Squires")
  xdbSetField(dbfHandle, "amountdue", 0, "199.95")
  xdbSetField(dbfHandle, "lastpymt",  0, "20061231")
  xdbSetField(dbfHandle, "isactive",  0, "T")          ; True
  xdbSetField(dbfHandle, "notes",     0, "This is my note for record 1")
  
  ; Add the record to the database. The index Tags are automatically
  ; updated based on the database field values. When adding the record,
  ; we use a value of 0 for the record number. This tells Cheetah to
  ; append the record at the end of the database.
  errcode = xdbPutRecord(dbfHandle, 0)
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Record added, index/tag updated."
      
   ; // ADD A SECOND RECORD
  xdbClearBuffer(dbfHandle)
  
  xdbSetField(dbfHandle, "custid",    0, "2000")
  xdbSetField(dbfHandle, "firstname", 0, "Bill")
  xdbSetField(dbfHandle, "lastname",  0, "Smith")
  xdbSetField(dbfHandle, "amountdue", 0, "500.00")
  xdbSetField(dbfHandle, "lastpymt",  0, "20050930")
  xdbSetField(dbfHandle, "isactive",  0, "T")          ; True
  xdbSetField(dbfHandle, "notes",     0, "This is my note for record 2")
   
  errcode = xdbPutRecord(dbfHandle, 0)
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Record added, index/tag updated."

  ; // ADD A THIRD RECORD
  xdbClearBuffer(dbfHandle)
  
  xdbSetField(dbfHandle, "custid",    0, "1500")
  xdbSetField(dbfHandle, "firstname", 0, "Mary")
  xdbSetField(dbfHandle, "lastname",  0, "Beckworth")
  xdbSetField(dbfHandle, "amountdue", 0, "0.00")
  xdbSetField(dbfHandle, "lastpymt",  0, "20060115")
  xdbSetField(dbfHandle, "isactive",  0, "T")          ; True
  xdbSetField(dbfHandle, "notes",     0, "This is my note for record 3")
            
  errcode = xdbPutRecord(dbfHandle, 0)
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Record added, index/tag updated."
                             
  DisplayRecords(dbfHandle, idxHandle, tagHandle1)
                             
                               
  ; // UPDATE THE FIRST RECORD 
  ; Update by changing the custid field value. This will automatically
  ; update the related CustId index tag.
  errcode = xdbGetRecord(dbfHandle, 1)
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf

  xdbSetField(dbfHandle, "custid",   0, "1700")
   
  errcode = xdbPutRecord( dbfHandle, 1 )
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "First Record updated, index/tag updated."

  DisplayRecords(dbfHandle, idxHandle, tagHandle1)
                             
                             
  ; // CLOSE THE DATABASE AND INDEX(ES)
  ; Closing the database will automatically close all indexes associated
  ; with it. The xdbShutDown command will also close the databases and
  ; indexes if you fail to remember to close them prior to the program ending.
  errcode = xdbCloseDatabase(dbfHandle) 
  If errcode
    Debug errcode
    xdbShutdown():End
  EndIf
  Debug "Database and index closed."

  Procedure DisplayRecords(dbfHandle.l, idxHandle.l, tagHandle1.l)
    Protected st1.s
    Protected st2.s
    Protected st3.s
    Protected nRecNum.l 
    Protected errcode.l
   
    Debug "Move through database based on CustId Tag"
    errcode = xdbMove(dbfHandle, tagHandle1, #XDB_MOVEFIRST, nRecNum)
      
    While errcode = 0   ; loop until end of file reached or error
      errcode = xdbGetRecord(dbfHandle, nRecNum)
      If errcode
        xdbShutdown():End
      EndIf       
      ; Bypass any deleted records
      If Not xdbIsDeleted(dbfHandle)
         xdbGetField(dbfHandle, "custid",    0, #True, st1)
         xdbGetField(dbfHandle, "lastname",  0, #True, st2)
         xdbGetField(dbfHandle, "firstname", 0, #True, st3)
         
         Debug st1+"-"+st2+", "+st3
      EndIf
      ; You can use the %XDB_MOVENEXT_ATOMIC move ONLY if you know
      ; that the most previous inkey key position has not changed. A %XDB_MOVENEXT
      ; performs a seek prior to doing the move to the next key. The %XDB_MOVENEXT_ATOMIC
      ; does not do the seek and assumes that the key position is valid. 
      errcode = xdbMove(dbfHandle, tagHandle1, #XDB_MOVENEXT_ATOMIC, nRecNum)
      
      ;errcode = xdbMove( dbfHandle, tagHandle1, XDB_MOVENEXT, nRecNum )
    Wend
  EndProcedure


; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 52
; FirstLine = 24
; Folding = +