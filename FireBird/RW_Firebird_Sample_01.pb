XIncludeFile "RW_Firebird_Inc.pb"

  Debug "Version : "+Str(isc_get_client_major_version())+"."+Str(isc_get_client_minor_version())
  
  ; Create Database
  If FileSize("Samples\Sample_01.fdb") < 0
    Define.s create_db = "CREATE DATABASE "+Chr(34)+"Samples\Sample_01.fdb"+Chr(34)+""
    db_handle.l = #Null
    Debug isc_dsql_execute_immediate(status, @db_handle, @trans, 0, create_db, 1, #Null)
    Debug isc_detach_database(status_vector, @db_handle)
  EndIf
  ; Connect Database
  Debug isc_attach_database(status, 0, "Samples\Sample_01.fdb", @db_handle, 0, #Null)
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
  
  ; Update Data
  Debug isc_start_transaction(Status, @trans, 1, @db_handle, 0, #Null)
    Debug isc_dsql_execute_immediate(Status, @db_handle, @trans, 0, "UPDATE tbl_test SET FIELD2 = 2008 WHERE FIELD1 = "+Chr(34)+"A"+Chr(34)+";", 1, #Null)
  Debug isc_commit_transaction(Status, @trans)
  
  ; Delete Table
;   Debug isc_start_transaction(Status, @trans, 1, @db_handle, 0, #Null)
;     Debug isc_dsql_execute_immediate(Status, @db_handle, @trans, 0, "DROP TABLE tbl_test;", 1, #Null)
;   Debug isc_commit_transaction(Status, @trans)

  ; Disconnect database
  Debug isc_detach_database(Status, @db_handle)
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 36
; Folding = -