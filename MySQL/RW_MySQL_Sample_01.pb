XIncludeFile "RW_MySQL_Inc.pb"

  hDB_MySQL = mysql_init(0)
  Debug mysql_real_connect(hDB_MySQL, "127.0.0.1", "root", "", "glpi", 3306, "", 0)
;   If mysql_query(hDB_MySQL, "select * from glpi_type_computers") = 0
  If mysql_query(hDB_MySQL, "select * from `glpi_users`") = 0
    pMyRES = mysql_store_result(hDB_MySQL)
    If pMyRES <> 0
      Debug pMyRES
      nbFields = mysql_num_fields(pMyRES)
      If nbFields > 0
        Debug "nbFields > "+Str(nbFields)
        For i = 0 To mysql_num_rows(pMyRES) - 1
          pMyROW  = mysql_fetch_row(pMyRES)
          pLengths= mysql_fetch_lengths(pMyRES)
          sumlength = 0
          For j = 0 To nbFields - 1
            length = PeekL(pLengths+j*4)
            Debug "#"+Str(j)+"-Len > "+Str(length)
            If length > 0
              Debug PeekS(pMyRow+(nbFields+1)*4+sumlength, length, #PB_Ascii)
            EndIf
            sumlength + length+1
          Next
          CallDebugger
          Debug "--------------------"
        Next
      EndIf
    EndIf
    mysql_free_result (pMyRES)
  EndIf  
  mysql_close (hDB_MySQL)
  

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 19
; Folding = --
; EnableUnicode