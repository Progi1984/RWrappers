XIncludeFile "RW_OciLib_Inc.pb"

  ProcedureC Err_handler(*err.OCI_Error)
    Debug "code  : ORA-"+Str(OCI_ErrorGetOCICode(*err))
    Debug "msg   : "+ PeekS(OCI_ErrorGetString(*err))
    ;Debug "sql   : "+ Str(OCI_GetSql(OCI_ErrorGetStatement(err)))
  EndProcedure

  Global hDB.l
  Global sPathInstantClient.s = ""
  Global sServerName.s        = ""
  Global sServerPort.s        = ""
  Global sServerInstance.s    = ""
  Global sServerCnxName.s     = sServerName + ":" + sServerPort + "/" + sServerInstance
  Global sLogin.s             = ""
  Global sPassword.s          = ""
  
  If Not OCI_Initialize(@Err_handler(), @sPathInstantClient, #OCI_ENV_DEFAULT)
    If OCI_GetLastError() <> 0
      Debug PeekS(OCI_GetLastError())
      End
    EndIf
  EndIf
  
  hDB = OCI_ConnectionCreate(@sServerCnxName, @sLogin, @sPassword, #OCI_SESSION_DEFAULT)

  If (hDB <> #Null)
    Debug "Server version > " + PeekS(OCI_GetVersionServer(hDB))
    
    Debug "Server major > " + Str(OCI_GetServerMajorVersion(hDB))
    Debug "Server minor> " + Str(OCI_GetServerMinorVersion(hDB))
    Debug "Server revision > " + Str(OCI_GetServerRevisionVersion(hDB))
    Debug "Connection > " + Str(OCI_GetVersionConnection(hDB))
    Debug "Database > " + PeekS(OCI_GetDatabase(hDB))
    Debug "Username > " + PeekS(OCI_GetUserName(hDB))
    Debug "Password > " + PeekS(OCI_GetPassword(hDB))
    Debug "Format Date (default) > " + PeekS(OCI_GetDefaultFormatDate(hDB))
    Debug "Format Numeric (default) > " + PeekS(OCI_GetDefaultFormatNumeric(hDB))
    OCI_ConnectionFree(hDB)
  Else
    If OCI_GetLastError() <> 0
      Debug PeekS(OCI_GetLastError())
      End
    EndIf
  EndIf
  
  OCI_Cleanup()
  

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 15
; Folding = -