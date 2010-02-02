XIncludeFile "RW_Cheetah_Inc.pb"

   Global dbfHandle  .l       
   Global idxHandle  .l
   Global tagHandle1 .l
   Global tagHandle2 .l
   Global errcode    .l
   Global nRecNum    .l
   Global sData      .s
   Global sLookfor   .s
                            
   ; CREATE A DBASE COMPATIBLE DATABASE 
   sData = "disk  = Samples\Sample_06.dbf;"    
   sData + "type  = dbase;"            
   sData + "memosize = 512;"           ; always 512 for dBase style databases
   sData + "field = custid,c,8,0;"     ; character
   sData + "field = firstname,c,20,0;" ; character
   sData + "field = lastname,c,20,0;"  ; character
   sData + "field = amountdue,n,12,2;" ; numeric, 2 decimal places
   sData + "field = lastpymt,d,8,0;"   ; date
   sData + "field = isactive,l,1,0;"   ; logical y/n, t/f
   sData + "field = notes,m,10,0;"     ; dbase memos are always size 10 

   errcode = xdbCreateDatabase(sData) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Database created."

   sData = "disk = Samples\Sample_06.btx;"  
   errcode = xdbCreateIndex(sData) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Index created"
   
   sData = "disk=Samples\Sample_06.dbf"
   errcode = xdbOpenDatabase(sData, dbfHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Database opened. Handle ="+Str(dbfHandle)                  
                  
   sData = "disk=Samples\Sample_06.btx"
   errcode = xdbOpenIndex(sData, dbfHandle, @idxHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Index opened. Handle ="+Str(idxHandle)                  

   sData = "TagName=custid; Expression=custid; UpperCase=TRUE"
   errcode = xdbCreateTag(sData, idxHandle) 
   If errcode  :Debug "xdbCreateTag>"+Str(errcode): xdbShutdown():End :EndIf
   Debug "Tag ;custid; created"

   sData = "TagName=fullname; Expression=lastname+firstname; UpperCase=TRUE"
   errcode = xdbCreateTag(sData, idxHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Tag ;fullname; created"


   ; ADD RECORDS TO THE DATABASE
   xdbClearBuffer(dbfHandle)
   
   xdbSetField(dbfHandle, "custid",    0, "1000")
   xdbSetField(dbfHandle, "firstname", 0, "Paul")
   xdbSetField(dbfHandle, "lastname",  0, "Squires")
   xdbSetField(dbfHandle, "amountdue", 0, "199.95")
   xdbSetField(dbfHandle, "lastpymt",  0, "20061231")
   xdbSetField(dbfHandle, "isactive",  0, "T")          ; True
   xdbSetField(dbfHandle, "notes",     0, "This is my note for record 1")
   
   errcode = xdbPutRecord(dbfHandle, 0)
   If errcode  : xdbShutdown():End :EndIf
   Debug "Record added, index/tag updated."
      
      
   ; ADD A SECOND RECORD
   xdbClearBuffer(dbfHandle)
   
   xdbSetField(dbfHandle, "custid",    0, "2000")
   xdbSetField(dbfHandle, "firstname", 0, "Bill")
   xdbSetField(dbfHandle, "lastname",  0, "Smith")
   xdbSetField(dbfHandle, "amountdue", 0, "500.00")
   xdbSetField(dbfHandle, "lastpymt",  0, "20050930")
   xdbSetField(dbfHandle, "isactive",  0, "T")          ; True
   xdbSetField(dbfHandle, "notes",     0, "This is my note for record 2")
   
   errcode = xdbPutRecord(dbfHandle, 0)
   If errcode  : xdbShutdown():End :EndIf
   Debug "Record added, index/tag updated."


   ; ADD A THIRD RECORD
   xdbClearBuffer(dbfHandle)
   
   xdbSetField(dbfHandle, "custid",    0, "1500")
   xdbSetField(dbfHandle, "firstname", 0, "Mary")
   xdbSetField(dbfHandle, "lastname",  0, "Beckworth")
   xdbSetField(dbfHandle, "amountdue", 0, "0.00")
   xdbSetField(dbfHandle, "lastpymt",  0, "20060115")
   xdbSetField(dbfHandle, "isactive",  0, "T")          ; True
   xdbSetField(dbfHandle, "notes",     0, "This is my note for record 3")
   
   errcode = xdbPutRecord(dbfHandle, 0)
   If errcode  : xdbShutdown():End :EndIf
   Debug "Record added, index/tag updated."

   

   ; PERFORM SEEKS ON THE TAGS
   ; In order to get an exact match for the seek you must pass a search
   ; key in the same size as the field(s) in the database. For example,
   ; The CustId field is 8 characters wide. For an exact match, you
   ; must pass a character string 8 characters wide containing the value
   ; that you want to match.
   errcode = xdbGetTag("custid", idxHandle, tagHandle1) 
   If errcode  : xdbShutdown():End :EndIf
   
   Debug ""
   sLookfor = Space(xdbGetFieldLength(dbfHandle, "custid", 0))
   sLookfor = "1500" 
   
   errcode = xdbSeek(tagHandle1, sLookfor, nRecNum)   ; exact match
   
   ; The xdbSeek will return one of three error codes signifying
   ; the type of match achieved.
   ; ERR_SEEKNOMATCH      
   ; ERR_SEEKEXACTMATCH   
   ; ERR_SEEKPARTIALMATCH 
   Select errcode 
      Case #ERR_SEEKNOMATCH      
         Debug "No match for "+sLookfor+ " in Tag:custid"
      Case #ERR_SEEKEXACTMATCH   
         Debug "Exact match for "+ sLookfor+ " in Tag:custid at RecNum"+Str(nRecNum)
      Case #ERR_SEEKPARTIALMATCH 
         Debug "Partial match for "+ sLookfor+" in Tag:custid at RecNum"+Str(nRecNum)
   EndSelect   
        
        
   sLookfor = "99999999" 
   errcode = xdbSeek(tagHandle1, sLookfor, nRecNum)   ; no match
   Select errcode 
      Case #ERR_SEEKNOMATCH      
         Debug "No match for "+sLookfor+ " in Tag:custid"
      Case #ERR_SEEKEXACTMATCH   
         Debug "Exact match for "+sLookfor+" in Tag:custid at RecNum"+Str(nRecNum)
      Case #ERR_SEEKPARTIALMATCH 
         Debug "Partial match for "+sLookfor+" in Tag:custid at RecNum"+Str(nRecNum)
   EndSelect   
        
        
   errcode = xdbSeek(tagHandle1, "150", nRecNum)  ; partial match
   Select errcode 
      Case #ERR_SEEKNOMATCH      
         Debug "No match for 150 in Tag:custid"
      Case #ERR_SEEKEXACTMATCH   
         Debug "Exact match for 150 in Tag:custid at RecNum"+Str(nRecNum)
      Case #ERR_SEEKPARTIALMATCH 
         Debug "Partial match for 150 in Tag:custid at RecNum"+Str(nRecNum)
   EndSelect                        
   Debug ""

   
   ; GET THE TAG HANDLES
       
  errcode = xdbGetTag("fullname", idxHandle, tagHandle2) 
  If errcode  : xdbShutdown():End :EndIf
  Debug "Tag ;fullname;. Handle ="+Str(tagHandle2)

   


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

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 37
; FirstLine = 9