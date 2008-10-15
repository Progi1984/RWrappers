XIncludeFile "RW_OciLib_Inc.pb"

  ProcedureC err_handler(*err.OCI_Error)
    Debug "code  : ORA-"+Str(OCI_ErrorGetOCICode(err))
    Debug "msg   : "+ Str(OCI_ErrorGetString(err))
    ;Debug "sql   : "+Str(OCI_GetSql(OCI_ErrorGetStatement(err)))
  EndProcedure

  Global cnx.l
  
  If Not OCI_Initialize(@err_handler(), #Null, #OCI_ENV_DEFAULT)
    Debug PeekS(OCI_GetLastError())
    End
  EndIf
  
  cnx = OCI_ConnectionCreate(@"db", @"usr", @"pwd", #OCI_SESSION_DEFAULT)
  
  If (cn <> #Null)
    Debug OCI_GetVersionServer(cn)
    
    Debug "Server major    version : " + Str(OCI_GetServerMajorVersion(cn))
    Debug "Server minor    version : " + Str(OCI_GetServerMinorVersion(cn))
    Debug "Server revision version : " + Str(OCI_GetServerRevisionVersion(cn))
    
    Debug "Connection      version : " + Str(OCI_GetVersionConnection(cn))

    OCI_ConnectionFree(cn)
  EndIf
  
  OCI_Cleanup()
  

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 3
; Folding = -