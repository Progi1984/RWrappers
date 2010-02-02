XIncludeFile "RW_MySQL_Inc.pb"

  Global hDB.l
  Global sServerIP.s        = "" 
  Global lServerPort.l      = 3306
  Global sServerLogin.s     = ""
  Global sServerPassword.s  = ""
  Global sServerDatabase.s  = ""
  Global pResults.l, pResultFields.l
  Global lIncA.l, lNbFields.l


  hDB = mysql_init(0)
  mysql_real_connect(hDB, sServerIP, sServerLogin, sServerPassword, sServerDatabase, lServerPort, "", 0)
  If mysql_query(hDB, "select * from `table_name`") = 0
    pResults = mysql_store_result(hDB)
    If pResults <> 0
      lNbFields = mysql_num_fields(pResults)
      If lNbFields > 0
        Debug "lNbFields > " + Str(lNbFields)
        pResultFields = mysql_fetch_fields(pResults)
        Dim dimFields.MYSQL_FIELD(lNbFields)
        CopyMemory(pResultFields, @dimFields(), SizeOf(MYSQL_FIELD) * lNbFields)
        For lIncA = 0 To lNbFields - 1
          Debug"Field > " + dimFields(lIncA)\name + " - Type > " + Str(dimFields(ilIncA)\type)
        Next
      EndIf
    EndIf
    mysql_free_result (pResults)
  EndIf  
  mysql_close (hDB)
  
XIncludeFile "RW_MySQL_Inc.pb"
; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 8
; EnableUnicode