XIncludeFile "RW_Cheetah_Inc.pb"

  Declare DisplayRecords()

   Global idxHandle .l
   Global tagHandle1 .l
   
   Global errcode   .l
   Global sData     .s
   Global sKey      .s
   Global nRecNum   .l
   Global NumRead   .l
                            
   sData = "disk = standalone.btx;"  
   errcode = xdbCreateIndex(sData) 
   If errcode  : xdbShutdown():End :EndIf

   ; In order to use the index without an associated database, you
   ; must specify the "NoDatabase" property and set it to "TRUE".
   sData = "disk=standalone.btx; nodatabase=true;" 
   errcode = xdbOpenIndex(sData, 0, @idxHandle) 
   If errcode  : xdbShutdown():End :EndIf
   Debug "Create/open index. Handle:"+Str(idxHandle)
   

   ; CREATE AN INDEX TAG
   ; When you create a Tag, it is your responsibility to specify
   ; the size of the keys.
   sData = "TagName=scores; Size=20; Uppercase=TRUE"
   errcode = xdbCreateTag(sData, idxHandle) 
   If errcode  : xdbShutdown():End :EndIf

   errcode = xdbGetTag("scores", idxHandle, @tagHandle1) 
   If errcode  : xdbShutdown():End :EndIf

   Debug "GetTag. 'Scores' Handle:"+Str(tagHandle1)
   
   
   ; ADD INDEX KEYS //         
   If xdbAddKey(tagHandle1, "Paul",   100) : xdbCloseIndex(idxHandle):xdbShutdown():End: EndIf
   If xdbAddKey(tagHandle1, "Jeff",    85) : xdbCloseIndex(idxHandle):xdbShutdown():End: EndIf
   If xdbAddKey(tagHandle1, "Blayne",  91) : xdbCloseIndex(idxHandle):xdbShutdown():End: EndIf
   If xdbAddKey(tagHandle1, "Todd",    79) : xdbCloseIndex(idxHandle):xdbShutdown():End: EndIf
   If xdbAddKey(tagHandle1, "Donna",   82) : xdbCloseIndex(idxHandle):xdbShutdown():End: EndIf
   If xdbAddKey(tagHandle1, "Bob",     57) : xdbCloseIndex(idxHandle):xdbShutdown():End: EndIf
   If xdbAddKey(tagHandle1, "Tammy",   98) : xdbCloseIndex(idxHandle):xdbShutdown():End: EndIf

   Debug "Index keys and values added."
   Debug ""

   ; MOVE THROUGH THE INDEX TAG
   DisplayRecords()


   ; DELETE SOME KEYS
   ; The key and recnum must match exactly in order for it to be deleted
   Debug ""
   If xdbDeleteKey(tagHandle1, "Donna", 82) = #ERR_SEEKEXACTMATCH 
      Debug "Could not delete Key: Donna, 82"
   Else
      Debug "Deleted. Key: Donna, 82"
   EndIf   

   If xdbDeleteKey(tagHandle1, "Blayne", 91) = #ERR_SEEKEXACTMATCH
      Debug "Could not delete Key/Recnum: Blayne, 91"
   Else
      Debug "Deleted. Key: Blayne, 91"
   EndIf   

   If xdbDeleteKey(tagHandle1, "Paul", 100) = #ERR_SEEKEXACTMATCH 
      Debug "Could not delete Key/Recnum: Paul, 100"
   Else
      Debug "Deleted. Key: Paul, 100"
   EndIf   
   Debug ""

   DisplayRecords()
   
  ; CLOSE THE INDEX
  xdbCloseIndex(idxHandle)

  ; SHUTDOWN THE SYSTEM
  xdbShutdown()
  Debug ""
  Debug "Completed"
  End
   
      
Procedure DisplayRecords()
  Protected sKey.s = ""
  ; Because there is no database, specify 0 for the database handle.
  errcode = xdbMove(0, tagHandle1, #XDB_MOVEFIRST, @nRecNum)
  
  While errcode = 0   ; loop until end of file reached
    errcode = xdbGetKey(tagHandle1, @sKey, @nRecNum)
    If errcode  : xdbShutdown():End :EndIf
    
    Debug "Key: "+sKey+"   RecNum: "+Str(nRecNum)
    
    errcode = xdbMove(0, tagHandle1, #XDB_MOVENEXT_ATOMIC, @nRecNum)
    ;errcode = xdbMove(0, tagHandle1, #XDB_MOVENEXT, @nRecNum)
  Wend
  ProcedureReturn
EndProcedure


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 100
; FirstLine = 52
; Folding = ---