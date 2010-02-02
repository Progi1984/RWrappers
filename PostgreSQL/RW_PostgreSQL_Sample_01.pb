XIncludeFile "RW_PostGreSQL_Inc.pb"

  Global sCnxIP.s       = "192.168.14.23"
  Global sCnxLogin.s    = "postgres"
  Global sCnxPassword.s = "asfpmo"
  Global sCnxInfo.s     = "host="+sCnxIP+" user="+sCnxLogin+" password="+sCnxPassword
  Global hCnx.l, lRes.l, lIncA.l, lIncB.l
  
  hCnx = PQconnectdb(sCnxInfo)
  If hCnx
    Debug "Statut=" + Str(PQstatus(hCnx)) + " - OK = "+Str(#CONNECTION_OK)
    If PQstatus(hCnx) = #CONNECTION_OK
      lRes = PQexec(hCnx, "SELECT 1234,5678,9.01234,'string',LOCALTIME,NOW(),1024*1024;")
      If lRes
        If PQresultStatus(lRes) = #PGRES_TUPLES_OK
          For lIncA = 0 To PQnfields(lRes) -1
            For lIncB = 0 To PQnTuples(lRes) - 1
              Debug "# "+PeekS(PQgetvalue(lRes, lIncB, lIncA))
            Next
          Next
        EndIf
        PQclear(lRes)
      EndIf
    EndIf
    PQfinish(hCnx)
  EndIf
