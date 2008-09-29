XIncludeFile "RW_MySQL_Inc.pb"

; Thanks to Flype for his test file :) : http://www.purebasic.fr/english/viewtopic.php?t=21862

Procedure Test_Client()
  Debug "[Client]"
  Debug mysql_get_client_version()
  Debug PeekS(mysql_get_client_info())
  Debug Hex(mysql_get_parameters())
EndProcedure
Procedure Test_Error(handle.l)
  Debug "[Error]"
  Debug mysql_errno(handle)
  Debug PeekS(mysql_sqlstate(handle))
  Debug PeekS(mysql_error(handle))
EndProcedure
Procedure Test_Server(handle.l)
  Debug "[Server]"
  Debug mysql_get_server_version(handle)
  Debug PeekS(mysql_get_server_info(handle))
  Debug PeekS(mysql_get_host_info(handle))
EndProcedure
Procedure Test_Fields(result.l)
  fields.s = ""
  For i = 0 To mysql_num_fields(result) - 1
    *field.MYSQL_FIELD = mysql_fetch_field(result)
    fields + *field\name + ", "
  Next
  Debug "fields>"+fields
EndProcedure
Procedure Test_Rows(result.l)
  For i = 0 To mysql_num_rows(result) - 1
    Protected *row.MYSQL_ROW 
    *row = mysql_fetch_row(result)
    If *row
      rows.s = ""
      For j = 0 To mysql_num_fields(result) - 1
        rows + *row\field[j] + ", "
      Next
      Debug "rows>"+rows
    EndIf
  Next
EndProcedure
Procedure Test_Query(handle.l,query.s)
  Debug "[Query]"
  If mysql_query(handle,query)
    Test_Error(handle)
  Else
    id = mysql_insert_id(handle)
    If id
      Debug "id>"+Str(id)
    EndIf
    info = mysql_info(handle)
    If info
      Debug "info>"+PeekS(info)
    EndIf
    If mysql_field_count(handle)
      result = mysql_store_result(handle)
      If result
        Test_Fields(result)
        Test_Rows(result)
        mysql_free_result(result)
      EndIf
    EndIf
  EndIf
EndProcedure
Procedure Test_Processes(handle.l)
  Debug "[Processes]"
  result = mysql_list_processes.l(handle)
  If result
    Test_Fields(result)
    Test_Rows(result)
    mysql_free_result(result)
  EndIf
EndProcedure
Procedure Test_Tables(handle.l)
  Debug "[Tables]"
  result = mysql_list_tables.l(handle,"")
  If result
    Test_Fields(result)
    Test_Rows(result)
    mysql_free_result(result)
  EndIf
EndProcedure
Procedure Test_Dbs(handle.l)
  Debug "[Dbs]"
  result = mysql_list_dbs.l(handle,"")
  If result
    Test_Fields(result)
    Test_Rows(result)
    mysql_free_result(result)
  EndIf
EndProcedure
Procedure Test_String(handle.l)
  Debug "[EscapeString]"
  sFrom.s = "What's this"
  sTo.s = Space(Len(sFrom)*2+1)
  If mysql_escape_string(sTo,sFrom,Len(sFrom))
    Debug sTo
  EndIf
  sFrom.s = "What's this"
  sTo.s = Space(Len(sFrom)*2+1)
  If mysql_real_escape_string(handle,sTo,sFrom,Len(sFrom))
    Debug sTo
  EndIf
  sFrom.s = "ABCDEF"
  sTo.s = Space(Len(sFrom)*2+1)
  If mysql_hex_string(sTo,sFrom,Len(sFrom))
    Debug "0x"+sTo
  EndIf
EndProcedure
Procedure Test_CharSet(handle.l)
  Debug "[CharSet]"
  mysql_get_character_set_info(handle,cs.MY_CHARSET_INFO)
  Debug cs\number
  Debug cs\state
  Debug cs\csname
  Debug cs\name
  Debug cs\comment
  Debug cs\dir
  Debug cs\mbminlen
  Debug cs\mbmaxlen
EndProcedure
Procedure Test_Stmt(handle.l)
  Debug "[Stmt]"
  stmt = mysql_stmt_init(handle)
  If stmt
    query.s = "SELECT * FROM people"
    mysql_stmt_prepare(stmt,query,Len(query))
    mysql_stmt_execute(stmt)
    If mysql_stmt_field_count(stmt)
      result = mysql_stmt_result_metadata(stmt) 
      If result
        Test_Fields(result)
        Test_Rows(result)
        mysql_free_result(result)
      EndIf
    EndIf
    mysql_stmt_close(stmt)
  Else
    Test_Error(handle)
  EndIf
EndProcedure

;-------------

Test_Client()
hDB = mysql_init(#Null)
If hDB
  If mysql_real_connect(hDB,"localhost","root","","",3306,"NULL",#Null)
    If mysql_select_db(hDB,"glpi")
      Test_Error(hDB)
    Else
      mysql_autocommit(hDB,#True)
      Test_Server(hDB)
      Test_Processes(hDB)
      Test_Dbs(hDB)
      Test_Tables(hDB)
      Test_String(hDB)
      Test_CharSet(hDB)
      Test_Query(hDB,"SELECT NOW()")
      Test_Query(hDB,"SELECT NOW() 'DateTime', (1+2*16) 'Expression'")
      Test_Query(hDB,"DROP TABLE people")
      Test_Query(hDB,"CREATE TABLE people (id INT(8) NOT NULL AUTO_INCREMENT, firstname VARCHAR(64), name VARCHAR(64), PRIMARY KEY (id), UNIQUE KEY id (id), UNIQUE KEY name (name))")
      Test_Query(hDB,"INSERT INTO people VALUES('','Jean','Dupont')")
      Test_Query(hDB,"INSERT INTO people VALUES('','Patrice','Durand')")
      Test_Query(hDB,"INSERT INTO people VALUES('','Hélène','Dubois')")
      Test_Query(hDB,"INSERT INTO people VALUES('','Léon','Martin'),('','Nathalie','Morin'),('','Hélène','Dujardin')")
      Test_Query(hDB,"UPDATE people SET firstname='Valérie' WHERE firstname='Hélène'")
      Test_Query(hDB,"SELECT firstname,name FROM people ORDER BY name ASC")
      Test_Stmt(hDB)
    EndIf
  Else
    Test_Error(hDB)
  EndIf
  mysql_close(hDB)
EndIf

;-------------

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 2
; Folding = Q4X26-