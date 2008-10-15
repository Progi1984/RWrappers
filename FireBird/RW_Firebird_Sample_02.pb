XIncludeFile "RW_Firebird_Inc.pb"


  Debug "Version : "+Str(isc_get_client_major_version())+"."+Str(isc_get_client_minor_version())
  
  ; Create Database
  If FileSize("Samples\Sample_02.fdb") < 0
    Define.s create_db = "CREATE DATABASE "+Chr(34)+"Samples\Sample_02.fdb"+Chr(34)+""
    db_handle.l = #Null
    Debug isc_dsql_execute_immediate(status, @db_handle, @trans, 0, create_db, 1, #Null)
    Debug isc_detach_database(status_vector, @db_handle)
  EndIf
  ; Connect Database
  Debug isc_attach_database(status, 0, "Samples\Sample_02.fdb", @db_handle, 0, #Null)
;   ; Create Table
  Debug isc_start_transaction(Status, @trans, 1, @db_handle, 0, #Null)
  Debug isc_dsql_execute_immediate(Status, @db_handle, @trans, 0, "CREATE TABLE tbl_test (FIELD1 VARCHAR(20), FIELD2 INTEGER);", 1, #Null)
  Debug isc_commit_transaction(Status, @trans)

  ; Insert Data
  Debug isc_start_transaction(Status, @trans, 1, @db_handle, 0, #Null)
  For Inc = 1 To 10
    Debug isc_dsql_execute_immediate(Status, @db_handle, @trans, 0, "INSERT INTO tbl_test VALUES ("+Chr(34)+Left("AZERTYUIOP", Inc)+Chr(34)+","+Str(Random(256))+");", 1, #Null)
  Next
  Debug isc_commit_transaction(Status, @trans)

  MessageRequester("RW_Firebird_Sample_02", "SELECT in this example doesn't run")
  End
  ; Select Data
  Debug isc_start_transaction(Status, @trans, 1, @db_handle, 0, #Null)
  
  flag0.w = 0
  flag1.w = 0
  str.s = "SELECT FIELD2 FROM tbl_test;"
  stmt = #Null
  FIELD1.s
  FIELD2.s
    
  *sqlda.XSQLDA = AllocateMemory(SizeOf(XSQLDA))
  *sqlda\version = #SQLDA_VERSION1
  *sqlda\sqln    = 1
  *sqlda\sqld    = 1
  ;sqlda\sqlvar[0]\sqldata = @FIELD1
  ;sqlda\sqlvar[0]\sqltype = #SQL_TEXT
  ;sqlda\sqlvar[0]\sqlind  = @flag0

  *sqlda\sqlvar[0]\sqldata = @"FIELD2"
  *sqlda\sqlvar[0]\sqltype = #SQL_LONG + 1
  *sqlda\sqlvar[0]\sqllen  = SizeOf(Long)
  *sqlda\sqlvar[0]\sqlind   = 0

  Debug isc_dsql_allocate_statement(status, @db_handle, @stmt)
  Debug isc_dsql_prepare(status, @trans, @stmt, 0, str, 1, *sqlda)
  Debug  isc_dsql_execute(status, @trans, @stmt, 1, #Null)
  Debug "------"
  While fetch_stat = 0
    Debug status
    Debug stmt
    Debug @stmt
    Debug *sqlda
    Debug @*sqlda
    Debug fetch_stat
    fetch_stat = isc_dsql_fetch(status, @stmt, 1, *sqlda)
    Debug fetch_stat
    Debug FIELD1;last_name.vary_length, last_name.vary_string);

    ;Debug ;"%-15.*s ", first_name.vary_length, first_name.vary_string);

    ;phone_ext[sqlda->sqlvar[2].sqllen] = '\0';
    ;Debug "%s\n", phone_ext);
  Wend
  Debug "------" 
  Debug isc_dsql_free_statement(status, @stmt, #DSQL_close)
  
  Debug isc_commit_transaction(status, @trans)
  

  ; Disconnect database
  Debug isc_detach_database(Status, @db_handle)
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 27
; FirstLine = 4
; Folding = -