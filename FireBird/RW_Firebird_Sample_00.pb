XIncludeFile "RW_Firebird_Inc.pb"

Debug "Version : "+Str(isc_get_client_major_version())+"."+Str(isc_get_client_minor_version())
  
  ; Create Database
  If FileSize("Samples\Sample_00.fdb") < 0
    Define.s create_db = "CREATE DATABASE "+Chr(34)+"Samples\Sample_00.fdb"+Chr(34)+""
    db_handle.l = #Null
    Debug isc_dsql_execute_immediate(status, @db_handle, @trans, 0, create_db, 1, #Null)
    Debug isc_detach_database(status_vector, @db_handle)
  EndIf
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 10
; Folding = -