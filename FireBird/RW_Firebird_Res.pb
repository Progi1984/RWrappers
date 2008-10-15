;{ Enumerations
  Enumeration ; blob_lseek_mode
    #blb_seek_relative = 1
    #blb_seek_from_tail = 2
  EndEnumeration  
  Enumeration ; blob_get_result
    #blb_got_fragment = -1
    #blb_got_eof = 0
    #blb_got_full_segment = 1
  EndEnumeration
  Enumeration ; db_info_types
    #isc_info_db_id                  = 4
    #isc_info_reads                  = 5
    #isc_info_writes             = 6
    #isc_info_fetches                = 7
    #isc_info_marks                  = 8
    
    #isc_info_implementation = 11
    #isc_info_isc_version            = 12
    #isc_info_base_level             = 13
    #isc_info_page_size              = 14
    #isc_info_num_buffers    = 15
    #isc_info_limbo                  = 16
    #isc_info_current_memory = 17
    #isc_info_max_memory             = 18
    #isc_info_window_turns   = 19
    #isc_info_license                = 20
    
    #isc_info_allocation             = 21
    #isc_info_attachment_id   = 22
    #isc_info_read_seq_count = 23
    #isc_info_read_idx_count = 24
    #isc_info_insert_count           = 25
    #isc_info_update_count           = 26
    #isc_info_delete_count           = 27
    #isc_info_backout_count          = 28
    #isc_info_purge_count            = 29
    #isc_info_expunge_count          = 30
    
    #isc_info_sweep_interval = 31
    #isc_info_ods_version            = 32
    #isc_info_ods_minor_version      = 33
    #isc_info_no_reserve             = 34
    
    #isc_info_logfile                = 35
    #isc_info_cur_logfile_name       = 36
    #isc_info_cur_log_part_offset    = 37
    #isc_info_num_wal_buffers        = 38
    #isc_info_wal_buffer_size        = 39
    #isc_info_wal_ckpt_length        = 40
    
    #isc_info_wal_cur_ckpt_interval = 41
    #isc_info_wal_prv_ckpt_fname     = 42
    #isc_info_wal_prv_ckpt_poffset   = 43
    #isc_info_wal_recv_ckpt_fname    = 44
    #isc_info_wal_recv_ckpt_poffset = 45
    #isc_info_wal_grpc_wait_usecs    = 47
    #isc_info_wal_num_io             = 48
    #isc_info_wal_avg_io_size        = 49
    #isc_info_wal_num_commits        = 50
    #isc_info_wal_avg_grpc_size      = 51
    
    #isc_info_forced_writes          = 52
    #isc_info_user_names = 53
    #isc_info_page_errors = 54
    #isc_info_record_errors = 55
    #isc_info_bpage_errors = 56
    #isc_info_dpage_errors = 57
    #isc_info_ipage_errors = 58
    #isc_info_ppage_errors = 59
    #isc_info_tpage_errors = 60
    
    #isc_info_set_page_buffers = 61
    #isc_info_db_sql_dialect = 62   
    #isc_info_db_read_only = 63
    #isc_info_db_size_in_pages = 64
    
    #frb_info_att_charset = 101
    #isc_info_db_class = 102
    #isc_info_firebird_version = 103
    #isc_info_oldest_transaction = 104
    #isc_info_oldest_active = 105
    #isc_info_oldest_snapshot = 106
    #isc_info_next_transaction = 107
    #isc_info_db_provider = 108
    #isc_info_active_transactions = 109
    #isc_info_active_tran_count = 110
    #isc_info_creation_date = 111
    #isc_info_db_file_size = 112
    
    #isc_info_db_last_value   
  EndEnumeration
  Enumeration ; info_db_implementations
    #isc_info_db_impl_rdb_vms = 1
    #isc_info_db_impl_rdb_eln = 2
    #isc_info_db_impl_rdb_eln_dev = 3
    #isc_info_db_impl_rdb_vms_y = 4
    #isc_info_db_impl_rdb_eln_y = 5
    #isc_info_db_impl_jri = 6
    #isc_info_db_impl_jsv = 7
    
    #isc_info_db_impl_isc_apl_68K = 25
    #isc_info_db_impl_isc_vax_ultr = 26
    #isc_info_db_impl_isc_vms = 27
    #isc_info_db_impl_isc_sun_68k = 28
    #isc_info_db_impl_isc_os2 = 29
    #isc_info_db_impl_isc_sun4 = 30    
    
    #isc_info_db_impl_isc_hp_ux = 31
    #isc_info_db_impl_isc_sun_386i = 32
    #isc_info_db_impl_isc_vms_orcl = 33
    #isc_info_db_impl_isc_mac_aux = 34
    #isc_info_db_impl_isc_rt_aix = 35
    #isc_info_db_impl_isc_mips_ult = 36
    #isc_info_db_impl_isc_xenix = 37
    #isc_info_db_impl_isc_dg = 38
    #isc_info_db_impl_isc_hp_mpexl = 39
    #isc_info_db_impl_isc_hp_ux68K = 40       
    
    #isc_info_db_impl_isc_sgi = 41
    #isc_info_db_impl_isc_sco_unix = 42
    #isc_info_db_impl_isc_cray = 43
    #isc_info_db_impl_isc_imp = 44
    #isc_info_db_impl_isc_delta = 45
    #isc_info_db_impl_isc_next = 46
    #isc_info_db_impl_isc_dos = 47
    #isc_info_db_impl_m88K = 48
    #isc_info_db_impl_unixware = 49
    #isc_info_db_impl_isc_winnt_x86 = 50
    
    #isc_info_db_impl_isc_epson = 51
    #isc_info_db_impl_alpha_osf = 52
    #isc_info_db_impl_alpha_vms = 53
    #isc_info_db_impl_netware_386 = 54 
    #isc_info_db_impl_win_only = 55
    #isc_info_db_impl_ncr_3000 = 56
    #isc_info_db_impl_winnt_ppc = 57
    #isc_info_db_impl_dg_x86 = 58
    #isc_info_db_impl_sco_ev = 59
    #isc_info_db_impl_i386 = 60
    
    #isc_info_db_impl_freebsd = 61
    #isc_info_db_impl_netbsd = 62
    #isc_info_db_impl_darwin_ppc = 63
    #isc_info_db_impl_sinixz = 64
    
    #isc_info_db_impl_linux_sparc = 65
    #isc_info_db_impl_linux_amd64 = 66
    
    #isc_info_db_impl_freebsd_amd64 = 67
    
    #isc_info_db_impl_winnt_amd64 = 68
    
    #isc_info_db_impl_linux_ppc = 69
    #isc_info_db_impl_darwin_x86 = 70
    #isc_info_db_impl_linux_mipsel = 71
    #isc_info_db_impl_linux_mips = 72
    #isc_info_db_impl_darwin_x64 = 73
    #isc_info_db_impl_sun_amd64 = 74
    
    #isc_info_db_impl_linux_arm = 75
    #isc_info_db_impl_linux_ia64 = 76
    
    #isc_info_db_impl_last_value   
  EndEnumeration
  Enumeration ; info_db_class
    #isc_info_db_class_access = 1
    #isc_info_db_class_y_valve = 2
    #isc_info_db_class_rem_int = 3
    #isc_info_db_class_rem_srvr = 4
    #isc_info_db_class_pipe_int = 7
    #isc_info_db_class_pipe_srvr = 8
    #isc_info_db_class_sam_int = 9
    #isc_info_db_class_sam_srvr = 10
    #isc_info_db_class_gateway = 11
    #isc_info_db_class_cache = 12
    #isc_info_db_class_classic_access = 13
    #isc_info_db_class_server_access = 14
    
    #isc_info_db_class_last_value   
  EndEnumeration
  Enumeration ; info_db_provider
    #isc_info_db_code_rdb_eln = 1
    #isc_info_db_code_rdb_vms = 2
    #isc_info_db_code_interbase = 3
    #isc_info_db_code_firebird = 4
    
    #isc_info_db_code_last_value   
  EndEnumeration

;}
;{ Constantes
  #ISC_TRUE	    = 1
  #ISC_FALSE    =	0
  #isc_dpb_version1                  = 1
  #isc_dpb_cdd_pathname              = 1
  #isc_dpb_allocation                = 2
  #isc_dpb_journal                   = 3
  #isc_dpb_page_size                 = 4
  #isc_dpb_num_buffers               = 5
  #isc_dpb_buffer_length             = 6
  #isc_dpb_debug                     = 7
  #isc_dpb_garbage_collect           = 8
  #isc_dpb_verify                    = 9
  #isc_dpb_sweep                     = 10
  #isc_dpb_enable_journal            = 11
  #isc_dpb_disable_journal           = 12
  #isc_dpb_dbkey_scope               = 13
  #isc_dpb_number_of_users           = 14
  #isc_dpb_trace                     = 15
  #isc_dpb_no_garbage_collect        = 16
  #isc_dpb_damaged                   = 17
  #isc_dpb_license                   = 18
  #isc_dpb_sys_user_name             = 19
  #isc_dpb_encrypt_key               = 20
  #isc_dpb_activate_shadow           = 21
  #isc_dpb_sweep_interval            = 22
  #isc_dpb_delete_shadow             = 23
  #isc_dpb_force_write               = 24
  #isc_dpb_begin_log                 = 25
  #isc_dpb_quit_log                  = 26
  #isc_dpb_no_reserve                = 27
  #isc_dpb_user_name                 = 28
  #isc_dpb_password                  = 29
  #isc_dpb_password_enc              = 30
  #isc_dpb_sys_user_name_enc         = 31
  #isc_dpb_interp                    = 32
  #isc_dpb_online_dump               = 33
  #isc_dpb_old_file_size             = 34
  #isc_dpb_old_num_files             = 35
  #isc_dpb_old_file                  = 36
  #isc_dpb_old_start_page            = 37
  #isc_dpb_old_start_seqno           = 38
  #isc_dpb_old_start_file            = 39
  #isc_dpb_drop_walfile              = 40
  #isc_dpb_old_dump_id               = 41
  #isc_dpb_wal_backup_dir            = 42
  #isc_dpb_wal_chkptlen              = 43
  #isc_dpb_wal_numbufs               = 44
  #isc_dpb_wal_bufsize               = 45
  #isc_dpb_wal_grp_cmt_wait          = 46
  #isc_dpb_lc_messages               = 47
  #isc_dpb_lc_ctype                  = 48
  #isc_dpb_cache_manager             = 49
  #isc_dpb_shutdown                  = 50
  #isc_dpb_online                    = 51
  #isc_dpb_shutdown_delay            = 52
  #isc_dpb_reserved                  = 53
  #isc_dpb_overwrite                 = 54
  #isc_dpb_sec_attach                = 55
  #isc_dpb_disable_wal               = 56
  #isc_dpb_connect_timeout           = 57
  #isc_dpb_dummy_packet_interval     = 58
  #isc_dpb_gbak_attach               = 59
  #isc_dpb_sql_role_name             = 60
  #isc_dpb_set_page_buffers          = 61
  #isc_dpb_working_directory         = 62
  #isc_dpb_sql_dialect               = 63
  #isc_dpb_set_db_readonly           = 64
  #isc_dpb_set_db_sql_dialect        = 65
  #isc_dpb_gfix_attach               = 66
  #isc_dpb_gstat_attach              = 67
  #isc_dpb_set_db_charset            = 68
  #isc_dpb_gsec_attach               = 69
  #isc_dpb_address_path              = 70
  #isc_dpb_process_id                = 71
  #isc_dpb_no_db_triggers            = 72
  #isc_dpb_trusted_auth              = 73
  #isc_dpb_process_name              = 74
  
  #isc_dpb_address                   = 1
  
  #isc_dpb_addr_protocol             = 1
  #isc_dpb_addr_endpoint             = 2
                                  
  #isc_dpb_pages                     = 1
  #isc_dpb_records                   = 2
  #isc_dpb_indices                   = 4
  #isc_dpb_transactions              = 8
  #isc_dpb_no_update                 = 16
  #isc_dpb_repair                    = 32
  #isc_dpb_ignore                    = 64
  
  #isc_dpb_shut_cache                = $1
  #isc_dpb_shut_attachment           = $2
  #isc_dpb_shut_transaction          = $4
  #isc_dpb_shut_force                = $8
  #isc_dpb_shut_mode_mask            = $70
  
  #isc_dpb_shut_default              = $0
  #isc_dpb_shut_normal               = $10
  #isc_dpb_shut_multi                = $20
  #isc_dpb_shut_single               = $30
  #isc_dpb_shut_full                 = $40
  
  #isc_info_svc_svr_db_info          = 50
  #isc_info_svc_get_license          = 51
  #isc_info_svc_get_license_mask     = 52
  #isc_info_svc_get_config           = 53
  #isc_info_svc_version              = 54
  #isc_info_svc_server_version       = 55
  #isc_info_svc_implementation       = 56
  #isc_info_svc_capabilities         = 57
  #isc_info_svc_user_dbpath          = 58
  #isc_info_svc_get_env              = 59
  #isc_info_svc_get_env_lock         = 60
  #isc_info_svc_get_env_msg          = 61
  #isc_info_svc_line                 = 62
  #isc_info_svc_to_eof               = 63
  #isc_info_svc_timeout              = 64
  #isc_info_svc_get_licensed_users   = 65
  #isc_info_svc_limbo_trans          = 66
  #isc_info_svc_running              = 67
  #isc_info_svc_get_users            = 68
  
  #SQLDA_VERSION1   = 1
  
  #DSQL_close      = 1
  #DSQL_drop       = 2
  
  #SQL_TEXT         = 452
  #SQL_VARYING      = 448
  #SQL_SHORT        = 500
  #SQL_LONG         = 496
  #SQL_FLOAT        = 482
  #SQL_DOUBLE       = 480
  #SQL_D_FLOAT      = 530
  #SQL_TIMESTAMP    = 510
  #SQL_BLOB         = 520
  #SQL_ARRAY        = 540
  #SQL_QUAD         = 550
  #SQL_TYPE_TIME    = 560
  #SQL_TYPE_DATE    = 570
  #SQL_INT64        = 580
                  
  #SQL_DATE         = #SQL_TIMESTAMP
  
  #SQL_DIALECT_V5   = 1       
  #SQL_DIALECT_V6_TRANSITION = 2       
  #SQL_DIALECT_V6   = 3       
  #SQL_DIALECT_CURRENT = #SQL_DIALECT_V6  
  
  #ISC_STATUS_LENGTH = 20
  
  
  #DSC_null                = 1
  #DSC_no_subtype          = 2       
  #DSC_nullable            = 4       
  
  #dtype_unknown   = 0
  #dtype_text      = 1
  #dtype_cstring   = 2
  #dtype_varying   = 3
  
  #dtype_packed    = 6
  #dtype_byte      = 7
  #dtype_short     = 8
  #dtype_long      = 9
  #dtype_quad      = 10
  #dtype_real      = 11
  #dtype_double    = 12
  #dtype_d_float   = 13
  #dtype_sql_date  = 14
  #dtype_sql_time  = 15
  #dtype_timestamp = 16
  #dtype_blob      = 17
  #dtype_array     = 18
  #dtype_int64     = 19
  #DTYPE_TYPE_MAX  = 20
  
  #ISC_TIME_SECONDS_PRECISION             = 10000
  #ISC_TIME_SECONDS_PRECISION_SCALE       = (-4)
  
  #sec_uid_spec           = $01
  #sec_gid_spec		        = $02
  #sec_server_spec        = $04
  #sec_password_spec      = $08
  #sec_group_name_spec    = $10
  #sec_first_name_spec    = $20
  #sec_middle_name_spec   = $40
  #sec_last_name_spec	    = $80
  #sec_dba_user_name_spec = $100
  #sec_dba_password_spec  = $200
  
  #sec_protocol_tcpip     = 1
  #sec_protocol_netbeui   = 2
  #sec_protocol_spx       = 3 ; -- Deprecated Protocol. Declaration retained For compatibility   
  #sec_protocol_local     = 4
  
  
  #isc_blob_filter_open            = 0
  #isc_blob_filter_get_segment     = 1
  #isc_blob_filter_close           = 2
  #isc_blob_filter_create          = 3
  #isc_blob_filter_put_segment     = 4
  #isc_blob_filter_alloc           = 5
  #isc_blob_filter_free            = 6
  #isc_blob_filter_seek            = 7
                                
  ;*****************
  ; Blr definitions 
  ;*****************
  #blr_text                = 14
  #blr_text2               = 15       
  #blr_short               = 7
  #blr_long                = 8
  #blr_quad                = 9
  #blr_float               = 10
  #blr_double              = 27
  #blr_d_float             = 11
  #blr_timestamp           = 35
  #blr_varying             = 37
  #blr_varying2            = 38       
  #blr_blob                = 261
  #blr_cstring             = 40       
  #blr_cstring2            = 41       
  #blr_blob_id             = 45       
  #blr_sql_date            = 12
  #blr_sql_time            = 13
  #blr_int64               = 16
  #blr_blob2               = 17
  #blr_domain_name         = 18
  #blr_domain_name2        = 19
  #blr_not_nullable        = 20
  
  #blr_domain_type_of      = 0
  #blr_domain_full         = 1
  
  #blr_date                = #blr_timestamp
  
  #blr_inner               = 0
  #blr_left                = 1
  #blr_right               = 2
  #blr_full                = 3
  
  #blr_gds_code            = 0
  #blr_sql_code            = 1
  #blr_exception           = 2
  #blr_trigger_code        = 3
  #blr_default_code        = 4
  #blr_raise               = 5
  #blr_exception_msg       = 6
  
  #blr_version4            = 4
  #blr_version5            = 5
  #blr_eoc                 = 76
  #blr_end                 = 255    
  
  #blr_assignment          = 1
  #blr_begin               = 2
  #blr_dcl_variable        = 3        
  #blr_message             = 4
  #blr_erase               = 5
  #blr_fetch               = 6
  #blr_for                 = 7
  #blr_if                  = 8
  #blr_loop                = 9
  #blr_modify              = 10
  #blr_handler             = 11
  #blr_receive             = 12
  #blr_select              = 13
  #blr_send                = 14
  #blr_store               = 15
  #blr_label               = 17
  #blr_leave               = 18
  #blr_store2              = 19
  #blr_post                = 20
  #blr_literal             = 21
  #blr_dbkey               = 22
  #blr_field               = 23
  #blr_fid                 = 24
  #blr_parameter           = 25
  #blr_variable            = 26
  #blr_average             = 27
  #blr_count               = 28
  #blr_maximum             = 29
  #blr_minimum             = 30
  #blr_total               = 31
  
  #blr_add                 = 34
  #blr_subtract            = 35
  #blr_multiply            = 36
  #blr_divide              = 37
  #blr_negate              = 38
  #blr_concatenate         = 39
  #blr_substring           = 40
  #blr_parameter2          = 41
  #blr_from                = 42
  #blr_via                 = 43
  #blr_parameter2_old      = 44       
  #blr_user_name           = 44       
  #blr_null                = 45
  
  #blr_equiv               = 46
  #blr_eql                 = 47
  #blr_neq                 = 48
  #blr_gtr                 = 49
  #blr_geq                 = 50
  #blr_lss                 = 51
  #blr_leq                 = 52
  #blr_containing          = 53
  #blr_matching            = 54
  #blr_starting            = 55
  #blr_between             = 56
  #blr_or                  = 57
  #blr_and                 = 58
  #blr_not                 = 59
  #blr_any                 = 60
  #blr_missing             = 61
  #blr_unique              = 62
  #blr_like                = 63
  
  #blr_rse                 = 67
  #blr_first               = 68
  #blr_project             = 69
  #blr_sort                = 70
  #blr_boolean             = 71
  #blr_ascending           = 72
  #blr_descending          = 73
  #blr_relation            = 74
  #blr_rid                 = 75
  #blr_union               = 76
  #blr_map                 = 77
  #blr_group_by            = 78
  #blr_aggregate           = 79
  #blr_join_type           = 80
  
  #blr_agg_count           = 83
  #blr_agg_max             = 84
  #blr_agg_min             = 85
  #blr_agg_total           = 86
  #blr_agg_average         = 87
  #blr_parameter3          = 88       
  #blr_run_max             = 89
  #blr_run_min             = 90
  #blr_run_total           = 91
  #blr_run_average         = 92
  #blr_agg_count2          = 93
  #blr_agg_count_distinct  = 94
  #blr_agg_total_distinct  = 95
  #blr_agg_average_distinct= 96
  
  #blr_function            = 100
  #blr_gen_id              = 101
  #blr_prot_mask           = 102
  #blr_upcase              = 103
  #blr_lock_state          = 104
  #blr_value_if            = 105
  #blr_matching2           = 106
  #blr_index               = 107
  #blr_ansi_like           = 108
  
  #blr_seek                = 112
  
  #blr_continue            = 0
  #blr_forward             = 1
  #blr_backward            = 2
  #blr_bof_forward         = 3
  #blr_eof_backward        = 4
  
  #blr_run_count           = 118      
  #blr_rs_stream           = 119
  #blr_exec_proc           = 120
  
  #blr_procedure           = 124
  #blr_pid                 = 125
  #blr_exec_pid            = 126
  #blr_singular            = 127
  #blr_abort               = 128
  #blr_block               = 129
  #blr_error_handler       = 130
  
  #blr_cast                = 131
  
  #blr_start_savepoint     = 134
  #blr_end_savepoint       = 135
  
  #blr_plan                = 139      
  #blr_merge               = 140
  #blr_join                = 141
  #blr_sequential          = 142
  #blr_navigational        = 143
  #blr_indices             = 144
  #blr_retrieve            = 145
  
  #blr_relation2           = 146
  #blr_rid2                = 147
  
  #blr_set_generator       = 150
  
  #blr_ansi_any            = 151   
  #blr_exists              = 152   
  
  #blr_record_version      = 154      
  #blr_stall               = 155      
  
  #blr_ansi_all            = 158   
  
  #blr_extract             = 159
  
  #blr_extract_year        = 0
  #blr_extract_month       = 1
  #blr_extract_day         = 2
  #blr_extract_hour        = 3
  #blr_extract_minute      = 4
  #blr_extract_second      = 5
  #blr_extract_weekday     = 6
  #blr_extract_yearday     = 7
  #blr_extract_millisecond = 8
  #blr_extract_week        = 9
  
  #blr_current_date        = 160
  #blr_current_timestamp   = 161
  #blr_current_time        = 162
  
  #blr_post_arg            = 163
  #blr_exec_into           = 164
  #blr_user_savepoint      = 165
  #blr_dcl_cursor          = 166
  #blr_cursor_stmt         = 167
  #blr_current_timestamp2  = 168
  #blr_current_time2       = 169
  #blr_agg_list            = 170
  #blr_agg_list_distinct   = 171
  #blr_modify2             = 172
  
  #blr_current_role        = 174
  #blr_skip                = 175
  
  #blr_exec_sql            = 176
  #blr_internal_info       = 177
  #blr_nullsfirst          = 178
  #blr_writelock           = 179
  #blr_nullslast           = 180
  
  #blr_lowcase             = 181
  #blr_strlen              = 182
  
  #blr_strlen_bit          = 0
  #blr_strlen_char         = 1
  #blr_strlen_octet        = 2
  
  #blr_trim                = 183
  
  #blr_trim_both           = 0
  #blr_trim_leading        = 1
  #blr_trim_trailing       = 2
  
  #blr_trim_spaces         = 0
  #blr_trim_characters     = 1
  
  #blr_savepoint_set       = 0
  #blr_savepoint_release   = 1
  #blr_savepoint_undo      = 2
  #blr_savepoint_release_single = 3
  
  #blr_cursor_open         = 0
  #blr_cursor_close        = 1
  #blr_cursor_fetch        = 2
  
  #blr_init_variable       = 184
  #blr_recurse             = 185
  #blr_sys_function        = 186
  
  #RDB_system              = 1
  #RDB_id_assigned         = 2
                         
  #isc_tpb_version1        = 1
  #isc_tpb_version3        = 3
  #isc_tpb_consistency     = 1
  #isc_tpb_concurrency     = 2
  #isc_tpb_shared          = 3
  #isc_tpb_protected       = 4
  #isc_tpb_exclusive       = 5
  #isc_tpb_wait            = 6
  #isc_tpb_nowait          = 7
  #isc_tpb_read            = 8
  #isc_tpb_write           = 9
  #isc_tpb_lock_read       = 10
  #isc_tpb_lock_write      = 11
  #isc_tpb_verb_time       = 12
  #isc_tpb_commit_time     = 13
  #isc_tpb_ignore_limbo    = 14
  #isc_tpb_read_committed  = 15
  #isc_tpb_autocommit      = 16
  #isc_tpb_rec_version     = 17
  #isc_tpb_no_rec_version  = 18
  #isc_tpb_restart_requests= 19
  #isc_tpb_no_auto_undo    = 20
  #isc_tpb_lock_timeout    = 21
  
  #isc_bpb_version1        = 1
  #isc_bpb_source_type     = 1
  #isc_bpb_target_type     = 2
  #isc_bpb_type            = 3
  #isc_bpb_source_interp   = 4
  #isc_bpb_target_interp   = 5
  #isc_bpb_filter_parameter= 6
  #isc_bpb_storage         = 7
  
  #isc_bpb_type_segmented  = $0
  #isc_bpb_type_stream     = $1
  #isc_bpb_storage_main    = $0
  #isc_bpb_storage_temp    = $2
  
  
  #isc_spb_version1        = 1
  #isc_spb_current_version = 2
  #isc_spb_version         = #isc_spb_current_version
  #isc_spb_user_name       = #isc_dpb_user_name
  #isc_spb_sys_user_name   = #isc_dpb_sys_user_name
  #isc_spb_sys_user_name_enc= #isc_dpb_sys_user_name_enc
  #isc_spb_password        = #isc_dpb_password
  #isc_spb_password_enc    = #isc_dpb_password_enc
  #isc_spb_command_line    = 105
  #isc_spb_dbname          = 106
  #isc_spb_verbose         = 107
  #isc_spb_options         = 108
  #isc_spb_address_path    = 109
  #isc_spb_process_id      = 110
  #isc_spb_trusted_auth    = 111
  #isc_spb_process_name    = 112
  
  #isc_spb_connect_timeout = #isc_dpb_connect_timeout
  #isc_spb_dummy_packet_interval= #isc_dpb_dummy_packet_interval
  #isc_spb_sql_role_name   = #isc_dpb_sql_role_name
  
  #isc_action_svc_backup           =  1        
  #isc_action_svc_restore          =  2        
  #isc_action_svc_repair           =  3        
  #isc_action_svc_add_user         =  4        
  #isc_action_svc_delete_user      =  5        
  #isc_action_svc_modify_user      =  6        
  #isc_action_svc_display_user     =  7        
  #isc_action_svc_properties       =  8        
  #isc_action_svc_add_license      =  9        
  #isc_action_svc_remove_license   = 10        
  #isc_action_svc_db_stats         = 11        
  #isc_action_svc_get_ib_log       = 12        
  #isc_action_svc_get_fb_log       = 12        
  
  
  
  #isc_spb_sec_userid              = 5
  #isc_spb_sec_groupid             = 6
  #isc_spb_sec_username            = 7
  #isc_spb_sec_password            = 8
  #isc_spb_sec_groupname           = 9
  #isc_spb_sec_firstname           = 10
  #isc_spb_sec_middlename          = 11
  #isc_spb_sec_lastname            = 12
  
  #isc_spb_lic_key                 = 5
  #isc_spb_lic_id                  = 6
  #isc_spb_lic_desc                = 7
                              
  #isc_spb_bkp_file                = 5
  #isc_spb_bkp_factor              = 6
  #isc_spb_bkp_length              = 7
  #isc_spb_bkp_ignore_checksums    = $01
  #isc_spb_bkp_ignore_limbo        = $02
  #isc_spb_bkp_metadata_only       = $04
  #isc_spb_bkp_no_garbage_collect  = $08
  #isc_spb_bkp_old_descriptions    = $10
  #isc_spb_bkp_non_transportable   = $20
  #isc_spb_bkp_convert             = $40
  #isc_spb_bkp_expand              = $80
  
  #isc_spb_prp_page_buffers           = 5
  #isc_spb_prp_sweep_interval         = 6
  #isc_spb_prp_shutdown_db            = 7
  #isc_spb_prp_deny_new_attachments   = 9
  #isc_spb_prp_deny_new_transactions  = 10
  #isc_spb_prp_reserve_space          = 11
  #isc_spb_prp_write_mode             = 12
  #isc_spb_prp_access_mode            = 13
  #isc_spb_prp_set_sql_dialect        = 14
  #isc_spb_prp_activate               = $0100
  #isc_spb_prp_db_online              = $0200
                                  
  #isc_spb_prp_res_use_full =35
  #isc_spb_prp_res = 36
  
  #isc_spb_prp_wm_async = 37
  #isc_spb_prp_wm_sync = 38
  
  #isc_spb_prp_am_readonly = 39
  #isc_spb_prp_am_readwrite = 40
  
  #isc_spb_rpr_commit_trans = 15
  #isc_spb_rpr_rollback_trans = 34
  #isc_spb_rpr_recover_two_phase = 17
  #isc_spb_tra_id = 18
  #isc_spb_single_tra_id = 19
  #isc_spb_multi_tra_id = 20
  #isc_spb_tra_state = 21
  #isc_spb_tra_state_limbo = 22
  #isc_spb_tra_state_commit = 23
  #isc_spb_tra_state_rollback = 24
  #isc_spb_tra_state_unknown = 25
  #isc_spb_tra_host_site = 26
  #isc_spb_tra_remote_site = 27
  #isc_spb_tra_db_path = 28
  #isc_spb_tra_advise = 29
  #isc_spb_tra_advise_commit = 30
  #isc_spb_tra_advise_rollback = 31
  #isc_spb_tra_advise_unknown = 33
  
  #isc_spb_rpr_validate_db      = $01
  #isc_spb_rpr_sweep_db         = $02
  #isc_spb_rpr_mend_db          = $04
  #isc_spb_rpr_list_limbo_trans = $08
  #isc_spb_rpr_check_db         = $10
  #isc_spb_rpr_ignore_checksum  = $20
  #isc_spb_rpr_kill_shadows     = $40
  #isc_spb_rpr_full             = $80
  
  #isc_spb_res_buffers          = 9
  #isc_spb_res_page_size        = 10
  #isc_spb_res_length           = 11
  #isc_spb_res_access_mode      = 12
  #isc_spb_res_deactivate_idx   = $0100
  #isc_spb_res_no_shadow        = $0200
  #isc_spb_res_no_validity      = $0400
  #isc_spb_res_one_at_a_time    = $0800
  #isc_spb_res_replace          = $1000
  #isc_spb_res_create           = $2000
  #isc_spb_res_use_all_space    = $4000
  
  #isc_spb_res_am_readonly      = #isc_spb_prp_am_readonly
  #isc_spb_res_am_readwrite     = #isc_spb_prp_am_readwrite
  
  #isc_spb_num_att              = 5
  #isc_spb_num_db               = 6
  
  #isc_spb_sts_data_pages       = $01
  #isc_spb_sts_db_log           = $02
  #isc_spb_sts_hdr_pages        = $04
  #isc_spb_sts_idx_pages        = $08
  #isc_spb_sts_sys_relations    = $10
  #isc_spb_sts_record_versions  = $20
  #isc_spb_sts_table            = $40
  #isc_spb_sts_nocreation       = $80
  
  #isc_dyn_version_1            = 1
  #isc_dyn_eoc                  = 255
  
  #isc_dyn_begin                = 2
  #isc_dyn_end                  = 3
  #isc_dyn_if                   = 4
  #isc_dyn_def_database         = 5
  #isc_dyn_def_global_fld       = 6
  #isc_dyn_def_local_fld        = 7
  #isc_dyn_def_idx              = 8
  #isc_dyn_def_rel              = 9
  #isc_dyn_def_sql_fld          = 10
  #isc_dyn_def_view             = 12
  #isc_dyn_def_trigger          = 15
  #isc_dyn_def_security_class   = 120
  #isc_dyn_def_dimension        = 140
  #isc_dyn_def_generator        = 24
  #isc_dyn_def_function         = 25
  #isc_dyn_def_filter           = 26
  #isc_dyn_def_function_arg     = 27
  #isc_dyn_def_shadow           = 34
  #isc_dyn_def_trigger_msg      = 17
  #isc_dyn_def_file             = 36
  #isc_dyn_mod_database         = 39
  #isc_dyn_mod_rel              = 11
  #isc_dyn_mod_global_fld       = 13
  #isc_dyn_mod_idx              = 102
  #isc_dyn_mod_local_fld        = 14
  #isc_dyn_mod_sql_fld          = 216
  #isc_dyn_mod_view             = 16
  #isc_dyn_mod_security_class   = 122
  #isc_dyn_mod_trigger          = 113
  #isc_dyn_mod_trigger_msg      = 28
  #isc_dyn_delete_database      = 18
  #isc_dyn_delete_rel           = 19
  #isc_dyn_delete_global_fld    = 20
  #isc_dyn_delete_local_fld     = 21
  #isc_dyn_delete_idx           = 22
  #isc_dyn_delete_security_class= 123
  #isc_dyn_delete_dimensions    = 143
  #isc_dyn_delete_trigger       = 23
  #isc_dyn_delete_trigger_msg   = 29
  #isc_dyn_delete_filter        = 32
  #isc_dyn_delete_function      = 33
  #isc_dyn_delete_shadow        = 35
  #isc_dyn_grant                = 30
  #isc_dyn_revoke               = 31
  #isc_dyn_def_primary_key      = 37
  #isc_dyn_def_foreign_key      = 38
  #isc_dyn_def_unique           = 40
  #isc_dyn_def_procedure        = 164
  #isc_dyn_delete_procedure     = 165
  #isc_dyn_def_parameter        = 135
  #isc_dyn_delete_parameter     = 136
  #isc_dyn_mod_procedure        = 175
  
  #isc_dyn_def_exception        = 181
  #isc_dyn_mod_exception        = 182
  #isc_dyn_del_exception        = 183
  
  #isc_dyn_def_difference       = 220
  #isc_dyn_drop_difference      = 221
  #isc_dyn_begin_backup         = 222
  #isc_dyn_end_backup           = 223
  #isc_dyn_debug_info           = 240
  
  #isc_dyn_view_blr             = 43
  #isc_dyn_view_source          = 44
  #isc_dyn_view_relation        = 45
  #isc_dyn_view_context         = 46
  #isc_dyn_view_context_name    = 47
  
  #isc_dyn_rel_name             = 50
  #isc_dyn_fld_name             = 51
  #isc_dyn_new_fld_name         = 215
  #isc_dyn_idx_name             = 52
  #isc_dyn_description          = 53
  #isc_dyn_security_class       = 54
  #isc_dyn_system_flag          = 55
  #isc_dyn_update_flag          = 56
  #isc_dyn_prc_name             = 166
  #isc_dyn_prm_name             = 137
  #isc_dyn_sql_object           = 196
  #isc_dyn_fld_character_set_name= 174
  
  #isc_dyn_rel_dbkey_length          = 61
  #isc_dyn_rel_store_trig            = 62
  #isc_dyn_rel_modify_trig           = 63
  #isc_dyn_rel_erase_trig            = 64
  #isc_dyn_rel_store_trig_source     = 65
  #isc_dyn_rel_modify_trig_source    = 66
  #isc_dyn_rel_erase_trig_source     = 67
  #isc_dyn_rel_ext_file              = 68
  #isc_dyn_rel_sql_protection        = 69
  #isc_dyn_rel_constraint            = 162
  #isc_dyn_delete_rel_constraint     = 163
  
  #isc_dyn_rel_temporary             = 238
  #isc_dyn_rel_temp_global_preserve  = 1
  #isc_dyn_rel_temp_global_delete    = 2
  
  #isc_dyn_fld_type                  = 70
  #isc_dyn_fld_length                = 71
  #isc_dyn_fld_scale                 = 72
  #isc_dyn_fld_sub_type              = 73
  #isc_dyn_fld_segment_length        = 74
  #isc_dyn_fld_query_header          = 75
  #isc_dyn_fld_edit_string           = 76
  #isc_dyn_fld_validation_blr        = 77
  #isc_dyn_fld_validation_source     = 78
  #isc_dyn_fld_computed_blr          = 79
  #isc_dyn_fld_computed_source       = 80
  #isc_dyn_fld_missing_value         = 81
  #isc_dyn_fld_default_value         = 82
  #isc_dyn_fld_query_name            = 83
  #isc_dyn_fld_dimensions            = 84
  #isc_dyn_fld_not_null              = 85
  #isc_dyn_fld_precision             = 86
  #isc_dyn_fld_char_length           = 172
  #isc_dyn_fld_collation             = 173
  #isc_dyn_fld_default_source        = 193
  #isc_dyn_del_default               = 197
  #isc_dyn_del_validation            = 198
  #isc_dyn_single_validation         = 199
  #isc_dyn_fld_character_set         = 203
  
  #isc_dyn_fld_source                = 90
  #isc_dyn_fld_base_fld              = 91
  #isc_dyn_fld_position              = 92
  #isc_dyn_fld_update_flag           = 93
  
  #isc_dyn_idx_unique                = 100
  #isc_dyn_idx_inactive              = 101
  #isc_dyn_idx_type                  = 103
  #isc_dyn_idx_foreign_key           = 104
  #isc_dyn_idx_ref_column            = 105
  #isc_dyn_idx_statistic             = 204
  
  #isc_dyn_trg_type                  = 110
  #isc_dyn_trg_blr                   = 111
  #isc_dyn_trg_source                = 112
  #isc_dyn_trg_name                  = 114
  #isc_dyn_trg_sequence              = 115
  #isc_dyn_trg_inactive              = 116
  #isc_dyn_trg_msg_number            = 117
  #isc_dyn_trg_msg                   = 118
  
  #isc_dyn_scl_acl                   = 121
  #isc_dyn_grant_user                = 130
  #isc_dyn_grant_user_explicit       = 219
  #isc_dyn_grant_proc                = 186
  #isc_dyn_grant_trig                = 187
  #isc_dyn_grant_view                = 188
  #isc_dyn_grant_options             = 132
  #isc_dyn_grant_user_group          = 205
  #isc_dyn_grant_role                = 218
  
  #isc_dyn_dim_lower                 = 141
  #isc_dyn_dim_upper                 = 142
  
  #isc_dyn_file_name                 = 125
  #isc_dyn_file_start                = 126
  #isc_dyn_file_length               = 127
  #isc_dyn_shadow_number             = 128
  #isc_dyn_shadow_man_auto           = 129
  #isc_dyn_shadow_conditional        = 130
  
  #isc_dyn_function_name             = 145
  #isc_dyn_function_type             = 146
  #isc_dyn_func_module_name          = 147
  #isc_dyn_func_entry_point          = 148
  #isc_dyn_func_return_argument      = 149
  #isc_dyn_func_arg_position         = 150
  #isc_dyn_func_mechanism            = 151
  #isc_dyn_filter_in_subtype         = 152
  #isc_dyn_filter_out_subtype        = 153
  
  #isc_dyn_description2              = 154
  #isc_dyn_fld_computed_source2      = 155
  #isc_dyn_fld_edit_string2          = 156
  #isc_dyn_fld_query_header2         = 157
  #isc_dyn_fld_validation_source2    = 158
  #isc_dyn_trg_msg2                  = 159
  #isc_dyn_trg_source2               = 160
  #isc_dyn_view_source2              = 161
  #isc_dyn_xcp_msg2                  = 184
  
  #isc_dyn_generator_name            = 95
  #isc_dyn_generator_id              = 96
  
  #isc_dyn_prc_inputs                = 167
  #isc_dyn_prc_outputs               = 168
  #isc_dyn_prc_source                = 169
  #isc_dyn_prc_blr                   = 170
  #isc_dyn_prc_source2               = 171
  #isc_dyn_prc_type                  = 239
  
  #isc_dyn_prc_t_selectable          = 1
  #isc_dyn_prc_t_executable          = 2
  
  #isc_dyn_prm_number                = 138
  #isc_dyn_prm_type                  = 139
  #isc_dyn_prm_mechanism             = 241
  
  #isc_dyn_xcp_msg                   = 185
  
  #isc_dyn_foreign_key_update        = 205
  #isc_dyn_foreign_key_delete        = 206
  #isc_dyn_foreign_key_cascade       = 207
  #isc_dyn_foreign_key_default       = 208
  #isc_dyn_foreign_key_null          = 209
  #isc_dyn_foreign_key_none          = 210
  
  #isc_dyn_def_sql_role              = 211
  #isc_dyn_sql_role_name             = 212
  #isc_dyn_grant_admin_options       = 213
  #isc_dyn_del_sql_role              = 214
  
  #isc_dyn_delete_generator          = 217
  
  #isc_dyn_mod_function              = 224
  #isc_dyn_mod_filter                = 225
  #isc_dyn_mod_generator             = 226
  #isc_dyn_mod_sql_role              = 227
  #isc_dyn_mod_charset               = 228
  #isc_dyn_mod_collation             = 229
  #isc_dyn_mod_prc_parameter         = 230
  
  #isc_dyn_def_collation             = 231
  #isc_dyn_coll_for_charset          = 232
  #isc_dyn_coll_from                 = 233
  #isc_dyn_coll_from_external        = 239
  #isc_dyn_coll_attribute            = 234
  #isc_dyn_coll_specific_attributes_charset= 235
  #isc_dyn_coll_specific_attributes  = 236
  #isc_dyn_del_collation             = 237
  
  #isc_dyn_last_dyn_value            = 242
  
  #isc_sdl_version1                  = 1
  #isc_sdl_eoc                       = 255
  #isc_sdl_relation                  = 2
  #isc_sdl_rid                       = 3
  #isc_sdl_field                     = 4
  #isc_sdl_fid                       = 5
  #isc_sdl_struct                    = 6
  #isc_sdl_variable                  = 7
  #isc_sdl_scalar                    = 8
  #isc_sdl_tiny_integer              = 9
  #isc_sdl_short_integer             = 10
  #isc_sdl_long_integer              = 11
  #isc_sdl_literal                   = 12
  #isc_sdl_add                       = 13
  #isc_sdl_subtract                  = 14
  #isc_sdl_multiply                  = 15
  #isc_sdl_divide                    = 16
  #isc_sdl_negate                    = 17
  #isc_sdl_eql                       = 18
  #isc_sdl_neq                       = 19
  #isc_sdl_gtr                       = 20
  #isc_sdl_geq                       = 21
  #isc_sdl_lss                       = 22
  #isc_sdl_leq                       = 23
  #isc_sdl_and                       = 24
  #isc_sdl_or                        = 25
  #isc_sdl_not                       = 26
  #isc_sdl_while                     = 27
  #isc_sdl_assignment                = 28
  #isc_sdl_label                     = 29
  #isc_sdl_leave                     = 30
  #isc_sdl_begin                     = 31
  #isc_sdl_end                       = 32
  #isc_sdl_do3                       = 33
  #isc_sdl_do2                       = 34
  #isc_sdl_do1                       = 35
  #isc_sdl_element                   = 36
  
  #isc_interp_eng_ascii              = 0
  #isc_interp_jpn_sjis               = 5
  #isc_interp_jpn_euc                = 6
  
  #isc_blob_untyped                  = 0
  
  #isc_blob_text                     = 1
  #isc_blob_blr                      = 2
  #isc_blob_acl                      = 3
  #isc_blob_ranges                   = 4
  #isc_blob_summary                  = 5
  #isc_blob_format                   = 6
  #isc_blob_tra                      = 7
  #isc_blob_extfile                  = 8
  #isc_blob_debug_info               = 9
  #isc_blob_max_predefined_subtype   = 10
  
  #isc_blob_formatted_memo           = 20
  #isc_blob_paradox_ole              = 21
  #isc_blob_graphic                  = 22
  #isc_blob_dbase_ole                = 23
  #isc_blob_typed_binary             = 24
  
  #isc_info_db_SQL_dialect           = 62
  #isc_dpb_SQL_dialect               = 63
  #isc_dpb_set_db_SQL_dialect        = 65
  
  #fb_dbg_version                    = 1
  #fb_dbg_end                        = 255
  #fb_dbg_map_src2blr                = 2
  #fb_dbg_map_varname                = 3
  #fb_dbg_map_argument               = 4
                                  
  #fb_dbg_arg_input                  = 0
  #fb_dbg_arg_output                 = 1
                                  
  #isc_info_end                    = 1
  #isc_info_truncated              = 2
  #isc_info_error                  = 3
  #isc_info_data_not_ready         = 4
  #isc_info_length                 = 126
  #isc_info_flag_end               = 127
  
  
  #isc_info_db_impl_isc_a = #isc_info_db_impl_isc_apl_68K
  #isc_info_db_impl_isc_u = #isc_info_db_impl_isc_vax_ultr
  #isc_info_db_impl_isc_v = #isc_info_db_impl_isc_vms
  #isc_info_db_impl_isc_s = #isc_info_db_impl_isc_sun_68k
  
  #isc_info_number_messages       = 4
  #isc_info_max_message           = 5
  #isc_info_max_send              = 6
  #isc_info_max_receive           = 7
  #isc_info_state                 = 8
  #isc_info_message_number        = 9
  #isc_info_message_size          = 10
  #isc_info_request_cost          = 11
  #isc_info_access_path           = 12
  #isc_info_req_select_count      = 13
  #isc_info_req_insert_count      = 14
  #isc_info_req_update_count      = 15
  #isc_info_req_delete_count      = 16
  
  #isc_info_rsb_end               = 0
  #isc_info_rsb_begin             = 1
  #isc_info_rsb_type              = 2
  #isc_info_rsb_relation          = 3
  #isc_info_rsb_plan              = 4
  
  #isc_info_rsb_unknown           = 1
  #isc_info_rsb_indexed           = 2
  #isc_info_rsb_navigate          = 3
  #isc_info_rsb_sequential        = 4      
  #isc_info_rsb_cross             = 5
  #isc_info_rsb_sort              = 6
  #isc_info_rsb_first             = 7
  #isc_info_rsb_boolean           = 8
  #isc_info_rsb_union             = 9
  #isc_info_rsb_aggregate         = 10
  #isc_info_rsb_merge             = 11
  #isc_info_rsb_ext_sequential    = 12
  #isc_info_rsb_ext_indexed       = 13
  #isc_info_rsb_ext_dbkey         = 14
  #isc_info_rsb_left_cross        = 15
  #isc_info_rsb_select            = 16
  #isc_info_rsb_sql_join          = 17
  #isc_info_rsb_simulate          = 18
  #isc_info_rsb_sim_cross         = 19
  #isc_info_rsb_once              = 20
  #isc_info_rsb_procedure         = 21
  #isc_info_rsb_skip              = 22
  #isc_info_rsb_virt_sequential   = 23
  #isc_info_rsb_recursive         = 24
                               
  #isc_info_rsb_and               = 1
  #isc_info_rsb_or                = 2
  #isc_info_rsb_dbkey             = 3
  #isc_info_rsb_index             = 4
  
  #isc_info_req_active            = 2
  #isc_info_req_inactive          = 3
  #isc_info_req_send              = 4
  #isc_info_req_receive           = 5
  #isc_info_req_select            = 6
  #isc_info_req_sql_stall         = 7
                               
  #isc_info_blob_num_segments     = 4
  #isc_info_blob_max_segment      = 5
  #isc_info_blob_total_length     = 6
  #isc_info_blob_type             = 7
  
  #isc_info_tra_id                = 4
  #isc_info_tra_oldest_interesting= 5
  #isc_info_tra_oldest_snapshot   = 6
  #isc_info_tra_oldest_active     = 7
  #isc_info_tra_isolation         = 8
  #isc_info_tra_access            = 9
  #isc_info_tra_lock_timeout      = 10
  
  #isc_info_tra_consistency       = 1
  #isc_info_tra_concurrency       = 2
  #isc_info_tra_read_committed    = 3
  
  #isc_info_tra_no_rec_version    = 0
  #isc_info_tra_rec_version       = 1
  
  #isc_info_tra_readonly          = 0      
  #isc_info_tra_readwrite         = 1
  
  #isc_info_sql_select            = 4
  #isc_info_sql_bind              = 5
  #isc_info_sql_num_variables     = 6
  #isc_info_sql_describe_vars     = 7
  #isc_info_sql_describe_end      = 8
  #isc_info_sql_sqlda_seq         = 9
  #isc_info_sql_message_seq       = 10
  #isc_info_sql_type              = 11
  #isc_info_sql_sub_type          = 12
  #isc_info_sql_scale             = 13
  #isc_info_sql_length            = 14
  #isc_info_sql_null_ind          = 15
  #isc_info_sql_field             = 16
  #isc_info_sql_relation          = 17
  #isc_info_sql_owner             = 18
  #isc_info_sql_alias             = 19
  #isc_info_sql_sqlda_start       = 20
  #isc_info_sql_stmt_type         = 21
  #isc_info_sql_get_plan          = 22
  #isc_info_sql_records           = 23
  #isc_info_sql_batch_fetch       = 24
  #isc_info_sql_relation_alias    = 25
  
  #isc_info_sql_stmt_select       = 1
  #isc_info_sql_stmt_insert       = 2
  #isc_info_sql_stmt_update       = 3
  #isc_info_sql_stmt_delete       = 4
  #isc_info_sql_stmt_ddl          = 5
  #isc_info_sql_stmt_get_segment  = 6
  #isc_info_sql_stmt_put_segment  = 7
  #isc_info_sql_stmt_exec_procedure= 8
  #isc_info_sql_stmt_start_trans  = 9
  #isc_info_sql_stmt_commit       = 10
  #isc_info_sql_stmt_rollback     = 11
  #isc_info_sql_stmt_select_for_upd= 12
  #isc_info_sql_stmt_set_generator= 13
  #isc_info_sql_stmt_savepoint    = 14

;}
;{ Macros
  Macro ISC_SHORT
    w
  EndMacro
  Macro ISC_LONG
    l
  EndMacro
  Macro XSQLDA_LENGTH(n)
    (SizeOf(XSQLDA) + (n - 1) * SizeOf (XSQLVAR))
  EndMacro
  Macro ISC_STATUS
    ISC_STATUS_ARRAY[#ISC_STATUS_LENGTH]
  EndMacro
  Macro ISC_DATE
    l
  EndMacro
  Macro ISC_TIME
    l
  EndMacro
  Macro GDS_QUAD
    GDS_QUAD_t
  EndMacro
  Macro ISC_QUAD
    GDS_QUAD_t
  EndMacro
  Macro isc_info_isc_version
    isc_info_version
  EndMacro
  Macro ISC_UCHAR
    c
  EndMacro
  Macro ISC_SCHAR
    c
  EndMacro
  Macro isc_blob_handle
    l
  EndMacro
  Macro ISC_USHORT
    l
  EndMacro
;}
;{ Structures
  Structure XSQLVAR
    sqltype.ISC_SHORT
    sqlscale.ISC_SHORT
    sqlsubtype.ISC_SHORT
    sqllen.ISC_SHORT
    sqldata.l
    sqlind.ISC_SHORT
    sqlname_length.ISC_SHORT
    sqlname.s{32}
    relname_length.ISC_SHORT
    relname.s{32}
    ownname_length.ISC_SHORT
    ownname.s{32}
    aliasname_length.ISC_SHORT
    aliasname.s{32}
  EndStructure        
  Structure XSQLDA
    version.ISC_SHORT
    sqldaid.s{8}
    sqldabc.ISC_LONG
    sqln.ISC_SHORT
    sqld.ISC_SHORT
    sqlvar.XSQLVAR[2]
  EndStructure
  Structure ISC_TIMESTAMP
    timestamp_date.ISC_DATE
    timestamp_time.ISC_TIME
  EndStructure
  Structure GDS_QUAD_t
    gds_quad_high.l
    gds_quad_low.l
  EndStructure
  Structure ISC_ARRAY_BOUND
    array_bound_lower.w
  	array_bound_upper.w
  EndStructure  
  Structure ISC_ARRAY_DESC
  	array_desc_dtype.ISC_UCHAR
  	array_desc_scale.ISC_SCHAR
  	array_desc_length.l
  	array_desc_field_name.ISC_SCHAR[32]
  	array_desc_relation_name.ISC_SCHAR[32]
  	array_desc_dimensions.w
  	array_desc_flags.w
  	array_desc_bounds.ISC_ARRAY_BOUND[16]
  EndStructure
  Structure ISC_BLOB_DESC
  	blob_desc_subtype.w
  	blob_desc_charset.w
  	blob_desc_segment_size.w
  	blob_desc_field_name.ISC_UCHAR[32]
  	blob_desc_relation_name.ISC_UCHAR[32]
  EndStructure
  Structure ISC_BLOB_CTL
  	*ctl_source.ISC_STATUS	; Source filter 
  	*ctl_source_handle.isc_blob_ctl	; Argument To pass To source filter 
  	ctl_to_sub_type.w		; Target type 
  	ctl_from_sub_type.w		; Source type 
  	ctl_buffer_length.l		; Length of buffer 
  	ctl_segment_length.l		; Length of current segment 
  	ctl_bpb_length.l			; Length of blob parameter  block 
  	; Internally, this is const UCHAR*, but this public struct probably can't change. 
  	*ctl_bpb.ISC_SCHAR				; Address of blob parameter block 
  	*ctl_buffer.ISC_UCHAR				; Address of segment buffer 
    ctl_max_segment.ISC_LONG		; Length of longest segment 
    ctl_number_segments.ISC_LONG	; Total number of segments 
    ctl_total_length.ISC_LONG		; Total length of blob 
  	*ctl_status.ISC_STATUS				; Address of status vector 
  	ctl_data.l[8]			; Application specific Data 
  EndStructure
  Structure BSTREAM
  	bstr_blob.isc_blob_handle		; Blob handle 
  	*bstr_buffer.ISC_SCHAR	; Address of buffer 
  	*bstr_ptr.ISC_SCHAR		; Next character 
  	bstr_length.w	; Length of buffer 
  	bstr_cnt.w		; Characters in buffer 
  	bstr_mode.c		; (mode) ? OUTPUT : INPUT 
  EndStructure
  Structure BLOBCALLBACK 
    *blob_get_segment.w
  	*cb1  ; void* hnd, ISC_UCHAR* buffer, ISC_USHORT buf_size, ISC_USHORT* result_len
    *blob_handle
    blob_number_segments.ISC_LONG
    blob_max_segment.ISC_LONG
    blob_total_length.ISC_LONG
    *blob_put_segment
  	*cb2  ; void* hnd, const ISC_UCHAR* buffer, ISC_USHORT buf_size
    *blob_lseek.ISC_LONG
  	*cb3  ; void* hnd, ISC_USHORT mode, ISC_LONG offset
  EndStructure
  Structure PARAMDSC
    dsc_dtype.ISC_UCHAR
    dsc_scale.c
    dsc_length.ISC_USHORT
    dsc_sub_type.w
    dsc_flags.ISC_USHORT
    *dsc_address.ISC_UCHAR
  EndStructure
  Structure PARAMVARY
    vary_length.ISC_USHORT
    vary_string.ISC_UCHAR[1]
  EndStructure 
  Structure USER_SEC_DATA
  	sec_flags.w			; which fields are specified 
  	uid.l					; the user's id 
  	gid.l					; the user's group id 
  	protocol.l				; protocol To use For connection 
  	server.s				; server To administer 
  	user_name.s			; the user's name 
  	password.s				; the user's password 
  	group_name.s			; the group name 
  	first_name.s			; the user's first name 
  	middle_name.s			; the user's middle name 
  	last_name.s			; the user's last name 
  	dba_user_name.s		; the dba user name 
  	dba_password.s			; the dba password 
  EndStructure 
;}
;{ Prototypes
Prototype.l isc_callback()
Prototype.l ISC_PRINT_CALLBACK(*void, arg2.ISC_SHORT, arg3.s)
Prototype.l ISC_VERSION_CALLBACK(*void, arg2.s)
Prototype.l ISC_EVENT_CALLBACK(*void, arg2.ISC_USHORT, arg3.s)
;}
                     

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 1327
; Folding = AAAAAA+
; EnableUnicode