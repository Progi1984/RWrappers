;{ Constantes
  #PCRE_MAJOR         = 7
  #PCRE_MINOR         = 0
  #PCRE_DATE          = 1166400000  ;= Date(2006,12,18,0,0,0)
  
  
  ; Options 
  #PCRE_CASELESS           = $00000001
  #PCRE_MULTILINE          = $00000002
  #PCRE_DOTALL             = $00000004
  #PCRE_EXTENDED           = $00000008
  #PCRE_ANCHORED           = $00000010
  #PCRE_DOLLAR_ENDONLY     = $00000020
  #PCRE_EXTRA              = $00000040
  #PCRE_NOTBOL             = $00000080
  #PCRE_NOTEOL             = $00000100
  #PCRE_UNGREEDY           = $00000200
  #PCRE_NOTEMPTY           = $00000400
  #PCRE_UTF8               = $00000800
  #PCRE_NO_AUTO_CAPTURE    = $00001000
  #PCRE_NO_UTF8_CHECK      = $00002000
  #PCRE_AUTO_CALLOUT       = $00004000
  #PCRE_PARTIAL            = $00008000
  #PCRE_DFA_SHORTEST       = $00010000
  #PCRE_DFA_RESTART        = $00020000
  #PCRE_FIRSTLINE          = $00040000
  #PCRE_DUPNAMES           = $00080000
  #PCRE_NEWLINE_CR         = $00100000
  #PCRE_NEWLINE_LF         = $00200000
  #PCRE_NEWLINE_CRLF       = $00300000
  #PCRE_NEWLINE_ANY        = $00400000
  
  ; Exec-time And get/set-time error codes 
  #PCRE_ERROR_NOMATCH         = -1
  #PCRE_ERROR_NULL            = -2
  #PCRE_ERROR_BADOPTION       = -3
  #PCRE_ERROR_BADMAGIC        = -4
  #PCRE_ERROR_UNKNOWN_OPCODE  = -5
  #PCRE_ERROR_UNKNOWN_NODE    = -5  ; For backward compatibility 
  #PCRE_ERROR_NOMEMORY        = -6
  #PCRE_ERROR_NOSUBSTRING     = -7
  #PCRE_ERROR_MATCHLIMIT      = -8
  #PCRE_ERROR_CALLOUT         = -9  ; Never used by PCRE itself 
  #PCRE_ERROR_BADUTF8        = -10
  #PCRE_ERROR_BADUTF8_OFFSET = -11
  #PCRE_ERROR_PARTIAL        = -12
  #PCRE_ERROR_BADPARTIAL     = -13
  #PCRE_ERROR_INTERNAL       = -14
  #PCRE_ERROR_BADCOUNT       = -15
  #PCRE_ERROR_DFA_UITEM      = -16
  #PCRE_ERROR_DFA_UCOND      = -17
  #PCRE_ERROR_DFA_UMLIMIT    = -18
  #PCRE_ERROR_DFA_WSSIZE     = -19
  #PCRE_ERROR_DFA_RECURSE    = -20
  #PCRE_ERROR_RECURSIONLIMIT = -21
  #PCRE_ERROR_NULLWSLIMIT    = -22
  #PCRE_ERROR_BADNEWLINE     = -23
  
  ; Request types For pcre_fullinfo()
  #PCRE_INFO_OPTIONS          =  0
  #PCRE_INFO_SIZE             =  1
  #PCRE_INFO_CAPTURECOUNT     =  2
  #PCRE_INFO_BACKREFMAX       =  3
  #PCRE_INFO_FIRSTBYTE        =  4
  #PCRE_INFO_FIRSTCHAR        =  4  ; For backwards compatibility 
  #PCRE_INFO_FIRSTTABLE       =  5
  #PCRE_INFO_LASTLITERAL      =  6
  #PCRE_INFO_NAMEENTRYSIZE    =  7
  #PCRE_INFO_NAMECOUNT        =  8
  #PCRE_INFO_NAMETABLE        =  9
  #PCRE_INFO_STUDYSIZE        = 10
  #PCRE_INFO_DEFAULT_TABLES   = 11
  
  ; Request types For pcre_config(). Do Not re-arrange, in order To remain compatible. 
  #PCRE_CONFIG_UTF8                   = 0
  #PCRE_CONFIG_NEWLINE                = 1
  #PCRE_CONFIG_LINK_SIZE              = 2
  #PCRE_CONFIG_POSIX_MALLOC_THRESHOLD = 3
  #PCRE_CONFIG_MATCH_LIMIT            = 4
  #PCRE_CONFIG_STACKRECURSE           = 5
  #PCRE_CONFIG_UNICODE_PROPERTIES     = 6
  #PCRE_CONFIG_MATCH_LIMIT_RECURSION  = 7
  
  ; Bit flags For the pcre_extra Structure. Do Not re-arrange Or redefine these bits, just add new ones on the End, in order To remain compatible. 
  #PCRE_EXTRA_STUDY_DATA             = $0001
  #PCRE_EXTRA_MATCH_LIMIT            = $0002
  #PCRE_EXTRA_CALLOUT_DATA           = $0004
  #PCRE_EXTRA_TABLES                 = $0008
  #PCRE_EXTRA_MATCH_LIMIT_RECURSION  = $0010
;}
;{ Structures
  Structure pcre_extra
    flags.l         ; Bits for which fields are set
    study_data.l    ; Opaque data from pcre_study()
    match_limit.l   ; Maximum number of calls to match()
    callout_data.l  ; Data passed back in callouts
    tables.l        ; Pointer to character tables
  EndStructure
;}

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 99
; Folding = 5