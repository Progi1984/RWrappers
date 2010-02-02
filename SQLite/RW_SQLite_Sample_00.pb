XIncludeFile "RW_SQLite_Inc.pb"


  Declare.l CallBack_ReturnRows(NullPtr.l,ArgCount.l,*Values.l, *ColNames.l)
  Global sDBFile.s, sSQL0.s, sSQL1.s
  Global fCurrentTime.f
  Global llQueryReturnValueurnValue.l, hDB.l
  
  sDBFile = "Samples\sample_00.db"

  sSQL0   = "CREATE TABLE 'TestTable' ("
  sSQL0   = sSQL0 +   "'ID' INTEGER  Not NULL PRIMARY KEY AUTOINCREMENT,"
  sSQL0   = sSQL0 +   "'StringCol1' TEXT  NULL,"
  sSQL0   = sSQL0 +   "'StringCol2' TEXT  NULL,"
  sSQL0   = sSQL0 +   "'IntCol1' INTEGER  NULL,"
  sSQL0   = sSQL0 +   "'IntCol2' INTEGER  NULL"
  sSQL0   = sSQL0 +   ")"   
  sSQL0   = ReplaceString(sSQL0, "'", Chr(34))

  fCurrentTime = ElapsedMilliseconds()

  ;Open Database
  If sqlite3_open(sDBFile, @hDB)
    sqlite3_errmsg(@RetVal)
    Debug PeekS(RetVal)
  Else ; If successful send queries
    ; Send Created DB SQL, table may exist
    lQueryReturnValue.l = sqlite3_exec(hDB, sSQL0, @CallBack_ReturnRows() , #Null, @ReturnValue)     
    If lQueryReturnValue
      sqlite3_errmsg(@ReturnValue)
      Debug PeekS(ReturnValue)
    EndIf
    ; Send Insert Row SQL, table may exist
    For i.l = 1 To 100
      sSQL1   = "INSERT INTO TestTable(StringCol1, StringCol2, IntCol1, IntCol2) VALUES ('SQLiteFirstColumn', 'SQLiteSecondColumn', " + Str(i) + ", " + Str(Random(SizeOf(Quad))) + ") "
      lQueryReturnValue.l = sqlite3_exec(hDB, sSQL1, @CallBack_ReturnRows(), #Null, @ReturnValue)
      If lQueryReturnValue
        sqlite3_errmsg(@ReturnValue)
        Debug PeekS(ReturnValue)
      EndIf       
    Next
    ;Send arbitrary Query
    lQueryReturnValue.l = sqlite3_exec(hDB, "SELECT * FROM TestTable", @CallBack_ReturnRows() , #Null, @ReturnValue)
    If lQueryReturnValue
      sqlite3_errmsg(@ReturnValue)
      Debug PeekS(ReturnValue)
    EndIf
    ;Close Database
    sqlite3_close(hDB)
  EndIf
  Debug  ElapsedMilliseconds() - CurrentTime


ProcedureC.l CallBack_ReturnRows(NullPtr.l, NbArgs.l, *Values.l, *ColNames.l)
  Protected Dim ValuePts.l(ArgCount)
  Protected iInc.l
  Protected sRowContent.s
  For iInc.l = 0 To NbArgs - 1
    ValuePts(ValLoop) = PeekL(*Values + (iInc * 4))
    sRowContent = sRowContent + PeekS(ValuePts(iInc) ) + ","
  Next
  Debug sRowContent
  ProcedureReturn 0
EndProcedure   