
;{ Constantes
  #SQLITE_VERSION         ="3.6.0"
  #SQLITE_VERSION_NUMBER  =3006000
  ; SQLite Constants
  #SQLITE_OK         =   0 ; Successful result 
  #SQLITE_ERROR      =   1 ; SQL error Or missing database 
  #SQLITE_INTERNAL   =   2 ; An internal logic error in SQLite 
  #SQLITE_PERM       =   3 ; Access permission denied 
  #SQLITE_ABORT      =   4 ; Callback routine requested an abort 
  #SQLITE_BUSY       =   5 ; The database file is locked 
  #SQLITE_LOCKED     =   6 ; A table in the database is locked 
  #SQLITE_NOMEM      =   7 ; A malloc() failed 
  #SQLITE_READONLY   =   8 ; Attempt To write a readonly database 
  #SQLITE_INTERRUPT  =   9 ; Operation terminated by sqlite_interrupt() 
  #SQLITE_IOERR      =  10 ; Some kind of disk I/O error occurred 
  #SQLITE_CORRUPT    =  11 ; The database disk image is malformed 
  #SQLITE_NOTFOUND   =  12 ; (Internal Only) Table Or record Not found 
  #SQLITE_FULL       =  13 ; Insertion failed because database is full 
  #SQLITE_CANTOPEN   =  14 ; Unable To open the database file 
  #SQLITE_PROTOCOL   =  15 ; Database lock protocol error 
  #SQLITE_EMPTY      =  16 ; (Internal Only) Database table is empty 
  #SQLITE_SCHEMA     =  17 ; The database schema changed 
  #SQLITE_TOOBIG     =  18 ; Too much Data For one row of a table 
  #SQLITE_CONSTRAINT =  19 ; Abort due To constraint violation 
  #SQLITE_MISMATCH   =  20 ; Data type mismatch 
  #SQLITE_MISUSE     =  21 ; Library used incorrectly 
  #SQLITE_NOLFS      =  22 ; Uses OS features Not supported on host 
  #SQLITE_AUTH       =  23 ; Authorization denied 
  #SQLITE_FORMAT     =  24 ; Auxiliary database format error
  #SQLITE_RANGE      =  25 ; 2nd parameter To sqlite3_bind out of range
  #SQLITE_NOTADB     =  26 ; File opened that is Not a database file
  #SQLITE_ROW        = 100 ; sqlite_step() has another row ready 
  #SQLITE_DONE       = 101 ; sqlite_step() has finished executing 
  #SQLITE_STATIC     =  0 
  #SQLITE_TRANSIENT  = -1 
  ; The extended result codes always have the primary result code
  ; As a prefix.  Primary result codes only contain a single "_"
  ; character.  Extended result codes contain two Or more "_" characters.
  #SQLITE_IOERR_READ          = (#SQLITE_IOERR | (1<<8))
  #SQLITE_IOERR_SHORT_READ    = (#SQLITE_IOERR | (2<<8))
  #SQLITE_IOERR_WRITE         = (#SQLITE_IOERR | (3<<8))
  #SQLITE_IOERR_FSYNC         = (#SQLITE_IOERR | (4<<8))
  #SQLITE_IOERR_DIR_FSYNC     = (#SQLITE_IOERR | (5<<8))
  #SQLITE_IOERR_TRUNCATE      = (#SQLITE_IOERR | (6<<8))
  #SQLITE_IOERR_FSTAT         = (#SQLITE_IOERR | (7<<8))
  #SQLITE_IOERR_UNLOCK        = (#SQLITE_IOERR | (8<<8))
  #SQLITE_IOERR_RDLOCK        = (#SQLITE_IOERR | (9<<8))
  #SQLITE_IOERR_DELETE        = (#SQLITE_IOERR | (10<<8))
  #SQLITE_IOERR_BLOCKED       = (#SQLITE_IOERR | (11<<8))
  #SQLITE_IOERR_NOMEM         = (#SQLITE_IOERR | (12<<8))
  #SQLITE_IOERR_ACCESS        = (#SQLITE_IOERR | (13<<8))
  #SQLITE_IOERR_CHECKRESERVEDLOCK = (#SQLITE_IOERR | (14<<8))
  
  ; Flags For File Open Operations
  #SQLITE_OPEN_READONLY         = $00000001
  #SQLITE_OPEN_READWRITE        = $00000002
  #SQLITE_OPEN_CREATE           = $00000004
  #SQLITE_OPEN_DELETEONCLOSE    = $00000008
  #SQLITE_OPEN_EXCLUSIVE        = $00000010
  #SQLITE_OPEN_MAIN_DB          = $00000100
  #SQLITE_OPEN_TEMP_DB          = $00000200
  #SQLITE_OPEN_TRANSIENT_DB     = $00000400
  #SQLITE_OPEN_MAIN_JOURNAL     = $00000800
  #SQLITE_OPEN_TEMP_JOURNAL     = $00001000
  #SQLITE_OPEN_SUBJOURNAL       = $00002000
  #SQLITE_OPEN_MASTER_JOURNAL   = $00004000
  #SQLITE_OPEN_NOMUTEX          = $00008000
  ; Device Characteristics
  #SQLITE_IOCAP_ATOMIC          = $00000001
  #SQLITE_IOCAP_ATOMIC512       = $00000002
  #SQLITE_IOCAP_ATOMIC1K        = $00000004
  #SQLITE_IOCAP_ATOMIC2K        = $00000008
  #SQLITE_IOCAP_ATOMIC4K        = $00000010
  #SQLITE_IOCAP_ATOMIC8K        = $00000020
  #SQLITE_IOCAP_ATOMIC16K       = $00000040
  #SQLITE_IOCAP_ATOMIC32K       = $00000080
  #SQLITE_IOCAP_ATOMIC64K       = $00000100
  #SQLITE_IOCAP_SAFE_APPEND     = $00000200
  #SQLITE_IOCAP_SEQUENTIAL      = $00000400
  ; File Locking Levels
  #SQLITE_LOCK_NONE          = 0
  #SQLITE_LOCK_SHARED        = 1
  #SQLITE_LOCK_RESERVED      = 2
  #SQLITE_LOCK_PENDING       = 3
  #SQLITE_LOCK_EXCLUSIVE     = 4
  ; Synchronization Type Flags
  #SQLITE_SYNC_NORMAL        = $00002
  #SQLITE_SYNC_FULL          = $00003
  #SQLITE_SYNC_DATAONLY      = $00010
  ; Standard File Control Opcodes
  #SQLITE_FCNTL_LOCKSTATE    = 1
  ; Flags for the xAccess VFS method
  #SQLITE_ACCESS_EXISTS    = 0
  #SQLITE_ACCESS_READWRITE = 1
  #SQLITE_ACCESS_READ      = 2
  ; Configuration Options 
  #SQLITE_CONFIG_SINGLETHREAD  = 1  ; nil 
  #SQLITE_CONFIG_MULTITHREAD   = 2  ; nil 
  #SQLITE_CONFIG_SERIALIZED    = 3  ; nil 
  #SQLITE_CONFIG_MALLOC        = 4  ; sqlite3_mem_methods* 
  #SQLITE_CONFIG_GETMALLOC     = 5  ; sqlite3_mem_methods* 
  #SQLITE_CONFIG_SCRATCH       = 6  ; void*, int sz, int N 
  #SQLITE_CONFIG_PAGECACHE     = 7  ; void*, int sz, int N 
  #SQLITE_CONFIG_HEAP          = 8  ; void*, int nByte, int min 
  #SQLITE_CONFIG_MEMSTATUS     = 9  ; boolean 
  #SQLITE_CONFIG_MUTEX         = 10  ; sqlite3_mutex_methods* 
  #SQLITE_CONFIG_GETMUTEX      = 11  ; sqlite3_mutex_methods* 
  ; Authorizer Return Codes
  #SQLITE_DENY   = 1   ; Abort the SQL statement With an error 
  #SQLITE_IGNORE = 2   ; Don't allow access, but don't generate an error 
  ; Authorizer Action Codes
  #SQLITE_CREATE_INDEX         =  1   ; Index Name      Table Name      
  #SQLITE_CREATE_TABLE         =  2   ; Table Name      NULL            
  #SQLITE_CREATE_TEMP_INDEX    =  3   ; Index Name      Table Name      
  #SQLITE_CREATE_TEMP_TABLE    =  4   ; Table Name      NULL            
  #SQLITE_CREATE_TEMP_TRIGGER  =  5   ; Trigger Name    Table Name      
  #SQLITE_CREATE_TEMP_VIEW     =  6   ; View Name       NULL            
  #SQLITE_CREATE_TRIGGER       =  7   ; Trigger Name    Table Name      
  #SQLITE_CREATE_VIEW          =  8   ; View Name       NULL            
  #SQLITE_DELETE               =  9   ; Table Name      NULL            
  #SQLITE_DROP_INDEX           = 10   ; Index Name      Table Name      
  #SQLITE_DROP_TABLE           = 11   ; Table Name      NULL            
  #SQLITE_DROP_TEMP_INDEX      = 12   ; Index Name      Table Name      
  #SQLITE_DROP_TEMP_TABLE      = 13   ; Table Name      NULL            
  #SQLITE_DROP_TEMP_TRIGGER    = 14   ; Trigger Name    Table Name      
  #SQLITE_DROP_TEMP_VIEW       = 15   ; View Name       NULL            
  #SQLITE_DROP_TRIGGER         = 16   ; Trigger Name    Table Name      
  #SQLITE_DROP_VIEW            = 17   ; View Name       NULL            
  #SQLITE_INSERT               = 18   ; Table Name      NULL            
  #SQLITE_PRAGMA               = 19   ; Pragma Name     1st arg Or NULL 
  #SQLITE_READ                 = 20   ; Table Name      Column Name     
  #SQLITE_SELECT               = 21   ; NULL            NULL            
  #SQLITE_TRANSACTION          = 22   ; NULL            NULL            
  #SQLITE_UPDATE               = 23   ; Table Name      Column Name     
  #SQLITE_ATTACH               = 24   ; Filename        NULL            
  #SQLITE_DETACH               = 25   ; Database Name   NULL            
  #SQLITE_ALTER_TABLE          = 26   ; Database Name   Table Name      
  #SQLITE_REINDEX              = 27   ; Index Name      NULL            
  #SQLITE_ANALYZE              = 28   ; Table Name      NULL            
  #SQLITE_CREATE_VTABLE        = 29   ; Table Name      Module Name     
  #SQLITE_DROP_VTABLE          = 30   ; Table Name      Module Name     
  #SQLITE_FUNCTION             = 31   ; Function Name   NULL            
  #SQLITE_COPY                 =  0   ; No longer used 
  ; Run-Time Limit Categories
  #SQLITE_LIMIT_LENGTH                    = 0
  #SQLITE_LIMIT_SQL_LENGTH                = 1
  #SQLITE_LIMIT_COLUMN                    = 2
  #SQLITE_LIMIT_EXPR_DEPTH                = 3
  #SQLITE_LIMIT_COMPOUND_SELECT           = 4
  #SQLITE_LIMIT_VDBE_OP                   = 5
  #SQLITE_LIMIT_FUNCTION_ARG              = 6
  #SQLITE_LIMIT_ATTACHED                  = 7
  #SQLITE_LIMIT_LIKE_PATTERN_LENGTH       = 8
  #SQLITE_LIMIT_VARIABLE_NUMBER           = 9
  ; Fundamental Datatypes
  #SQLITE_INTEGER  = 1
  #SQLITE_FLOAT    = 2
  #SQLITE_BLOB     = 4
  #SQLITE_NULL     = 5
  #SQLITE_TEXT     = 3
  #SQLITE3_TEXT    = 3
  ; Text Encodings
  #SQLITE_UTF8           = 1
  #SQLITE_UTF16LE        = 2
  #SQLITE_UTF16BE        = 3
  #SQLITE_UTF16          = 4    ; Use native byte order 
  #SQLITE_ANY            = 5    ; sqlite3_create_function only 
  #SQLITE_UTF16_ALIGNED  = 8    ; sqlite3_create_collation only 
  ; Virtual Table Indexing Information
  #SQLITE_INDEX_CONSTRAINT_EQ    = 2
  #SQLITE_INDEX_CONSTRAINT_GT    = 4
  #SQLITE_INDEX_CONSTRAINT_LE    = 8
  #SQLITE_INDEX_CONSTRAINT_LT    = 16
  #SQLITE_INDEX_CONSTRAINT_GE    = 32
  #SQLITE_INDEX_CONSTRAINT_MATCH = 64
  ; Mutex Types
  #SQLITE_MUTEX_FAST             = 0
  #SQLITE_MUTEX_RECURSIVE        = 1
  #SQLITE_MUTEX_STATIC_MASTER    = 2
  #SQLITE_MUTEX_STATIC_MEM       = 3  ; sqlite3_malloc() 
  #SQLITE_MUTEX_STATIC_MEM2      = 4  ; sqlite3_release_memory() 
  #SQLITE_MUTEX_STATIC_PRNG      = 5  ; sqlite3_random() 
  #SQLITE_MUTEX_STATIC_LRU       = 6  ; lru page list 
  #SQLITE_MUTEX_STATIC_LRU2      = 7  ; lru page list 
  ; Testing Interface Operation Codes
  #SQLITE_TESTCTRL_PRNG_SAVE                = 5
  #SQLITE_TESTCTRL_PRNG_RESTORE             = 6
  #SQLITE_TESTCTRL_PRNG_RESET               = 7
  #SQLITE_TESTCTRL_BITVEC_TEST              = 8
  #SQLITE_TESTCTRL_FAULT_INSTALL            = 9
  #SQLITE_TESTCTRL_BENIGN_MALLOC_HOOKS     = 10
  ; Status Parameters
  #SQLITE_STATUS_MEMORY_USED          = 0
  #SQLITE_STATUS_PAGECACHE_USED       = 1
  #SQLITE_STATUS_PAGECACHE_OVERFLOW   = 2
  #SQLITE_STATUS_SCRATCH_USED         = 3
  #SQLITE_STATUS_SCRATCH_OVERFLOW     = 4
  #SQLITE_STATUS_MALLOC_SIZE          = 5
;}
;{ Structures
  Structure sqlite3_io_methods 
    iVersion.l
    *xClose                 ; CB > sqlite3_file*
    *xRead                  ; CB > sqlite3_file*, void*, int iAmt, sqlite3_int64 iOfst
    *xWrite                 ; CB > sqlite3_file*, const void*, int iAmt, sqlite3_int64 iOfst
    *xTruncate              ; CB > sqlite3_file*, sqlite3_int64 size
    *xSync                  ; CB > sqlite3_file*, int flags
    *xFileSize              ; CB > sqlite3_file*, sqlite3_int64 *pSize
    *xLock                  ; CB > sqlite3_file*, int
    *xUnlock                ; CB > sqlite3_file*, int
    *xCheckReservedLock     ; CB > sqlite3_file*, int *pResOut
    *xFileControl           ; CB > sqlite3_file*, int op, void *pArg
    *xSectorSize            ; CB > sqlite3_file*
    *xDeviceCharacteristics ; CB > sqlite3_file*
    ; Additional methods may be added in future releases 
  EndStructure
  Structure sqlite3_vfs 
    iVersion.l        ; structureure version number 
    szOsFile.l        ; Size of subclassed sqlite3_file 
    mxPathname.l      ; Maximum file pathname length 
    *pNext.sqlite3_vfs; Next registered VFS 
    zName.s           ; Name of this virtual file system 
    *pAppData         ; Pointer To application-specific Data 
    *xOpen            ; CB >sqlite3_vfs*, const char *zName, sqlite3_file*, int flags, int *pOutFlags
    *xDelete          ; CB >sqlite3_vfs*, const char *zName, int syncDir
    *xAccess          ; CB >sqlite3_vfs*, const char *zName, int flags, int *pResOut
    *xFullPathname    ; CB >sqlite3_vfs*, const char *zName, int nOut, char *zOut
    *xDlOpen          ; CB >sqlite3_vfs*, const char *zFilename
    *xDlError         ; CB >sqlite3_vfs*, int nByte, char *zErrMsg
    *xDlSym           ; CB >sqlite3_vfs*,void*, const char *zSymbol
    *xDlClose         ; CB >sqlite3_vfs*, void*
    *xRandomness      ; CB >sqlite3_vfs*, int nByte, char *zOut
    *xSleep           ; CB >sqlite3_vfs*, int microseconds
    *xCurrentTime     ; CB >sqlite3_vfs*, double*
    *xGetLastError    ; CB >sqlite3_vfs*, int, char *
    ; New fields may be appended in figure versions.  The iVersion
    ; value will increment whenever this happens. 
  EndStructure
  Structure sqlite3_mem_methods 
    *xMalloc    ; CB >int       ; Memory allocation function 
    *xFree      ; CB >void*     ; Free a prior allocation 
    *xRealloc   ; CB >void*,int ; Resize an allocation 
    *xSize      ; CB >void*     ; Return the size of an allocation 
    *xRoundup   ; CB >int       ; Round up request size To allocation size 
    *xInit      ; CB >void*     ; Initialize the memory allocator 
    *xShutdown  ; CB >void*     ; Deinitialize the memory allocator 
    *pAppData   ; Argument To xInit() And xShutdown()
  EndStructure
  Structure sqlite3_module 
    iVersion.l
    *xCreate      ; CB >sqlite3*, void *pAux, int argc, const char *const*argv, sqlite3_vtab **ppVTab, char**
    *xConnect     ; CB >sqlite3*, void *pAux, int argc, const char *const*argv, sqlite3_vtab **ppVTab, char**
    *xBestIndex   ; CB >sqlite3_vtab *pVTab, sqlite3_index_info*
    *xDisconnect  ; CB >sqlite3_vtab *pVTab
    *xDestroy     ; CB >sqlite3_vtab *pVTab
    *xOpen        ; CB >sqlite3_vtab *pVTab, sqlite3_vtab_cursor **ppCursor
    *xClose       ; CB >sqlite3_vtab_cursor*
    *xFilter      ; CB >sqlite3_vtab_cursor*, int idxNum, const char *idxStr, int argc, sqlite3_value **argv
    *xNext        ; CB >sqlite3_vtab_cursor*
    *xEof         ; CB >sqlite3_vtab_cursor*
    *xColumn      ; CB >sqlite3_vtab_cursor*, sqlite3_context*, int
    *xRowid       ; CB >sqlite3_vtab_cursor*, sqlite3_int64 *pRowid
    *xUpdate      ; CB >sqlite3_vtab *, int, sqlite3_value **, sqlite3_int64 *
    *xBegin       ; CB >sqlite3_vtab *pVTab
    *xSync        ; CB >sqlite3_vtab *pVTab
    *xCommit      ; CB >sqlite3_vtab *pVTab
    *xRollback    ; CB >sqlite3_vtab *pVTab
    *xFindFunction; CB >sqlite3_vtab *pVtab, int nArg, const char *zName, void (**pxFunc ; CB >sqlite3_context*,int,sqlite3_value**, void **ppArg
    *xRename      ; CB >sqlite3_vtab *pVtab, const char *zNew
  EndStructure
  Structure sqlite3_vtab 
    *pModule.sqlite3_module ; The module For this virtual table 
    nRef.l                  ; Used internally 
    zErrMsg.s               ; Error message from sqlite3_mprintf()
    ; Virtual table implementations will typically add additional fields 
  EndStructure
  Structure sqlite3_vtab_cursor 
    *pVtab.sqlite3_vtab   ; Virtual table of this cursor 
    ; Virtual table implementations will typically add additional fields 
  EndStructure
  Structure sqlite3_mutex_methods 
    *xMutexInit     ; CB >void
    *xMutexEnd      ; CB >void
    *xMutexAlloc    ; CB >int
    *xMutexFree     ; CB >sqlite3_mutex *
    *xMutexEnter    ; CB >sqlite3_mutex *
    *xMutexTry      ; CB >sqlite3_mutex *
    *xMutexLeave    ; CB >sqlite3_mutex *
    *xMutexHeld     ; CB >sqlite3_mutex *
    *xMutexNotheld  ; CB >sqlite3_mutex *
  EndStructure
;}

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 293
; Folding = A5
; EnableXP
; UseMainFile = SQLite_Ex0.pb