XIncludeFile "RW_PostGreSQL_Inc.pb"

  Global hCnx.PGconn
  Global lRes.PGResult
  Global lNbFields.l,lIncA.l, lIncB.l
  Global sCnxIP.s       = ""
  Global sCnxPort.s     = ""
  Global sCnxOption.s   = ""
  Global sCnxTTY.s      = ""
  Global sCnxDBName.s   = ""
  Global sCnxLogin.s    = ""
  Global sCnxPassword.s = ""
  Global sCnxInfo.s     = "hostaddr="+sCnxIP+" port="+sCnxPort+" options="+sCnxOption+" tty="+sCnxTTY+" dbname="+sCnxDBName+" user="+sCnxLogin+" password="+sCnxPassword

  ; Make a connection To the database 
  hCnx = PQconnectdb(sCnxInfo)
  ; OR
  ;hCnx = PQsetdbLogin(sCnxIP, sCnxPort, sCnxOption, sCnxTTY,sCnxDBName, sCnxLogin, sCnxPassword) 
  
  ; Check To see that the backend connection was successfully made 
  If (PQstatus(hCnx) <> #CONNECTION_OK)
    Debug "Connection to database failed: " + PeekS(PQerrorMessage(hCnx))
    PQfinish(hCnx)
    End
  Else
    Debug "Connection to database successed"
  EndIf

  ; Start a transaction block 
  lRes = PQexec(hCnx, "BEGIN")
  If PQResultStatus(lRes) <> #PGRES_COMMAND_OK
    Debug "BEGIN command failed : " + PeekS(PQerrorMessage(hCnx))
    PQclear(lRes)
    PQfinish(hCnx)
  Else
    Debug "BEGIN command successed"
  EndIf
  ;Should PQclear PGlResult whenever it is no longer needed To avoid memory leaks
  PQclear(lRes)

  ;Fetch rows from pg_database, the system catalog of databases
  lRes = PQexec(hCnx, "DECLARE myportal CURSOR FOR select * from pg_database")
  If (PQResultStatus(lRes) <> #PGRES_COMMAND_OK)
    Debug "DECLARE CURSOR failed: " + PeekS(PQerrorMessage(hCnx))
    PQclear(lRes)
    PQfinish(hCnx)
  Else
    Debug "DECLARE CURSOR successed"
  EndIf
  PQclear(lRes)
  lRes = PQexec(hCnx, "FETCH ALL in myportal")
  If (PQResultStatus(lRes) <> #PGRES_TUPLES_OK)
    Debug "FETCH ALL failed: " + PeekS(PQerrorMessage(hCnx))
    PQclear(lRes)
    PQfinish(hCnx)
  Else
    Debug "FETCH ALL successed"
  EndIf
  
  Debug "--- Attributes Names"
  ; first, print out the attribute names 
  lNbFields = PQnfields(lRes)
  For lIncA = 0 To lNbFields - 1
    Debug ">"+PeekS(PQfname(lRes, lIncA))
  Next
  ; Next, print out the rows 
  Debug "--- Rows"
  For lIncA = 0 To PQntuples(lRes) - 1
    Debug ">> datname       : "+PeekS(PQgetvalue(lRes, lIncA, 0))
    Debug ">> datdba        : "+PeekS(PQgetvalue(lRes, lIncA, 1))
    Debug ">> encoding      : "+PeekS(PQgetvalue(lRes, lIncA, 2))
    Debug ">> datistemplate : "+PeekS(PQgetvalue(lRes, lIncA, 3))
    Debug ">> datallowconn  : "+PeekS(PQgetvalue(lRes, lIncA, 4))
    Debug ">> datconnlimit  : "+PeekS(PQgetvalue(lRes, lIncA, 5))
    Debug ">> datlastsysoid : "+PeekS(PQgetvalue(lRes, lIncA, 6))
    Debug ">> datvacuumxid  : "+PeekS(PQgetvalue(lRes, lIncA, 7))
    Debug ">> datfrozenxid  : "+PeekS(PQgetvalue(lRes, lIncA, 8))
    Debug ">> dattablespace : "+PeekS(PQgetvalue(lRes, lIncA, 9))
    Debug ">> datconfig     : "+PeekS(PQgetvalue(lRes, lIncA, 10))
    Debug ">> datacl        : "+PeekS(PQgetvalue(lRes, lIncA, 11))
    Debug "-------------------------------------------------------"
  Next
  PQclear(lRes)

  ; close the portal ... we don't bother to check for errors ... 
  lRes = PQexec(hCnx, "CLOSE myportal")
  PQclear(lRes)

  ; End the transaction 
  lRes = PQexec(hCnx, "END")
  PQclear(lRes)

  ; close the connection To the database And cleanup 
  PQfinish(hCnx)
