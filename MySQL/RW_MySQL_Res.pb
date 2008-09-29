;{ Enumerations
  Enumeration ; mysql_option 
    #MYSQL_OPT_CONNECT_TIMEOUT
    #MYSQL_OPT_COMPRESS
    #MYSQL_OPT_NAMED_PIPE
    #MYSQL_INIT_COMMAND
    #MYSQL_READ_DEFAULT_FILE
    #MYSQL_READ_DEFAULT_GROUP
    #MYSQL_SET_CHARSET_DIR
    #MYSQL_SET_CHARSET_NAME
    #MYSQL_OPT_LOCAL_INFILE
    #MYSQL_OPT_PROTOCOL
    #MYSQL_SHARED_MEMORY_BASE_NAME
    #MYSQL_OPT_READ_TIMEOUT
    #MYSQL_OPT_WRITE_TIMEOUT
    #MYSQL_OPT_USE_RESULT
    #MYSQL_OPT_USE_REMOTE_CONNECTION
    #MYSQL_OPT_USE_EMBEDDED_CONNECTION
    #MYSQL_OPT_GUESS_CONNECTION
    #MYSQL_SET_CLIENT_IP
    #MYSQL_SECURE_AUTH
    #MYSQL_REPORT_DATA_TRUNCATION
    #MYSQL_OPT_RECONNECT
    #MYSQL_OPT_SSL_VERIFY_SERVER_CERT
  EndEnumeration
  Enumeration ; mysql_status 
    #MYSQL_STATUS_READY
    #MYSQL_STATUS_GET_RESULT
    #MYSQL_STATUS_USE_RESULT
  EndEnumeration
  Enumeration ; mysql_protocol_type 
    #MYSQL_PROTOCOL_DEFAULT
    #MYSQL_PROTOCOL_TCP
    #MYSQL_PROTOCOL_SOCKET
    #MYSQL_PROTOCOL_PIPE
    #MYSQL_PROTOCOL_MEMORY
  EndEnumeration
  Enumeration ; mysql_rpl_type 
    #MYSQL_RPL_MASTER
    #MYSQL_RPL_SLAVE
    #MYSQL_RPL_ADMIN
  EndEnumeration
  Enumeration ; mysql_stmt_state
    #MYSQL_STMT_INIT_DONE = 1
    #MYSQL_STMT_PREPARE_DONE
    #MYSQL_STMT_EXECUTE_DONE
    #MYSQL_STMT_FETCH_DONE
  EndEnumeration
  Enumeration ; stmt_attr_type
    #STMT_ATTR_UPDATE_MAX_LENGTH
    #STMT_ATTR_CURSOR_TYPE
    #STMT_ATTR_PREFETCH_ROWS
  EndEnumeration
  Enumeration ; cr_error
    #CR_ERROR_FIRST = 2000 ;Copy first error nr.
    #CR_UNKNOWN_ERROR	= 2000
    #CR_SOCKET_CREATE_ERROR
    #CR_CONNECTION_ERROR
    #CR_CONN_HOST_ERROR
    #CR_IPSOCK_ERROR
    #CR_UNKNOWN_HOST
    #CR_SERVER_GONE_ERROR
    #CR_VERSION_ERROR
    #CR_OUT_OF_MEMORY
    #CR_WRONG_HOST_INFO
    #CR_LOCALHOST_CONNECTION
    #CR_TCP_CONNECTION
    #CR_SERVER_HANDSHAKE_ERR
    #CR_SERVER_LOST
    #CR_COMMANDS_OUT_OF_SYNC
    #CR_NAMEDPIPE_CONNECTION
    #CR_NAMEDPIPEWAIT_ERROR
    #CR_NAMEDPIPEOPEN_ERROR
    #CR_NAMEDPIPESETSTATE_ERROR
    #CR_CANT_READ_CHARSET
    #CR_NET_PACKET_TOO_LARGE
    #CR_EMBEDDED_CONNECTION
    #CR_PROBE_SLAVE_STATUS
    #CR_PROBE_SLAVE_HOSTS
    #CR_PROBE_SLAVE_CONNECT
    #CR_PROBE_MASTER_CONNECT
    #CR_SSL_CONNECTION_ERROR
    #CR_MALFORMED_PACKET
    #CR_WRONG_LICENSE
    ; new 4.1 error codes 
    #CR_NULL_POINTER
    #CR_NO_PREPARE_STMT
    #CR_PARAMS_NOT_BOUND
    #CR_DATA_TRUNCATED
    #CR_NO_PARAMETERS_EXISTS
    #CR_INVALID_PARAMETER_NO
    #CR_INVALID_BUFFER_USE
    #CR_UNSUPPORTED_PARAM_TYPE
    
    #CR_SHARED_MEMORY_CONNECTION
    #CR_SHARED_MEMORY_CONNECT_REQUEST_ERROR
    #CR_SHARED_MEMORY_CONNECT_ANSWER_ERROR
    #CR_SHARED_MEMORY_CONNECT_FILE_MAP_ERROR
    #CR_SHARED_MEMORY_CONNECT_MAP_ERROR
    #CR_SHARED_MEMORY_FILE_MAP_ERROR
    #CR_SHARED_MEMORY_MAP_ERROR
    #CR_SHARED_MEMORY_EVENT_ERROR
    #CR_SHARED_MEMORY_CONNECT_ABANDONED_ERROR
    #CR_SHARED_MEMORY_CONNECT_SET_ERROR
    #CR_CONN_UNKNOW_PROTOCOL
    #CR_INVALID_CONN_HANDLE
    #CR_SECURE_AUTH
    #CR_FETCH_CANCELED
    #CR_NO_DATA
    #CR_NO_STMT_METADATA
    #CR_NO_RESULT_SET
    #CR_NOT_IMPLEMENTED
    #CR_SERVER_LOST_EXTENDED
    #CR_ERROR_LAST  ;Copy last error nr:  2055
  EndEnumeration
  Enumeration ; mysql_timestamp_type
    #MYSQL_TIMESTAMP_NONE     = -2
    #MYSQL_TIMESTAMP_ERROR    = -1
    #MYSQL_TIMESTAMP_DATE     = 0
    #MYSQL_TIMESTAMP_DATETIME = 1
    #MYSQL_TIMESTAMP_TIME     = 2
  EndEnumeration
  Enumeration ; server_command
    #COM_SLEEP
    #COM_QUIT
    #COM_INIT_DB
    #COM_QUERY
    #COM_FIELD_LIST
    #COM_CREATE_DB
    #COM_DROP_DB
    #COM_REFRESH
    #COM_SHUTDOWN
    #COM_STATISTICS
    #COM_PROCESS_INFO
    #COM_CONNECT
    #COM_PROCESS_KILL
    #COM_DEBUG
    #COM_PING
    #COM_TIME
    #COM_DELAYED_INSERT
    #COM_CHANGE_USER
    #COM_BINLOG_DUMP
    #COM_TABLE_DUMP
    #COM_CONNECT_OUT
    #COM_REGISTER_SLAVE
    #COM_STMT_PREPARE
    #COM_STMT_EXECUTE
    #COM_STMT_SEND_LONG_DATA
    #COM_STMT_CLOSE
    #COM_STMT_RESET
    #COM_SET_OPTION
    #COM_STMT_FETCH
    ; Must be last 
    #COM_END
  EndEnumeration
  Enumeration ; field_types
    #MYSQL_TYPE_DECIMAL
    #MYSQL_TYPE_TINY
    #MYSQL_TYPE_SHORT
    #MYSQL_TYPE_LONG
    #MYSQL_TYPE_FLOAT
    #MYSQL_TYPE_DOUBLE
    #MYSQL_TYPE_NULL
    #MYSQL_TYPE_TIMESTAMP
    #MYSQL_TYPE_LONGLONG
    #MYSQL_TYPE_INT24
    #MYSQL_TYPE_DATE
    #MYSQL_TYPE_TIME
    #MYSQL_TYPE_DATETIME
    #MYSQL_TYPE_YEAR
    #MYSQL_TYPE_NEWDATE
    #MYSQL_TYPE_VARCHAR
    #MYSQL_TYPE_BIT
    #MYSQL_TYPE_NEWDECIMAL  = 246
    #MYSQL_TYPE_ENUM        = 247
    #MYSQL_TYPE_SET         = 248
    #MYSQL_TYPE_TINY_BLOB   = 249
    #MYSQL_TYPE_MEDIUM_BLOB = 250
    #MYSQL_TYPE_LONG_BLOB   = 251
    #MYSQL_TYPE_BLOB        = 252
    #MYSQL_TYPE_VAR_STRING  = 253
    #MYSQL_TYPE_STRING      = 254
    #MYSQL_TYPE_GEOMETRY    = 255
  EndEnumeration
  Enumeration ; cursor_type
    #CURSOR_TYPE_NO_CURSOR   = 0
    #CURSOR_TYPE_READ_ONLY   = 1
    #CURSOR_TYPE_FOR_UPDATE  = 2
    #CURSOR_TYPE_SCROLLABLE  = 4
  EndEnumeration
  Enumeration ; mysql_set_option
    #MYSQL_OPTION_MULTI_STATEMENTS_ON
    #MYSQL_OPTION_MULTI_STATEMENTS_OFF
  EndEnumeration
  Enumeration ; Item_result 
    #STRING_RESULT  = 0
    #REAL_RESULT
    #INT_RESULT
    #ROW_RESULT
    #DECIMAL_RESULT
  EndEnumeration
;}
;{ Constants
  #CLIENT_NET_READ_TIMEOUT		= 365*24*3600	; Timeout on Read 
  #CLIENT_NET_WRITE_TIMEOUT	  = 365*24*3600	; Timeout on write 
  #WARN_DATA_TRUNCATED        = 1265
  #ER_WARN_DATA_TRUNCATED     = #WARN_DATA_TRUNCATED
  #MAX_MYSQL_MANAGER_ERR      = 256  
  #MAX_MYSQL_MANAGER_MSG      = 256
  #MANAGER_OK                 = 200
  #MANAGER_INFO               = 250
  #MANAGER_ACCESS             = 401
  #MANAGER_CLIENT_ERR         = 450
  #MANAGER_INTERNAL_ERR       = 500
  #LOCAL_INFILE_ERROR_LEN     = 512
  #CR_MIN_ERROR		            = 2000	; For easier client code 
  #CR_MAX_ERROR		            = 2999
  #CLIENT_ERRMAP		          = 2	    ; Errormap used by my_error() 
  #MYSQL_NO_DATA              = 100
  #MYSQL_DATA_TRUNCATED       = 101
  #ALLOC_MAX_BLOCK_TO_DROP		= 4096
  #ALLOC_MAX_BLOCK_USAGE_BEFORE_DROP = 10 
  #NAME_LEN	                  = 64		; Field/table name length 
  #HOSTNAME_LENGTH            = 60
  #USERNAME_LENGTH            = 16
  #SERVER_VERSION_LENGTH      = 60
  #SQLSTATE_LENGTH            = 5
  #USER_HOST_BUFF_SIZE        = #HOSTNAME_LENGTH + #USERNAME_LENGTH + 2
  #LOCAL_HOST	                = "localhost"
  #LOCAL_HOST_NAMEDPIPE       = "."
  #MYSQL_NAMEDPIPE            = "MySQL"
  #MYSQL_SERVICENAME          = "MySQL"
  #SCRAMBLE_LENGTH            = 20
  #SCRAMBLE_LENGTH_323        = 8
  #SCRAMBLED_PASSWORD_CHAR_LENGTH     = #SCRAMBLE_LENGTH*2+1
  #SCRAMBLED_PASSWORD_CHAR_LENGTH_323 = #SCRAMBLE_LENGTH_323*2
  #NOT_NULL_FLAG	            = 1	  	; Field can't be NULL 
  #PRI_KEY_FLAG		            = 2 		; Field is part of a primary key 
  #UNIQUE_KEY_FLAG            = 4		  ; Field is part of a unique key 
  #MULTIPLE_KEY_FLAG          = 8		  ; Field is part of a key 
  #BLOB_FLAG	                = 16		; Field is a blob 
  #UNSIGNED_FLAG	            = 32		; Field is unsigned 
  #ZEROFILL_FLAG	            = 64		; Field is zerofill 
  #BINARY_FLAG	              = 128		; Field is binary   
  ; The following are only sent To new clients 
  #ENUM_FLAG	                = 256		; field is an enum 
  #AUTO_INCREMENT_FLAG        = 512		; field is a autoincrement field 
  #TIMESTAMP_FLAG	            = 1024	; Field is a timestamp 
  #SET_FLAG	                  = 2048	; field is a set 
  #NO_DEFAULT_VALUE_FLAG      = 4096	; Field doesn't have default value 
  #NUM_FLAG	                  = 32768	; Field is num (For clients) 
  #PART_KEY_FLAG	            = 16384	; Intern Part of some key 
  #GROUP_FLAG	                = 32768	; Intern: Group field 
  #UNIQUE_FLAG	              = 65536	; Intern: Used by sql_yacc 
  #BINCMP_FLAG	              = 131072; Intern: Used by sql_yacc 
  
  #REFRESH_GRANT		          = 1	    ; Refresh grant tables 
  #REFRESH_LOG		            = 2	    ; Start on new log file 
  #REFRESH_TABLES		          = 4	    ; close all tables 
  #REFRESH_HOSTS		          = 8	    ; Flush host cache 
  #REFRESH_STATUS		          = 16	  ; Flush status variables 
  #REFRESH_THREADS		        = 32	  ; Flush thread cache 
  #REFRESH_SLAVE              = 64    ; Reset master info And restart slave thread 
  #REFRESH_MASTER             = 128   ; Remove all bin logs in the index And truncate the index 
  ; The following can't be set with mysql_refresh() 
  #REFRESH_READ_LOCK	        = 16384	; Lock tables For Read 
  #REFRESH_FAST		            = 32768	; Intern flag 
  ; RESET (remove all queries) from query cache 
  #REFRESH_QUERY_CACHE	      = 65536
  #REFRESH_QUERY_CACHE_FREE   = $20000; pack query cache 
  #REFRESH_DES_KEY_FILE	      = $40000
  #REFRESH_USER_RESOURCES	    = $80000
  
  #CLIENT_LONG_PASSWORD	      = 1	; new more secure passwords 
  #CLIENT_FOUND_ROWS	        = 2	; Found instead of affected rows 
  #CLIENT_LONG_FLAG	          = 4	; Get all column flags 
  #CLIENT_CONNECT_WITH_DB	    = 8	; One can specify db on connect 
  #CLIENT_NO_SCHEMA	          = 16	; Don't allow database.table.column 
  #CLIENT_COMPRESS		        = 32	; Can use compression protocol 
  #CLIENT_ODBC		            = 64	; Odbc client 
  #CLIENT_LOCAL_FILES	        = 128	; Can use LOAD Data LOCAL 
  #CLIENT_IGNORE_SPACE	      = 256	; Ignore spaces before '(' 
  #CLIENT_PROTOCOL_41	        = 512	; New 4.1 protocol 
  #CLIENT_INTERACTIVE	        = 1024	; This is an interactive client 
  #CLIENT_SSL                 = 2048	; Switch To SSL after handshake 
  #CLIENT_IGNORE_SIGPIPE      = 4096    ; IGNORE sigpipes 
  #CLIENT_TRANSACTIONS	      = 8192	; Client knows about transactions 
  #CLIENT_RESERVED            = 16384   ; Old flag For 4.1 protocol  
  #CLIENT_SECURE_CONNECTION   = 32768  ; New 4.1 authentication 
  #CLIENT_MULTI_STATEMENTS    = (1 << 16) ; Enable/disable multi-stmt support 
  #CLIENT_MULTI_RESULTS       = (1 << 17) ; Enable/disable multi-results 
  #CLIENT_SSL_VERIFY_SERVER_CERT =  (1 << 30)
  #CLIENT_REMEMBER_OPTIONS    = (1 << 31)
  #SERVER_STATUS_IN_TRANS     = 1	; Transaction has started 
  #SERVER_STATUS_AUTOCOMMIT   = 2	; Server in auto_commit mode 
  #SERVER_MORE_RESULTS_EXISTS = 8    ; Multi query - Next query exists 
  #SERVER_QUERY_NO_GOOD_INDEX_USED = 16
  #SERVER_QUERY_NO_INDEX_USED = 32
  #SERVER_STATUS_CURSOR_EXISTS= 64
  #SERVER_STATUS_LAST_ROW_SENT= 128
  #SERVER_STATUS_DB_DROPPED   = 256 ; A database was dropped 
  #SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512
  
  #MYSQL_ERRMSG_SIZE	        = 512
  #NET_READ_TIMEOUT	          = 30		; Timeout on Read 
  #NET_WRITE_TIMEOUT	        = 60		; Timeout on write 
  #NET_WAIT_TIMEOUT	          = 8*60*60		; Wait For new query 
  
  #ONLY_KILL_QUERY            = 1
  #MAX_TINYINT_WIDTH          = 3       ; Max width For a TINY w.o. sign 
  #MAX_SMALLINT_WIDTH         = 5       ; Max width For a SHORT w.o. sign 
  #MAX_MEDIUMINT_WIDTH        = 8       ; Max width For a INT24 w.o. sign 
  #MAX_INT_WIDTH              = 10      ; Max width For a LONG w.o. sign 
  #MAX_BIGINT_WIDTH           = 20      ; Max width For a LONGLONG 
  #MAX_CHAR_WIDTH		          = 255	; Max length For a CHAR colum 
  #MAX_BLOB_WIDTH		          = 8192	; Default width For blob 
  
  ; For backward compatibility 
  #CLIENT_MULTI_QUERIES       = #CLIENT_MULTI_STATEMENTS    
  #FIELD_TYPE_DECIMAL         = #MYSQL_TYPE_DECIMAL
  #FIELD_TYPE_NEWDECIMAL      = #MYSQL_TYPE_NEWDECIMAL
  #FIELD_TYPE_TINY            = #MYSQL_TYPE_TINY
  #FIELD_TYPE_SHORT           = #MYSQL_TYPE_SHORT
  #FIELD_TYPE_LONG            = #MYSQL_TYPE_LONG
  #FIELD_TYPE_FLOAT           = #MYSQL_TYPE_FLOAT
  #FIELD_TYPE_DOUBLE          = #MYSQL_TYPE_DOUBLE
  #FIELD_TYPE_NULL            = #MYSQL_TYPE_NULL
  #FIELD_TYPE_TIMESTAMP       = #MYSQL_TYPE_TIMESTAMP
  #FIELD_TYPE_LONGLONG        = #MYSQL_TYPE_LONGLONG
  #FIELD_TYPE_INT24           = #MYSQL_TYPE_INT24
  #FIELD_TYPE_DATE            = #MYSQL_TYPE_DATE
  #FIELD_TYPE_TIME            = #MYSQL_TYPE_TIME
  #FIELD_TYPE_DATETIME        = #MYSQL_TYPE_DATETIME
  #FIELD_TYPE_YEAR            = #MYSQL_TYPE_YEAR
  #FIELD_TYPE_NEWDATE         = #MYSQL_TYPE_NEWDATE
  #FIELD_TYPE_ENUM            = #MYSQL_TYPE_ENUM
  #FIELD_TYPE_SET             = #MYSQL_TYPE_SET
  #FIELD_TYPE_TINY_BLOB       = #MYSQL_TYPE_TINY_BLOB
  #FIELD_TYPE_MEDIUM_BLOB     = #MYSQL_TYPE_MEDIUM_BLOB
  #FIELD_TYPE_LONG_BLOB       = #MYSQL_TYPE_LONG_BLOB
  #FIELD_TYPE_BLOB            = #MYSQL_TYPE_BLOB
  #FIELD_TYPE_VAR_STRING      = #MYSQL_TYPE_VAR_STRING
  #FIELD_TYPE_STRING          = #MYSQL_TYPE_STRING
  #FIELD_TYPE_CHAR            = #MYSQL_TYPE_TINY
  #FIELD_TYPE_INTERVAL        = #MYSQL_TYPE_ENUM
  #FIELD_TYPE_GEOMETRY        = #MYSQL_TYPE_GEOMETRY
  #FIELD_TYPE_BIT             = #MYSQL_TYPE_BIT
  ; Bits For THD::killable. 
  #MYSQL_SHUTDOWN_KILLABLE_CONNECT    = 1 << 0
  #MYSQL_SHUTDOWN_KILLABLE_TRANS      = 1 << 1
  #MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE = 1 << 2
  #MYSQL_SHUTDOWN_KILLABLE_UPDATE     = 1 << 3
  Enumeration ; mysql_enum_shutdown_level
    #SHUTDOWN_DEFAULT = 0
    ; wait For existing connections To finish 
    #SHUTDOWN_WAIT_CONNECTIONS      = #MYSQL_SHUTDOWN_KILLABLE_CONNECT
    ; wait For existing trans To finish 
    #SHUTDOWN_WAIT_TRANSACTIONS     = #MYSQL_SHUTDOWN_KILLABLE_TRANS
    ; wait For existing updates To finish (=> no partial MyISAM update) 
    #SHUTDOWN_WAIT_UPDATES          = #MYSQL_SHUTDOWN_KILLABLE_UPDATE
    ; flush InnoDB buffers And other storage engines' buffers
    #SHUTDOWN_WAIT_ALL_BUFFERS      = #MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1
    ; don't flush InnoDB buffers, flush other storage engines' buffers
    #SHUTDOWN_WAIT_CRITICAL_BUFFERS = (#MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1
    ; Now the 2 levels of the KILL command 
    #KILL_QUERY= 254
    #KILL_CONNECTION= 255
  EndEnumeration
  
  #NET_HEADER_SIZE            = 4		; standard header size 
  #COMP_HEADER_SIZE           = 3		; compression header extra size 
  #MYSQL_STMT_HEADER          = 4
  #MYSQL_LONG_DATA_HEADER     = 6
  #PROTOCOL_VERSION		        = 10
  #MYSQL_SERVER_VERSION	      = 	"5.0.67"
  #MYSQL_BASE_VERSION		      = "mysqld-5.0"
  #MYSQL_SERVER_SUFFIX_DEF	  = 	"-community-nt"
  #FRM_VER				            = 6
  #MYSQL_VERSION_ID		        = 50067
  #MYSQL_PORT			            = 3306
  #MYSQL_PORT_DEFAULT	        = 	0
  #MYSQL_UNIX_ADDR		        = 	"/tmp/mysql.sock"
  #MYSQL_CONFIG_NAME	        = 	"my"
  #MYSQL_COMPILATION_COMMENT	= "MySQL Community Edition (GPL)"
  #LICENSE				            = "GPL"
;}
;{ Macros
  Macro IS_PRI_KEY(n)	
    (n And #PRI_KEY_FLAG)
  EndMacro
  Macro IS_NOT_NULL(n)	
    (n And #NOT_NULL_FLAG)
  EndMacro
  Macro IS_BLOB(n)
    (n And #BLOB_FLAG)
  EndMacro
  Macro IS_NUM(t)	
    (t <= #FIELD_TYPE_INT24 || t = #FIELD_TYPE_YEAR || t = #FIELD_TYPE_NEWDECIMAL)
  EndMacro
  Macro IS_NUM_FIELD(f)
    (f\flags And #NUM_FLAG)
  EndMacro
  Macro INTERNAL_NUM_FIELD(f) 
    ((f\type <= #FIELD_TYPE_INT24 And (f\type <> #FIELD_TYPE_TIMESTAMP || f\length = 14 || f\length = 8)) || f\type = #FIELD_TYPE_YEAR)
  EndMacro
  Macro IS_LONGDATA(t)
    (t >= #MYSQL_TYPE_TINY_BLOB And t <= #MYSQL_TYPE_STRING)
  EndMacro
  Macro mysql_reload(mysql)
    mysql_refresh(mysql, #REFRESH_GRANT)
  EndMacro
  Macro list_rest(a) 
    a\next_
  EndMacro
  Macro list_push(a,b) 
    a = list_cons(b,a)
  EndMacro
  Macro MYSQL_FIELD_OFFSET
    l ; offset to current field
  EndMacro
  Macro character_set
    MY_CHARSET_INFO
  EndMacro
  Macro net_new_transaction(net) 
    net\pkt_nr=0
  EndMacro
  
  Macro enum_mysql_option         ; ENUM
    l
  EndMacro
  Macro enum_mysql_status         ; ENUM
    l
  EndMacro
  Macro enum_field_types          ; ENUM
    l
  EndMacro
  Macro enum_mysql_timestamp_type ; ENUM
  l
EndMacro
  Macro enum_mysql_stmt_state     ; ENUM
    l
  EndMacro
;}
;{ Structures
  Structure MYSQL_ROW
    field.s[255]
  EndStructure
  Structure MYSQL_FIELD
    name.s                 ; Name of column 
    org_name.s             ; Original column name, If an alias 
    table.s                ; Table of column If column was a field 
    org_table.s            ; Org table name, If table was an alias 
    db.s                   ; Database For table 
    catalog.s	             ; Catalog For table 
    def.s                  ; Default value (set by mysql_list_fields) 
    length.l               ; Width of column (create length) 
    max_length.l           ; Max width For selected set 
    name_length.l
    org_name_length.l
    table_length.l
    org_table_length.l
    db_length.l
    catalog_length.l
    def_length.l
    flags.l                ; Div flags 
    decimals.l             ; Number of decimals in field 
    charsetnr.l            ; Character set 
    type.l                 ; Type of field. See mysql_com.h For types 
  EndStructure
  Structure MYSQL_ROWS
    *next_.MYSQL_ROWS		; list of rows 
    data_.MYSQL_ROW
    length.l
  EndStructure
  Structure USED_MEM
    *next_.USED_MEM	; Next block in use 
    left.l		      ; memory left in block  
    size.l		      ; size of block 
  EndStructure
  Structure MEM_ROOT
    *free.USED_MEM       ; blocks With free memory in it 
    *used.USED_MEM       ; blocks almost without free memory 
    *pre_alloc.USED_MEM  ; preallocated block 
    ; If block have less memory it will be put in 'used' list 
    min_malloc.l
    block_size.l         ; initial block size 
    block_num.l          ; allocated blocks counter 
    ; first free block in queue test counter (If it exceed MAX_BLOCK_USAGE_BEFORE_DROP block will be dropped in 'used' list)
    first_block_usage.l 
    *error_handler
  EndStructure
  Structure MYSQL_DATA
    rows.l
    fields.l
    *data_.MYSQL_ROWS
    alloc.MEM_ROOT
    ; extra info For embedded library 
    *embedded_info
  EndStructure
  Structure MYSQL_OPTIONS
    connect_timeout.l
    read_timeout.l
    write_timeout.l
    port.l
    protocol.l
    client_flag.l
    host.s
    user.s
    password.s
    unix_socket.s
    db.s
    *init_commands
    my_cnf_file.s
    my_cnf_group.s
    charset_dir.s
    charset_name.s
    ssl_key.s				          ; PEM key file 
    ssl_cert.s				        ; PEM cert file 
    ssl_ca.s					        ; PEM CA file 
    ssl_capath.s				      ; PEM directory of CA-s? 
    ssl_cipher.s				      ; cipher To use 
    shared_memory_base_name.s
    max_allowed_packet.l
    use_ssl.b				    ; If To use SSL Or Not 
    compress.b
    named_pipe.b
    ; On connect, find out the replication role of the server, And establish connections To all the peers
    rpl_probe.b
   ; Each call To mysql_real_query() will parse it To tell If it is a Read Or a write, And direct it To the slave Or the master
    rpl_parse.b
   ; If set, never Read from a master, only from slave, when doing a Read that is replication-aware
    no_master_reads.b
    separate_thread.b
    *methods_to_use.mysql_option
    client_ip.s
    ; Refuse client connecting To server If it uses old (pre-4.1.1) protocol 
    secure_auth.b
    ; 0 - never report, 1 - always report (Default) 
    report_data_truncation.b
  
    ; function pointers For local infile support 
    *fn_local_infile_init
    *fn_local_infile_read
    *fn_local_infile_end
    *fn_local_infile_error
    *fn_local_infile_userdata
  EndStructure
  Structure MY_CHARSET_INFO
    number.l     ; character set number              
    state.l      ; character set state               
    csname.s     ; collation name                    
    name.s       ; character set name                
    comment.s    ; comment                           
    dir.s        ; character set directory           
    mbminlen.l   ; min. length For multibyte strings 
    mbmaxlen.l   ; max. length For multibyte strings 
  EndStructure
  Structure MYSQL
    *net.NET			                  ; Communication parameters 
    connector_fd.l                  ; ConnectorFd For SSL 
    host.s
    user.s
    passwd.s
    unix_socket.s
    server_version.s
    host_info.s
    info.s
    db.s
    *charset.character_set
    *fields.MYSQL_FIELD	
    *field_alloc.MEM_ROOT	
    affected_rows.l
    insert_id.l		                  ; id If insert on table With NEXTNR 
    extra_info.l		                ; Not used 
    thread_id.l		                  ; Id For connection in server 
    packet_length.l
    port.l
    client_flag.l
    server_capabilities.l
    protocol_version.l
    field_count.l
    server_status.l
    server_language.l
    warning_count.l
    *options.st_mysql_options
    *status.mysql_status
    free_me.b		                    ; If free in mysql_close 
    reconnect.b		                  ; set To 1 If automatic reconnect 
    ; session-wide random string 
    scramble.b[#SCRAMBLE_LENGTH+1]
   ; Set If this is the original connection, Not a master Or a slave we have added though mysql_rpl_probe() Or mysql_set_master()/ mysql_add_slave()
    rpl_pivot.b
    ; Pointers To the master, And the Next slave connections, points To itself If lone connection.
    *master.MYSQL
    *next_slave.MYSQL
    *last_used_slave.MYSQL          ; needed For round-robin slave pick 
   ; needed For send/Read/store/use result To work correctly With replication 
    *last_used_con.MYSQL
    *stmts.LIST                     ; list of all statements 
    *methods.mysql_methods
    *thd
    ; Points To boolean flag in MYSQL_RES  Or MYSQL_STMT. We set this flag  from mysql_stmt_close If close had To cancel result set of this object.
    unbuffered_fetch_owner.b
    ; needed For embedded server - no net buffer To store the 'info' 
    info_buffer.s
  EndStructure
  Structure MYSQL_RES
    row_count.l
    *fields.MYSQL_FIELD
    *data_.MYSQL_DATA
    *data_cursor.MYSQL_ROWS
    *lengths		          ; column lengths of current row 
    *handle.MYSQL		      ; For unbuffered reads 
    *field_alloc.MEM_ROOT
    field_count.l
    current_field.l
    row.MYSQL_ROW			    ; If unbuffered Read 
    current_row.MYSQL_ROW	; buffer To current row 
    eof.c			            ; Used by mysql_fetch_row 
    ; mysql_stmt_close() had To cancel this result 
    unbuffered_fetch_cancelled.c
    *methods
  EndStructure
  Structure MYSQL_MANAGER
    *net.NET
    host.s
    user.s
    passwd.s
    port.l
    free_me.c
    eof.c
    cmd_status.l
    last_errno.l
    net_buf.s
    net_buf_pos.s
    net_data_end.s
    net_buf_size.l
    last_error.c[#MAX_MYSQL_MANAGER_ERR]
  EndStructure
  Structure MYSQL_PARAMETERS
    p_max_allowed_packet.l
    p_net_buffer_length.l
  EndStructure
  Structure MYSQL_BIND
    *length.l         ; output length pointer 
    *is_null.c	      ; Pointer To null indicator 
    *buffer	          ; buffer To get/put Data 
    ; set this If you want To track Data truncations happened during fetch 
    error.c
    buffer_type.enum_field_types	; buffer type 
    ; output buffer length, must be set when fetching str/binary 
    buffer_length.l
    row_ptr.s         ; For the current Data position 
    offset.l          ; offset position For char/binary fetch 
    length_value.l    ; Used If length is 0 
    param_number.l	  ; For null count And error messages 
    pack_length.l	    ; Internal length For packed Data 
    error_value.c     ; used If error is 0 
    is_unsigned.c     ; set If integer type is unsigned 
    long_data_used.c	; If used With mysql_send_long_data 
    is_null_value.c   ; Used If is_null is 0 
    *store_param_func
    *fetch_result
    *skip_result
  EndStructure
  Structure MYSQL_STMT
    mem_root.MEM_ROOT                 ; root allocations 
    *list.LIST                         ; list To keep track of all stmts 
    *mysql.MYSQL                      ; connection handle 
    *params.MYSQL_BIND                ; input parameters 
    *bind.MYSQL_BIND                  ; output parameters 
    *fields.MYSQL_FIELD               ; result set metadata 
    result.MYSQL_DATA                 ; cached result set 
    *data_cursor.MYSQL_ROWS           ; current row in cached result 
    ; copy of mysql->affected_rows after statement execution 
    affected_rows.l
    insert_id.l                       ; copy of mysql->insert_id 
    ;  mysql_stmt_fetch() calls this function To fetch one row (it's different For buffered, unbuffered And cursor fetch).
    *read_row_func
    stmt_id.l	                        ; Id For prepared statement 
    flags.l                           ; i.e. type of cursor To open 
    prefetch_rows.l                   ; number of rows per one COM_FETCH 
    ; Copied from mysql->server_status after execute/fetch To know server-side cursor status For this statement.
    server_status.l
    last_errno.l	                    ; error code 
    param_count.l                     ; input parameter count 
    field_count.l                     ; number of columns in result set 
    state.enum_mysql_stmt_state       ; statement state 
    last_error.s{#MYSQL_ERRMSG_SIZE}  ; error message 
    sqlstate.s{#SQLSTATE_LENGTH+1}
    ; Types of input parameters should be sent To server 
    send_types_to_server.c
    bind_param_done.c                 ; input buffers were supplied 
    *bind_result_done                 ; output buffers were supplied 
    ; mysql_stmt_close() had To cancel this result 
    unbuffered_fetch_cancelled.c
    ; Is set To true If we need To calculate field->max_length For  metadata fields when doing mysql_stmt_store_result.
    update_max_length.c
  EndStructure 
  Structure MYSQL_METHODS
    *read_query_result
    *advanced_command
    *read_rows
    *use_result
    *fetch_lengths
    *flush_use_result
    *list_fields
    *read_prepare_result
    *stmt_execute
    *read_binary_rows
    *unbuffered_fetch
    *free_embedded_thd
    *read_statistics
    *next_result
    *read_change_user_result
    *read_rows_from_cursor
  EndStructure
  Structure LIST
    *prev.LIST
    *next_.LIST
    *data_
  EndStructure
  Structure NET
    *vio
    buff.s
    buff_end.s
    write_pos.s
    read_pos.s
    fd.l					; For Perl DBI/dbd 
    max_packet.l
    max_packet_size.l
    pkt_nr.l
    compress_pkt_nr.l
    write_timeout.l
    read_timeout.l
    retry_count.l
    fcntl.l
    compress.c
    ; The following variable is set If we are doing several queries in one command ( As in LOAD TABLE ... FROM MASTER ), And do Not want To confuse the client With OK at the wrong time
    remain_in_buf.l
    length.l
    buf_length.l
    where_b.l
    *return_status
    reading_or_writing.c
    save_char.c
    no_send_ok.c  ; For SPs And other things that do multiple stmts 
    no_send_eof.c ; For SPs' first version read-only cursors 
    ; Set If OK packet is already sent, And we do Not need To send error messages
    no_send_error.c
    ; Pointer To query object in query cache, do Not equal NULL (0) For queries in cache that have Not stored its results yet
    last_error.s{#MYSQL_ERRMSG_SIZE}
    sqlstate.s{#SQLSTATE_LENGTH+1}
    last_errno.l
    error.c
    ; 'query_cache_query' should be accessed only via query cache functions And methods To maintain proper locking.
    *query_cache_query
    report_error.c ; We should report error (we have unreported error) 
    return_errno.c
  EndStructure 
  Structure rand_struct
    seed1.l
    seed2.l
    max_value.l
    max_value_dbl.d
  EndStructure
  Structure UDF_ARGS
    arg_count.l			    ; Number of arguments 
    *arg_type				    ; Pointer To item_results 
    *args						    ; Pointer To argument 
    *lengths				    ; Length of string arguments 
    *maybe_null			    ; Set To 1 For all maybe_null args 
    *attributes         ; Pointer To attribute name 
    *attribute_lengths  ; Length of attribute arguments 
  EndStructure
  Structure UDF_INIT
    maybe_null.c  ; 1 If function can Return NULL 
    decimals.l    ; For real functions 
    max_length.l  ; For string functions 
    *ptr          ; free pointer For function Data 
    const_item.c  ; 1 If function always returns the same value 
  EndStructure
  Structure MYSQL_TIME
    year.l
    month.l
    day.l
    hour.l
    minute.l
    second.l
    second_part.l
    neg.c
    time_type.enum_mysql_timestamp_type
  EndStructure
  Structure TYPELIB
    count.l		; How many types 
    name.s		; Name of typelib 
    *type_names
    *type_lengths
  EndStructure
;}


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 444
; FirstLine = 26
; Folding = BQQAAgAAAw
; EnableUnicode