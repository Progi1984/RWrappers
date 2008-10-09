XIncludeFile "RW_Cheetah_Inc.pb"

  Global errcode.l
  Global sData.s
   sData = "disk  = Samples\Sample_00_DBASE.dbf;"      
   sData + "type  = dbase;"            
   sData + "memosize = 512;"                ; always 512 for dBase style databases
   sData + "field = custid,c,8,0;"          ; character
;    sData + "field = custname,c,30,0;"       ; character
;    sData + "field = amountdue,n,12,2;"      ; numeric, 2 decimal places
;    sData + "field = lastpymt,d,8,0;"        ; date
;    sData + "field = isactive,l,1,0;"        ; logical y/n, t/f
;    sData + "field = notes,m,10,0;"          ; dbase memos are always size 10 

   ; Create the actual database. A second file with a .dbt extension is
   ; created to hold the memo field text. If no fields were specified 
   ; with the Memo type then the .dbt would not be created.
   errcode = xdbCreateDatabase(sData)
   Debug errcode
   Debug "dBase database created."

   sData = "disk  = Samples\Sample_00_FOXPRO.dbf;"     
   sData + "type  = foxpro;"           
   sData + "memosize = 64;"                 
   sData + "field = custid,c,8,0;"         ; character
   sData + "field = custname,c,30,0;"      ; character
   sData + "field = amountdue,y,8,0;"      ; currency type
   sData + "field = lastpymt,t,8,0;"       ; datetime type
   sData + "field = isactive,l,1,0;"       ; logical y/n, t/f
   sData + "field = notes,m,4,0;"          ; FoxPro memos are always size 4

   ; Create the actual database. A second file with a .fpt extension is
   ; created to hold the memo field text. If no fields were specified 
   ; with the Memo type then the .fpt would not be created.
   errcode = xdbCreateDatabase( sData ) 
   Debug errcode
   Debug "FoxPro database created."
   ; SHUTDOWN THE SYSTEM (This will close files and free internal allocated memory)
   xdbShutdown()

   Debug "Demo Completed"

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 21
; Folding = -