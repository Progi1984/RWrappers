;{ Macros 
; Charset macros 
  CompilerIf #PB_Compiler_Unicode = #True
    Macro MT(x)
      x
    EndMacro
    Macro mtext
      c
    EndMacro
    Macro DT(x)
      x
    EndMacro
    Macro dtext
      c
    EndMacro
  CompilerElse
    Macro MT(x)
      x
    EndMacro
    Macro mtext
      c
    EndMacro
    Macro DT(x)
      x
    EndMacro
    Macro dtext
      char
    EndMacro
  CompilerEndIf
  Macro mtextsize(s)
    (mtslen(s) * SizeOf(mtext))
  EndMacro
  Macro dtextsize(s)
    (dtslen(s) * SizeOf(dtext))
  EndMacro
  Macro msizeof(s)
    (SizeOf(s) / SizeOf(mtext))
  EndMacro
  Macro dsizeof(s)
    (SizeOf(s) / SizeOf(dtext))
  EndMacro
  
  Macro OCI_ConnPool:l:EndMacro
  Macro OCI_Connection:l:EndMacro
  Macro OCI_Statement:l:EndMacro
  Macro OCI_Resultset:l:EndMacro
  Macro OCI_Column:l:EndMacro
  Macro OCI_Lob:l:EndMacro
  Macro OCI_File:l:EndMacro
  Macro OCI_Transaction:l:EndMacro
  Macro OCI_Long:l:EndMacro
  Macro OCI_Date:l:EndMacro
  Macro OCI_Timestamp:l:EndMacro
  Macro OCI_Interval:l:EndMacro
  Macro OCI_Object:l:EndMacro
  Macro OCI_Coll:l:EndMacro
  Macro OCI_Elem:l:EndMacro
  Macro OCI_Iter:l:EndMacro
  Macro OCI_Schema:l:EndMacro
  Macro OCI_HashTable:l:EndMacro
  Macro OCI_Error:l:EndMacro
  Macro OCI_Mutex:l:EndMacro
  Macro OCI_Thread:l:EndMacro
;}
;{ Constants
  #OCILIB_MAJOR_VERSION     = 3
  #OCILIB_MINOR_VERSION     = 0
  #OCILIB_REVISION_VERSION  = 0

  ; oracle versions
  #OCI_UNKNOWN             = 0
  #OCI_8                   = 8
  #OCI_9                   = 9
  #OCI_10                  = 10
  #OCI_11                  = 11
  
  ; OCILIB Error types 
  #OCI_ERR_ORACLE          = 1
  #OCI_ERR_OCILIB          = 2
  
  ; OCILIB Error codes     
  #OCI_ERR_NONE                    = 0
  #OCI_ERR_NOT_INITIALIZED         = 1
  #OCI_ERR_LOADING_SHARED_LIB      = 2
  #OCI_ERR_LOADING_SYMBOLS         = 3
  #OCI_ERR_MULTITHREADED           = 4
  #OCI_ERR_MEMORY                  = 5
  #OCI_ERR_NOT_AVAILABLE           = 6
  #OCI_ERR_NULL_POINTER            = 7
  #OCI_ERR_NOT_SUPPORTED           = 8
  #OCI_ERR_PARSE_TOKEN             = 9
  #OCI_ERR_MAP_ARGUMENT            = 10
  #OCI_ERR_OUT_OF_BOUNDS           = 11
  #OCI_ERR_UNFREED_DATA            = 12
  #OCI_ERR_MAX_BIND                = 13
  #OCI_ERR_ATTR_NOT_FOUND          = 14
  #OCI_ERR_MIN_VALUE               = 15
  #OCI_ERR_NOT_COMPATIBLE          = 16
  #OCI_ERR_STMT_STATE              = 17
  #OCI_ERR_STMT_NOT_SCROLLABLE     = 18
                                
  ; binding 
  #OCI_BIND_BY_POS         = 0
  #OCI_BIND_BY_NAME        = 1
  #OCI_BIND_SIZE           = 6
  #OCI_BIND_MAX            = 512
                         
  ; fetching 
  #OCI_FETCH_SIZE          = 20   
  #OCI_PREFETCH_SIZE       = 20
  #OCI_LONG_EXPLICIT       = 1   
  #OCI_LONG_IMPLICIT       = 2 
  
  ; unkown value 
  #OCI_UNKNOWN             = 0
  
  ; C Data Type mapping 
  #OCI_CDT_NUMERIC         = 1  
  #OCI_CDT_DATETIME        = 3        
  #OCI_CDT_TEXT            = 4        
  #OCI_CDT_LONG            = 5        
  #OCI_CDT_CURSOR          = 6        
  #OCI_CDT_LOB             = 7    
  #OCI_CDT_FILE            = 8
  #OCI_CDT_TIMESTAMP       = 9
  #OCI_CDT_INTERVAL        = 10
  #OCI_CDT_RAW             = 11
  #OCI_CDT_OBJECT          = 12
  #OCI_CDT_COLLECTION      = 13
  
  ; Data Type codes For OCI_ImmediateXXX() calls 
  #OCI_ARG_SHORT           = 1        
  #OCI_ARG_USHORT          = 2 
  #OCI_ARG_INT             = 3        
  #OCI_ARG_UINT            = 4        
  #OCI_ARG_BIGINT          = 5        
  #OCI_ARG_BIGUINT         = 6        
  #OCI_ARG_DOUBLE          = 7        
  #OCI_ARG_DATETIME        = 8        
  #OCI_ARG_TEXT            = 9        
  #OCI_ARG_LOB             = 10    
  #OCI_ARG_FILE            = 11
  #OCI_ARG_TIMESTAMP       = 12
  #OCI_ARG_INTERVAL        = 13
  #OCI_ARG_RAW             = 14
  
  ; statement types 
  #OCI_CST_SELECT          = 1                
  #OCI_CST_UPDATE          = 2                   
  #OCI_CST_DELETE          = 3                      
  #OCI_CST_INSERT          = 4                     
  #OCI_CST_CREATE          = 5                     
  #OCI_CST_DROP            = 6                      
  #OCI_CST_ALTER           = 7                      
  #OCI_CST_BEGIN           = 8           
  #OCI_CST_DECLARE         = 9
  
  ; environnement modes 
  #OCI_ENV_DEFAULT         = 0
  #OCI_ENV_THREADED        = 1
  #OCI_ENV_CONTEXT         = 2
  
      ; sessions modes 
  #OCI_SESSION_DEFAULT     = 0
  #OCI_SESSION_SYSDBA      = 2
  #OCI_SESSION_SYSOPER     = 4
  
  ; charsetform types 
  #OCI_CSF_NONE            = 0
  #OCI_CSF_CHARSET         = 1
  #OCI_CSF_NATIONAL        = 2
  
  ; statement fetch mode 
  #OCI_SFM_DEFAULT         = 0
  #OCI_SFM_SCROLLABLE      = $08
  
  ; statement fetch direction 
  #OCI_SFD_ABSOLUTE        = $20
  #OCI_SFD_RELATIVE        = $40
  
  ; timestamp types 
  #OCI_TIMESTAMP           = 1
  #OCI_TIMESTAMP_TZ        = 2
  #OCI_TIMESTAMP_LTZ       = 3
  
  ; interval types 
  #OCI_INTERVAL_YM         = 1
  #OCI_INTERVAL_DS         = 2
  
  ; long types 
  #OCI_BLONG               = 1
  #OCI_CLONG               = 2
  
  ; lLob types 
  #OCI_BLOB                = 1
  #OCI_CLOB                = 2
  #OCI_NCLOB               = 3
  
  ; lob opening mode 
  #OCI_LOB_READONLY        = 1  
  #OCI_LOB_READWRITE       = 2 
  
  ; file types 
  #OCI_BFILE               = 1
  #OCI_CFILE               = 2
  
  ; lob browing mode 
  #OCI_SEEK_SET            = 1
  #OCI_SEEK_END            = 2
  #OCI_SEEK_CUR            = 3
  
  ; schema types 
  #OCI_SCHEMA_TABLE        = 1
  #OCI_SCHEMA_VIEW         = 2
  #OCI_SCHEMA_TYPE         = 3
  
  ; Collection types 
  #OCI_COLL_VARRAY         = 1
  #OCI_COLL_NESTED_TABLE   = 2
  
  ; size constants 
  #OCI_SIZE_FORMAT         = 64
  #OCI_SIZE_BUFFER         = 512
  #OCI_SIZE_LONG           = (64*1024)-1
  #OCI_SIZE_DATE           = 44
  #OCI_SIZE_TIMESTAMP      = 60
  #OCI_SIZE_FORMAT_TODATE  = 14
  #OCI_SIZE_NULL           = 4 
  #OCI_SIZE_PRECISION      = 10
  #OCI_SIZE_ROWID          = 23
  #OCI_SIZE_DIRECTORY      = 30
  #OCI_SIZE_FILENAME       = 255
  #OCI_SIZE_FORMAT_NUMS    = 40
  #OCI_SIZE_FORMAT_NUML    = 65
  
  ; hash tables support 
  #OCI_HASH_STRING         = 1
  #OCI_HASH_INTEGER        = 2
  #OCI_HASH_POINTER        = 3
  #OCI_HASH_DEFAULT_SIZE   = 256
  
  ; Trancsaction types 
  #OCI_TRS_NEW             = $00000001
  #OCI_TRS_READONLY        = $00000100
  #OCI_TRS_READWRITE       = $00000200
  #OCI_TRS_SERIALIZABLE    = $00000400
  #OCI_TRS_LOOSE           = $00010000
  #OCI_TRS_TIGHT           = $00020000
  
  ; string constants 
  #OCI_STRING_NULL         = MT("NULL")            
  #OCI_STRING_FORMAT_DATE  = MT("YYYY-MM-DD")
  #OCI_STRING_DEFAULT_PREC = 3
  #OCI_STRING_FORMAT_NUM   = MT("FM99999999999999999999999999999999999990.999999999999999999999999")
;}
;{ Prototypes
  Prototype.l POCI_ERROR(*err.OCI_Error)
  Prototype.l POCI_THREAD(*thread.OCI_Thread,*arg)
  Prototype.l POCI_THREADKEYDEST(*data_)
;}
;{ Structures
  Structure OCI_XID
  	formatID.l
  	gtrid_length.l		
  	bqual_length.l
  	data_.c[128]
  EndStructure
  Structure OCI_HashValue
    ;value.OCI_Variant
    StructureUnion ; OCI_Variant
      ; integers 
      num.l
      ; raw Data 
      *p_bytes;
      ; pointer To c natives types 
      *p_void
      *p_int.l
      *p_double.d       
      *p_dtext.dtext         
      *p_mtext.mtext         
      ; ocilib object types 
      *p_date.OCI_Date      
      *p_interval.OCI_Interval  
      *p_timestampOCI_Timestamp ;
      *p_long.OCI_Long      
      *p_lob.OCI_Lob       
      *p_file.OCI_File      
      *p_stmt.OCI_Statement 
      *p_col.OCI_Column    
      *p_obj.OCI_Object    
      *p_coll.OCI_Coll      
      *p_iter.OCI_Iter      
      *p_elem.OCI_Elem      
    EndStructureUnion
    *Next_.OCI_HashValue
  EndStructure
  Structure OCI_HashEntry
    *key.mtext
    *values.OCI_HashValue
    *next_.OCI_HashEntry
  EndStructure
;}

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 269
; Folding = AAAAAAq