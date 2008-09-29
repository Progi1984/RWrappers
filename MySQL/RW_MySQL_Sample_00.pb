XIncludeFile "RW_MySQL_Inc.pb"

  hDB_MySQL = mysql_init(0)
  Debug mysql_real_connect(hDB_MySQL, "127.0.0.1", "root", "", "glpi", 3306, "", 0)
  pMyRES = mysql_list_tables(hDB_MySQL, "")
  If pMyRES <> 0
    For i = 0 To mysql_num_rows(pMyRES) - 1
      pMyROW = mysql_fetch_row(pMyRES)
      Debug PeekS(pMyROW,-1, #PB_Ascii)
    Next
    mysql_free_result (pMyRES)
  EndIf
  mysql_close (hDB_MySQL)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 12
; Folding = -
; EnableUnicode