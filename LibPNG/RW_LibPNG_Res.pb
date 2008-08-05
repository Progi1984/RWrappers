;{ Macros }
  Macro PNG_COLOR_DIST(c1, c2) 
    (Abs(c1\red - c2\red) +  Abs(c1\green - c2\green) + Abs(c1\blue - c2\blue))
  EndMacro
  ; PNG_OUT_OF_RANGE returns true If value is outside the range 
    ; ideal-delta..ideal+delta.  Each argument is evaluated twice.
    ; "ideal" And "delta" should be constants, normally simple
    ; integers, "value" a variable. Added To libpng-1.2.6 JB 
  Macro PNG_OUT_OF_RANGE(value, ideal, delta)
    (value<ideal-delta||value >ideal+delta)
  EndMacro
;}
;{ Dims }
  ; Constant strings For known chunk types.  If you need To add a chunk,
    ; Define the name here, And add an invocation of the Macro in png.c And
    ; wherever it's needed.
  Global Dim png_IHDR(5): png_IHDR(0) =  73: png_IHDR(1) = 72: png_IHDR(2) = 68: png_IHDR(3) =  82: png_IHDR(4) = '\0':
  Global Dim png_IDAT(5): png_IDAT(0) =  73: png_IDAT(1) = 68: png_IDAT(2) = 65: png_IDAT(3) =  84: png_IDAT(4) = '\0':
  Global Dim png_IEND(5): png_IEND(0) =  73: png_IEND(1) = 69: png_IEND(2) = 78: png_IEND(3) =  68: png_IEND(4) = '\0':
  Global Dim png_PLTE(5): png_PLTE(0) =  80: png_PLTE(1) = 76: png_PLTE(2) = 84: png_PLTE(3) =  69: png_PLTE(4) = '\0':
  Global Dim png_bKGD(5): png_bKGD(0) =  98: png_bKGD(1) = 75: png_bKGD(2) = 71: png_bKGD(3) =  68: png_bKGD(4) = '\0':
  Global Dim png_cHRM(5): png_cHRM(0) =  99: png_cHRM(1) = 72: png_cHRM(2) = 82: png_cHRM(3) =  77: png_cHRM(4) = '\0':
  Global Dim png_gAMA(5): png_gAMA(0) = 103: png_gAMA(1) = 65: png_gAMA(2) = 77: png_gAMA(3) =  65: png_gAMA(4) = '\0':
  Global Dim png_hIST(5): png_hIST(0) = 104: png_hIST(1) = 73: png_hIST(2) = 83: png_hIST(3) =  84: png_hIST(4) = '\0':
  Global Dim png_iCCP(5): png_iCCP(0) = 105: png_iCCP(1) = 67: png_iCCP(2) = 67: png_iCCP(3) =  80: png_iCCP(4) = '\0':
  Global Dim png_iTXt(5): png_iTXt(0) = 105: png_iTXt(1) = 84: png_iTXt(2) = 88: png_iTXt(3) = 116: png_iTXt(4) = '\0':
  Global Dim png_oFFs(5): png_oFFs(0) = 111: png_oFFs(1) = 70: png_oFFs(2) = 70: png_oFFs(3) = 115: png_oFFs(4) = '\0':
  Global Dim png_pCAL(5): png_pCAL(0) = 112: png_pCAL(1) = 67: png_pCAL(2) = 65: png_pCAL(3) =  76: png_pCAL(4) = '\0':
  Global Dim png_sCAL(5): png_sCAL(0) = 115: png_sCAL(1) = 67: png_sCAL(2) = 65: png_sCAL(3) =  76: png_sCAL(4) = '\0':
  Global Dim png_pHYs(5): png_pHYs(0) = 112: png_pHYs(1) = 72: png_pHYs(2) = 89: png_pHYs(3) = 115: png_pHYs(4) = '\0':
  Global Dim png_sBIT(5): png_sBIT(0) = 115: png_sBIT(1) = 66: png_sBIT(2) = 73: png_sBIT(3) =  84: png_sBIT(4) = '\0':
  Global Dim png_sPLT(5): png_sPLT(0) = 115: png_sPLT(1) = 80: png_sPLT(2) = 76: png_sPLT(3) =  84: png_sPLT(4) = '\0':
  Global Dim png_sRGB(5): png_sRGB(0) = 115: png_sRGB(1) = 82: png_sRGB(2) = 71: png_sRGB(3) =  66: png_sRGB(4) = '\0':
  Global Dim png_tEXt(5): png_tEXt(0) = 116: png_tEXt(1) = 69: png_tEXt(2) = 88: png_tEXt(3) = 116: png_tEXt(4) = '\0':
  Global Dim png_tIME(5): png_tIME(0) = 116: png_tIME(1) = 73: png_tIME(2) = 77: png_tIME(3) =  69: png_tIME(4) = '\0':
  Global Dim png_tRNS(5): png_tRNS(0) = 116: png_tRNS(1) = 82: png_tRNS(2) = 78: png_tRNS(3) =  83: png_tRNS(4) = '\0':
  Global Dim png_zTXt(5): png_zTXt(0) = 122: png_zTXt(1) = 84: png_zTXt(2) = 88: png_zTXt(3) = 116: png_zTXt(4) = '\0':
;}
;{ Constantes }
  ; Version information For png.h - this should match the version in png.c 
  #PNG_LIBPNG_VER_STRING      = "1.2.24"
  #PNG_HEADER_VERSION_STRING  = " libpng version 1.2.24 - December 14, 2007"
  #PNG_LIBPNG_VER_SONUM       = 0
  #PNG_LIBPNG_VER_DLLNUM      = 13
  
  ; These should match the first 3 components of PNG_LIBPNG_VER_STRING: 
  #PNG_LIBPNG_VER_MAJOR       = 1
  #PNG_LIBPNG_VER_MINOR       = 2
  #PNG_LIBPNG_VER_RELEASE     = 24
  
  ; This should match the numeric part of the final component of PNG_LIBPNG_VER_STRING, omitting any leading zero: 
  #PNG_LIBPNG_VER_BUILD       = 0
  
  ; Release Status 
  #PNG_LIBPNG_BUILD_ALPHA     = 1
  #PNG_LIBPNG_BUILD_BETA      = 2
  #PNG_LIBPNG_BUILD_RC        = 3
  #PNG_LIBPNG_BUILD_STABLE    = 4
  #PNG_LIBPNG_BUILD_RELEASE_STATUS_MASK = 7
    
  ; Release-Specific Flags 
  #PNG_LIBPNG_BUILD_PATCH     = 8   ; Can be Or'ed with PNG_LIBPNG_BUILD_STABLE only 
  #PNG_LIBPNG_BUILD_PRIVATE   = 16  ; Cannot be Or'ed with PNG_LIBPNG_BUILD_SPECIAL 
  #PNG_LIBPNG_BUILD_SPECIAL   = 32  ; Cannot be Or'ed with PNG_LIBPNG_BUILD_PRIVATE 
  #PNG_LIBPNG_BUILD_BASE_TYPE = #PNG_LIBPNG_BUILD_STABLE
  
  ; Careful here.  At one time, Guy wanted To use 082, but that would be octal.
    ; We must Not include leading zeros.
    ; Versions 0.7 through 1.0.0 were in the range 0 To 100 here (only
    ; version 1.0.0 was mis-numbered 100 instead of 10000).  From
    ; version 1.0.1 it's    xxyyzz, where x=major, y=minor, z=release 
  #PNG_LIBPNG_VER             = 10224 ; 1.2.24 
  
  ; Supported compression types For text in PNG files (tEXt, And zTXt).
   ; The values of the PNG_TEXT_COMPRESSION_ defines should Not be changed. 
  #PNG_TEXT_COMPRESSION_NONE_WR = -3
  #PNG_TEXT_COMPRESSION_zTXt_WR = -2
  #PNG_TEXT_COMPRESSION_NONE    = -1
  #PNG_TEXT_COMPRESSION_zTXt    =  0
  #PNG_ITXT_COMPRESSION_NONE    =  1
  #PNG_ITXT_COMPRESSION_zTXt    =  2
  #PNG_TEXT_COMPRESSION_LAST    =  3  ; Not a valid value 
  
  #PNG_CHUNK_NAME_LENGTH        = 5
  
  ; Maximum positive integer used in PNG is (2^31)-1 
  #PNG_UINT_31_MAX  = $7fffffff
  #PNG_UINT_32_MAX  = -1
  #PNG_SIZE_MAX     = -1
  ; PNG_MAX_UINT is deprecated; use PNG_UINT_31_MAX instead. 
  #PNG_MAX_UINT     = #PNG_UINT_31_MAX
  
  ; These describe the color_type field in png_info. 
    ; color type masks 
    #PNG_COLOR_MASK_PALETTE    = 1
    #PNG_COLOR_MASK_COLOR      = 2
    #PNG_COLOR_MASK_ALPHA      = 4
    ; color types.  Note that Not all combinations are legal 
    #PNG_COLOR_TYPE_GRAY        = 0
    #PNG_COLOR_TYPE_PALETTE     = #PNG_COLOR_MASK_COLOR | #PNG_COLOR_MASK_PALETTE
    #PNG_COLOR_TYPE_RGB         = #PNG_COLOR_MASK_COLOR
    #PNG_COLOR_TYPE_RGB_ALPHA   = #PNG_COLOR_MASK_COLOR | #PNG_COLOR_MASK_ALPHA
    #PNG_COLOR_TYPE_GRAY_ALPHA  = #PNG_COLOR_MASK_ALPHA
    ; aliases 
    #PNG_COLOR_TYPE_RGBA        = #PNG_COLOR_TYPE_RGB_ALPHA
    #PNG_COLOR_TYPE_GA          = #PNG_COLOR_TYPE_GRAY_ALPHA
  
  ; This is For compression type. PNG 1.0-1.2 only Define the single type. 
  #PNG_COMPRESSION_TYPE_BASE  = 0 ; Deflate method 8, 32K window 
  #PNG_COMPRESSION_TYPE_DEFAULT = #PNG_COMPRESSION_TYPE_BASE
  
  ; This is For filter type. PNG 1.0-1.2 only Define the single type. 
  #PNG_FILTER_TYPE_BASE       = 0 ; Single row per-byte filtering 
  #PNG_INTRAPIXEL_DIFFERENCING  = 64 ; Used only in MNG datastreams 
  #PNG_FILTER_TYPE_DEFAULT    = #PNG_FILTER_TYPE_BASE
  
  ; These are For the interlacing type.  These values should Not be changed. 
  #PNG_INTERLACE_NONE         = 0 ; Non-interlaced image 
  #PNG_INTERLACE_ADAM7        = 1 ; Adam7 interlacing 
  #PNG_INTERLACE_LAST         = 2 ; Not a valid value 
  
  ; These are For the oFFs chunk.  These values should Not be changed. 
  #PNG_OFFSET_PIXEL           = 0 ; Offset in pixels 
  #PNG_OFFSET_MICROMETER      = 1 ; Offset in micrometers (1/10^6 meter) 
  #PNG_OFFSET_LAST            = 2 ; Not a valid value 
  
  ; These are For the pCAL chunk.  These values should Not be changed. 
  #PNG_EQUATION_LINEAR        = 0 ; Linear transformation 
  #PNG_EQUATION_BASE_E        = 1 ; Exponential base e transform 
  #PNG_EQUATION_ARBITRARY     = 2 ; Arbitrary base exponential transform 
  #PNG_EQUATION_HYPERBOLIC    = 3 ; Hyperbolic sine transformation 
  #PNG_EQUATION_LAST          = 4 ; Not a valid value 
  
  ; These are For the sCAL chunk.  These values should Not be changed. 
  #PNG_SCALE_UNKNOWN          = 0 ; unknown unit (image scale) 
  #PNG_SCALE_METER            = 1 ; meters per pixel 
  #PNG_SCALE_RADIAN           = 2 ; radians per pixel 
  #PNG_SCALE_LAST             = 3 ; Not a valid value 
  
  ; These are For the pHYs chunk.  These values should Not be changed. 
  #PNG_RESOLUTION_UNKNOWN     = 0 ; pixels/unknown unit (aspect ratio) 
  #PNG_RESOLUTION_METER       = 1 ; pixels/meter 
  #PNG_RESOLUTION_LAST        = 2 ; Not a valid value 
  
  ; These are For the sRGB chunk.  These values should Not be changed. 
  #PNG_sRGB_INTENT_PERCEPTUAL = 0
  #PNG_sRGB_INTENT_RELATIVE   = 1
  #PNG_sRGB_INTENT_SATURATION = 2
  #PNG_sRGB_INTENT_ABSOLUTE   = 3
  #PNG_sRGB_INTENT_LAST       = 4 ; Not a valid value 
  
  ; This is For text chunks 
  #PNG_KEYWORD_MAX_LENGTH     = 79
  
  ; Maximum number of entries in PLTE/sPLT/tRNS arrays 
  #PNG_MAX_PALETTE_LENGTH     = 256
  
  ; These determine If an ancillary chunk's data has been successfully read
    ; from the PNG header, Or If the application has filled in the corresponding
    ; Data in the info_struct To be written into the output file.  The values
    ; of the PNG_INFO_<chunk> defines should Not be changed.
  #PNG_INFO_gAMA = $0001
  #PNG_INFO_sBIT = $0002
  #PNG_INFO_cHRM = $0004
  #PNG_INFO_PLTE = $0008
  #PNG_INFO_tRNS = $0010
  #PNG_INFO_bKGD = $0020
  #PNG_INFO_hIST = $0040
  #PNG_INFO_pHYs = $0080
  #PNG_INFO_oFFs = $0100
  #PNG_INFO_tIME = $0200
  #PNG_INFO_pCAL = $0400
  #PNG_INFO_sRGB = $0800   ; GR-P, 0.96a 
  #PNG_INFO_iCCP = $1000   ; ESR, 1.0.6 
  #PNG_INFO_sPLT = $2000   ; ESR, 1.0.6 
  #PNG_INFO_sCAL = $4000   ; ESR, 1.0.6 
  #PNG_INFO_IDAT = $8000   ; ESR, 1.0.6 
  
  ; Transform masks For the high-level Interface 
  #PNG_TRANSFORM_IDENTITY       = $0000    ; Read And write 
  #PNG_TRANSFORM_STRIP_16       = $0001    ; Read only 
  #PNG_TRANSFORM_STRIP_ALPHA    = $0002    ; Read only 
  #PNG_TRANSFORM_PACKING        = $0004    ; Read And write 
  #PNG_TRANSFORM_PACKSWAP       = $0008    ; Read And write 
  #PNG_TRANSFORM_EXPAND         = $0010    ; Read only 
  #PNG_TRANSFORM_INVERT_MONO    = $0020    ; Read And write 
  #PNG_TRANSFORM_SHIFT          = $0040    ; Read And write 
  #PNG_TRANSFORM_BGR            = $0080    ; Read And write 
  #PNG_TRANSFORM_SWAP_ALPHA     = $0100    ; Read And write 
  #PNG_TRANSFORM_SWAP_ENDIAN    = $0200    ; Read And write 
  #PNG_TRANSFORM_INVERT_ALPHA   = $0400    ; Read And write 
  #PNG_TRANSFORM_STRIP_FILLER   = $0800    ; WRITE only 
  
  ; Flags For MNG supported features 
  #PNG_FLAG_MNG_EMPTY_PLTE     = $01
  #PNG_FLAG_MNG_FILTER_64      = $04
  #PNG_ALL_MNG_FEATURES        = $05
  
  
  ; The values of the PNG_FILLER_ defines should Not be changed 
  #PNG_FILLER_BEFORE  = 0
  #PNG_FILLER_AFTER   = 1
  
  #PNG_BACKGROUND_GAMMA_UNKNOWN = 0
  #PNG_BACKGROUND_GAMMA_SCREEN  = 1
  #PNG_BACKGROUND_GAMMA_FILE    = 2
  #PNG_BACKGROUND_GAMMA_UNIQUE  = 3
  
  ; Values For png_set_crc_action() To say how To handle CRC errors in
    ; ancillary And critical chunks, And whether To use the Data contained
    ; therein.  Note that it is impossible To "discard" Data in a critical
    ; chunk.  For versions prior To 0.90, the action was always error/quit,
    ; whereas in version 0.90 And later, the action For CRC errors in ancillary
    ; chunks is warn/discard.  These values should Not be changed.
    ;      value                       action:critical     action:ancillary
  #PNG_CRC_DEFAULT       = 0  ; error/quit          warn/discard Data 
  #PNG_CRC_ERROR_QUIT    = 1  ; error/quit          error/quit        
  #PNG_CRC_WARN_DISCARD  = 2  ; (INVALID)           warn/discard Data 
  #PNG_CRC_WARN_USE      = 3  ; warn/use Data       warn/use Data     
  #PNG_CRC_QUIET_USE     = 4  ; quiet/use Data      quiet/use Data    
  #PNG_CRC_NO_CHANGE     = 5  ; use current value   use current value 
  
  ; Flags For png_set_filter() To say which filters To use.  The flags
    ; are chosen so that they don't conflict with real filter types
    ; below, in Case they are supplied instead of the #defined constants.
    ; These values should Not be changed.
  #PNG_NO_FILTERS     = $00
  #PNG_FILTER_NONE    = $08
  #PNG_FILTER_SUB     = $10
  #PNG_FILTER_UP      = $20
  #PNG_FILTER_AVG     = $40
  #PNG_FILTER_PAETH   = $80
  #PNG_ALL_FILTERS    = #PNG_FILTER_NONE | #PNG_FILTER_SUB | #PNG_FILTER_UP | #PNG_FILTER_AVG | #PNG_FILTER_PAETH
  
  ; Filter values (Not flags) - used in pngwrite.c, pngwutil.c For now.
    ; These defines should Not be changed.
  #PNG_FILTER_VALUE_NONE  = 0
  #PNG_FILTER_VALUE_SUB   = 1
  #PNG_FILTER_VALUE_UP    = 2
  #PNG_FILTER_VALUE_AVG   = 3
  #PNG_FILTER_VALUE_PAETH = 4
  #PNG_FILTER_VALUE_LAST  = 5
  
  ; Heuristic used For row filter selection.  These defines should Not be changed.
  #PNG_FILTER_HEURISTIC_DEFAULT    = 0  ; Currently "UNWEIGHTED" 
  #PNG_FILTER_HEURISTIC_UNWEIGHTED = 1  ; Used by libpng < 0.95 
  #PNG_FILTER_HEURISTIC_WEIGHTED   = 2  ; Experimental feature 
  #PNG_FILTER_HEURISTIC_LAST       = 3  ; Not a valid value 
  
  ; assignments For png_data_freer 
  #PNG_DESTROY_WILL_FREE_DATA = 1
  #PNG_SET_WILL_FREE_DATA     = 1
  #PNG_USER_WILL_FREE_DATA    = 2
  
  ; Flags For png_ptr->free_me And info_ptr->free_me 
  #PNG_FREE_HIST = $0008
  #PNG_FREE_ICCP = $0010
  #PNG_FREE_SPLT = $0020
  #PNG_FREE_ROWS = $0040
  #PNG_FREE_PCAL = $0080
  #PNG_FREE_SCAL = $0100
  #PNG_FREE_UNKN = $0200
  #PNG_FREE_LIST = $0400
  #PNG_FREE_PLTE = $1000
  #PNG_FREE_TRNS = $2000
  #PNG_FREE_TEXT = $4000
  #PNG_FREE_ALL  = $7fff
  #PNG_FREE_MUL  = $4220 ; PNG_FREE_SPLT|PNG_FREE_TEXT|PNG_FREE_UNKN 
  
  ; For use in png_set_keep_unknown, added To version 1.2.6 
  #PNG_HANDLE_CHUNK_AS_DEFAULT   = 0
  #PNG_HANDLE_CHUNK_NEVER        = 1
  #PNG_HANDLE_CHUNK_IF_SAFE      = 2
  #PNG_HANDLE_CHUNK_ALWAYS       = 3
  
  ; Added To version 1.2.0 
  #PNG_ASM_FLAG_MMX_SUPPORT_COMPILED  = $01  ; Not user-settable 
  #PNG_ASM_FLAG_MMX_SUPPORT_IN_CPU    = $02  ; Not user-settable 
  #PNG_ASM_FLAG_MMX_READ_COMBINE_ROW  = $04
  #PNG_ASM_FLAG_MMX_READ_INTERLACE    = $08
  #PNG_ASM_FLAG_MMX_READ_FILTER_SUB   = $10
  #PNG_ASM_FLAG_MMX_READ_FILTER_UP    = $20
  #PNG_ASM_FLAG_MMX_READ_FILTER_AVG   = $40
  #PNG_ASM_FLAG_MMX_READ_FILTER_PAETH = $80
  #PNG_ASM_FLAGS_INITIALIZED          = $80000000  ; Not user-settable 
  
  #PNG_MMX_READ_FLAGS                 = #PNG_ASM_FLAG_MMX_READ_COMBINE_ROW | #PNG_ASM_FLAG_MMX_READ_INTERLACE | #PNG_ASM_FLAG_MMX_READ_FILTER_SUB | #PNG_ASM_FLAG_MMX_READ_FILTER_UP | #PNG_ASM_FLAG_MMX_READ_FILTER_AVG | #PNG_ASM_FLAG_MMX_READ_FILTER_PAETH
  #PNG_MMX_WRITE_FLAGS                = 0
  #PNG_MMX_FLAGS                      = #PNG_ASM_FLAG_MMX_SUPPORT_COMPILED | #PNG_ASM_FLAG_MMX_SUPPORT_IN_CPU | #PNG_MMX_READ_FLAGS | #PNG_MMX_WRITE_FLAGS
  
  #PNG_SELECT_READ   = 1
  #PNG_SELECT_WRITE  = 2
  
  ; Various modes of operation, that are visible To applications because
    ; they are used For unknown chunk location.
  #PNG_HAVE_IHDR               = $01
  #PNG_HAVE_PLTE               = $02
  #PNG_HAVE_IDAT               = $04
  #PNG_AFTER_IDAT              = $08 ; Have complete zlib datastream 
  #PNG_HAVE_IEND               = $10
  
  ; More modes of operation.  Note that after an init, mode is set To
    ; zero automatically when the Structure is created.
  #PNG_HAVE_gAMA               = $20
  #PNG_HAVE_cHRM               = $40
  #PNG_HAVE_sRGB               = $80
  #PNG_HAVE_CHUNK_HEADER      = $100
  #PNG_WROTE_tIME             = $200
  #PNG_WROTE_INFO_BEFORE_PLTE = $400
  #PNG_BACKGROUND_IS_GRAY     = $800
  #PNG_HAVE_PNG_SIGNATURE    = $1000
  #PNG_HAVE_CHUNK_AFTER_IDAT = $2000 ; Have another chunk after IDAT 
  
  ; flags For the transformations the PNG library does on the image Data 
  #PNG_BGR                = $0001
  #PNG_INTERLACE          = $0002
  #PNG_PACK               = $0004
  #PNG_SHIFT              = $0008
  #PNG_SWAP_BYTES         = $0010
  #PNG_INVERT_MONO        = $0020
  #PNG_DITHER             = $0040
  #PNG_BACKGROUND         = $0080
  #PNG_BACKGROUND_EXPAND  = $0100
  #PNG_16_TO_8            = $0400
  #PNG_RGBA               = $0800
  #PNG_EXPAND             = $1000
  #PNG_GAMMA              = $2000
  #PNG_GRAY_TO_RGB        = $4000
  #PNG_FILLER             = $8000
  #PNG_PACKSWAP          = $10000
  #PNG_SWAP_ALPHA        = $20000
  #PNG_STRIP_ALPHA       = $40000
  #PNG_INVERT_ALPHA      = $80000
  #PNG_USER_TRANSFORM   = $100000
  #PNG_RGB_TO_GRAY_ERR  = $200000
  #PNG_RGB_TO_GRAY_WARN = $400000
  #PNG_RGB_TO_GRAY      = $600000  ; two bits, RGB_TO_GRAY_ERR|WARN 
  #PNG_ADD_ALPHA       = $1000000  ; Added To libpng-1.2.7 
  #PNG_EXPAND_tRNS     = $2000000  ; Added To libpng-1.2.9 
  
  ; flags For png_create_struct 
  #PNG_STRUCT_PNG   = $0001
  #PNG_STRUCT_INFO  = $0002
  
  ; Scaling factor For filter heuristic weighting calculations 
  #PNG_WEIGHT_SHIFT   = 8
  #PNG_WEIGHT_FACTOR  = 1<<#PNG_WEIGHT_SHIFT
  #PNG_COST_SHIFT     = 3
  #PNG_COST_FACTOR    = 1<<#PNG_COST_SHIFT
  
  ; flags For the png_ptr->flags rather than declaring a byte For each one 
  #PNG_FLAG_ZLIB_CUSTOM_STRATEGY     = $0001
  #PNG_FLAG_ZLIB_CUSTOM_LEVEL        = $0002
  #PNG_FLAG_ZLIB_CUSTOM_MEM_LEVEL    = $0004
  #PNG_FLAG_ZLIB_CUSTOM_WINDOW_BITS  = $0008
  #PNG_FLAG_ZLIB_CUSTOM_METHOD       = $0010
  #PNG_FLAG_ZLIB_FINISHED            = $0020
  #PNG_FLAG_ROW_INIT                 = $0040
  #PNG_FLAG_FILLER_AFTER             = $0080
  #PNG_FLAG_CRC_ANCILLARY_USE        = $0100
  #PNG_FLAG_CRC_ANCILLARY_NOWARN     = $0200
  #PNG_FLAG_CRC_CRITICAL_USE         = $0400
  #PNG_FLAG_CRC_CRITICAL_IGNORE      = $0800
  #PNG_FLAG_FREE_PLTE                = $1000
  #PNG_FLAG_FREE_TRNS                = $2000
  #PNG_FLAG_FREE_HIST                = $4000
  #PNG_FLAG_KEEP_UNKNOWN_CHUNKS      = $8000
  #PNG_FLAG_KEEP_UNSAFE_CHUNKS       = $10000
  #PNG_FLAG_LIBRARY_MISMATCH         = $20000
  #PNG_FLAG_STRIP_ERROR_NUMBERS      = $40000
  #PNG_FLAG_STRIP_ERROR_TEXT         = $80000
  #PNG_FLAG_MALLOC_NULL_MEM_OK       = $100000
  #PNG_FLAG_ADD_ALPHA                = $200000  ; Added To libpng-1.2.8 
  #PNG_FLAG_STRIP_ALPHA              = $400000  ; Added To libpng-1.2.8 
  
  #PNG_FLAG_CRC_ANCILLARY_MASK       =  #PNG_FLAG_CRC_ANCILLARY_USE | #PNG_FLAG_CRC_ANCILLARY_NOWARN
  #PNG_FLAG_CRC_CRITICAL_MASK        =  #PNG_FLAG_CRC_CRITICAL_USE | #PNG_FLAG_CRC_CRITICAL_IGNORE
  #PNG_FLAG_CRC_MASK                 =  #PNG_FLAG_CRC_ANCILLARY_MASK | #PNG_FLAG_CRC_CRITICAL_MASK
;}
;{ Structures }
  ; Three color definitions.  The order of the red, green, And blue, (And the
    ; exact size) is Not important, although the size of the fields need To
    ; be png_byte Or png_uint_16 (As defined below).
  Structure png_color
     red.c
     green.c
     blue.c
  EndStructure
  Structure png_color_16
     index.c  ; used for palette files 
     red.l    ; for use in red green blue files 
     green.l
     blue.l
     gray.l   ; for use in grayscale files 
  EndStructure
  Structure png_color_8
     red.b    ; for use in red green blue files 
     green.b
     blue.b
     gray.b   ; for use in grayscale files 
     alpha.b  ; for alpha channel files 
  EndStructure
  ; The following two structures are used For the in-core representation
    ; of sPLT chunks.
  Structure png_sPLT_entry
     red.l
     green.l
     blue.l
     alpha.l
     frequency.l
  EndStructure
  ; When the depth of the sPLT palette is 8 bits, the color And alpha samples
    ; occupy the LSB of their respective members, And the MSB of each member
    ; is zero-filled.  The frequency member always occupies the full 16 bits.
  Structure png_sPLT_t
     name.s                   ; palette name 
     depth.c                  ; depth of palette samples 
     *entries.png_sPLT_entry  ; palette entries 
     nentries.l              ; number of palette entries 
  EndStructure
  ; png_text holds the contents of a text/ztxt/itxt chunk in a PNG file,
    ; And whether that contents is compressed Or Not.  The "key" field
    ; points To a regular zero-terminated C string.  The "text", "lang", And
    ; "lang_key" fields can be regular C strings, empty strings, Or NULL pointers.
    ; However, the ; Structure returned by png_get_text() will always contain
    ; regular zero-terminated C strings (possibly empty), never NULL pointers,
    ; so they can be safely used in printf() And other string-handling functions.
  Structure png_text
     compression.l  ; compression value:
                      ;  -1: tEXt, none
                      ;  0: zTXt, deflate
                      ;  1: iTXt, none
                      ;  2: iTXt, deflate  
     key.s          ; keyword, 1-79 character description of "text" 
     text.s         ; comment, may be an empty string (ie "")
                      ; Or a NULL pointer 
     text_length.l  ; length of the text string 
     itxt_length.l  ; length of the itxt string 
     lang.s         ; language code, 0-79 characters
                      ; Or a NULL pointer 
     lang_key.s     ; keyword translated UTF-8 string, 0 or more
                      ; chars Or a NULL pointer 
  EndStructure
  ; png_time is a way To hold the time in an machine independent way.
   ; Two conversions are provided, both from time_t And struct tm.  There
   ; is no portable way To convert To either of these structures, As far
   ; As I know.  If you know of a portable way, send it To me.  As a side
   ; note - PNG has always been Year 2000 compliant!
  Structure png_time
     year.l   ; full year, as in, 1995 
     month.b  ; month of year, 1 - 12 
     day.b    ; day of month, 1 - 31 
     hour.b   ; hour of day, 0 - 23 
     minute.b ; minute of hour, 0 - 59 
     second.b ; second of minute, 0 - 60 (for leap seconds) 
  EndStructure
  ; png_unknown_chunk is a Structure To hold queued chunks For which there is
   ; no specific support.  The idea is that we can use this To queue
   ; up private chunks For output even though the library doesn't actually
   ; know about their semantics.
  Structure png_unknown_chunk
    name.c[#PNG_CHUNK_NAME_LENGTH];
    *Data
    size.l
    ; libpng-using applications should Not directly modify this byte. 
    location.c ; mode of operation at read time 
  EndStructure
  
  ; png_info is a Structure that holds the information in a PNG file so
   ; that the application can find out the characteristics of the image.
   ; If you are reading the file, this Structure will tell you what is
   ; in the PNG file.  If you are writing the file, fill in the information
   ; you want To put into the PNG file, then call png_write_info().
   ; The names chosen should be very close To the PNG specification, so
   ; consult that document For information about the meaning of each field.
   ; With libpng < 0.95, it was only possible To directly set And Read the
   ; the values in the png_info_struct, which meant that the contents And
   ; order of the values had To remain fixed.  With libpng 0.95 And later,
   ; however, there are now functions that abstract the contents of
   ; png_info_struct from the application, so this makes it easier To use
   ; libpng With dynamic libraries, And even makes it possible To use
   ; libraries that don't have all of the libpng ancillary chunk-handing
   ; functionality.
   ; In any Case, the order of the parameters in png_info_struct should Not
   ; be changed For As long As possible To keep compatibility With applications
   ; that use the old direct-access method With png_info_struct.
   ; The following members may have allocated storage attached that should be
   ; cleaned up before the Structure is discarded: palette, trans, text,
   ; pcal_purpose, pcal_units, pcal_params, hist, iccp_name, iccp_profile,
   ; splt_palettes, scal_unit, row_pointers, And unknowns.   By Default, these
   ; are automatically freed when the info Structure is deallocated, If they were
   ; allocated internally by libpng.  This behavior can be changed by means
   ; of the png_data_freer() function.
   ; More allocation details: all the chunk-reading functions that
   ; change these members go through the corresponding png_set_*
   ; functions.  A function To clear these members is available: see
   ; png_free_data().  The png_set_; functions do Not depend on being
   ; able To point info Structure members To any of the storage they are
   ; passed (they make their own copies), EXCEPT that the png_set_text
   ; functions use the same storage passed To them in the text_ptr Or
   ; itxt_ptr Structure argument, And the png_set_rows And png_set_unknowns
   ; functions do Not make their own copies.
  Structure png_info
    ; the following are necessary For every PNG file 
    width.l                          ; width of image in pixels (from IHDR) 
    height.l                         ; height of image in pixels (from IHDR) 
    valid.l                          ; valid chunk data (see PNG_INFO_ below) 
    rowbytes.l                       ; bytes needed to hold an untransformed row 
    palette.png_color                ; array of color values (valid & PNG_INFO_PLTE) 
    num_palette.w                    ; number of color entries in "palette" (PLTE) 
    num_trans.w                      ; number of transparent palette color (tRNS) 
    bit_depth.b                      ; 1, 2, 4, 8, or 16 bits/channel (from IHDR) 
    color_type.b                     ; see PNG_COLOR_TYPE_ below (from IHDR) 
    ; The following three should have been named *_method Not *_type 
    compression_type.b               ; must be PNG_COMPRESSION_TYPE_BASE (IHDR) 
    filter_type.b                    ; must be PNG_FILTER_TYPE_BASE (from IHDR) 
    interlace_type.b                 ; One of PNG_INTERLACE_NONE, PNG_INTERLACE_ADAM7 
    ; The following is informational only on Read, And Not used on writes. 
    channels.b                       ; number of data channels per pixel (1, 2, 3, 4) 
    pixel_depth.b                    ; number of bits per pixel 
    spare_byte.b                     ; to align the data, and for future use 
    signature.b[8]                   ; magic bytes read by libpng from start of file 
    ; The rest of the Data is optional.  If you are reading, check the
      ; valid field To see If the information in these are valid.  If you
      ; are writing, set the valid field To those chunks you want written,
      ; And initialize the appropriate fields below.
      ; The gAMA chunk describes the gamma characteristics of the system
      ; on which the image was created, normally in the range [1.0, 2.5].
      ; Data is valid If (valid & PNG_INFO_gAMA) is non-zero.
    gamma.f                           ; gamma value of image, if (valid & PNG_INFO_gAMA) 
    ; GR-P, 0.96a 
      ; Data valid If (valid & PNG_INFO_sRGB) non-zero. 
    srgb_intent.b                     ; sRGB rendering intent [0, 1, 2, or 3] 
    ; The tEXt, And zTXt chunks contain human-readable textual Data in
      ; uncompressed, compressed, And optionally compressed forms, respectively.
      ; The Data in "text" is an array of pointers To uncompressed,
      ; null-terminated C strings. Each chunk has a keyword that describes the
      ; textual Data contained in that chunk.  Keywords are Not required To be
      ; unique, And the text string may be empty.  Any number of text chunks may
      ; be in an image.
    num_text.l                        ; number of comments read/to write 
    max_text.l                        ; current size of text array 
    text.png_text; ; array of comments read/to write 
    ; The tIME chunk holds the last time the displayed image Data was
      ; modified.  See the png_time struct For the contents of this struct.
    mod_time.png_time
    ; The sBIT chunk specifies the number of significant high-order bits
      ; in the pixel Data.  Values are in the range [1, bit_depth], And are
      ; only specified For the channels in the pixel Data.  The contents of
      ; the low-order bits is Not specified.  Data is valid If
      ; (valid & PNG_INFO_sBIT) is non-zero.
    sig_bit.png_color_8               ; significant bits in color channels 
    ; The tRNS chunk supplies transparency Data For paletted images And
      ; other image types that don't need a full alpha channel.  There are
      ; "num_trans" transparency values For a paletted image, stored in the
      ; same order As the palette colors, starting from index 0.  Values
      ; For the Data are in the range [0, 255], ranging from fully transparent
      ; To fully opaque, respectively.  For non-paletted images, there is a
      ; single color specified that should be treated As fully transparent.
      ; Data is valid If (valid & PNG_INFO_tRNS) is non-zero.
    trans.b                           ; transparent values for paletted image 
    trans_values.png_color_16         ; transparent color For non-palette image 
    ; The bKGD chunk gives the suggested image background color If the
      ; display program does Not have its own background color And the image
      ; is needs To composited onto a background before display.  The colors
      ; in "background" are normally in the same color space/depth As the
      ; pixel Data.  Data is valid If (valid & PNG_INFO_bKGD) is non-zero.
    background.png_color_16
    ; The oFFs chunk gives the offset in "offset_unit_type" units rightwards
      ; And downwards from the top-left corner of the display, page, Or other
      ; application-specific co-ordinate space.  See the PNG_OFFSET_ defines
      ; below For the unit types.  Valid If (valid & PNG_INFO_oFFs) non-zero.
    x_offset.l                        ; x offset on page 
    y_offset.l                        ; y offset on page 
    offset_unit_type.b                ; offset units type 
    ; The pHYs chunk gives the physical pixel density of the image For
      ; display Or printing in "phys_unit_type" units (see PNG_RESOLUTION_
      ; defines below).  Data is valid If (valid & PNG_INFO_pHYs) is non-zero.
    x_pixels_per_unit.l               ; horizontal pixel density 
    y_pixels_per_unit.l               ; vertical pixel density 
    phys_unit_type.b; ; resolution type (see PNG_RESOLUTION_ below) 
    ; The hIST chunk contains the relative frequency Or importance of the
      ; various palette entries, so that a viewer can intelligently Select a
      ; reduced-color palette, If required.  Data is an array of "num_palette"
      ; values in the range [0,65535]. Data valid If (valid & PNG_INFO_hIST)
      ; is non-zero.
    hist.w
    ; The cHRM chunk describes the CIE color characteristics of the monitor
      ; on which the PNG was created.  This Data allows the viewer To do gamut
      ; mapping of the input image To ensure that the viewer sees the same
      ; colors in the image As the creator.  Values are in the range
      ; [0.0, 0.8].  Data valid If (valid & PNG_INFO_cHRM) non-zero.
    x_white.f
    y_white.f
    x_red.f
    y_red.f
    x_green.f
    y_green.f
    x_blue.f
    y_blue.f
    ; The pCAL chunk describes a transformation between the stored pixel
      ; values And original physical Data values used To create the image.
      ; The integer range [0, 2^bit_depth - 1] maps To the floating-point
      ; range given by [pcal_X0, pcal_X1], And are further transformed by a
      ; (possibly non-linear) transformation function given by "pcal_type"
      ; And "pcal_params" into "pcal_units".  Please see the PNG_EQUATION_
      ; defines below, And the PNG-Group's PNG extensions document for a
      ; complete description of the transformations And how they should be
      ; implemented, And For a description of the ASCII parameter strings.
      ; Data values are valid If (valid & PNG_INFO_pCAL) non-zero.
    pcal_purpose.s;                   ; pCAL chunk description string 
    pcal_X0.l                        ; minimum value 
    pcal_X1.l                        ; maximum value 
    pcal_units.s                      ; Latin-1 string giving physical units 
    pcal_params.s                     ; ASCII strings containing parameter values 
    pcal_type.b;                      ; equation type (see PNG_EQUATION_ below) 
    pcal_nparams.b;                   ; number of parameters given in pcal_params 
    ; New members added in libpng-1.0.6 
    free_me.l                        ; flags items libpng is responsible for freeing 
    ; storage For unknown chunks that the library doesn't recognize. 
    unknown_chunks.png_unknown_chunk
    unknown_chunks_num.l
    ; iCCP chunk Data. 
    iccp_name.s                       ; profile name 
    iccp_profile.s                    ; International Color Consortium profile data 
                                      ; Note To maintainer: should be png_bytep 
    iccp_proflen.l                    ; ICC profile data length 
    iccp_compression.b                ; Always zero 
    ; Data on sPLT chunks (there may be more than one). 
    splt_palettes.png_sPLT_t
    splt_palettes_num.l
    ; The sCAL chunk describes the actual physical dimensions of the
      ; subject matter of the graphic.  The chunk contains a unit specification
      ; a byte value, And two ASCII strings representing floating-point
      ; values.  The values are width And height corresponsing To one pixel
      ; in the image.  This external representation is converted To double
      ; here.  Data values are valid If (valid & PNG_INFO_sCAL) is non-zero.
    scal_unit.b                       ; unit of physical scale 
    scal_pixel_width.d                ; width of one pixel 
    scal_pixel_height.d               ; height of one pixel 
    scal_s_width.s                    ; string containing height 
    scal_s_height.s                   ; string containing width 
    ; Memory has been allocated If (valid & PNG_ALLOCATED_INFO_ROWS) non-zero 
      ; Data valid If (valid & PNG_INFO_IDAT) non-zero 
    *row_pointers.b                   ; the image bits 
    int_gamma.l                      ; gamma of image, if (valid & PNG_INFO_gAMA) 
    int_x_white.l
    int_y_white.l
    int_x_red.l
    int_y_red.l
    int_x_green.l
    int_y_green.l
    int_x_blue.l
    int_y_blue.l
  EndStructure
  ; This is used For the transformation routines, As some of them
    ; change these values For the row.  It also should enable using
    ; the routines For other purposes.
  Structure png_row_info
    width.l       ; width of row 
    rowbytes.l    ; number of bytes in row 
    color_type.b  ; color type of row 
    bit_depth.b   ; bit depth of row 
    channels.b    ; number of channels (1, 2, 3, or 4) 
    pixel_depth.b ; bits per pixel (depth ; channels) 
  EndStructure
  ; The Structure that holds the information To Read And write PNG files.
    ; The only people who need To care about what is inside of this are the
    ; people who will be modifying the library For their own special needs.
    ; It should Not be accessed directly by an application, except To store
    ; the jmp_buf.
  Structure png_struct_def
    jmpbuf.l                          ; used in png_error 
    *error_fn                         ; function for printing errors and aborting 
    *warning_fn                       ; function for printing warnings 
    error_ptr.l                       ; user supplied struct for error functions 
    *write_data_fn                    ; function for writing output data 
    *read_data_fn                     ; function for reading input data 
    io_ptr.l                          ; ptr to application struct for I/O functions 
    *read_user_transform_fn           ; user read transform 
    *write_user_transform_fn          ; user write transform 
    user_transform_ptr.l              ; user supplied struct For user transform 
    user_transform_depth.b;           ; bit depth of user transformed pixels 
    user_transform_channels.b         ; channels in user transformed pixels 
    mode.l                            ; tells us where we are in the PNG file 
    flags.l                           ; flags indicating various things to libpng 
    transformations.l                 ; which transformations to perform 
    *zstream;                         ; pointer to decompression structure (below) 
    zbuf.b;                           ; buffer for zlib 
    zbuf_size.l                       ; size of zbuf 
    zlib_level.l                      ; holds zlib compression level 
    zlib_method.l                     ; holds zlib compression method 
    zlib_window_bits.l                ; holds zlib compression window bits 
    zlib_mem_level.l                  ; holds zlib compression memory level 
    zlib_strategy.l                   ; holds zlib compression strategy 
    width.l                           ; width of image in pixels 
    height.l                          ; height of image in pixels 
    num_rows.l                        ; number of rows in current pass 
    usr_width.l                       ; width of row at start of write 
    rowbytes.l                        ; size of row in bytes 
    irowbytes.l                       ; size of current interlaced row in bytes 
    iwidth.l                          ; width of current interlaced row in pixels 
    row_number.l                      ; current row in interlace pass 
    prev_row.b;                       ; buffer to save previous (unfiltered) row 
    row_buf.b;                        ; buffer to save current (unfiltered) row 
    sub_row.b;                        ; buffer to save "sub" row when filtering 
    up_row.b;                         ; buffer to save "up" row when filtering 
    avg_row.b;                        ; buffer to save "avg" row when filtering 
    paeth_row.b;                      ; buffer to save "Paeth" row when filtering 
    row_info.png_row_info;            ; used for transformation routines 
    idat_size.l                       ; current IDAT size for read 
    crc.l                             ; current chunk CRC value 
    palette.png_color;                ; palette from the input file 
    num_palette.w                     ; number of color entries in palette 
    num_trans.w                       ; number of transparency values 
    chunk_name.b[5];                  ; null-terminated name of current chunk 
    compression.b;                    ; file compression type (always 0) 
    filter.b;                         ; file filter type (always 0) 
    interlaced.b;                     ; PNG_INTERLACE_NONE, PNG_INTERLACE_ADAM7 
    pass.b;                           ; current interlace pass (0 - 6) 
    do_filter.b;                      ; row filter flags (see PNG_FILTER_ below ) 
    color_type.b;                     ; color type of file 
    bit_depth.b;                      ; bit depth of file 
    usr_bit_depth.b;                  ; bit depth of users row 
    pixel_depth.b;                    ; number of bits per pixel 
    channels.b;                       ; number of channels in file 
    usr_channels.b;                   ; channels at start of write 
    sig_bytes.b;                      ; magic bytes read/written from start of file 
    fillerB.b;                        ; filler byte for pixel expansion 
    fillerW.w                         ; filler bytes for pixel expansion 
    background_gamma_type.b
    background_gamma.f
    background.png_color_16           ; background color in screen gamma space 
    background_1.png_color_16         ; background normalized to gamma 1.0 
    *output_flush_fn                  ; Function for flushing output 
    flush_dist.l                      ; how many rows apart to flush, 0 - no flush 
    flush_rows.l                      ; number of rows written since last flush 
    gamma_shift.l                     ; number of "insignificant" bits 16-bit gamma 
    gamma.f                           ; file gamma value 
    screen_gamma.f                    ; screen gamma value (display_exponent) 
    gamma_table.b                     ; gamma table for 8-bit depth files 
    gamma_from_1.b                    ; converts from 1.0 to screen 
    gamma_to_1.b                      ; converts from file to 1.0 
    gamma_16_table.w                  ; gamma table for 16-bit depth files 
    gamma_16_from_1.w                 ; converts from 1.0 to screen 
    gamma_16_to_1.w                   ; converts from file to 1.0 
    sig_bit.png_color_8;              ; significant bits in each available channel 
    shift.png_color_8;                ; shift for significant bit tranformation 
    trans.b;                          ; transparency values for paletted files 
    trans_values.png_color_16         ; transparency values for non-paletted files 
    *read_row_fn                      ; called after each row is decoded 
    *write_row_fn                     ; called after each row is encoded 
    *info_fn                          ; called after header data fully read 
    *row_fn                           ; called after each prog. row is decoded 
    *end_fn                           ; called after image is complete 
    save_buffer_ptr.b                 ; current location in save_buffer 
    save_buffer.b;                    ; buffer for previously read data 
    current_buffer_ptr.b;             ; current location in current_buffer 
    current_buffer.b;                 ; buffer for recently used data 
    push_length.l                     ; size of current input chunk 
    skip_length.l                     ; bytes to skip in input data 
    save_buffer_size.l                ; amount of data now in save_buffer 
    save_buffer_max.l                 ; total size of save_buffer 
    buffer_size.l                     ; total amount of available input data 
    current_buffer_size.l             ; amount of data now in current_buffer 
    process_mode.l                    ; what push library is currently doing 
    cur_palette.l                     ; current push library palette index 
    current_text_size.l               ; current size of text input data 
    current_text_left.l               ; how much text left to read in input 
    current_text.s                    ; current text chunk buffer 
    current_text_ptr.s                ; current location in current_text 
    ; For the Borland special 64K segment handler 
    offset_table_ptr.b
    offset_table.b
    offset_table_number.w
    offset_table_count.w
    offset_table_count_free.w
    palette_lookup.b                  ; lookup table for dithering 
    dither_index.b                    ; index translation for palette files 
    hist.w                            ; histogram 
    heuristic_method.b                ; heuristic for row filter selection 
    num_prev_filters.b                ; number of weights for previous rows 
    prev_filters.b                    ; filter type(s) of previous row(s) 
    filter_weights.w                  ; weight(s) for previous line(s) 
    inv_filter_weights.w              ; 1/weight(s) for previous line(s) 
    filter_costs.w                    ; relative filter calculation cost 
    inv_filter_costs.w                ; 1/relative filter calculation cost 
    time_buffer.s                     ; String to hold RFC 1123 time text 
    ; New members added in libpng-1.0.6 
    free_me.l                         ; flags items libpng is responsible for freeing 
    user_chunk_ptr.l
    *read_user_chunk_fn               ; user read chunk handler 
    num_chunk_list.l
    chunk_list.b
    ; New members added in libpng-1.0.3 
    rgb_to_gray_status.c
    ; These were changed from png_byte in libpng-1.0.6 
    rgb_to_gray_red_coeff.w
    rgb_to_gray_green_coeff.w
    rgb_to_gray_blue_coeff.w
    ; New member added in libpng-1.0.4 (renamed in 1.0.9) 
    mng_features_permitted.l
    ; New member added in libpng-1.0.7 
    int_gamma.l
    ; New member added in libpng-1.0.9, ifdef'ed out in 1.0.12, enabled in 1.2.0 
    filter_type.b
    ; New member added in libpng-1.0.10, ifdef'ed out in 1.2.0 
    row_buf_size.l
    ; New members added in libpng-1.2.0 
    mmx_bitdepth_threshold.b
    mmx_rowbytes_threshold.l
    asm_flags.l
    ; New members added in libpng-1.0.2 but first enabled by Default in 1.2.0 
    mem_ptr.l                         ; user supplied struct for mem functions 
    *malloc_fn                        ; function for allocating memory 
    *free_fn                          ; function for freeing memory 
    ; New member added in libpng-1.0.13 And 1.2.0 
    big_row_buf.b                     ; buffer to save current (unfiltered) row 
    ; The following three members were added at version 1.0.14 And 1.2.4 
    dither_sort.b                     ; working sort array 
    index_to_palette.b                ; where the original index currently is 
    ; in the palette 
    palette_to_index.b                ; which original index points to this 
    ; palette color 
      ; New members added in libpng-1.0.16 And 1.2.6 
    compression_type.b
    user_width_max.l
    user_height_max.l
    ; New member added in libpng-1.0.25 And 1.2.17 
      ; storage For unknown chunk that the library doesn't recognize. 
    unknown_chunk.png_unknown_chunk
  EndStructure
;}

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 833
; Folding = A--