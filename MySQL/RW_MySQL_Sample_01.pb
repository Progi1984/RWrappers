XIncludeFile "RW_MySQL_Inc.pb"

  Global hDB.l
  Global sServerIP.s        = "" 
  Global lServerPort.l      = 3306
  Global sServerLogin.s     = ""
  Global sServerPassword.s  = ""
  Global sServerDatabase.s  = ""
  Global pResults.l, pResultRow.l, pResultLengths.l
  Global lIncA.l, lIncB.l, lNbFields.l, lSumLength.l, lLength.l

  hDB = mysql_init(0)
  mysql_real_connect(hDB, sServerIP, sServerLogin, sServerPassword, sServerDatabase, lServerPort, "", 0)
  If mysql_query(hDB, "select * from `table_name`") = 0
    pResults = mysql_store_result(hDB)
    If pResults <> 0
      lNbFields = mysql_num_fields(pResults)
      If lNbFields > 0
        Debug "lNbFields > " + Str(lNbFields)
        For lIncA = 0 To mysql_num_rows(pResults) - 1
          pResultRow    = mysql_fetch_row(pResults)
          pResultLengths= mysql_fetch_lengths(pResults)
          lSumLength    = 0
          For lIncB = 0 To lNbFields - 1
            lLength = PeekL(pResultLengths + lIncB * 4)
            Debug "#"+Str(lIncB)+" - Len > "+Str(lLength)
            If lIncB > 0
              Debug PeekS(pResultRow + (lNbFields+1) * 4 + lSumLength, lLength, #PB_Ascii)
            EndIf
            lSumLength + lLength + 1
          Next
        Next
      EndIf
    EndIf
    mysql_free_result (pResults)
  EndIf  
  mysql_close (hDB)
  

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 31
; EnableUnicode