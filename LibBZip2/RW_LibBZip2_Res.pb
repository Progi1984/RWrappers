;{ Constantes }
  #BZ_RUN               = 0
  #BZ_FLUSH             = 1
  #BZ_FINISH            = 2
  #BZ_OK                = 0
  #BZ_RUN_OK            = 1
  #BZ_FLUSH_OK          = 2
  #BZ_FINISH_OK         = 3
  #BZ_STREAM_END        = 4
  
  #BZ_SEQUENCE_ERROR    = -1
  #BZ_PARAM_ERROR       = -2
  #BZ_MEM_ERROR         = -3
  #BZ_DATA_ERROR        = -4
  #BZ_DATA_ERROR_MAGIC  = -5
  #BZ_IO_ERROR          = -6
  #BZ_UNEXPECTED_EOF    = -7
  #BZ_OUTBUFF_FULL      = -8
  #BZ_CONFIG_ERROR      = -9
  
  #BZ_MAX_UNUSED        = 5000
;}
;{ Structures }
  Structure bz_stream
    next_in.s
    avail_in.l
    total_in_lo32.l
    total_in_hi32.l
    next_out.s
    avail_out.l
    total_out_lo32.l
    total_out_hi32.l
    *state
    *bzalloc
    *bzfree
    *opaque
  EndStructure
;}  

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 38
; Folding = 5