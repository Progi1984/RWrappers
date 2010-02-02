XIncludeFile "RW_Cheetah_Inc.pb"

Structure CUSTOMER_TYPE
   deleted   .s{1}
   custid    .s{8}
   firstname .s{20}
   lastname  .s{20}
   amountdue .s{12}
   lastpymt  .s{8}
   isactive  .s{1}
   notes     .s{10}
EndStructure


  
   Global dbfHandle  .l        
   Global idxHandle  .l
   Global tagHandle1 .l
   Global tagHandle2 .l
   Global errcode    .l
   Global sData      .s
   Global cust       .CUSTOMER_TYPE
                            
   ; CREATE A DBASE COMPATIBLE DATABASE 
   sData = "disk  = Samples\Sample_08.dbf;"    
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
   
   sData = "disk = Samples\Sample_08.btx;"  
   errcode = xdbCreateIndex(sData) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Index created"
   
   sData = "disk=Samples\Sample_08.dbf"
   errcode = xdbOpenDatabase(sData, dbfHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Database opened. Handle ="+Str(dbfHandle)                  
                  
   sData = "disk=Samples\Sample_08.btx"
   errcode = xdbOpenIndex(sData, dbfHandle, @idxHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Index opened. Handle ="+Str(idxHandle)                  

   sData = "TagName=custid; Expression=custid; UpperCase=TRUE"
   errcode = xdbCreateTag(sData, idxHandle) 
   If errcode  : Debug "xdbCreateTag>"+Str(errcode):xdbShutdown():End :EndIf
   Debug "Tag ;custid; created"

   sData = "TagName=fullname; Expression=lastname+firstname; UpperCase=TRUE"
   errcode = xdbCreateTag(sData, idxHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Tag ;fullname; created"

   
   ; ADD RECORDS TO THE DATABASE
   ; We must clear the existing record buffer prior to adding a 
   ; new record.
   xdbClearBuffer(dbfHandle)
   
   ; Set the values for some of the database fields. 
   cust\custid    = "1000"
   cust\firstname = "Paul"
   cust\lastname  = "Squires"
   cust\amountdue = "199.95"    ; numeric fields must be right aligned
   cust\lastpymt  = "20061231"
   cust\isactive  = "T"
   
   ; You must use the xdbSetField for all fields of Memo type.
   xdbSetField(dbfHandle, "notes", 0, "This Is my note For record 1")
   
   ; Pass the entire TYPE to the xdbPutRecord function. We do this
   ; by passing the memory address of the TYPE variable.
   errcode = xdbPutRecord(dbfHandle, 0, @cust)
   If errcode  : xdbShutdown():End :EndIf
   Debug "Record added, index/tag updated."
      
      
   ; ADD A SECOND RECORD
   xdbClearBuffer(dbfHandle)
   
   cust\custid    = "2000"
   cust\firstname = "Bill"
   cust\lastname  = "Smith"
   cust\amountdue = "500.00"    ; numeric fields must be right aligned
   cust\lastpymt  = "20050930"
   cust\isactive  = "T"
   
   ; You must use the xdbSetField for all fields of Memo type.
   xdbSetField(dbfHandle, "notes", 0, "This Is my note For record 2")

   errcode = xdbPutRecord(dbfHandle, 0, @cust)
   If errcode  : xdbShutdown():End :EndIf
   Debug "Record added, index/tag updated."


   ; ADD A THIRD RECORD
   xdbClearBuffer(dbfHandle)
   
   cust\custid    = "1500"
   cust\firstname = "Mary"
   cust\lastname  = "Beckworth"
   cust\amountdue = "0.00"    ; numeric fields must be right aligned
   cust\lastpymt  = "20060115"
   cust\isactive  = "T"
   
   ; You must use the xdbSetField for all fields of Memo type.
   xdbSetField(dbfHandle, "notes", 0, "This Is my note For record 3")

   errcode = xdbPutRecord(dbfHandle, 0, @cust)
   If errcode  : xdbShutdown():End :EndIf
   Debug "Record added, index/tag updated."

   
   ; GET RECORD #2, MAKE A CHANGE, UPDATE THE DATABASE
   errcode = xdbGetRecord(dbfHandle, 2, @cust) 
   If errcode  : xdbShutdown():End :EndIf
   ; Change the CustId. This is a Tag index field so the correspnding
   ; index tag will also update its key.
   cust\Custid = "1555"
   errcode = xdbPutRecord(dbfHandle, 2, @cust) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Record #2 updated."
   

   ; CLOSE THE DATABASE AND INDEX(ES)
   errcode = xdbCloseDatabase(dbfHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Database and index closed."
   
   ; SHUTDOWN THE SYSTEM (This will close files and free internal allocated memory)
   xdbShutdown()

   Debug "Demo Completed"

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 49
; FirstLine = 56