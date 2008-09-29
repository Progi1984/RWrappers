XIncludeFile "RW_MySQL_Inc.pb"

  hDB_MySQL = mysql_init(0)
  Debug mysql_real_connect(hDB_MySQL, "127.0.0.1", "root", "", "glpi", 3306, "", 0)
  If mysql_query(hDB_MySQL, "select * from glpi_type_computers") = 0
;   If mysql_query(hDB_MySQL, "select * from `glpi_users`") = 0
    pMyRES = mysql_store_result(hDB_MySQL)
    If pMyRES <> 0
      Debug pMyRES
      nbFields = mysql_num_fields(pMyRES)
      If nbFields > 0
        Debug "nbFields > "+Str(nbFields)
        pMyFields = mysql_fetch_fields(pMyRES)
        Dim myFields.MYSQL_FIELD(nbFields)
        CopyMemory(pMyFields, @myFields(), SizeOf(MYSQL_FIELD) * nbFields)
        For i = 0 To nbFields - 1
          Debug"Le champ " + myFields(i)\name + " est du type " + Str(myFields(i)\type)
        Next
        Debug pMyFields
        CallDebugger
      EndIf
    EndIf
    mysql_free_result (pMyRES)
  EndIf  
  mysql_close (hDB_MySQL)
  
XIncludeFile "RW_MySQL_Inc.pb"
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 14
; Folding = -
; EnableUnicode