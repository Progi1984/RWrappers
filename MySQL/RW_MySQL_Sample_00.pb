XIncludeFile "RW_MySQL_Inc.pb"

  Global hDB.l
  Global sServerIP.s        = "" 
  Global lServerPort.l      = 3306
  Global sServerLogin.s     = ""
  Global sServerPassword.s  = ""
  Global sServerDatabase.s  = ""
  Global pResults.l
  Global lInc.l

  hDB = mysql_init(0)
  Debug mysql_real_connect(hDB, sServerIP, sServerLogin, sServerPassword, sServerDatabase, lServerPort, "", 0)
  
  pResults = mysql_list_tables(hDB, "")
  If pResults <> 0
    For lInc = 0 To mysql_num_rows(pResults) - 1
      pMyROW = mysql_fetch_row(pResults)
      Debug PeekS(pMyROW, -1, #PB_Ascii)
    Next
    mysql_free_result (pResults)
  EndIf
  mysql_close (hDB)

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 17
; EnableUnicode