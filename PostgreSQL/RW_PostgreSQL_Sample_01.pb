XIncludeFile "RW_PostGreSQL_Inc.pb"

conn = PQconnectdb("host=192.168.14.23 user=postgres password=asfpmo")
If conn
  Debug conn
  Debug PQstatus(conn)
  If PQstatus(conn) = #CONNECTION_OK
    res = PQexec(conn, "SELECT 1234,5678,9.01234,'string',LOCALTIME,NOW(),1024*1024;")
    If res
      If PQresultStatus(res) = #PGRES_TUPLES_OK
        For i = 0 To PQnfields(res) -1
          Debug "#"
          For j = 0 To PQnTuples(res) - 1
            Debug PeekS(PQgetvalue(res, j, i))
          Next
        Next
      EndIf
      PQclear(res)
    EndIf
  EndIf
  PQfinish(conn)
EndIf

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 17
; Folding = --