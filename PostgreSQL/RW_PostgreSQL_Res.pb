; Application-visible enum types 
Enumeration 0 ; ConnStatusType
	;Although it is okay To add To this list values which become unused
	;should never be removed nor should constants be redefined - that would
	;Break compatibility With existing code.
	#CONNECTION_OK
	#CONNECTION_BAD
	;The existence of these should never be relied upon - they should only
	;be used For user feedback Or similar purposes.
	#CONNECTION_STARTED			      ; Waiting For connection To be made.  
	#CONNECTION_MADE			        ; Connection OK waiting To send.	   
	#CONNECTION_AWAITING_RESPONSE ; Waiting For a response from the postmaster.		  
	#CONNECTION_AUTH_OK			      ; Received authentication waiting For backend startup. 
	#CONNECTION_SETENV			      ; Negotiating environment. 
	#CONNECTION_SSL_STARTUP		    ; Negotiating SSL. 
	#CONNECTION_NEEDED			      ; Internal state: connect() needed 
EndEnumeration 
Enumeration 0 ; PostgresPollingStatusType
	#PGRES_POLLING_FAILED = 0
	#PGRES_POLLING_READING		; These two indicate that one may	  
	#PGRES_POLLING_WRITING		; use Select before polling again.   
	#PGRES_POLLING_OK
	#PGRES_POLLING_ACTIVE		; unused keep For awhile For backwards compatibility 
EndEnumeration 
Enumeration 0 ; ExecStatusType
	#PGRES_EMPTY_QUERY = 0	; empty query string was executed 
	#PGRES_COMMAND_OK			  ; a query command that doesn't return anything was executed properly by the backend 
	#PGRES_TUPLES_OK			  ; a query command that returns tuples was executed properly by the backend PGresult contains the result tuples 
	#PGRES_COPY_OUT				  ; Copy Out Data transfer in progress 
	#PGRES_COPY_IN				  ; Copy In Data transfer in progress 
	#PGRES_BAD_RESPONSE			; an unexpected response was recv'd from the backend 
	#PGRES_NONFATAL_ERROR		; notice Or warning message 
	#PGRES_FATAL_ERROR			; query failed 
EndEnumeration 
Enumeration 0 ; PGTransactionStatusType
	#PQTRANS_IDLE    ; connection idle 
	#PQTRANS_ACTIVE  ; command in progress 
	#PQTRANS_INTRANS ; idle within transaction block 
	#PQTRANS_INERROR ; idle within failed transaction 
	#PQTRANS_UNKNOWN ; cannot determine status 
EndEnumeration 
Enumeration 0 ; PGVerbosity
	#PQERRORS_TERSE    ; single-line error messages 
	#PQERRORS_DEFAULT  ; recommended style 
	#PQERRORS_VERBOSE  ; all the facts ma'am 
EndEnumeration 
Macro ConnStatusType
  l
EndMacro
Macro PostgresPollingStatusType
  l
EndMacro
Macro ExecStatusType
  l
EndMacro
Macro PGTransactionStatusType
  l
EndMacro
Macro PGVerbosity
  l
EndMacro


; PGconn encapsulates a connection To the backend.
;   The contents of this struct are Not supposed To be known To applications.
Macro PGconn
  l
EndMacro
; PGresult encapsulates the result of a query (Or more precisely of a single
;   SQL command --- a query string given To PQsendQuery can contain multiple
;   commands And thus Return multiple PGresult objects).
;   The contents of this struct are Not supposed To be known To applications.
Macro PGresult
  l
EndMacro
; PGcancel encapsulates the information needed To cancel a running
;   query on an existing connection.
;   The contents of this struct are Not supposed To be known To applications.
Macro PGcancel
  l
EndMacro

; PGnotify represents the occurrence of a NOTIFY message.
;   Ideally this would be an opaque typedef but it's so simple that it's
;   unlikely To change.
;   NOTE: in Postgres 6.4 And later the be_pid is the notifying backend's
;   whereas in earlier versions it was always your own backend's PID.
Structure pgNotify
	relname.s ; notification condition name 
	be_pid.l	; process ID of notifying server process 
	extra.s		; notification parameter 
	; Fields below here are private To libpq apps should Not use 'em 
	*next_.pgNotify		; list link 
EndStructure 

; Function types For notice-handling callbacks 
Prototype.l PQnoticeReceiver(*arg, *res.PGresult)
Prototype.l PQnoticeProcessor(*arg, message.s)

; Print options For PQprint() 
Macro pqbool
 c
EndMacro

Structure PQprintOpt
	header.pqbool   ; print output field headings And row count 
	align.pqbool    ; fill align the fields 
	standard.pqbool ; old brain dead format 
	html3.pqbool		; output html tables 
	expanded.pqbool ; expand tables 
	pager.pqbool		; use pager For output If needed 
	fieldSep.s		  ; field separator 
	tableOpt.s		  ; insert To HTML <table ...> 
	caption.s		  ; HTML <caption> 
	fieldName.s		; null terminated array of replacement field names 
EndStructure

; Structure For the conninfo parameter definitions returned by PQconndefaults
;   All fields except "val" point at Static strings which must Not be altered.
;   "val" is either NULL Or a malloc'd current-value string.  PQconninfoFree()
;   will release both the val strings And the PQconninfoOption array itself.
Structure PQconninfoOption
	keyword.s	  ; The keyword of the option			
	envvar.s		; Fallback environment variable name	
	compiled.s  ; Fallback compiled in Default value	
	val.s       ; Option's current value or NULL		 
	label.s	    ; Label For field in connect dialog	
	dispchar.s	; Character To display For this field in a connect dialog. Values are: "" Display entered value As is "*" Password field - hide value "D"  Debug option - don't show by Default 
	dispsize.l	; Field size in characters For dialog	
EndStructure

;PQArgBlock -- Structure For PQfn() arguments
Structure PQArgBlock
	len.l
	isint.l
	StructureUnion
		*ptr		  ; can't use void (dec compiler barfs)	 
		integer.l
  EndStructureUnion
EndStructure

Macro PQsetdb(M_PGHOST,M_PGPORT,M_PGOPT,M_PGTTY,M_DBNAME)
  PQsetdbLogin(M_PGHOST, M_PGPORT, M_PGOPT, M_PGTTY, M_DBNAME, NULL, NULL)
EndMacro

Prototype.l pgthreadlock_t(acquire.l)

Macro PQfreeNotify(ptr)
  PQfreemem(ptr)
EndMacro

Macro PQnoPasswordSupplied	
  "fe_sendauth: no password supplied\n"
EndMacro


; Identifiers of error message fields.  Kept here To keep common
;   between frontend And backend, And also To export them To libpq
;   applications.
#PG_DIAG_SEVERITY		        = 'S'
#PG_DIAG_SQLSTATE		        = 'C'
#PG_DIAG_MESSAGE_PRIMARY    = 'M'
#PG_DIAG_MESSAGE_DETAIL	    = 'D'
#PG_DIAG_MESSAGE_HINT	      = 'H'
#PG_DIAG_STATEMENT_POSITION = 'P'
#PG_DIAG_INTERNAL_POSITION  = 'p'
#PG_DIAG_INTERNAL_QUERY	    = 'q'
#PG_DIAG_CONTEXT			      = 'W'
#PG_DIAG_SOURCE_FILE		    = 'F'
#PG_DIAG_SOURCE_LINE		    = 'L'
#PG_DIAG_SOURCE_FUNCTION    = 'R'

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 170
; FirstLine = 38
; Folding = AAA-
; EnableUnicode