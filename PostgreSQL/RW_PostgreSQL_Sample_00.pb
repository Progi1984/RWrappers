XIncludeFile "RW_PostGreSQL_Inc.pb"

Procedure PGQuitCnx(conn.PGconn)
  PQfinish(conn)
EndProcedure

  Global conninfo.s
  Global conn.PGconn
  Global res.PGresult
  Global nFields.l
  Global i.l, j.l
  conninfo = "dbname = postgres"

  ; Make a connection To the database 
  ;conn = PQconnectdb(conninfo)
  conn = PQsetdbLogin("192.168.14.23", "5432", "", "","beta-bddmat", "postgres", "asfpmo") 
  
;  PGQuitCnx(conn)
  ; Check To see that the backend connection was successfully made 
  If (PQstatus(conn) <> #CONNECTION_OK)
    Debug "Connection to database failed: " + PeekS(PQerrorMessage(conn))
    PGQuitCnx(conn)
  Else
    Debug "Connection to database successed"
  EndIf
   

  ; Start a transaction block 
  res = PQexec(conn, "BEGIN")
  If PQresultStatus(res) <> #PGRES_COMMAND_OK
    Debug "BEGIN command failed : " + PeekS(PQerrorMessage(conn))
    PQclear(res)
    PGQuitCnx(conn)
  Else
    Debug "BEGIN command successed"
  EndIf

  ;Should PQclear PGresult whenever it is no longer needed To avoid memory leaks
  PQclear(res)

  ;Fetch rows from pg_database, the system catalog of databases
  res = PQexec(conn, "DECLARE myportal CURSOR FOR select * from pg_database")
  If (PQresultStatus(res) <> #PGRES_COMMAND_OK)
    Debug "DECLARE CURSOR failed: " + PeekS(PQerrorMessage(conn))
    PQclear(res)
    PGQuitCnx(conn)
  Else
    Debug "DECLARE CURSOR successed"
  EndIf
  PQclear(res)

  res = PQexec(conn, "FETCH ALL in myportal")
  If (PQresultStatus(res) <> #PGRES_TUPLES_OK)
    Debug "FETCH ALL failed: " + PeekS(PQerrorMessage(conn))
    PQclear(res)
    PGQuitCnx(conn)
  Else
    Debug "FETCH ALL successed"
  EndIf
  
  Debug "--- Attributes Names"
  ; first, print out the attribute names 
  nFields = PQnfields(res)
  For i = 0 To nFields-1
    Debug PeekS(PQfname(res, i))
  Next
  Debug ""
  Debug ""
  
  ; Next, print out the rows 
  Debug "--- Rows"
  For i = 0 To PQntuples(res) - 1
    For j = 0 To  nFields - 1
      Debug PeekS(PQgetvalue(res, i, j))
    Next
    Debug ""
  Next
  PQclear(res)

  ; close the portal ... we don't bother to check for errors ... 
  res = PQexec(conn, "CLOSE myportal")
  PQclear(res)

  ; End the transaction 
  res = PQexec(conn, "END")
  PQclear(res)

  ; close the connection To the database And cleanup 
  PQfinish(conn)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 73
; FirstLine = 39
; Folding = --