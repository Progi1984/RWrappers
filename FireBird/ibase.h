ISC_STATUS ISC_EXPORT isc_attach_database(ISC_STATUS*,
										  short,
										  const ISC_SCHAR*,
										  isc_db_handle*,
										  short,
										  const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_array_gen_sdl(ISC_STATUS*,
										const ISC_ARRAY_DESC*,
										ISC_SHORT*,
										ISC_UCHAR*,
										ISC_SHORT*);

ISC_STATUS ISC_EXPORT isc_array_get_slice(ISC_STATUS*,
										  isc_db_handle*,
										  isc_tr_handle*,
										  ISC_QUAD*,
										  const ISC_ARRAY_DESC*,
										  void*,
										  ISC_LONG*);

ISC_STATUS ISC_EXPORT isc_array_lookup_bounds(ISC_STATUS*,
											  isc_db_handle*,
											  isc_tr_handle*,
											  const ISC_SCHAR*,
											  const ISC_SCHAR*,
											  ISC_ARRAY_DESC*);

ISC_STATUS ISC_EXPORT isc_array_lookup_desc(ISC_STATUS*,
											isc_db_handle*,
											isc_tr_handle*,
											const ISC_SCHAR*,
											const ISC_SCHAR*,
											ISC_ARRAY_DESC*);

ISC_STATUS ISC_EXPORT isc_array_set_desc(ISC_STATUS*,
										 const ISC_SCHAR*,
										 const ISC_SCHAR*,
										 const short*,
										 const short*,
										 const short*,
										 ISC_ARRAY_DESC*);

ISC_STATUS ISC_EXPORT isc_array_put_slice(ISC_STATUS*,
										  isc_db_handle*,
										  isc_tr_handle*,
										  ISC_QUAD*,
										  const ISC_ARRAY_DESC*,
										  void*,
										  ISC_LONG *);

void ISC_EXPORT isc_blob_default_desc(ISC_BLOB_DESC*,
									  const ISC_UCHAR*,
									  const ISC_UCHAR*);

ISC_STATUS ISC_EXPORT isc_blob_gen_bpb(ISC_STATUS*,
									   const ISC_BLOB_DESC*,
									   const ISC_BLOB_DESC*,
									   unsigned short,
									   ISC_UCHAR*,
									   unsigned short*);

ISC_STATUS ISC_EXPORT isc_blob_info(ISC_STATUS*,
									isc_blob_handle*,
									short,
									const ISC_SCHAR*,
									short,
									ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_blob_lookup_desc(ISC_STATUS*,
										   isc_db_handle*,
										   isc_tr_handle*,
										   const ISC_UCHAR*,
										   const ISC_UCHAR*,
										   ISC_BLOB_DESC*,
										   ISC_UCHAR*);

ISC_STATUS ISC_EXPORT isc_blob_set_desc(ISC_STATUS*,
										const ISC_UCHAR*,
										const ISC_UCHAR*,
										short,
										short,
										short,
										ISC_BLOB_DESC*);

ISC_STATUS ISC_EXPORT isc_cancel_blob(ISC_STATUS *,
									  isc_blob_handle *);

ISC_STATUS ISC_EXPORT isc_cancel_events(ISC_STATUS *,
										isc_db_handle *,
										ISC_LONG *);

ISC_STATUS ISC_EXPORT isc_close_blob(ISC_STATUS *,
									 isc_blob_handle *);

ISC_STATUS ISC_EXPORT isc_commit_retaining(ISC_STATUS *,
										   isc_tr_handle *);

ISC_STATUS ISC_EXPORT isc_commit_transaction(ISC_STATUS *,
											 isc_tr_handle *);

ISC_STATUS ISC_EXPORT isc_create_blob(ISC_STATUS*,
									  isc_db_handle*,
									  isc_tr_handle*,
									  isc_blob_handle*,
									  ISC_QUAD*);

ISC_STATUS ISC_EXPORT isc_create_blob2(ISC_STATUS*,
									   isc_db_handle*,
									   isc_tr_handle*,
									   isc_blob_handle*,
									   ISC_QUAD*,
									   short,
									   const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_create_database(ISC_STATUS*,
										  short,
										  const ISC_SCHAR*,
										  isc_db_handle*,
										  short,
										  const ISC_SCHAR*,
										  short);

ISC_STATUS ISC_EXPORT isc_database_info(ISC_STATUS*,
										isc_db_handle*,
										short,
										const ISC_SCHAR*,
										short,
										ISC_SCHAR*);

void ISC_EXPORT isc_decode_date(const ISC_QUAD*,
								void*);

void ISC_EXPORT isc_decode_sql_date(const ISC_DATE*,
									void*);

void ISC_EXPORT isc_decode_sql_time(const ISC_TIME*,
									void*);

void ISC_EXPORT isc_decode_timestamp(const ISC_TIMESTAMP*,
									 void*);

ISC_STATUS ISC_EXPORT isc_detach_database(ISC_STATUS *,
										  isc_db_handle *);

ISC_STATUS ISC_EXPORT isc_drop_database(ISC_STATUS *,
										isc_db_handle *);

ISC_STATUS ISC_EXPORT isc_dsql_allocate_statement(ISC_STATUS *,
												  isc_db_handle *,
												  isc_stmt_handle *);

ISC_STATUS ISC_EXPORT isc_dsql_alloc_statement2(ISC_STATUS *,
												isc_db_handle *,
												isc_stmt_handle *);

ISC_STATUS ISC_EXPORT isc_dsql_describe(ISC_STATUS *,
										isc_stmt_handle *,
										unsigned short,
										XSQLDA *);

ISC_STATUS ISC_EXPORT isc_dsql_describe_bind(ISC_STATUS *,
											 isc_stmt_handle *,
											 unsigned short,
											 XSQLDA *);

ISC_STATUS ISC_EXPORT isc_dsql_exec_immed2(ISC_STATUS*,
										   isc_db_handle*,
										   isc_tr_handle*,
										   unsigned short,
										   const ISC_SCHAR*,
										   unsigned short,
										   XSQLDA*,
										   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_dsql_execute(ISC_STATUS*,
									   isc_tr_handle*,
									   isc_stmt_handle*,
									   unsigned short,
									   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_dsql_execute2(ISC_STATUS*,
										isc_tr_handle*,
										isc_stmt_handle*,
										unsigned short,
										XSQLDA*,
										XSQLDA*);

ISC_STATUS ISC_EXPORT isc_dsql_execute_immediate(ISC_STATUS*,
												 isc_db_handle*,
												 isc_tr_handle*,
												 unsigned short,
												 const ISC_SCHAR*,
												 unsigned short,
												 XSQLDA*);

ISC_STATUS ISC_EXPORT isc_dsql_fetch(ISC_STATUS *,
									 isc_stmt_handle *,
									 unsigned short,
									 XSQLDA *);

ISC_STATUS ISC_EXPORT isc_dsql_finish(isc_db_handle *);

ISC_STATUS ISC_EXPORT isc_dsql_free_statement(ISC_STATUS *,
											  isc_stmt_handle *,
											  unsigned short);

ISC_STATUS ISC_EXPORT isc_dsql_insert(ISC_STATUS*,
									  isc_stmt_handle*,
									  unsigned short,
									  XSQLDA*);

ISC_STATUS ISC_EXPORT isc_dsql_prepare(ISC_STATUS*,
									   isc_tr_handle*,
									   isc_stmt_handle*,
									   unsigned short,
									   const ISC_SCHAR*,
									   unsigned short,
									   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_dsql_set_cursor_name(ISC_STATUS*,
											   isc_stmt_handle*,
											   const ISC_SCHAR*,
											   unsigned short);

ISC_STATUS ISC_EXPORT isc_dsql_sql_info(ISC_STATUS*,
										isc_stmt_handle*,
										short,
										const ISC_SCHAR*,
										short,
										ISC_SCHAR*);

void ISC_EXPORT isc_encode_date(const void*,
								ISC_QUAD*);

void ISC_EXPORT isc_encode_sql_date(const void*,
									ISC_DATE*);

void ISC_EXPORT isc_encode_sql_time(const void*,
									ISC_TIME*);

void ISC_EXPORT isc_encode_timestamp(const void*,
									 ISC_TIMESTAMP*);

ISC_LONG ISC_EXPORT_VARARG isc_event_block(ISC_UCHAR**,
										   ISC_UCHAR**,
										   ISC_USHORT, ...);

ISC_USHORT ISC_EXPORT isc_event_block_a(ISC_SCHAR**,
										ISC_SCHAR**,
										ISC_USHORT, 
										ISC_SCHAR**);

void ISC_EXPORT isc_event_block_s(ISC_SCHAR**,
								  ISC_SCHAR**,
								  ISC_USHORT,
								  ISC_SCHAR**,
								  ISC_USHORT*);

void ISC_EXPORT isc_event_counts(ISC_ULONG*,
								 short,
								 ISC_UCHAR*,
								 const ISC_UCHAR *);

/* 17 May 2001 - isc_expand_dpb is DEPRECATED */
void FB_API_DEPRECATED ISC_EXPORT_VARARG isc_expand_dpb(ISC_SCHAR**,
											  			short*, ...);

int ISC_EXPORT isc_modify_dpb(ISC_SCHAR**,
							  short*,
							  unsigned short,
							  const ISC_SCHAR*,
							  short);

ISC_LONG ISC_EXPORT isc_free(ISC_SCHAR *);

ISC_STATUS ISC_EXPORT isc_get_segment(ISC_STATUS *,
									  isc_blob_handle *,
									  unsigned short *,
									  unsigned short,
									  ISC_SCHAR *);

ISC_STATUS ISC_EXPORT isc_get_slice(ISC_STATUS*,
									isc_db_handle*,
									isc_tr_handle*,
									ISC_QUAD*,
									short,
									const ISC_SCHAR*,
									short,
									const ISC_LONG*,
									ISC_LONG,
									void*,
									ISC_LONG*);

/* CVC: This non-const signature is needed for compatibility, see gds.cpp. */
ISC_LONG FB_API_DEPRECATED ISC_EXPORT isc_interprete(ISC_SCHAR*,
									 ISC_STATUS**);

/* This const params version used in the engine and other places. */
ISC_LONG ISC_EXPORT fb_interpret(ISC_SCHAR*,
								 unsigned int,
								 const ISC_STATUS**);

ISC_STATUS ISC_EXPORT isc_open_blob(ISC_STATUS*,
									isc_db_handle*,
									isc_tr_handle*,
									isc_blob_handle*,
									ISC_QUAD*);

ISC_STATUS ISC_EXPORT isc_open_blob2(ISC_STATUS*,
									 isc_db_handle*,
									 isc_tr_handle*,
									 isc_blob_handle*,
									 ISC_QUAD*,
									 ISC_USHORT,
									 const ISC_UCHAR*);

ISC_STATUS ISC_EXPORT isc_prepare_transaction2(ISC_STATUS*,
											   isc_tr_handle*,
											   ISC_USHORT,
											   const ISC_UCHAR*);

void ISC_EXPORT isc_print_sqlerror(ISC_SHORT,
								   const ISC_STATUS*);

ISC_STATUS ISC_EXPORT isc_print_status(const ISC_STATUS*);

ISC_STATUS ISC_EXPORT isc_put_segment(ISC_STATUS*,
									  isc_blob_handle*,
									  unsigned short,
									  const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_put_slice(ISC_STATUS*,
									isc_db_handle*,
									isc_tr_handle*,
									ISC_QUAD*,
									short,
									const ISC_SCHAR*,
									short,
									const ISC_LONG*,
									ISC_LONG,
									void*);

ISC_STATUS ISC_EXPORT isc_que_events(ISC_STATUS*,
									 isc_db_handle*,
									 ISC_LONG*,
									 short,
									 const ISC_UCHAR*,
									 ISC_EVENT_CALLBACK,
									 void*);

ISC_STATUS ISC_EXPORT isc_rollback_retaining(ISC_STATUS *,
											 isc_tr_handle *);

ISC_STATUS ISC_EXPORT isc_rollback_transaction(ISC_STATUS *,
											   isc_tr_handle *);

ISC_STATUS ISC_EXPORT isc_start_multiple(ISC_STATUS *,
										 isc_tr_handle *,
										 short,
										 void *);

ISC_STATUS ISC_EXPORT_VARARG isc_start_transaction(ISC_STATUS *,
												   isc_tr_handle *,
												   short, ...);

ISC_LONG ISC_EXPORT isc_sqlcode(const ISC_STATUS*);

void ISC_EXPORT isc_sqlcode_s(const ISC_STATUS*,
							  ISC_ULONG*);

void ISC_EXPORT isc_sql_interprete(short,
								   ISC_SCHAR*,
								   short);

ISC_STATUS ISC_EXPORT isc_transaction_info(ISC_STATUS*,
										   isc_tr_handle*,
										   short,
										   const ISC_SCHAR*,
										   short,
										   ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_transact_request(ISC_STATUS*,
										   isc_db_handle*,
										   isc_tr_handle*,
										   unsigned short,
										   const ISC_SCHAR*,
										   unsigned short,
										   ISC_SCHAR*,
										   unsigned short,
										   ISC_SCHAR*);

ISC_LONG ISC_EXPORT isc_vax_integer(const ISC_SCHAR*,
									short);

ISC_INT64 ISC_EXPORT isc_portable_integer(const ISC_UCHAR*,
										  short);


ISC_STATUS ISC_EXPORT isc_add_user(ISC_STATUS*, const USER_SEC_DATA*);

ISC_STATUS ISC_EXPORT isc_delete_user(ISC_STATUS*, const USER_SEC_DATA*);

ISC_STATUS ISC_EXPORT isc_modify_user(ISC_STATUS*, const USER_SEC_DATA*);

/**********************************/
/*  Other OSRI functions          */
/**********************************/

ISC_STATUS ISC_EXPORT isc_compile_request(ISC_STATUS*,
										  isc_db_handle*,
										  isc_req_handle*,
										  short,
										  const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_compile_request2(ISC_STATUS*,
										   isc_db_handle*,
										   isc_req_handle*,
										   short,
										   const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_ddl(ISC_STATUS*,
							  isc_db_handle*,
							  isc_tr_handle*,
							  short,
							  const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_prepare_transaction(ISC_STATUS*,
											  isc_tr_handle*);


ISC_STATUS ISC_EXPORT isc_receive(ISC_STATUS*,
								  isc_req_handle*,
								  short,
								  short,
								  void*,
								  short);

ISC_STATUS ISC_EXPORT isc_reconnect_transaction(ISC_STATUS*,
												isc_db_handle*,
												isc_tr_handle*,
												short,
												const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_release_request(ISC_STATUS*,
										  isc_req_handle*);

ISC_STATUS ISC_EXPORT isc_request_info(ISC_STATUS*,
									   isc_req_handle*,
									   short,
									   short,
									   const ISC_SCHAR*,
									   short,
									   ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_seek_blob(ISC_STATUS*,
									isc_blob_handle*,
									short,
									ISC_LONG,
									ISC_LONG*);

ISC_STATUS ISC_EXPORT isc_send(ISC_STATUS*,
							   isc_req_handle*,
							   short,
							   short,
							   const void*,
							   short);

ISC_STATUS ISC_EXPORT isc_start_and_send(ISC_STATUS*,
										 isc_req_handle*,
										 isc_tr_handle*,
										 short,
										 short,
										 const void*,
										 short);

ISC_STATUS ISC_EXPORT isc_start_request(ISC_STATUS *,
										isc_req_handle *,
										isc_tr_handle *,
										short);

ISC_STATUS ISC_EXPORT isc_unwind_request(ISC_STATUS *,
										 isc_tr_handle *,
										 short);

ISC_STATUS ISC_EXPORT isc_wait_for_event(ISC_STATUS*,
										 isc_db_handle*,
										 short,
										 const ISC_UCHAR*,
										 ISC_UCHAR*);


/*****************************/
/* Other Sql functions       */
/*****************************/

ISC_STATUS ISC_EXPORT isc_close(ISC_STATUS*,
								const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_declare(ISC_STATUS*,
								  const ISC_SCHAR*,
								  const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_describe(ISC_STATUS*,
								   const ISC_SCHAR*,
								   XSQLDA *);

ISC_STATUS ISC_EXPORT isc_describe_bind(ISC_STATUS*,
										const ISC_SCHAR*,
										XSQLDA*);

ISC_STATUS ISC_EXPORT isc_execute(ISC_STATUS*,
								  isc_tr_handle*,
								  const ISC_SCHAR*,
								  XSQLDA*);

ISC_STATUS ISC_EXPORT isc_execute_immediate(ISC_STATUS*,
											isc_db_handle*,
											isc_tr_handle*,
											short*,
											const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_fetch(ISC_STATUS*,
								const ISC_SCHAR*,
								XSQLDA*);

ISC_STATUS ISC_EXPORT isc_open(ISC_STATUS*,
							   isc_tr_handle*,
							   const ISC_SCHAR*,
							   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_prepare(ISC_STATUS*,
								  isc_db_handle*,
								  isc_tr_handle*,
								  const ISC_SCHAR*,
								  short*,
								  const ISC_SCHAR*,
								  XSQLDA*);


/*************************************/
/* Other Dynamic sql functions       */
/*************************************/

ISC_STATUS ISC_EXPORT isc_dsql_execute_m(ISC_STATUS*,
										 isc_tr_handle*,
										 isc_stmt_handle*,
										 unsigned short,
										 const ISC_SCHAR*,
										 unsigned short,
										 unsigned short,
										 ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_dsql_execute2_m(ISC_STATUS*,
										  isc_tr_handle*,
										  isc_stmt_handle*,
										  unsigned short,
										  const ISC_SCHAR*,
										  unsigned short,
										  unsigned short,
										  const ISC_SCHAR*,
										  unsigned short,
										  ISC_SCHAR*,
										  unsigned short,
										  unsigned short,
										  ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_dsql_execute_immediate_m(ISC_STATUS*,
												   isc_db_handle*,
												   isc_tr_handle*,
												   unsigned short,
												   const ISC_SCHAR*,
												   unsigned short,
												   unsigned short,
												   const ISC_SCHAR*,
												   unsigned short,
												   unsigned short,
												   ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_dsql_exec_immed3_m(ISC_STATUS*,
											 isc_db_handle*,
											 isc_tr_handle*,
											 unsigned short,
											 const ISC_SCHAR*,
											 unsigned short,
											 unsigned short,
											 const ISC_SCHAR*,
											 unsigned short,
											 unsigned short,
											 ISC_SCHAR*,
											 unsigned short,
											 ISC_SCHAR*,
											 unsigned short,
											 unsigned short,
											 ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_dsql_fetch_m(ISC_STATUS*,
									   isc_stmt_handle*,
									   unsigned short,
									   const ISC_SCHAR*,
									   unsigned short,
									   unsigned short,
									   ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_dsql_insert_m(ISC_STATUS*,
										isc_stmt_handle*,
										unsigned short,
										const ISC_SCHAR*,
										unsigned short,
										unsigned short,
										const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_dsql_prepare_m(ISC_STATUS*,
										 isc_tr_handle*,
										 isc_stmt_handle*,
										 unsigned short,
										 const ISC_SCHAR*,
										 unsigned short,
										 unsigned short,
										 const ISC_SCHAR*,
										 unsigned short,
										 ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_dsql_release(ISC_STATUS*,
									   const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_close(ISC_STATUS*,
										   const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_declare(ISC_STATUS*,
											 const ISC_SCHAR*,
											 const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_describe(ISC_STATUS*,
											  const ISC_SCHAR*,
											  unsigned short,
											  XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_describe_bind(ISC_STATUS*,
												   const ISC_SCHAR*,
												   unsigned short,
												   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_execute(ISC_STATUS*,
											 isc_tr_handle*,
											 const ISC_SCHAR*,
											 unsigned short,
											 XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_execute2(ISC_STATUS*,
											  isc_tr_handle*,
											  const ISC_SCHAR*,
											  unsigned short,
											  XSQLDA*,
											  XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_execute_immed(ISC_STATUS*,
												   isc_db_handle*,
												   isc_tr_handle*,
												   unsigned short,
												   const ISC_SCHAR*,
												   unsigned short,
												   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_fetch(ISC_STATUS*,
										   const ISC_SCHAR*,
										   unsigned short,
										   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_fetch_a(ISC_STATUS*,
											 int*,
											 const ISC_SCHAR*,
											 ISC_USHORT,
											 XSQLDA*);

void ISC_EXPORT isc_embed_dsql_length(const ISC_UCHAR*,
									  ISC_USHORT*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_open(ISC_STATUS*,
										  isc_tr_handle*,
										  const ISC_SCHAR*,
										  unsigned short,
										  XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_open2(ISC_STATUS*,
										   isc_tr_handle*,
										   const ISC_SCHAR*,
										   unsigned short,
										   XSQLDA*,
										   XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_insert(ISC_STATUS*,
											const ISC_SCHAR*,
											unsigned short,
											XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_prepare(ISC_STATUS*,
											 isc_db_handle*,
											 isc_tr_handle*,
											 const ISC_SCHAR*,
											 unsigned short,
											 const ISC_SCHAR*,
											 unsigned short,
											 XSQLDA*);

ISC_STATUS ISC_EXPORT isc_embed_dsql_release(ISC_STATUS*,
											 const ISC_SCHAR*);


/******************************/
/* Other Blob functions       */
/******************************/

BSTREAM* ISC_EXPORT BLOB_open(isc_blob_handle,
									  ISC_SCHAR*,
									  int);

int ISC_EXPORT BLOB_put(ISC_SCHAR,
						BSTREAM*);

int ISC_EXPORT BLOB_close(BSTREAM*);

int ISC_EXPORT BLOB_get(BSTREAM*);

int ISC_EXPORT BLOB_display(ISC_QUAD*,
							isc_db_handle,
							isc_tr_handle,
							const ISC_SCHAR*);

int ISC_EXPORT BLOB_dump(ISC_QUAD*,
						 isc_db_handle,
						 isc_tr_handle,
						 const ISC_SCHAR*);

int ISC_EXPORT BLOB_edit(ISC_QUAD*,
						 isc_db_handle,
						 isc_tr_handle,
						 const ISC_SCHAR*);

int ISC_EXPORT BLOB_load(ISC_QUAD*,
						 isc_db_handle,
						 isc_tr_handle,
						 const ISC_SCHAR*);

int ISC_EXPORT BLOB_text_dump(ISC_QUAD*,
							  isc_db_handle,
							  isc_tr_handle,
							  const ISC_SCHAR*);

int ISC_EXPORT BLOB_text_load(ISC_QUAD*,
							  isc_db_handle,
							  isc_tr_handle,
							  const ISC_SCHAR*);

BSTREAM* ISC_EXPORT Bopen(ISC_QUAD*,
								  isc_db_handle,
								  isc_tr_handle,
								  const ISC_SCHAR*);

/* Disabled, not found anywhere.
BSTREAM* ISC_EXPORT Bopen2(ISC_QUAD*,
								   isc_db_handle,
								   isc_tr_handle,
								   const ISC_SCHAR*,
								   unsigned short);
*/


/******************************/
/* Other Misc functions       */
/******************************/

ISC_LONG ISC_EXPORT isc_ftof(const ISC_SCHAR*,
							 const unsigned short,
							 ISC_SCHAR*,
							 const unsigned short);

ISC_STATUS ISC_EXPORT isc_print_blr(const ISC_SCHAR*,
									ISC_PRINT_CALLBACK,
									void*,
									short);

void ISC_EXPORT isc_set_debug(int);

void ISC_EXPORT isc_qtoq(const ISC_QUAD*,
						 ISC_QUAD*);

void ISC_EXPORT isc_vtof(const ISC_SCHAR*,
						 ISC_SCHAR*,
						 unsigned short);

void ISC_EXPORT isc_vtov(const ISC_SCHAR*,
						 ISC_SCHAR*,
						 short);

int ISC_EXPORT isc_version(isc_db_handle*,
						   ISC_VERSION_CALLBACK,
						   void*);

ISC_LONG ISC_EXPORT isc_reset_fpe(ISC_USHORT);

uintptr_t	ISC_EXPORT isc_baddress(ISC_SCHAR*);
void		ISC_EXPORT isc_baddress_s(const ISC_SCHAR*,
								  uintptr_t*);

/*****************************************/
/* Service manager functions             */
/*****************************************/


ISC_STATUS ISC_EXPORT isc_service_attach(ISC_STATUS*,
										 unsigned short,
										 const ISC_SCHAR*,
										 isc_svc_handle*,
										 unsigned short,
										 const ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_service_detach(ISC_STATUS *,
										 isc_svc_handle *);

ISC_STATUS ISC_EXPORT isc_service_query(ISC_STATUS*,
										isc_svc_handle*,
										isc_resv_handle*,
										unsigned short,
										const ISC_SCHAR*,
										unsigned short,
										const ISC_SCHAR*,
										unsigned short,
										ISC_SCHAR*);

ISC_STATUS ISC_EXPORT isc_service_start(ISC_STATUS*,
										isc_svc_handle*,
										isc_resv_handle*,
										unsigned short,
										const ISC_SCHAR*);


/********************************/
/* Client information functions */
/********************************/

void ISC_EXPORT isc_get_client_version ( ISC_SCHAR  *);
int  ISC_EXPORT isc_get_client_major_version ();
int  ISC_EXPORT isc_get_client_minor_version ();
