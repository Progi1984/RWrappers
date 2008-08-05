;- Macros
;{ Macros
  Macro HPDF_ALIGN_SIZ        : SizeOf(Long)              : EndMacro
  Macro HPDF_Catalog          : HPDF_Dict                 : EndMacro
  Macro HPDF_Box              : HPDF_Rect                 : EndMacro
  Macro HPDF_Annotation       : HPDF_Dict                 : EndMacro
  Macro HPDF_XObject          : HPDF_Dict                 : EndMacro
  Macro HPDF_Pages            : HPDF_Dict                 : EndMacro
  Macro HPDF_Page             : HPDF_Dict                 : EndMacro 
  Macro HPDF_Image            : HPDF_Dict                 : EndMacro
  Macro HPDF_Outline          : HPDF_Dict                 : EndMacro
  Macro HPDF_EncryptDict      : HPDF_Dict                 : EndMacro
  Macro HPDF_Action           : HPDF_Dict                 : EndMacro
  Macro HPDF_ExtGState        : HPDF_Dict                 : EndMacro
  Macro HPDF_U3D              : HPDF_Dict                 : EndMacro
  Macro HPDF_Destination      : HPDF_Array                : EndMacro
  Macro HPDF_Font             : HPDF_Dict                 : EndMacro
  Macro HPDF_Type1FontDefAttr : HPDF_Type1FontDefAttrRec  : EndMacro
  Macro HPDF__CIDFontDefAttr  : HPDF__CIDFontDefAttrRec   : EndMacro
  Macro HPDF__HANDLE          : l                         : EndMacro
  Macro HPDF__BYTE            : b                         : EndMacro
  Macro HPDF__REAL            : f                         : EndMacro
  Macro HPDF__DOUBLE          : d                         : EndMacro
  Macro HPDF__BOOL            : b                         : EndMacro
  Macro HPDF__STATUS          : l                         : EndMacro
  Macro HPDF__CID             : l                         : EndMacro
  Macro HPDF__UNICODE         : l                         : EndMacro
  Macro HPDF_EncoderType      : l                         : EndMacro
  Macro HPDF_StreamType       : l                         : EndMacro
  Macro HPDF_ByteType         : l                         : EndMacro
  Macro HPDF_WritingMode      : l                         : EndMacro
  Macro HPDF_EncryptMode      : l                         : EndMacro
  Macro HPDF_FontType         : l                         : EndMacro
  Macro HPDF_FontDefType      : l                         : EndMacro
  Macro HPDF_LineCap          : l                         : EndMacro
  Macro HPDF_LineJoin         : l                         : EndMacro
  Macro HPDF_TextRenderingMode: l                         : EndMacro
  Macro HPDF_ColorSpace       : l                         : EndMacro
  Macro HPDF_WhenceMode       : l                         : EndMacro
  Macro HPDF_BlendMode        : l                         : EndMacro
  Macro HPDF_AnnotType        : l                         : EndMacro
  Macro HPDF_BSSubtype        : l                         : EndMacro
  Macro HPDF_AnnotIcon        : l                         : EndMacro
  Macro HPDF_TransitionStyle  : l                         : EndMacro
  Macro HPDF_PageSizes        : l                         : EndMacro
  Macro HPDF_PageDirection    : l                         : EndMacro
  Macro HPDF_PageNumStyle     : l                         : EndMacro
  Macro HPDF_PageMode         : l                         : EndMacro
  Macro HPDF_PageLayout       : l                         : EndMacro
  Macro HPDF_InfoType         : l                         : EndMacro
  Macro HPDF_AnnotHighlightMode: l                        : EndMacro
  Macro HPDF_NEEDS_ESCAPE(c)
   (c < 0x21 || c > 0x7e || c == '\\' || c == '%' || c == '#' || c == '/' || c == '(' || c == ')' || c == '<' || c == '>' || c == '[' || c == ']' || c == '{' || c == '}' )  
  EndMacro
  Macro HPDF_IS_WHITE_SPACE(c)   
  	(c == 0x00 || c == 0x09 || c == 0x0A || c == 0x0C || c == 0x0D || c == 0x20 )
  EndMacro
;}
;- Enumerations
;{ Enumerations
  Enumeration ;HPDF_InfoType
    ; date-time type parameters 
    #HPDF_INFO_CREATION_DATE = 0
    #HPDF_INFO_MOD_DATE
    ; string type parameters 
    #HPDF_INFO_AUTHOR
    #HPDF_INFO_CREATOR
    #HPDF_INFO_PRODUCER
    #HPDF_INFO_TITLE
    #HPDF_INFO_SUBJECT
    #HPDF_INFO_KEYWORDS
    #HPDF_INFO_EOF
  EndEnumeration
  Enumeration ;HPDF_PdfVer
    #HPDF_VER_12 = 0
    #HPDF_VER_13
    #HPDF_VER_14
    #HPDF_VER_15
    #HPDF_VER_16
    #HPDF_VER_17
    #HPDF_VER_EOF
  EndEnumeration
  Enumeration ;HPDF_EncryptMode
    #HPDF_ENCRYPT_R2    = 2
    #HPDF_ENCRYPT_R3    = 3
  EndEnumeration
  Enumeration ;HPDF_ColorSpace
    #HPDF_CS_DEVICE_GRAY = 0
    #HPDF_CS_DEVICE_RGB
    #HPDF_CS_DEVICE_CMYK
    #HPDF_CS_CAL_GRAY
    #HPDF_CS_CAL_RGB
    #HPDF_CS_LAB
    #HPDF_CS_ICC_BASED
    #HPDF_CS_SEPARATION
    #HPDF_CS_DEVICE_N
    #HPDF_CS_INDEXED
    #HPDF_CS_PATTERN
    #HPDF_CS_EOF
  EndEnumeration
  Enumeration ;HPDF_LineCap
    #HPDF_BUTT_END = 0
    #HPDF_ROUND_END
    #HPDF_PROJECTING_SCUARE_END
    #HPDF_LINECAP_EOF
  EndEnumeration
  Enumeration ;HPDF_LineJoin
    #HPDF_MITER_JOIN = 0
    #HPDF_ROUND_JOIN
    #HPDF_BEVEL_JOIN
    #HPDF_LINEJOIN_EOF
  EndEnumeration
  Enumeration ;HPDF_TextRenderingMode
    #HPDF_FILL = 0
    #HPDF_STROKE
    #HPDF_FILL_THEN_STROKE
    #HPDF_INVISIBLE
    #HPDF_FILL_CLIPPING
    #HPDF_STROKE_CLIPPING
    #HPDF_FILL_STROKE_CLIPPING
    #HPDF_CLIPPING
    #HPDF_RENDERING_MODE_EOF
  EndEnumeration
  Enumeration ;HPDF_WritingMode
    #HPDF_WMODE_HORIZONTAL = 0
    #HPDF_WMODE_VERTICAL
    #HPDF_WMODE_EOF
  EndEnumeration
  Enumeration ;HPDF_PageLayout
    #HPDF_PAGE_LAYOUT_SINGLE = 0
    #HPDF_PAGE_LAYOUT_ONE_COLUMN
    #HPDF_PAGE_LAYOUT_TWO_COLUMN_LEFT
    #HPDF_PAGE_LAYOUT_TWO_COLUMN_RIGHT
    #HPDF_PAGE_LAYOUT_EOF
  EndEnumeration
  Enumeration ;HPDF_PageMode
    #HPDF_PAGE_MODE_USE_NONE = 0
    #HPDF_PAGE_MODE_USE_OUTLINE
    #HPDF_PAGE_MODE_USE_THUMBS
    #HPDF_PAGE_MODE_FULL_SCREEN
  ;  HPDF_PAGE_MODE_USE_OC
  ;  #HPDF_PAGE_MODE_USE_ATTACHMENTS
    #HPDF_PAGE_MODE_EOF
  EndEnumeration
  Enumeration ;HPDF_PageNumStyle
    #HPDF_PAGE_NUM_STYLE_DECIMAL = 0
    #HPDF_PAGE_NUM_STYLE_UPPER_ROMAN
    #HPDF_PAGE_NUM_STYLE_LOWER_ROMAN
    #HPDF_PAGE_NUM_STYLE_UPPER_LETTERS
    #HPDF_PAGE_NUM_STYLE_LOWER_LETTERS
    #HPDF_PAGE_NUM_STYLE_EOF
  EndEnumeration
  Enumeration ;HPDF_DestinationType
    #HPDF_XYZ = 0
    #HPDF_FIT
    #HPDF_FIT_H
    #HPDF_FIT_V
    #HPDF_FIT_R
    #HPDF_FIT_B
    #HPDF_FIT_BH
    #HPDF_FIT_BV
    #HPDF_DST_EOF
  EndEnumeration
  Enumeration ;HPDF_AnnotType
    #HPDF_ANNOT_TEXT_NOTES
    #HPDF_ANNOT_LINK
    #HPDF_ANNOT_SOUND
    #HPDF_ANNOT_FREE_TEXT
    #HPDF_ANNOT_STAMP
    #HPDF_ANNOT_SQUARE
    #HPDF_ANNOT_CIRCLE
    #HPDF_ANNOT_STRIKE_OUT
    #HPDF_ANNOT_HIGHTLIGHT
    #HPDF_ANNOT_UNDERLINE
    #HPDF_ANNOT_INK
    #HPDF_ANNOT_FILE_ATTACHMENT
    #HPDF_ANNOT_POPUP
    #HPDF_ANNOT_3D
  EndEnumeration
  Enumeration ;HPDF_AnnotFlgs
    #HPDF_ANNOT_INVISIBLE
    #HPDF_ANNOT_HIDDEN
    #HPDF_ANNOT_PRINT
    #HPDF_ANNOT_NOZOOM
    #HPDF_ANNOT_NOROTATE
    #HPDF_ANNOT_NOVIEW
    #HPDF_ANNOT_READONLY
  EndEnumeration
  Enumeration ;HPDF_AnnotHighlightMode
    #HPDF_ANNOT_NO_HIGHTLIGHT = 0
    #HPDF_ANNOT_INVERT_BOX
    #HPDF_ANNOT_INVERT_BORDER
    #HPDF_ANNOT_DOWN_APPEARANCE
    #HPDF_ANNOT_HIGHTLIGHT_MODE_EOF
  EndEnumeration
  Enumeration ;HPDF_AnnotIcon
    #HPDF_ANNOT_ICON_COMMENT = 0
    #HPDF_ANNOT_ICON_KEY
    #HPDF_ANNOT_ICON_NOTE
    #HPDF_ANNOT_ICON_HELP
    #HPDF_ANNOT_ICON_NEW_PARAGRAPH
    #HPDF_ANNOT_ICON_PARAGRAPH
    #HPDF_ANNOT_ICON_INSERT
    #HPDF_ANNOT_ICON_EOF
  EndEnumeration
  Enumeration ;HPDF_BSSubtype
    #HPDF_BS_SOLID
    #HPDF_BS_DASHED
    #HPDF_BS_BEVELED
    #HPDF_BS_INSET
    #HPDF_BS_UNDERLINED
  EndEnumeration
  Enumeration ;HPDF_BlendMode
    #HPDF_BM_NORMAL
    #HPDF_BM_MULTIPLY
    #HPDF_BM_SCREEN
    #HPDF_BM_OVERLAY
    #HPDF_BM_DARKEN
    #HPDF_BM_LIGHTEN
    #HPDF_BM_COLOR_DODGE
    #HPDF_BM_COLOR_BUM
    #HPDF_BM_HARD_LIGHT
    #HPDF_BM_SOFT_LIGHT
    #HPDF_BM_DIFFERENCE
    #HPDF_BM_EXCLUSHON
    #HPDF_BM_EOF
  EndEnumeration
  Enumeration ;HPDF_TransitionStyle
    #HPDF_TS_WIPE_RIGHT = 0
    #HPDF_TS_WIPE_UP
    #HPDF_TS_WIPE_LEFT
    #HPDF_TS_WIPE_DOWN
    #HPDF_TS_BARN_DOORS_HORIZONTAL_OUT
    #HPDF_TS_BARN_DOORS_HORIZONTAL_IN
    #HPDF_TS_BARN_DOORS_VERTICAL_OUT
    #HPDF_TS_BARN_DOORS_VERTICAL_IN
    #HPDF_TS_BOX_OUT
    #HPDF_TS_BOX_IN
    #HPDF_TS_BLINDS_HORIZONTAL
    #HPDF_TS_BLINDS_VERTICAL
    #HPDF_TS_DISSOLVE
    #HPDF_TS_GLITTER_RIGHT
    #HPDF_TS_GLITTER_DOWN
    #HPDF_TS_GLITTER_TOP_LEFT_TO_BOTTOM_RIGHT
    #HPDF_TS_REPLACE
    #HPDF_TS_EOF
  EndEnumeration
  Enumeration ;HPDF_PageSizes
    #HPDF_PAGE_SIZE_LETTER = 0
    #HPDF_PAGE_SIZE_LEGAL
    #HPDF_PAGE_SIZE_A3
    #HPDF_PAGE_SIZE_A4
    #HPDF_PAGE_SIZE_A5
    #HPDF_PAGE_SIZE_B4
    #HPDF_PAGE_SIZE_B5
    #HPDF_PAGE_SIZE_EXECUTIVE
    #HPDF_PAGE_SIZE_US4x6
    #HPDF_PAGE_SIZE_US4x8
    #HPDF_PAGE_SIZE_US5x7
    #HPDF_PAGE_SIZE_COMM10
    #HPDF_PAGE_SIZE_EOF
  EndEnumeration
  Enumeration ;HPDF_PageDirection
    #HPDF_PAGE_PORTRAIT = 0
    #HPDF_PAGE_LANDSCAPE
  EndEnumeration
  Enumeration ;HPDF_EncoderType
    #HPDF_ENCODER_TYPE_SINGLE_BYTE
    #HPDF_ENCODER_TYPE_DOUBLE_BYTE
    #HPDF_ENCODER_TYPE_UNINITIALIZED
    #HPDF_ENCODER_UNKNOWN
  EndEnumeration
  Enumeration ;HPDF_ByteType
    #HPDF_BYTE_TYPE_SINGLE = 0
    #HPDF_BYTE_TYPE_LEAD
    #HPDF_BYTE_TYPE_TRIAL
    #HPDF_BYTE_TYPE_UNKNOWN
  EndEnumeration
  Enumeration ;HPDF_TextAlignment
    #HPDF_TALIGN_LEFT = 0
    #HPDF_TALIGN_RIGHT
    #HPDF_TALIGN_CENTER
    #HPDF_TALIGN_JUSTIFY
  EndEnumeration 
  Enumeration ;HPDF_EncodingType
    #HPDF_STANDARD_ENCODING = 0
    #HPDF_MAC_ROMAN_ENCODING
    #HPDF_WIN_ANSI_ENCODING
    #HPDF_FONT_SPECIFIC
    #HPDF_ENCODING_EOF
  EndEnumeration 
  Enumeration ;HPDF_BaseEncodings
    #HPDF_BASE_ENCODING_STANDARD
    #HPDF_BASE_ENCODING_WIN_ANSI
    #HPDF_BASE_ENCODING_MAC_ROMAN
    #HPDF_BASE_ENCODING_FONT_SPECIFIC
    #HPDF_BASE_ENCODING_EOF
  EndEnumeration 
  Enumeration ;HPDF_FontType
    #HPDF_FONT_TYPE1 = 0
    #HPDF_FONT_TRUETYPE
    #HPDF_FONT_TYPE3
    #HPDF_FONT_TYPE0_CID
    #HPDF_FONT_TYPE0_TT
    #HPDF_FONT_CID_TYPE0
    #HPDF_FONT_CID_TYPE2
    #HPDF_FONT_MMTYPE1
  EndEnumeration
  Enumeration ;HPDF_FontDefType
    #HPDF_FONTDEF_TYPE_TYPE1
    #HPDF_FONTDEF_TYPE_TRUETYPE
    #HPDF_FONTDEF_TYPE_CID
    #HPDF_FONTDEF_TYPE_UNINITIALIZED
    #HPDF_FONTDEF_TYPE_EOF
  EndEnumeration 
  Enumeration ;HPDF_StreamType
    #HPDF_STREAM_UNKNOWN = 0
    #HPDF_STREAM_CALLBACK
    #HPDF_STREAM_FILE
    #HPDF_STREAM_MEMORY
  EndEnumeration
  Enumeration ;HPDF_WhenceMode
    #HPDF_SEEK_SET = 0
    #HPDF_SEEK_CUR
    #HPDF_SEEK_END
  EndEnumeration
;}
;- Constantes
;{ Constantes
  #HPDF_MAJOR_VERSION = 2
  #HPDF_MINOR_VERSION = 1
  #HPDF_BUGFIX_VERSION= 0
  #HPDF_EXTRA_VERSION = ""
  #HPDF_VERSION_TEXT  = "2.1.0"
  #HPDF_VERSION_ID    = 20100
  
  
  #HPDF_TRUE                  = 1
  #HPDF_FALSE                 = 0
  #HPDF_OK                    = 0
  #HPDF_NOERROR               = 0
  #HPDF_TMP_BUF_SIZ           = 512
  #HPDF_SHORT_BUF_SIZ         = 32
  #HPDF_REAL_LEN              = 11
  #HPDF_INT_LEN               = 11
  #HPDF_TEXT_DEFAULT_LEN      = 256
  #HPDF__UNICODE_HEADER_LEN    = 2
  #HPDF_DATE_TIME_STR_LEN     = 23
  #HPDF_BYTE_OFFSET_LEN       = 10
  #HPDF_OBJ_ID_LEN            = 7
  #HPDF_GEN_NO_LEN            = 5
  #HPDF_DEF_FONT              = "Helvetica"
  #HPDF_DEF_PAGE_LAYOUT       = #HPDF_PAGE_LAYOUT_SINGLE
  #HPDF_DEF_PAGE_MODE         = #HPDF_PAGE_MODE_USE_NONE
  #HPDF_DEF_WORDSPACE         = 0
  #HPDF_DEF_CHARSPACE         = 0
  #HPDF_DEF_FONTSIZE          = 10
  #HPDF_DEF_HSCALING          = 100
  #HPDF_DEF_LEADING           = 0
  #HPDF_DEF_RENDERING_MODE    = #HPDF_FILL
  #HPDF_DEF_RISE              = 0
  #HPDF_DEF_RAISE             = #HPDF_DEF_RISE
  #HPDF_DEF_LINEWIDTH         = 1
  #HPDF_DEF_LINECAP           = #HPDF_BUTT_END
  #HPDF_DEF_LINEJOIN          = #HPDF_MITER_JOIN
  #HPDF_DEF_MITERLIMIT        = 10
  #HPDF_DEF_FLATNESS          = 1
  #HPDF_DEF_PAGE_NUM          = 1
  #HPDF_BS_DEF_WIDTH          = 1
  #HPDF_DEF_PAGE_WIDTH        = 595.276
  #HPDF_DEF_PAGE_HEIGHT       = 841.89
  #HPDF_COMP_NONE            = $00
  #HPDF_COMP_TEXT            = $01
  #HPDF_COMP_IMAGE           = $02
  #HPDF_COMP_METADATA        = $04
  #HPDF_COMP_ALL             = $0F
  #HPDF_COMP_MASK            = $FF
  #HPDF_ENABLE_READ        = 0
  #HPDF_ENABLE_PRINT       = 4
  #HPDF_ENABLE_EDIT_ALL    = 8
  #HPDF_ENABLE_COPY        = 16
  #HPDF_ENABLE_EDIT        = 32
  #HPDF_HIDE_TOOLBAR   = 1  
  #HPDF_HIDE_MENUBAR   = 2
  #HPDF_HIDE_WINDOW_UI = 4
  #HPDF_FIT_WINDOW     = 8
  #HPDF_CENTER_WINDOW  = 16
  #HPDF_LIMIT_MAX_INT            = 2147483647
  #HPDF_LIMIT_MIN_INT            = -2147483647
  #HPDF_LIMIT_MAX_REAL           = 32767
  #HPDF_LIMIT_MIN_REAL           = -32767
  #HPDF_LIMIT_MAX_STRING_LEN     = 65535
  #HPDF_LIMIT_MAX_NAME_LEN       = 127
  #HPDF_LIMIT_MAX_ARRAY          = 8191
  #HPDF_LIMIT_MAX_DICT_ELEMENT   = 4095
  #HPDF_LIMIT_MAX_XREF_ELEMENT   = 8388607
  #HPDF_LIMIT_MAX_GSTATE         = 28
  #HPDF_LIMIT_MAX_DEVICE_N       = 8
  #HPDF_LIMIT_MAX_DEVICE_N_V15   = 32
  #HPDF_LIMIT_MAX_CID            = 65535
  #HPDF_MAX_GENERATION_NUM       = 65535
  #HPDF_MIN_PAGE_HEIGHT          = 3
  #HPDF_MIN_PAGE_WIDTH           = 3
  #HPDF_MAX_PAGE_HEIGHT          = 14400
  #HPDF_MAX_PAGE_WIDTH           = 14400
  #HPDF_MIN_MAGNIFICATION_FACTOR = 8
  #HPDF_MAX_MAGNIFICATION_FACTOR = 3200
  #HPDF_MIN_PAGE_SIZE         = 3 
  #HPDF_MAX_PAGE_SIZE         = 14400
  #HPDF_MIN_HORIZONTALSCALING = 10
  #HPDF_MAX_HORIZONTALSCALING = 300
  #HPDF_MIN_WORDSPACE         = -30
  #HPDF_MAX_WORDSPACE         = 300
  #HPDF_MIN_CHARSPACE         = -30
  #HPDF_MAX_CHARSPACE         = 300
  #HPDF_MAX_FONTSIZE          = 300
  #HPDF_MAX_ZOOMSIZE          = 10
  #HPDF_MAX_LEADING           = 300
  #HPDF_MAX_LINEWIDTH         = 100
  #HPDF_MAX_DASH_PATTERN      = 100
  #HPDF_MAX_JWW_NUM           = 128
  #HPDF_COUNTRY_AF = "AF"    ; AFGHANISTAN 
  #HPDF_COUNTRY_AL = "AL"    ; ALBANIA 
  #HPDF_COUNTRY_DZ = "DZ"    ; ALGERIA 
  #HPDF_COUNTRY_AS = "AS"    ; AMERICAN SAMOA 
  #HPDF_COUNTRY_AD = "AD"    ; ANDORRA 
  #HPDF_COUNTRY_AO = "AO"    ; ANGOLA 
  #HPDF_COUNTRY_AI = "AI"    ; ANGUILLA 
  #HPDF_COUNTRY_AQ = "AQ"    ; ANTARCTICA 
  #HPDF_COUNTRY_AG = "AG"    ; ANTIGUA And BARBUDA 
  #HPDF_COUNTRY_AR = "AR"    ; ARGENTINA 
  #HPDF_COUNTRY_AM = "AM"    ; ARMENIA 
  #HPDF_COUNTRY_AW = "AW"    ; ARUBA 
  #HPDF_COUNTRY_AU = "AU"    ; AUSTRALIA 
  #HPDF_COUNTRY_AT = "AT"    ; AUSTRIA 
  #HPDF_COUNTRY_AZ = "AZ"    ; AZERBAIJAN 
  #HPDF_COUNTRY_BS = "BS"    ; BAHAMAS 
  #HPDF_COUNTRY_BH = "BH"    ; BAHRAIN 
  #HPDF_COUNTRY_BD = "BD"    ; BANGLADESH 
  #HPDF_COUNTRY_BB = "BB"    ; BARBADOS 
  #HPDF_COUNTRY_BY = "BY"    ; BELARUS 
  #HPDF_COUNTRY_BE = "BE"    ; BELGIUM 
  #HPDF_COUNTRY_BZ = "BZ"    ; BELIZE 
  #HPDF_COUNTRY_BJ = "BJ"    ; BENIN 
  #HPDF_COUNTRY_BM = "BM"    ; BERMUDA 
  #HPDF_COUNTRY_BT = "BT"    ; BHUTAN 
  #HPDF_COUNTRY_BO = "BO"    ; BOLIVIA 
  #HPDF_COUNTRY_BA = "BA"    ; BOSNIA And HERZEGOWINA 
  #HPDF_COUNTRY_BW = "BW"    ; BOTSWANA 
  #HPDF_COUNTRY_BV = "BV"    ; BOUVET ISLAND 
  #HPDF_COUNTRY_BR = "BR"    ; BRAZIL 
  #HPDF_COUNTRY_IO = "IO"    ; BRITISH INDIAN OCEAN TERRITORY 
  #HPDF_COUNTRY_BN = "BN"    ; BRUNEI DARUSSALAM 
  #HPDF_COUNTRY_BG = "BG"    ; BULGARIA 
  #HPDF_COUNTRY_BF = "BF"    ; BURKINA FASO 
  #HPDF_COUNTRY_BI = "BI"    ; BURUNDI 
  #HPDF_COUNTRY_KH = "KH"    ; CAMBODIA 
  #HPDF_COUNTRY_CM = "CM"    ; CAMEROON 
  #HPDF_COUNTRY_CA = "CA"    ; CANADA 
  #HPDF_COUNTRY_CV = "CV"    ; CAPE VERDE 
  #HPDF_COUNTRY_KY = "KY"    ; CAYMAN ISLANDS 
  #HPDF_COUNTRY_CF = "CF"    ; CENTRAL AFRICAN REPUBLIC 
  #HPDF_COUNTRY_TD = "TD"    ; CHAD 
  #HPDF_COUNTRY_CL = "CL"    ; CHILE 
  #HPDF_COUNTRY_CN = "CN"    ; CHINA 
  #HPDF_COUNTRY_CX = "CX"    ; CHRISTMAS ISLAND 
  #HPDF_COUNTRY_CC = "CC"    ; COCOS (KEELING) ISLANDS 
  #HPDF_COUNTRY_CO = "CO"    ; COLOMBIA 
  #HPDF_COUNTRY_KM = "KM"    ; COMOROS 
  #HPDF_COUNTRY_CG = "CG"    ; CONGO 
  #HPDF_COUNTRY_CK = "CK"    ; COOK ISLANDS 
  #HPDF_COUNTRY_CR = "CR"    ; COSTA RICA 
  #HPDF_COUNTRY_CI = "CI"    ; COTE D'IVOIRE 
  #HPDF_COUNTRY_HR = "HR"    ; CROATIA (local name: Hrvatska) 
  #HPDF_COUNTRY_CU = "CU"    ; CUBA 
  #HPDF_COUNTRY_CY = "CY"    ; CYPRUS 
  #HPDF_COUNTRY_CZ = "CZ"    ; CZECH REPUBLIC 
  #HPDF_COUNTRY_DK = "DK"    ; DENMARK 
  #HPDF_COUNTRY_DJ = "DJ"    ; DJIBOUTI 
  #HPDF_COUNTRY_DM = "DM"    ; DOMINICA 
  #HPDF_COUNTRY_DO = "DO"    ; DOMINICAN REPUBLIC 
  #HPDF_COUNTRY_TP = "TP"    ; EAST TIMOR 
  #HPDF_COUNTRY_EC = "EC"    ; ECUADOR 
  #HPDF_COUNTRY_EG = "EG"    ; EGYPT 
  #HPDF_COUNTRY_SV = "SV"    ; EL SALVADOR 
  #HPDF_COUNTRY_GQ = "GQ"    ; EQUATORIAL GUINEA 
  #HPDF_COUNTRY_ER = "ER"    ; ERITREA 
  #HPDF_COUNTRY_EE = "EE"    ; ESTONIA 
  #HPDF_COUNTRY_ET = "ET"    ; ETHIOPIA 
  #HPDF_COUNTRY_FK = "FK"   ; FALKLAND ISLANDS (MALVINAS) 
  #HPDF_COUNTRY_FO = "FO"    ; FAROE ISLANDS 
  #HPDF_COUNTRY_FJ = "FJ"    ; FIJI 
  #HPDF_COUNTRY_FI = "FI"    ; FINLAND 
  #HPDF_COUNTRY_FR = "FR"    ; FRANCE 
  #HPDF_COUNTRY_FX = "FX"    ; FRANCE, METROPOLITAN 
  #HPDF_COUNTRY_GF = "GF"    ; FRENCH GUIANA 
  #HPDF_COUNTRY_PF = "PF"    ; FRENCH POLYNESIA 
  #HPDF_COUNTRY_TF = "TF"    ; FRENCH SOUTHERN TERRITORIES 
  #HPDF_COUNTRY_GA = "GA"    ; GABON 
  #HPDF_COUNTRY_GM = "GM"    ; GAMBIA 
  #HPDF_COUNTRY_GE = "GE"    ; GEORGIA 
  #HPDF_COUNTRY_DE = "DE"    ; GERMANY 
  #HPDF_COUNTRY_GH = "GH"    ; GHANA 
  #HPDF_COUNTRY_GI = "GI"    ; GIBRALTAR 
  #HPDF_COUNTRY_GR = "GR"    ; GREECE 
  #HPDF_COUNTRY_GL = "GL"    ; GREENLAND 
  #HPDF_COUNTRY_GD = "GD"    ; GRENADA 
  #HPDF_COUNTRY_GP = "GP"    ; GUADELOUPE 
  #HPDF_COUNTRY_GU = "GU"    ; GUAM 
  #HPDF_COUNTRY_GT = "GT"    ; GUATEMALA 
  #HPDF_COUNTRY_GN = "GN"    ; GUINEA 
  #HPDF_COUNTRY_GW = "GW"    ; GUINEA-BISSAU 
  #HPDF_COUNTRY_GY = "GY"    ; GUYANA 
  #HPDF_COUNTRY_HT = "HT"    ; HAITI 
  #HPDF_COUNTRY_HM = "HM"    ; HEARD And MC DONALD ISLANDS 
  #HPDF_COUNTRY_HN = "HN"    ; HONDURAS 
  #HPDF_COUNTRY_HK = "HK"    ; HONG KONG 
  #HPDF_COUNTRY_HU = "HU"    ; HUNGARY 
  #HPDF_COUNTRY_IS = "IS"    ; ICELAND 
  #HPDF_COUNTRY_IN = "IN"    ; INDIA 
  #HPDF_COUNTRY_ID = "ID"    ; INDONESIA 
  #HPDF_COUNTRY_IR = "IR"    ; IRAN (ISLAMIC REPUBLIC OF) 
  #HPDF_COUNTRY_IQ = "IQ"    ; IRAQ 
  #HPDF_COUNTRY_IE = "IE"    ; IRELAND 
  #HPDF_COUNTRY_IL = "IL"    ; ISRAEL 
  #HPDF_COUNTRY_IT = "IT"    ; ITALY 
  #HPDF_COUNTRY_JM = "JM"    ; JAMAICA 
  #HPDF_COUNTRY_JP = "JP"    ; JAPAN 
  #HPDF_COUNTRY_JO = "JO"    ; JORDAN 
  #HPDF_COUNTRY_KZ = "KZ"    ; KAZAKHSTAN 
  #HPDF_COUNTRY_KE = "KE"    ; KENYA 
  #HPDF_COUNTRY_KI = "KI"    ; KIRIBATI 
  #HPDF_COUNTRY_KP = "KP"    ; KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF 
  #HPDF_COUNTRY_KR = "KR"    ; KOREA, REPUBLIC OF 
  #HPDF_COUNTRY_KW = "KW"    ; KUWAIT 
  #HPDF_COUNTRY_KG = "KG"    ; KYRGYZSTAN 
  #HPDF_COUNTRY_LA = "LA"    ; LAO PEOPLE'S DEMOCRATIC REPUBLIC 
  #HPDF_COUNTRY_LV = "LV"    ; LATVIA 
  #HPDF_COUNTRY_LB = "LB"    ; LEBANON 
  #HPDF_COUNTRY_LS = "LS"    ; LESOTHO 
  #HPDF_COUNTRY_LR = "LR"    ; LIBERIA 
  #HPDF_COUNTRY_LY = "LY"    ; LIBYAN ARAB JAMAHIRIYA 
  #HPDF_COUNTRY_LI = "LI"    ; LIECHTENSTEIN 
  #HPDF_COUNTRY_LT = "LT"    ; LITHUANIA 
  #HPDF_COUNTRY_LU = "LU"    ; LUXEMBOURG 
  #HPDF_COUNTRY_MO = "MO"    ; MACAU 
  #HPDF_COUNTRY_MK = "MK"   ; MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF 
  #HPDF_COUNTRY_MG = "MG"    ; MADAGASCAR 
  #HPDF_COUNTRY_MW = "MW"    ; MALAWI 
  #HPDF_COUNTRY_MY = "MY"    ; MALAYSIA 
  #HPDF_COUNTRY_MV = "MV"    ; MALDIVES 
  #HPDF_COUNTRY_ML = "ML"    ; MALI 
  #HPDF_COUNTRY_MT = "MT"    ; MALTA 
  #HPDF_COUNTRY_MH = "MH"    ; MARSHALL ISLANDS 
  #HPDF_COUNTRY_MQ = "MQ"    ; MARTINIQUE 
  #HPDF_COUNTRY_MR = "MR"    ; MAURITANIA 
  #HPDF_COUNTRY_MU = "MU"    ; MAURITIUS 
  #HPDF_COUNTRY_YT = "YT"    ; MAYOTTE 
  #HPDF_COUNTRY_MX = "MX"    ; MEXICO 
  #HPDF_COUNTRY_FM = "FM"    ; MICRONESIA, FEDERATED STATES OF 
  #HPDF_COUNTRY_MD = "MD"    ; MOLDOVA, REPUBLIC OF 
  #HPDF_COUNTRY_MC = "MC"    ; MONACO 
  #HPDF_COUNTRY_MN = "MN"    ; MONGOLIA 
  #HPDF_COUNTRY_MS = "MS"    ; MONTSERRAT 
  #HPDF_COUNTRY_MA = "MA"    ; MOROCCO 
  #HPDF_COUNTRY_MZ = "MZ"    ; MOZAMBIQUE 
  #HPDF_COUNTRY_MM = "MM"    ; MYANMAR 
  #HPDF_COUNTRY_NA = "NA"    ; NAMIBIA 
  #HPDF_COUNTRY_NR = "NR"    ; NAURU 
  #HPDF_COUNTRY_NP = "NP"    ; NEPAL 
  #HPDF_COUNTRY_NL = "NL"    ; NETHERLANDS 
  #HPDF_COUNTRY_AN = "AN"    ; NETHERLANDS ANTILLES 
  #HPDF_COUNTRY_NC = "NC"    ; NEW CALEDONIA 
  #HPDF_COUNTRY_NZ = "NZ"    ; NEW ZEALAND 
  #HPDF_COUNTRY_NI = "NI"    ; NICARAGUA 
  #HPDF_COUNTRY_NE = "NE"    ; NIGER 
  #HPDF_COUNTRY_NG = "NG"    ; NIGERIA 
  #HPDF_COUNTRY_NU = "NU"    ; NIUE 
  #HPDF_COUNTRY_NF = "NF"    ; NORFOLK ISLAND 
  #HPDF_COUNTRY_MP = "MP"    ; NORTHERN MARIANA ISLANDS 
  #HPDF_COUNTRY_NO = "NO"    ; NORWAY 
  #HPDF_COUNTRY_OM = "OM"    ; OMAN 
  #HPDF_COUNTRY_PK = "PK"    ; PAKISTAN 
  #HPDF_COUNTRY_PW = "PW"    ; PALAU 
  #HPDF_COUNTRY_PA = "PA"    ; PANAMA 
  #HPDF_COUNTRY_PG = "PG"    ; PAPUA NEW GUINEA 
  #HPDF_COUNTRY_PY = "PY"    ; PARAGUAY 
  #HPDF_COUNTRY_PE = "PE"    ; PERU 
  #HPDF_COUNTRY_PH = "PH"    ; PHILIPPINES 
  #HPDF_COUNTRY_PN = "PN"    ; PITCAIRN 
  #HPDF_COUNTRY_PL = "PL"    ; POLAND 
  #HPDF_COUNTRY_PT = "PT"    ; PORTUGAL 
  #HPDF_COUNTRY_PR = "PR"    ; PUERTO RICO 
  #HPDF_COUNTRY_QA = "QA"    ; QATAR 
  #HPDF_COUNTRY_RE = "RE"    ; REUNION 
  #HPDF_COUNTRY_RO = "RO"    ; ROMANIA 
  #HPDF_COUNTRY_RU = "RU"    ; RUSSIAN FEDERATION 
  #HPDF_COUNTRY_RW = "RW"    ; RWANDA 
  #HPDF_COUNTRY_KN = "KN"    ; SAINT KITTS And NEVIS 
  #HPDF_COUNTRY_LC = "LC"    ; SAINT LUCIA 
  #HPDF_COUNTRY_VC = "VC"    ; SAINT VINCENT And THE GRENADINES 
  #HPDF_COUNTRY_WS = "WS"    ; SAMOA 
  #HPDF_COUNTRY_SM = "SM"    ; SAN MARINO 
  #HPDF_COUNTRY_ST = "ST"    ; SAO TOME And PRINCIPE 
  #HPDF_COUNTRY_SA = "SA"    ; SAUDI ARABIA 
  #HPDF_COUNTRY_SN = "SN"    ; SENEGAL 
  #HPDF_COUNTRY_SC = "SC"    ; SEYCHELLES 
  #HPDF_COUNTRY_SL = "SL"    ; SIERRA LEONE 
  #HPDF_COUNTRY_SG = "SG"    ; SINGAPORE 
  #HPDF_COUNTRY_SK = "SK"    ; SLOVAKIA (Slovak Republic) 
  #HPDF_COUNTRY_SI = "SI"    ; SLOVENIA 
  #HPDF_COUNTRY_SB = "SB"    ; SOLOMON ISLANDS 
  #HPDF_COUNTRY_SO = "SO"    ; SOMALIA 
  #HPDF_COUNTRY_ZA = "ZA"    ; SOUTH AFRICA 
  #HPDF_COUNTRY_ES = "ES"    ; SPAIN 
  #HPDF_COUNTRY_LK = "LK"    ; SRI LANKA 
  #HPDF_COUNTRY_SH = "SH"    ; ST. HELENA 
  #HPDF_COUNTRY_PM = "PM"    ; ST. PIERRE And MIQUELON 
  #HPDF_COUNTRY_SD = "SD"    ; SUDAN 
  #HPDF_COUNTRY_SR = "SR"    ; SURINAME 
  #HPDF_COUNTRY_SJ = "SJ"    ; SVALBARD And JAN MAYEN ISLANDS 
  #HPDF_COUNTRY_SZ = "SZ"    ; SWAZILAND 
  #HPDF_COUNTRY_SE = "SE"    ; SWEDEN 
  #HPDF_COUNTRY_CH = "CH"    ; SWITZERLAND 
  #HPDF_COUNTRY_SY = "SY"    ; SYRIAN ARAB REPUBLIC 
  #HPDF_COUNTRY_TW = "TW"    ; TAIWAN, PROVINCE OF CHINA 
  #HPDF_COUNTRY_TJ = "TJ"    ; TAJIKISTAN 
  #HPDF_COUNTRY_TZ = "TZ"    ; TANZANIA, UNITED REPUBLIC OF 
  #HPDF_COUNTRY_TH = "TH"    ; THAILAND 
  #HPDF_COUNTRY_TG = "TG"    ; TOGO 
  #HPDF_COUNTRY_TK = "TK"    ; TOKELAU 
  #HPDF_COUNTRY_TO = "TO"    ; TONGA 
  #HPDF_COUNTRY_TT = "TT"    ; TRINIDAD And TOBAGO 
  #HPDF_COUNTRY_TN = "TN"    ; TUNISIA 
  #HPDF_COUNTRY_TR = "TR"    ; TURKEY 
  #HPDF_COUNTRY_TM = "TM"    ; TURKMENISTAN 
  #HPDF_COUNTRY_TC = "TC"    ; TURKS And CAICOS ISLANDS 
  #HPDF_COUNTRY_TV = "TV"    ; TUVALU 
  #HPDF_COUNTRY_UG = "UG"    ; UGANDA 
  #HPDF_COUNTRY_UA = "UA"    ; UKRAINE 
  #HPDF_COUNTRY_AE = "AE"    ; UNITED ARAB EMIRATES 
  #HPDF_COUNTRY_GB = "GB"    ; UNITED KINGDOM 
  #HPDF_COUNTRY_US = "US"    ; UNITED STATES 
  #HPDF_COUNTRY_UM = "UM"    ; UNITED STATES MINOR OUTLYING ISLANDS 
  #HPDF_COUNTRY_UY = "UY"    ; URUGUAY 
  #HPDF_COUNTRY_UZ = "UZ"    ; UZBEKISTAN 
  #HPDF_COUNTRY_VU = "VU"    ; VANUATU 
  #HPDF_COUNTRY_VA = "VA"    ; VATICAN CITY STATE (HOLY SEE) 
  #HPDF_COUNTRY_VE = "VE"    ; VENEZUELA 
  #HPDF_COUNTRY_VN = "VN"    ; VIET NAM 
  #HPDF_COUNTRY_VG = "VG"    ; VIRGIN ISLANDS (BRITISH) 
  #HPDF_COUNTRY_VI = "VI"    ; VIRGIN ISLANDS (U.S.) 
  #HPDF_COUNTRY_WF = "WF"    ; WALLIS And FUTUNA ISLANDS 
  #HPDF_COUNTRY_EH = "EH"    ; WESTERN SAHARA 
  #HPDF_COUNTRY_YE = "YE"    ; YEMEN 
  #HPDF_COUNTRY_YU = "YU"    ; YUGOSLAVIA 
  #HPDF_COUNTRY_ZR = "ZR"    ; ZAIRE 
  #HPDF_COUNTRY_ZM = "ZM"    ; ZAMBIA 
  #HPDF_COUNTRY_ZW = "ZW"    ; ZIMBABWE 
  #HPDF_LANG_AA  =  "aa"     ; Afar 
  #HPDF_LANG_AB  =  "ab"     ; Abkhazian 
  #HPDF_LANG_AF  =  "af"     ; Afrikaans 
  #HPDF_LANG_AM  =  "am"     ; Amharic 
  #HPDF_LANG_AR  =  "ar"     ; Arabic 
  #HPDF_LANG_AS  =  "as"     ; Assamese 
  #HPDF_LANG_AY  =  "ay"     ; Aymara 
  #HPDF_LANG_AZ  =  "az"     ; Azerbaijani 
  #HPDF_LANG_BA  =  "ba"     ; Bashkir 
  #HPDF_LANG_BE  =  "be"     ; Byelorussian 
  #HPDF_LANG_BG  =  "bg"     ; Bulgarian 
  #HPDF_LANG_BH  =  "bh"     ; Bihari 
  #HPDF_LANG_BI  =  "bi"     ; Bislama 
  #HPDF_LANG_BN  =  "bn"     ; Bengali Bangla 
  #HPDF_LANG_BO  =  "bo"     ; Tibetan 
  #HPDF_LANG_BR  =  "br"     ; Breton 
  #HPDF_LANG_CA  =  "ca"     ; Catalan 
  #HPDF_LANG_CO  =  "co"     ; Corsican 
  #HPDF_LANG_CS  =  "cs"     ; Czech 
  #HPDF_LANG_CY  =  "cy"     ; Welsh 
  #HPDF_LANG_DA  =  "da"     ; Danish 
  #HPDF_LANG_DE  =  "de"     ; German 
  #HPDF_LANG_DZ  =  "dz"     ; Bhutani 
  #HPDF_LANG_EL  =  "el"     ; Greek 
  #HPDF_LANG_EN  =  "en"     ; English 
  #HPDF_LANG_EO  =  "eo"     ; Esperanto 
  #HPDF_LANG_ES  =  "es"     ; Spanish 
  #HPDF_LANG_ET  =  "et"     ; Estonian 
  #HPDF_LANG_EU  =  "eu"     ; Basque 
  #HPDF_LANG_FA  =  "fa"     ; Persian 
  #HPDF_LANG_FI  =  "fi"     ; Finnish 
  #HPDF_LANG_FJ  =  "fj"     ; Fiji 
  #HPDF_LANG_FO  =  "fo"     ; Faeroese 
  #HPDF_LANG_FR  =  "fr"     ; French 
  #HPDF_LANG_FY  =  "fy"     ; Frisian 
  #HPDF_LANG_GA  =  "ga"     ; Irish 
  #HPDF_LANG_GD  =  "gd"     ; Scots Gaelic 
  #HPDF_LANG_GL  =  "gl"     ; Galician 
  #HPDF_LANG_GN  =  "gn"     ; Guarani 
  #HPDF_LANG_GU  =  "gu"     ; Gujarati 
  #HPDF_LANG_HA  =  "ha"     ; Hausa 
  #HPDF_LANG_HI  =  "hi"     ; Hindi 
  #HPDF_LANG_HR  =  "hr"     ; Croatian 
  #HPDF_LANG_HU  =  "hu"     ; Hungarian 
  #HPDF_LANG_HY  =  "hy"     ; Armenian 
  #HPDF_LANG_IA  =  "ia"     ; Interlingua 
  #HPDF_LANG_IE  =  "ie"     ; Interlingue 
  #HPDF_LANG_IK  =  "ik"     ; Inupiak 
  #HPDF_LANG_IN  =  "in"     ; Indonesian 
  #HPDF_LANG_IS  =  "is"     ; Icelandic 
  #HPDF_LANG_IT  =  "it"     ; Italian 
  #HPDF_LANG_IW  =  "iw"     ; Hebrew 
  #HPDF_LANG_JA  =  "ja"     ; Japanese 
  #HPDF_LANG_JI  =  "ji"     ; Yiddish 
  #HPDF_LANG_JW  =  "jw"     ; Javanese 
  #HPDF_LANG_KA  =  "ka"     ; Georgian 
  #HPDF_LANG_KK  =  "kk"     ; Kazakh 
  #HPDF_LANG_KL  =  "kl"     ; Greenlandic 
  #HPDF_LANG_KM  =  "km"     ; Cambodian 
  #HPDF_LANG_KN  =  "kn"     ; Kannada 
  #HPDF_LANG_KO  =  "ko"     ; Korean 
  #HPDF_LANG_KS  =  "ks"     ; Kashmiri 
  #HPDF_LANG_KU  =  "ku"     ; Kurdish 
  #HPDF_LANG_KY  =  "ky"     ; Kirghiz 
  #HPDF_LANG_LA  =  "la"     ; Latin 
  #HPDF_LANG_LN  =  "ln"     ; Lingala 
  #HPDF_LANG_LO  =  "lo"     ; Laothian 
  #HPDF_LANG_LT  =  "lt"     ; Lithuanian 
  #HPDF_LANG_LV  =  "lv"     ; Latvian,Lettish 
  #HPDF_LANG_MG  =  "mg"     ; Malagasy 
  #HPDF_LANG_MI  =  "mi"     ; Maori 
  #HPDF_LANG_MK  =  "mk"     ; Macedonian 
  #HPDF_LANG_ML  =  "ml"     ; Malayalam 
  #HPDF_LANG_MN  =  "mn"     ; Mongolian 
  #HPDF_LANG_MO  =  "mo"     ; Moldavian 
  #HPDF_LANG_MR  =  "mr"     ; Marathi 
  #HPDF_LANG_MS  =  "ms"     ; Malay 
  #HPDF_LANG_MT  =  "mt"     ; Maltese 
  #HPDF_LANG_MY  =  "my"     ; Burmese 
  #HPDF_LANG_NA  =  "na"     ; Nauru 
  #HPDF_LANG_NE  =  "ne"     ; Nepali 
  #HPDF_LANG_NL  =  "nl"     ; Dutch 
  #HPDF_LANG_NO  =  "no"     ; Norwegian 
  #HPDF_LANG_OC  =  "oc"     ; Occitan 
  #HPDF_LANG_OM  =  "om"     ; (Afan)Oromo 
  #HPDF_LANG_OR  =  "or"     ; Oriya 
  #HPDF_LANG_PA  =  "pa"     ; Punjabi 
  #HPDF_LANG_PL  =  "pl"     ; Polish 
  #HPDF_LANG_PS  =  "ps"     ; Pashto,Pushto 
  #HPDF_LANG_PT  =  "pt"     ; Portuguese  
  #HPDF_LANG_QU  =  "qu"     ; Quechua 
  #HPDF_LANG_RM  =  "rm"     ; Rhaeto-Romance 
  #HPDF_LANG_RN  =  "rn"     ; Kirundi 
  #HPDF_LANG_RO  =  "ro"     ; Romanian 
  #HPDF_LANG_RU  =  "ru"     ; Russian 
  #HPDF_LANG_RW  =  "rw"     ; Kinyarwanda 
  #HPDF_LANG_SA  =  "sa"     ; Sanskrit 
  #HPDF_LANG_SD  =  "sd"     ; Sindhi 
  #HPDF_LANG_SG  =  "sg"     ; Sangro 
  #HPDF_LANG_SH  =  "sh"     ; Serbo-Croatian 
  #HPDF_LANG_SI  =  "si"     ; Singhalese 
  #HPDF_LANG_SK  =  "sk"     ; Slovak 
  #HPDF_LANG_SL  =  "sl"     ; Slovenian 
  #HPDF_LANG_SM  =  "sm"     ; Samoan 
  #HPDF_LANG_SN  =  "sn"     ; Shona 
  #HPDF_LANG_SO  =  "so"     ; Somali 
  #HPDF_LANG_SQ  =  "sq"     ; Albanian 
  #HPDF_LANG_SR  =  "sr"     ; Serbian 
  #HPDF_LANG_SS  =  "ss"     ; Siswati 
  #HPDF_LANG_ST  =  "st"     ; Sesotho 
  #HPDF_LANG_SU  =  "su"     ; Sundanese 
  #HPDF_LANG_SV  =  "sv"     ; Swedish 
  #HPDF_LANG_SW  =  "sw"     ; Swahili 
  #HPDF_LANG_TA  =  "ta"     ; Tamil 
  #HPDF_LANG_TE  =  "te"     ; Tegulu 
  #HPDF_LANG_TG  =  "tg"     ; Tajik 
  #HPDF_LANG_TH  =  "th"     ; Thai 
  #HPDF_LANG_TI  =  "ti"     ; Tigrinya 
  #HPDF_LANG_TK  =  "tk"     ; Turkmen 
  #HPDF_LANG_TL  =  "tl"     ; Tagalog 
  #HPDF_LANG_TN  =  "tn"     ; Setswanato Tonga 
  #HPDF_LANG_TR  =  "tr"     ; Turkish 
  #HPDF_LANG_TS  =  "ts"     ; Tsonga 
  #HPDF_LANG_TT  =  "tt"     ; Tatar 
  #HPDF_LANG_TW  =  "tw"     ; Twi 
  #HPDF_LANG_UK  =  "uk"     ; Ukrainian 
  #HPDF_LANG_UR  =  "ur"     ; Urdu 
  #HPDF_LANG_UZ  =  "uz"     ; Uzbek 
  #HPDF_LANG_VI  =  "vi"     ; Vietnamese 
  #HPDF_LANG_VO  =  "vo"     ; Volapuk 
  #HPDF_LANG_WO  =  "wo"     ; Wolof 
  #HPDF_LANG_XH  =  "xh"     ; Xhosa 
  #HPDF_LANG_YO  =  "yo"     ; Yoruba 
  #HPDF_LANG_ZH  =  "zh"     ; Chinese 
  #HPDF_LANG_ZU  =  "zu"     ; Zulu 
  #HPDF_GMODE_PAGE_DESCRIPTION       = $0001
  #HPDF_GMODE_PATH_OBJECT            = $0002
  #HPDF_GMODE_TEXT_OBJECT            = $0004
  #HPDF_GMODE_CLIPPING_PATH          = $0008
  #HPDF_GMODE_SHADING                = $0010
  #HPDF_GMODE_INLINE_IMAGE           = $0020
  #HPDF_GMODE_EXTERNAL_OBJECT        = $0040
  
  ; Default buffer size of memory-stream-object 
  #HPDF_STREAM_BUF_SIZ         = 4096
  
  ; Default array size of list-object 
  #HPDF_DEF_ITEMS_PER_BLOCK    = 20
  
  ; Default array size of cross-reference-table 
  #HPDF_DEFALUT_XREF_ENTRY_NUM = 1024
  
  ; Default array size of widths-table of cid-fontdef 
  #HPDF_DEF_CHAR_WIDTHS_NUM    = 128
  
  ; Default array size of page-list-tablef 
  #HPDF_DEF_PAGE_LIST_NUM      = 256
  
  ; Default array size of range-table of cid-fontdef 
  #HPDF_DEF_RANGE_TBL_NUM      = 128
  
  ; Default buffer size of memory-pool-object 
  #HPDF_MPOOL_BUF_SIZ          = 8192
  #HPDF_MIN_MPOOL_BUF_SIZ      = 256
  #HPDF_MAX_MPOOL_BUF_SIZ      = 1048576

  ; If HPDF_OTYPE_DIRECT bit is set, the object owned by other container
  ; object. If HPDF_OTYPE_INDIRECT bit is set, the object managed by xref.
  #HPDF_OTYPE_NONE              = $00000000
  #HPDF_OTYPE_DIRECT            = $80000000
  #HPDF_OTYPE_INDIRECT          = $40000000
  #HPDF_OTYPE_ANY               = (#HPDF_OTYPE_DIRECT | #HPDF_OTYPE_INDIRECT)
  #HPDF_OTYPE_HIDDEN            = $10000000
  
  #HPDF_OCLASS_UNKNOWN          = $0001
  #HPDF_OCLASS_NULL             = $0002
  #HPDF_OCLASS_BOOLEAN          = $0003
  #HPDF_OCLASS_NUMBER           = $0004
  #HPDF_OCLASS_REAL             = $0005
  #HPDF_OCLASS_NAME             = $0006
  #HPDF_OCLASS_STRING           = $0007
  #HPDF_OCLASS_BINARY           = $0008
  #HPDF_OCLASS_ARRAY            = $0010
  #HPDF_OCLASS_DICT             = $0011
  #HPDF_OCLASS_PROXY            = $0012
  #HPDF_OCLASS_ANY              = $00FF
  
  #HPDF_OSUBCLASS_FONT          = $0100
  #HPDF_OSUBCLASS_CATALOG       = $0200
  #HPDF_OSUBCLASS_PAGES         = $0300
  #HPDF_OSUBCLASS_PAGE          = $0400
  #HPDF_OSUBCLASS_XOBJECT       = $0500
  #HPDF_OSUBCLASS_OUTLINE       = $0600
  #HPDF_OSUBCLASS_DESTINATION   = $0700
  #HPDF_OSUBCLASS_ANNOTATION    = $0800
  #HPDF_OSUBCLASS_ENCRYPT       = $0900
  #HPDF_OSUBCLASS_EXT_GSTATE    = $0A00
  #HPDF_OSUBCLASS_EXT_GSTATE_R  = $0B00  ; Read only object 
  
  ; Values related xref 
  #HPDF_FREE_ENTRY              = 'f'
  #HPDF_IN_USE_ENTRY            = 'n'
  
  #HPDF_ENCODER_SIG_BYTES = $454E4344

  ; predefined font encodings
  
  #HPDF_ENCODING_FONT_SPECIFIC = "FontSpecific"
  #HPDF_ENCODING_STANDARD      = "StandardEncoding"
  #HPDF_ENCODING_MAC_ROMAN     = "MacRomanEncoding"
  #HPDF_ENCODING_WIN_ANSI      = "WinAnsiEncoding"
  #HPDF_ENCODING_ISO8859_2     = "ISO8859-2"
  #HPDF_ENCODING_ISO8859_3     = "ISO8859-3"
  #HPDF_ENCODING_ISO8859_4     = "ISO8859-4"
  #HPDF_ENCODING_ISO8859_5     = "ISO8859-5"
  #HPDF_ENCODING_ISO8859_6     = "ISO8859-6"
  #HPDF_ENCODING_ISO8859_7     = "ISO8859-7"
  #HPDF_ENCODING_ISO8859_8     = "ISO8859-8"
  #HPDF_ENCODING_ISO8859_9     = "ISO8859-9"
  #HPDF_ENCODING_ISO8859_10    = "ISO8859-10"
  #HPDF_ENCODING_ISO8859_11    = "ISO8859-11"
  #HPDF_ENCODING_ISO8859_13    = "ISO8859-13"
  #HPDF_ENCODING_ISO8859_14    = "ISO8859-14"
  #HPDF_ENCODING_ISO8859_15    = "ISO8859-15"
  #HPDF_ENCODING_ISO8859_16    = "ISO8859-16"
  #HPDF_ENCODING_CP1250        = "CP1250"
  #HPDF_ENCODING_CP1251        = "CP1251"
  #HPDF_ENCODING_CP1252        = "CP1252"
  #HPDF_ENCODING_CP1253        = "CP1253"
  #HPDF_ENCODING_CP1254        = "CP1254"
  #HPDF_ENCODING_CP1255        = "CP1255"
  #HPDF_ENCODING_CP1256        = "CP1256"
  #HPDF_ENCODING_CP1257        = "CP1257"
  #HPDF_ENCODING_CP1258        = "CP1258"
  #HPDF_ENCODING_KOI8_R        = "KOI8-R"
  
  ; definition for font encoding
  #char_NOTDEF       = ".notdef"

  #HPDF_VER_DEFAULT  = #HPDF_VER_12
  #HPDF_ID_LEN              = 16
  #HPDF_PASSWD_LEN          = 32
  #HPDF_ENCRYPT_KEY_MAX     = 16
  #HPDF_MD5_KEY_LEN         = 16
  #HPDF_PERMISSION_PAD      = $FFFFFFC0
  #HPDF_ARC4_BUF_SIZE       = 256
  ; error-code 
  #HPDF_ARRAY_COUNT_ERR                      = $1001
  #HPDF_ARRAY_ITEM_NOT_FOUND                 = $1002
  #HPDF_ARRAY_ITEM_UNEXPECTED_TYPE           = $1003
  #HPDF_BINARY_LENGTH_ERR                    = $1004
  #HPDF_CANNOT_GET_PALLET                    = $1005
  #HPDF_DICT_COUNT_ERR                       = $1007
  #HPDF_DICT_ITEM_NOT_FOUND                  = $1008
  #HPDF_DICT_ITEM_UNEXPECTED_TYPE            = $1009
  #HPDF_DICT_STREAM_LENGTH_NOT_FOUND         = $100A
  #HPDF_DOC_ENCRYPTDICT_NOT_FOUND            = $100B
  #HPDF_DOC_INVALID_OBJECT                   = $100C
  ;                                                = $100D 
  #HPDF_DUPLICATE_REGISTRATION               = $100E
  #HPDF_EXCEED_JWW_CODE_NUM_LIMIT            = $100F
  ;                                                = $1010 
  #HPDF_ENCRYPT_INVALID_PASSWORD             = $1011
  ;                                                = $1012 
  #HPDF_ERR_UNKNOWN_CLASS                    = $1013
  #HPDF_EXCEED_GSTATE_LIMIT                  = $1014
  #HPDF_FAILD_TO_ALLOC_MEM                   = $1015
  #HPDF_FILE_IO_ERROR                        = $1016
  #HPDF_FILE_OPEN_ERROR                      = $1017
  ;                                                = $1018 
  #HPDF_FONT_EXISTS                          = $1019
  #HPDF_FONT_INVALID_WIDTHS_TABLE            = $101A
  #HPDF_INVALID_AFM_HEADER                   = $101B
  #HPDF_INVALID_ANNOTATION                   = $101C
  ;                                                = $101D 
  #HPDF_INVALID_BIT_PER_COMPONENT            = $101E
  #HPDF_INVALID_CHAR_MATRICS_DATA            = $101F
  #HPDF_INVALID_COLOR_SPACE                  = $1020
  #HPDF_INVALID_COMPRESSION_MODE             = $1021
  #HPDF_INVALID_DATE_TIME                    = $1022
  #HPDF_INVALID_DESTINATION                  = $1023
  ;                                                = $1024 
  #HPDF_INVALID_DOCUMENT                     = $1025
  #HPDF_INVALID_DOCUMENT_STATE               = $1026
  #HPDF_INVALID_ENCODER                      = $1027
  #HPDF_INVALID_ENCODER_TYPE                 = $1028
  ;                                                = $1029 
  ;                                                = $102A 
  #HPDF_INVALID_ENCODING_NAME                = $102B
  #HPDF_INVALID_ENCRYPT_KEY_LEN              = $102C
  #HPDF_INVALID_FONTDEF_DATA                 = $102D
  #HPDF_INVALID_FONTDEF_TYPE                 = $102E
  #HPDF_INVALID_FONT_NAME                    = $102F
  #HPDF_INVALID_IMAGE                        = $1030
  #HPDF_INVALID_JPEG_DATA                    = $1031
  #HPDF_INVALID_N_DATA                       = $1032
  #HPDF_INVALID_OBJECT                       = $1033
  #HPDF_INVALID_OBJ_ID                       = $1034
  #HPDF_INVALID_OPERATION                    = $1035
  #HPDF_INVALID_OUTLINE                      = $1036
  #HPDF_INVALID_PAGE                         = $1037
  #HPDF_INVALID_PAGES                        = $1038
  #HPDF_INVALID_PARAMETER                    = $1039
  ;                                                = $103A 
  #HPDF_INVALID_PNG_IMAGE                    = $103B
  #HPDF_INVALID_STREAM                       = $103C
  #HPDF_MISSING_FILE_NAME_ENTRY              = $103D
  ;                                                = $103E 
  #HPDF_INVALID_TTC_FILE                     = $103F
  #HPDF_INVALID_TTC_INDEX                    = $1040
  #HPDF_INVALID_WX_DATA                      = $1041
  #HPDF_ITEM_NOT_FOUND                       = $1042
  #HPDF_LIBPNG_ERROR                         = $1043
  #HPDF_NAME_INVALID_VALUE                   = $1044
  #HPDF_NAME_OUT_OF_RANGE                    = $1045
  ;                                                = $1046 
  ;                                                = $1047 
  #HPDF_PAGE_INVALID_PARAM_COUNT             = $1048
  #HPDF_PAGES_MISSING_KIDS_ENTRY             = $1049
  #HPDF_PAGE_CANNOT_FIND_OBJECT              = $104A
  #HPDF_PAGE_CANNOT_GET_ROOT_PAGES           = $104B
  #HPDF_PAGE_CANNOT_RESTORE_GSTATE           = $104C
  #HPDF_PAGE_CANNOT_SET_PARENT               = $104D
  #HPDF_PAGE_FONT_NOT_FOUND                  = $104E
  #HPDF_PAGE_INVALID_FONT                    = $104F
  #HPDF_PAGE_INVALID_FONT_SIZE               = $1050
  #HPDF_PAGE_INVALID_GMODE                   = $1051
  #HPDF_PAGE_INVALID_INDEX                   = $1052
  #HPDF_PAGE_INVALID_ROTATE_VALUE            = $1053
  #HPDF_PAGE_INVALID_SIZE                    = $1054
  #HPDF_PAGE_INVALID_XOBJECT                 = $1055
  #HPDF_PAGE_OUT_OF_RANGE                    = $1056
  #HPDF__REAL_OUT_OF_RANGE                    = $1057
  #HPDF_STREAM_EOF                           = $1058
  #HPDF_STREAM_READLN_CONTINUE               = $1059
  ;                                                = $105A 
  #HPDF_STRING_OUT_OF_RANGE                  = $105B
  #HPDF_THIS_FUNC_WAS_SKIPPED                = $105C
  #HPDF_TTF_CANNOT_EMBEDDING_FONT            = $105D
  #HPDF_TTF_INVALID_CMAP                     = $105E
  #HPDF_TTF_INVALID_FOMAT                    = $105F
  #HPDF_TTF_MISSING_TABLE                    = $1060
  #HPDF_UNSUPPORTED_FONT_TYPE                = $1061
  #HPDF_UNSUPPORTED_FUNC                     = $1062
  #HPDF_UNSUPPORTED_JPEG_FORMAT              = $1063
  #HPDF_UNSUPPORTED_TYPE1_FONT               = $1064
  #HPDF_XREF_COUNT_ERR                       = $1065
  #HPDF_ZLIB_ERROR                           = $1066
  #HPDF_INVALID_PAGE_INDEX                   = $1067
  #HPDF_INVALID_URI                          = $1068
  #HPDF_PAGE_LAYOUT_OUT_OF_RANGE             = $1069
  #HPDF_PAGE_MODE_OUT_OF_RANGE               = $1070
  #HPDF_PAGE_NUM_STYLE_OUT_OF_RANGE          = $1071
  #HPDF_ANNOT_INVALID_ICON                   = $1072
  #HPDF_ANNOT_INVALID_BORDER_STYLE           = $1073
  #HPDF_PAGE_INVALID_DIRECTION               = $1074
  #HPDF_INVALID_FONT                         = $1075
  #HPDF_PAGE_INSUFFICIENT_SPACE              = $1076
  #HPDF_PAGE_INVALID_DISPLAY_TIME            = $1077
  #HPDF_PAGE_INVALID_TRANSITION_TIME         = $1078
  #HPDF_INVALID_PAGE_SLIDESHOW_TYPE          = $1079
  #HPDF_EXT_GSTATE_OUT_OF_RANGE              = $1080
  #HPDF_INVALID_EXT_GSTATE                   = $1081
  #HPDF_EXT_GSTATE_READ_ONLY                 = $1082
  #HPDF_INVALID_U3D_DATA                     = $1083

  #HPDF_FONTDEF_SIG_BYTES = $464F4E54
  ; collection of flags for defining characteristics. 
  #HPDF_FONT_FIXED_WIDTH    = 1
  #HPDF_FONT_SERIF          = 2
  #HPDF_FONT_SYMBOLIC       = 4
  #HPDF_FONT_SCRIPT         = 8
  #HPDF_FONT_STD_CHARSET    = 32
  #HPDF_FONT_ITALIC         = 64
  #HPDF_FONT_ALL_CAP        = 65536
  #HPDF_FONT_SMALL_CAP      = 131072
  #HPDF_FONT_FOURCE_BOLD    = 262144
  
  #HPDF__CID_W_TYPE_FROM_TO     = 0
  #HPDF__CID_W_TYPE_FROM_ARRAY  = 1
  #HPDF_TTF_FONT_TAG_LEN  = 6

  #HPDF_STREAM_SIG_BYTES   = $5354524D
  
  #HPDF_STREAM_FILTER_NONE          = $0000
  #HPDF_STREAM_FILTER_ASCIIHEX      = $0100
  #HPDF_STREAM_FILTER_ASCII85       = $0200
  #HPDF_STREAM_FILTER_FLATE_DECODE  = $0400
  #HPDF_STREAM_FILTER_DCT_DECODE    = $0800
;}
;- Structures
;{ Structures
  Structure HPDF_Point
    x.f
    y.f
  EndStructure
  Structure HPDF_Rect
    left.f
    bottom.f
    right.f
    top.f
  EndStructure
  Structure HPDF_Date
    year.l
    month.l
    day.l
    hour.l
    minutes.l
    seconds.l
    ind.s
    off_hour.l
    off_minutes.l
  EndStructure
  Structure HPDF_TextWidth
    numchars.l
    ; don't use this value (it may be change in the feature). use numspace As alternated.
    numwords.l
    width.l
    numspace.l
  EndStructure
  Structure HPDF_DashMode
    ptn.l[8]
    num_ptn.l
    phase.l
  EndStructure
  Structure HPDF_TransMatrix
    a.f
    b.f
    c.f
    d.f
    x.f
    y.f
  EndStructure
  Structure HPDF_RGBColor
    r.f
    g.f
    b.f
  EndStructure
  Structure HPDF_CMYKColor
    c.f
    m.f
    y.f
    k.f
  EndStructure
  ;  Structure of Object-ID
  ;  1       direct-object
  ;  2       indirect-object
  ;  3       reserved
  ;  4       shadow-object
  ;  5-8     reserved
  ;  9-32    object-id i0-8388607 j
  ;  the real Object-ID is described "obj_id & = $00FFFFFF"
   
  Structure HPDF_Obj_Header
     obj_id.l
     gen_no.l
     obj_class.l
  EndStructure
  Structure HPDF_Null
  	header.HPDF_Obj_Header
  EndStructure 
  Structure HPDF_Boolean
    header.HPDF_Obj_Header
    value.HPDF__BOOL
  EndStructure
  Structure HPDF_Number
    header.HPDF_Obj_Header
  	value.HPDF__BOOL
  EndStructure
  Structure HPDF_Error
    error_no.HPDF__STATUS
    detail_no.HPDF__STATUS
    *error_fn ; PROTO_HPDF_Error_Handler
    *user_data
  EndStructure 
  Structure HPDF_Real
    header.HPDF_Obj_Header
  	error.HPDF_Error
  	value.HPDF__REAL
  EndStructure
  Structure HPDF_Name
      header.HPDF_Obj_Header
  	error.HPDF_Error
  	value.c[#HPDF_LIMIT_MAX_NAME_LEN + 1]
  EndStructure
  Structure HPDF_MPool_Node
    buf.HPDF__BYTE
    size.l
    used_size.l
    *next_node.HPDF_MPool_Node
  EndStructure
  Structure HPDF_MMgr
    error.HPDF_Error        
    *alloc_fn ; Proto HPDF_Alloc_Func   
    *free_fn ; Proto HPDF_Free_Func    
    mpool.HPDF_MPool_Node
    buf_size.l         
    alloc_cnt.l         
    free_cnt.l         
  EndStructure
  Structure HPDF_Encoder
    sig_bytes.l
    name.c[#HPDF_LIMIT_MAX_NAME_LEN + 1]
    mmgr.HPDF_MMgr
    error.HPDF_Error
    type.HPDF_EncoderType
    *byte_type_fn	; HPDF_Encoder_ByteType_Func      
    *to_unicode_fn	; HPDF_Encoder_ToUnicode_Func     
    *write_fn		; HPDF_Encoder_Write_Func         
    *free_fn		; HPDF_Encoder_Free_Func          
    *init_fn		; HPDF_Encoder_Init_Func          
    *attr;
  EndStructure
  Structure HPDF_String
    header.HPDF_Obj_Header
    mmgr.HPDF_MMgr
    error.HPDF_Error
    encoder.HPDF_Encoder
    *value
    len.l
  EndStructure
  Structure HPDF_Binary
    header.HPDF_Obj_Header
    mmgr.HPDF_MMgr
    error.HPDF_Error
    *value
    len.l
  EndStructure
  Structure HPDF_List
  	mmgr.HPDF_MMgr
  	error.HPDF_Error
  	block_siz.l
  	items_per_block.l
  	count.l
  	*obj
  EndStructure
  Structure HPDF_Array
    header.HPDF_Obj_Header
    mmgr.HPDF_MMgr
    error.HPDF_Error
    list.HPDF_List
  EndStructure
  Structure HPDF_Stream 
    sig_bytes.l
    type.HPDF_StreamType
    mmgr.HPDF_MMgr                 
    error.HPDF_Error                
    size.l                 
    *write_fn ; Proto > HPDF_Stream_Write_Func    
    *read_fn ; Proto > HPDF_Stream_Read_Func     
    *seek_fn ; Proto > HPDF_Stream_Seek_Func     
    *free_fn ; Proto > HPDF_Stream_Free_Func     
    *tell_fn ; Proto > HPDF_Stream_Tell_Func     
    *size_fn ; Proto > HPDF_Stream_Size_Func     
    attr.l
  EndStructure
  Structure HPDF_Dict
    header.HPDF_Obj_Header
    mmgr.HPDF_MMgr
    error.HPDF_Error
    list.HPDF_List
    *before_write_fn 	; HPDF_Dict_BeforeWriteFunc
    *write_fn			; HPDF_Dict_OnWriteFunc
    *after_write_fn		; HPDF_Dict_AfterWriteFunc
    *free_fn			; HPDF_Dict_FreeFunc
    stream.HPDF_Stream
    filter.l
    *attr
  EndStructure
  Structure HPDF_DictElement
    key.c[#HPDF_LIMIT_MAX_NAME_LEN + 1]
    *value
  EndStructure
  Structure HPDF_Proxy
    header.HPDF_Obj_Header
    *obj
  EndStructure
  Structure HPDF_XrefEntry
    entry_typ.c
    byte_offset.l
    gen_no.l
    *obj
  EndStructure
  Structure HPDF_Xref
    mmgr.HPDF_MMgr
    error.HPDF_Error
    start_offset.l
    entries.HPDF_List
    addr.l
    *prev.HPDF_Xref
    trailer.HPDF_Dict
  EndStructure
  Structure HPDF_ParseText
    *text
    index.l
    len.l
    byte_type.HPDF_ByteType
  EndStructure 
  Structure HPDF_BasicEncoderAttr
  	base_encoding.c[#HPDF_LIMIT_MAX_NAME_LEN + 1];
  	first_char.HPDF__BYTE
  	last_char.HPDF__BYTE
  	unicode_map.HPDF__UNICODE[256];
  	has_differences.HPDF__BOOL
  	differences.HPDF__BYTE[256];
  EndStructure
  Structure HPDF_CidRange
    from.l
    to_.l
    cid.l
  EndStructure
  Structure HPDF_UnicodeMap
    code.l
    unicode.l
  EndStructure
  Structure HPDF_CMapEncoderAttr
    unicode_map.HPDF__UNICODE[65536]
    cid_map.l[65536];
    jww_line_head.l[#HPDF_MAX_JWW_NUM];
    cmap_range.HPDF_List;
    notdef_range.HPDF_List;
    code_space_range.HPDF_List;
    writing_mode.HPDF_WritingMode
    registry.c[#HPDF_LIMIT_MAX_NAME_LEN + 1];
    ordering.c[#HPDF_LIMIT_MAX_NAME_LEN + 1];
    suppliment.l
    *is_lead_byte_fn	; HPDF_CMapEncoder_ByteType_Func
    *is_trial_byte_fn	; HPDF_CMapEncoder_ByteType_Func
    uid_offset.l
    xuid.l[3]
  EndStructure
  Structure HPDF_Doc
    sig_bytes.l
    pdf_version.l
    
    mmgr.HPDF_MMgr         
    catalog.HPDF_Catalog      
    outlines.HPDF_Outline      
    xref.HPDF_Xref         
    root_pages.HPDF_Pages        
    cur_pages.HPDF_Pages        
    cur_page.HPDF_Page         
    page_list.HPDF_List         
    error.HPDF_Error    
    info.HPDF_Dict         
    trailer.HPDF_Dict         
    
    font_mgr.HPDF_List         
    ttfont_tag.HPDF__BYTE[6]         
    
    ; list for loaded fontdefs 
    fontdef_list.HPDF_List
    
    ; list for loaded encodings 
    encoder_list.HPDF_List
    
    cur_encoder.HPDF_Encoder
    
    ; default compression mode 
    compression_mode.HPDF__BOOL         
    
    encrypt_on.HPDF__BOOL         
    encrypt_dict.HPDF_EncryptDict  
    
    def_encoder.HPDF_Encoder      
    
    page_per_pages.l         
    cur_page_num.l         
    
    ; buffer for saving into memory stream 
    stream.HPDF_Stream
  EndStructure
  Structure HPDF_MD5Context
    buf.l[4]
    bits.l[2]
    in.HPDF__BYTE[64]
  EndStructure 
  Structure HPDF_ARC4_Ctx
    idx1.HPDF__BYTE
    idx2.HPDF__BYTE
    state.HPDF__BYTE[#HPDF_ARC4_BUF_SIZE]
  EndStructure 
  Structure HPDF_Encrypt
    mode.HPDF_EncryptMode
    
    ; key_len must be a multiple of 8, and between 40 to 128 
    key_len.l
    
    ; owner-password (not encrypted) 
    owner_passwd.HPDF__BYTE[#HPDF_PASSWD_LEN]
    
    ; user-password (not encrypted) 
    user_passwd.HPDF__BYTE[#HPDF_PASSWD_LEN]
    
    ; owner-password (encrypted) 
    owner_key.HPDF__BYTE[#HPDF_PASSWD_LEN]
    
    ; user-password (encrypted) 
    user_key.HPDF__BYTE[#HPDF_PASSWD_LEN]
    
    permission.l
    encrypt_id.HPDF__BYTE[#HPDF_ID_LEN]
    encryption_key.HPDF__BYTE[#HPDF_MD5_KEY_LEN + 5]
    md5_encryption_key.HPDF__BYTE[#HPDF_MD5_KEY_LEN]
    arc4ctx.HPDF_ARC4_Ctx
  EndStructure
  Structure HPDF_FontDef
    sig_bytes.l
    base_font.c[#HPDF_LIMIT_MAX_NAME_LEN + 1]
    mmgr.HPDF_MMgr
    error.HPDF_Error
    type.HPDF_FontDefType
    *clean_fn ; HPDF_FontDef_CleanFunc
    *free_fn  ; HPDF_FontDef_FreeFunc 
    *init_fn  ; HPDF_FontDef_InitFunc 
    
    ascent.l
    descent.l
    flags.l
    font_bbox.HPDF_Box
    italic_angle.l
    stemv.l
    avg_width.l
    max_width.l
    missing_width.l
    stemh.l
    x_height.l
    cap_height.l
    
    ;  the initial value of descriptor entry is NULL.
    ;  when first font-object besed on the fontdef object is created,
    ;  the font-descriptor object is created and descriptor entry is set.
     
    descriptor.HPDF_Dict
    data_.HPDF_Stream
    
    valid.HPDF__BOOL
    *attr
  EndStructure
  Structure HPDF_FontAttr
    type.HPDF_FontType
    writing_mode.HPDF_WritingMode
    *text_width_fn      ; PROTO HPDF_Font_TextWidths_Func
    *measure_text_fn    ; PROTO HPDF_Font_MeasureText_Func
    fontdef.HPDF_FontDef
    encoder.HPDF_Encoder
    
    widths.l
    used.HPDF__BYTE
    
    xref.HPDF_Xref
    descendant_font.HPDF_Font
    map_stream.HPDF_Dict
    cmap_stream.HPDF_Dict
  EndStructure
  Structure HPDF_CharData
  	char_cd.l
  	unicode.HPDF__UNICODE
  	width.l
  EndStructure
  Structure HPDF_CID_Width
    cid.l
    width.l
  EndStructure

  Structure HPDF_Type1FontDefAttrRec
    first_char.HPDF__BYTE; Required 
    last_char.HPDF__BYTE ; Required 
    *widths.HPDF_CharData ; Required 
    widths_count.l
    
    leading.l
    *char_set.c
    encoding_scheme.c[#HPDF_LIMIT_MAX_NAME_LEN + 1]
    length1.l
    length2.l
    length3.l
    is_base14font.HPDF__BOOL
    is_fixed_pitch.HPDF__BOOL
                  
    font_data.HPDF_Stream
  EndStructure
  Structure HPDF_TTF_Table 
    tag.c[4]
    check_sum.l
    offset.l
    length.l
  EndStructure
  Structure HPDF_TTF_OffsetTbl 
    sfnt_version.l
    num_tables.l
    search_range.l
    entry_selector.l
    range_shift.l
    *table.HPDF_TTFTable
  EndStructure
  Structure HPDF_TTF_CmapRange 
    format.l
    length.l
    language.l
    seg_count_x2.l
    search_range.l
    entry_selector.l
    range_shift.l
    *end_count.l
    reserved_pad.l
    *start_count.l
    *id_delta.l
    *id_range_offset.l
    *glyph_id_array.l
    glyph_id_array_count.l
  EndStructure
  Structure HPDF_TTF_GryphOffsets 
    base_offset.l
    *offsets.l
    *flags.HPDF__BYTE	; 0: unused, 1: used 
  EndStructure
  Structure HPDF_TTF_LongHorMetric 
    advance_width.l
    lsb.l
  EndStructure
  Structure HPDF_TTF_FontHeader 
    version_number.HPDF__BYTE[4]
    font_revision.l
    check_sum_adjustment.l
    magic_number.l
    flags.l
    units_per_em.l
    created.HPDF__BYTE[8]
    modified.HPDF__BYTE[8]
    x_min.l
    y_min.l
    x_max.l
    y_max.l
    mac_style.l
    lowest_rec_ppem.l
    font_direction_hint.l
    index_to_loc_format.l
    glyph_data_format.l
  EndStructure
  Structure HPDF_TTF_NameRecord 
    platform_id.l
    encoding_id.l
    language_id.l
    name_id.l
    length.l
    offset.l
  EndStructure
  Structure HPDF_TTF_NamingTable 
    format.l
    count.l
    string_offset.l
    *name_records.HPDF_TTF_NameRecord
  EndStructure
  Structure HPDF_TTFontDefAttr 
  	base_font.c[#HPDF_LIMIT_MAX_NAME_LEN + 1]
  	first_char.HPDF__BYTE
  	last_char.HPDF__BYTE
  	*char_set.c
  	tag_name.c[#HPDF_TTF_FONT_TAG_LEN + 1]
  	tag_name2.c[(#HPDF_TTF_FONT_TAG_LEN + 1) * 2]
  	header.HPDF_TTF_FontHeader
  	glyph_tbl.HPDF_TTF_GryphOffsets
  	num_glyphs.l
  	name_tbl.HPDF_TTF_NamingTable
  	*h_metric.HPDF_TTF_LongHorMetric
  	num_h_metric.l
  	offset_tbl.HPDF_TTF_OffsetTbl
  	cmap.HPDF_TTF_CmapRange
  	fs_type.l
  	panose.HPDF__BYTE[12]
  	code_page_range1.l
  	code_page_range2.l
  	length1.l
  	embedding.HPDF__BOOL
  	is_cidfont.HPDF__BOOL
  	stream.HPDF_Stream
  EndStructure
  Structure HPDF_CIDFontDefAttrRec 
  	widths.HPDF_List
  	DW.l
  	DW2.l[2]
  EndStructure
  Structure HPDF_GState
    trans_matrix.HPDF_TransMatrix        
    line_width.HPDF__REAL               
    line_cap.HPDF_LineCap
    line_join.HPDF_LineJoin
    miter_limit.HPDF__REAL
    dash_mode.HPDF_DashMode
    flatness.HPDF__REAL
                  
    char_space.HPDF__REAL
    word_space.HPDF__REAL
    h_scalling.HPDF__REAL
    text_leading.HPDF__REAL
    rendering_mode.HPDF_TextRenderingMode  
    text_rise.HPDF__REAL
                  
    cs_fill.HPDF_ColorSpace
    cs_stroke.HPDF_ColorSpace
    rgb_fill.HPDF_RGBColor
    rgb_stroke.HPDF_RGBColor
    cmyk_fill.HPDF_CMYKColor
    cmyk_stroke.HPDF_CMYKColor
    gray_fill.HPDF__REAL
    gray_stroke.HPDF__REAL
                  
    font.HPDF_Font
    font_size.HPDF__REAL
    writing_mode.HPDF_WritingMode
                  
    *prev.HPDF_GState
    depth.l
  EndStructure

  Structure HPDF_PageAttr
    parent.HPDF_Pages         
    fonts.HPDF_Dict          
    xobjects.HPDF_Dict          
    ext_gstates.HPDF_Dict          
    gstate.HPDF_GState        
    str_pos.HPDF_Point         
    cur_pos.HPDF_Point         
    text_pos.HPDF_Point         
    text_matrix.HPDF_TransMatrix   
    gmode.l
    contents.HPDF_Dict          
    stream.HPDF_Stream        
    xref.HPDF_Xref          
    compression_mode.l          
    *ver.l        
  EndStructure
  Structure HPDF_MemStreamAttr 
    buf.HPDF_List  
    buf_siz.l  
    w_pos.l  
    *w_ptr.HPDF__BYTE  
    r_ptr_idx.l  
    r_pos.l  
    *r_ptr.HPDF__BYTE  
  EndStructure
;}
;- Prototypes
;{ Prototypes
  Prototype.l HPDF_Error_Handler(error_no.HPDF__STATUS, detail_no.HPDF__STATUS, *user_data)
  Prototype.l HPDF_Alloc_Func(size.l)
  Prototype.l HPDF_Free_Func(*aptr)
  Prototype.l HPDF_Dict_FreeFunc(*obj.HPDF_Dict)
  Prototype.HPDF__STATUS HPDF_Dict_BeforeWriteFunc(*obj.HPDF_Dict)
  Prototype.HPDF__STATUS HPDF_Dict_AfterWriteFunc(*obj.HPDF_Dict)
  Prototype.HPDF__STATUS HPDF_Dict_OnWriteFunc(*obj.HPDF_Dict, *stream.HPDF_Stream)
  Prototype.HPDF_ByteType HPDF_Encoder_ByteType_Func(*encoder.HPDF_Encoder, *state.HPDF_ParseText)
  Prototype.HPDF__UNICODE HPDF_Encoder_ToUnicode_Func(*encoder.HPDF_Encoder, code.l)
  Prototype.HPDF__STATUS HPDF_Encoder_Write_Func(*encoder.HPDF_Encoder, *out.HPDF_Stream)
  Prototype.HPDF__STATUS HPDF_Encoder_Init_Func(*encoder.HPDF_Encoder)
  Prototype.l HPDF_Encoder_Free_Func(*encoder.HPDF_Encoder)
  Prototype.HPDF__BOOL HPDF_CMapEncoder_ByteType_Func(*encoder.HPDF_Encoder, b.HPDF__BYTE)
  Prototype.HPDF__STATUS HPDF_Stream_Write_Func(*stream.HPDF_Stream, *ptr.HPDF__BYTE, siz.l)
  Prototype.HPDF__STATUS HPDF_Stream_Read_Func(*stream.HPDF_Stream, *ptr.HPDF__BYTE, *siz.l)
  Prototype.HPDF__STATUS HPDF_Stream_Seek_Func(*stream.HPDF_Stream, pos.l, mode.HPDF_WhenceMode)
  Prototype.l HPDF_Stream_Tell_Func(*stream.HPDF_Stream)
  Prototype.l HPDF_Stream_Free_Func(*stream.HPDF_Stream)
  Prototype.l HPDF_Stream_Size_Func(*stream.HPDF_Stream)
  Prototype.l HPDF_FontDef_FreeFunc(*fontdef.HPDF_FontDef)
  Prototype.l HPDF_FontDef_CleanFunc(*fontdef.HPDF_FontDef)
  Prototype.HPDF__STATUS HPDF_FontDef_InitFunc(*fontdef.HPDF_FontDef)
  Prototype.l HPDF_Font_TextWidths_Func(*font.HPDF_Font, *text.HPDF__BYTE, len.l) ; Returns : HPDF_TextWidth
  Prototype.l HPDF_Font_MeasureText_Func(*font.HPDF_Font, *text.HPDF__BYTE, len.l, width.HPDF__REAL, fontsize.HPDF__REAL, charspace.HPDF__REAL, wordspace.HPDF__REAL, wordwrap.HPDF__BOOL, *real_width.HPDF__REAL)
;}

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 1629
; Folding = AAAAAAAAAAAAAAAAAAAAAAA5