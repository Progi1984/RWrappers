XIncludeFile "RW_Cheetah_Inc.pb"

   Global dbfHandle  .l        
   Global idxHandle  .l
   Global tagHandle1 .l
   Global tagHandle2 .l
   Global errcode    .l
   Global nRecNum    .l
   Global sData      .s
   Global st1        .s
   Global st2        .s
   Global st3        .s
                            
   ; CREATE A DBASE COMPATIBLE DATABASE 
   sData = "disk  = dbasetest.dbf;"    
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
   
   sData = "disk = dbasetest.btx;"  
   errcode = xdbCreateIndex(sData) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Index created"
   
   sData = "disk=dbasetest.dbf"
   errcode = xdbOpenDatabase(sData, dbfHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Database opened. Handle ="+Str(dbfHandle)                  
                  
   sData = "disk=dbasetest.btx"
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

   
   ; MOVE THROUGH THE DATABASE IN SORTED ORDER
   ; We need to retrieve the Tag handle and feed that value to
   ; the move functions.
   errcode = xdbGetTag("custid", idxHandle, tagHandle1) 
   If errcode  : xdbShutdown():End :EndIf

   Debug ""
   Debug "Move through database based on CustId Tag"
   errcode = xdbMove(dbfHandle, tagHandle1, #XDB_MOVEFIRST, nRecNum)
      
   While errcode = 0   ; loop until end of file reached or error
      errcode = xdbGetRecord(dbfHandle, nRecNum)
      If errcode  : xdbShutdown():End :EndIf

      ; Bypass any deleted records
      If Not xdbIsDeleted(dbfHandle)
        xdbGetField(dbfHandle, "custid",    0, #True, st1)
        xdbGetField(dbfHandle, "lastname",  0, #True, st2)
        xdbGetField(dbfHandle, "firstname", 0, #True, st3)
        Debug st1+"-"+ st2+", "+st3
      EndIf
      ; You can use the XDB_MOVENEXT_ATOMIC move ONLY if you know
      ; that the most previous inkey key position has not changed. A XDB_MOVENEXT
      ; performs a seek prior to doing the move to the next key. The XDB_MOVENEXT_ATOMIC
      ; does not do the seek and assumes that the key position is valid. 
      errcode = xdbMove(dbfHandle, tagHandle1, #XDB_MOVENEXT_ATOMIC, nRecNum)
      ;errcode = xdbMove(dbfHandle, tagHandle1, #XDB_MOVENEXT, nRecNum)
   Wend

   errcode = xdbGetTag("fullname", idxHandle, tagHandle2) 
   If errcode  : xdbShutdown():End :EndIf

   Debug ""
   Debug "Move through database based on FullName Tag"
   errcode = xdbMove(dbfHandle, tagHandle2, #XDB_MOVEFIRST, nRecNum)
      
   While errcode = 0   ; loop until end of file reached or error
       
      errcode = xdbGetRecord(dbfHandle, nRecNum)
      If errcode  : xdbShutdown():End :EndIf
      
      ; Bypass any deleted records
      If Not xdbIsDeleted(dbfHandle) 
         xdbGetField(dbfHandle, "custid",    0, #True, st1)
         xdbGetField(dbfHandle, "lastname",  0, #True, st2)
         xdbGetField(dbfHandle, "firstname", 0, #True, st3)
         
         Debug st2+", "+st3+"-"+st1
      EndIf
       
      errcode = xdbMove(dbfHandle, tagHandle2, #XDB_MOVENEXT_ATOMIC, nRecNum)
   Wend
   Debug ""

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
; CursorPosition = 46
; FirstLine = 18
; Folding = ----