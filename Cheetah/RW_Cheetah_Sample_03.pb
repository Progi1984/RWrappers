XIncludeFile "RW_Cheetah_Inc.pb"

  Global idxHandle .l
  Global tagHandle1 .l
  
  Global errcode   .l
  Global sData     .s
  Global sKey      .s
  Global nRecNum   .l
  Global NumRead   .l
  Global NumRecs   .l
  Global x         .l
  Global StartTime .l
  Global EndTime   .l
  
  sData = "disk = Samples\Sample_03.btx;"  
  errcode = xdbCreateIndex(sData) 
  If errcode  : xdbShutdown():End :EndIf
  
  ; In order to use the index without an associated database, you
  ; must specify the "NoDatabase" property and set it to "TRUE".
  sData = "disk=Samples\Sample_03.btx; nodatabase=true;" 
  errcode = xdbOpenIndex(sData, 0, @idxHandle) 
  If errcode  : xdbShutdown():End :EndIf
  
  Debug "Create/open index. Handle:"+Str(idxHandle)
   
  ; CREATE AN INDEX TAG
  ; When you create a Tag, it is your responsibility to specify
  ; the size of the keys.
  sData = "TagName=mytag; Size=50; Uppercase=TRUE"
  errcode = xdbCreateTag(sData, idxHandle) 
  If errcode
    Debug "xdbCreateTag > "+Str(errcode)
    xdbShutdown()
    End
  EndIf

  errcode = xdbGetTag("mytag", idxHandle, @tagHandle1) 
  If errcode  : xdbShutdown():End :EndIf
  
  Debug "GetTag. 'mytag' Handle:"+Str(tagHandle1)
  
  
  NumRecs = 100
  Debug "Adding "+ Str(NumRecs)+ " Index keys and values"
  StartTime = ElapsedMilliseconds()
  
  ; ADD INDEX KEYS 
  For x = 1 To NumRecs             
    sKey    = Str(Random(999999) + 100000)
    nRecNum = x
    If xdbAddKey(tagHandle1, sKey, nRecNum) 
      End
    EndIf
  Next
  Debug Str(NumRecs)+ " Index keys and values added. Time: "+ Str(ElapsedMilliseconds()-StartTime); " seconds."
  Debug ""
  Debug "Press any key to delete the keys, one by one..."
  
  
  ; DELETE ALL OF THE KEYS ONE BY ONE
  NumRead = 0
  Repeat
    errcode = xdbMove(0, tagHandle1, #XDB_MOVEFIRST, @nRecNum)
    If errcode 
      Debug "xdbMove > "+Str(errcode)
      Break
    EndIf
    errcode = xdbGetKey(tagHandle1, @sKey, @nRecNum)
    If errcode 
       Debug "GetKey error:" + Str(errcode)
       End
    EndIf   
    errcode = xdbDeleteKey(tagHandle1, sKey, nRecNum)
    If errcode 
      Debug "DeleteKey error:" + Str(errcode)
      End
    Else                           
      NumRead = NumRead + 1  
      Debug Str(NumRead)+ "  Deleted Key:"+ Left(sKey,6)+ "  nRecNum:"+Str(nRecNum)
    EndIf
   Until NumRead >= NumRecs
   
   Debug Str(NumRead)+ " keys deleted"
  ; CLOSE THE INDEX 
  xdbCloseIndex(idxHandle)

  ; SHUTDOWN THE SYSTEM 
  xdbShutdown()
  
  Debug "Completed"

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 91
; FirstLine = 40
; Folding = --