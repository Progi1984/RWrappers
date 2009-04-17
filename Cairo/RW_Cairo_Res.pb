;{ Constantes
  #CAIRO_VERSION_MAJOR      = 1
  #CAIRO_VERSION_MINOR      = 8
  #CAIRO_VERSION_MICRO      = 6
  #CAIRO_HAS_IMAGE_SURFACE  = 1
  #CAIRO_HAS_PDF_SURFACE    = 1
  #CAIRO_HAS_PNG_FUNCTIONS  = 1
  #CAIRO_HAS_PS_SURFACE     = 1
  #CAIRO_HAS_SVG_SURFACE    = 1
  #CAIRO_HAS_USER_FONT      = 1
  #CAIRO_HAS_WIN32_FONT     = 1
  #CAIRO_HAS_WIN32_SURFACE  = 1
  
  ; Deprecated
  #CAIRO_FORMAT_RGB16_565   = 4
  ;#CAIRO_FONT_TYPE_ATSUI    = #CAIRO_FONT_TYPE_QUARTZ
;}
;{ Enumerations
  Enumeration ; _cairo_status 
    #CAIRO_STATUS_SUCCESS = 0
    #CAIRO_STATUS_NO_MEMORY
    #CAIRO_STATUS_INVALID_RESTORE
    #CAIRO_STATUS_INVALID_POP_GROUP
    #CAIRO_STATUS_NO_CURRENT_POINT
    #CAIRO_STATUS_INVALID_MATRIX
    #CAIRO_STATUS_INVALID_STATUS
    #CAIRO_STATUS_NULL_POINTER
    #CAIRO_STATUS_INVALID_STRING
    #CAIRO_STATUS_INVALID_PATH_DATA
    #CAIRO_STATUS_READ_ERROR
    #CAIRO_STATUS_WRITE_ERROR
    #CAIRO_STATUS_SURFACE_FINISHED
    #CAIRO_STATUS_SURFACE_TYPE_MISMATCH
    #CAIRO_STATUS_PATTERN_TYPE_MISMATCH
    #CAIRO_STATUS_INVALID_CONTENT
    #CAIRO_STATUS_INVALID_FORMAT
    #CAIRO_STATUS_INVALID_VISUAL
    #CAIRO_STATUS_FILE_NOT_FOUND
    #CAIRO_STATUS_INVALID_DASH
    #CAIRO_STATUS_INVALID_DSC_COMMENT
    #CAIRO_STATUS_INVALID_INDEX
    #CAIRO_STATUS_CLIP_NOT_REPRESENTABLE
    #CAIRO_STATUS_TEMP_FILE_ERROR
    #CAIRO_STATUS_INVALID_STRIDE
    #CAIRO_STATUS_FONT_TYPE_MISMATCH
    #CAIRO_STATUS_USER_FONT_IMMUTABLE
    #CAIRO_STATUS_USER_FONT_ERROR
    #CAIRO_STATUS_NEGATIVE_COUNT
    #CAIRO_STATUS_INVALID_CLUSTERS
    #CAIRO_STATUS_INVALID_SLANT
    #CAIRO_STATUS_INVALID_WEIGHT
    ; after adding a new error: update #CAIRO_STATUS_LAST_STATUS in cairoint.h
  EndEnumeration ; cairo_status_t
  Enumeration ; _cairo_content 
    #CAIRO_CONTENT_COLOR		= $1000
    #CAIRO_CONTENT_ALPHA		= $2000
    #CAIRO_CONTENT_COLOR_ALPHA	= $3000
  EndEnumeration ; cairo_content_t
  Enumeration ; _cairo_operator 
    #CAIRO_OPERATOR_CLEAR
    
    #CAIRO_OPERATOR_SOURCE
    #CAIRO_OPERATOR_OVER
    #CAIRO_OPERATOR_IN
    #CAIRO_OPERATOR_OUT
    #CAIRO_OPERATOR_ATOP
    
    #CAIRO_OPERATOR_DEST
    #CAIRO_OPERATOR_DEST_OVER
    #CAIRO_OPERATOR_DEST_IN
    #CAIRO_OPERATOR_DEST_OUT
    #CAIRO_OPERATOR_DEST_ATOP
    
    #CAIRO_OPERATOR_XOR
    #CAIRO_OPERATOR_ADD
    #CAIRO_OPERATOR_SATURATE
  EndEnumeration ; cairo_operator_t
  Enumeration ; _cairo_antialias 
    #CAIRO_ANTIALIAS_DEFAULT
    #CAIRO_ANTIALIAS_NONE
    #CAIRO_ANTIALIAS_GRAY
    #CAIRO_ANTIALIAS_SUBPIXEL
  EndEnumeration ; cairo_antialias_t
  Enumeration ; _cairo_fill_rule 
    #CAIRO_FILL_RULE_WINDING
    #CAIRO_FILL_RULE_EVEN_ODD
  EndEnumeration ; cairo_fill_rule_t
  Enumeration ; _cairo_line_cap 
    #CAIRO_LINE_CAP_BUTT
    #CAIRO_LINE_CAP_ROUND
    #CAIRO_LINE_CAP_SQUARE
  EndEnumeration ; cairo_line_cap_t
  Enumeration ; _cairo_line_join 
    #CAIRO_LINE_JOIN_MITER
    #CAIRO_LINE_JOIN_ROUND
    #CAIRO_LINE_JOIN_BEVEL
  EndEnumeration ; cairo_line_join_t
  Enumeration ; _cairo_text_cluster_flags 
    #CAIRO_TEXT_CLUSTER_FLAG_BACKWARD = $00000001
  EndEnumeration ; cairo_text_cluster_flags_t
  Enumeration ; _cairo_font_slant 
    #CAIRO_FONT_SLANT_NORMAL
    #CAIRO_FONT_SLANT_ITALIC
    #CAIRO_FONT_SLANT_OBLIQUE
  EndEnumeration ; cairo_font_slant_t
  Enumeration ; _cairo_font_weight 
    #CAIRO_FONT_WEIGHT_NORMAL
    #CAIRO_FONT_WEIGHT_BOLD
  EndEnumeration ; cairo_font_weight_t
  Enumeration ; _cairo_subpixel_order 
    #CAIRO_SUBPIXEL_ORDER_DEFAULT
    #CAIRO_SUBPIXEL_ORDER_RGB
    #CAIRO_SUBPIXEL_ORDER_BGR
    #CAIRO_SUBPIXEL_ORDER_VRGB
    #CAIRO_SUBPIXEL_ORDER_VBGR
  EndEnumeration ; cairo_subpixel_order_t
  Enumeration ; _cairo_hint_style 
    #CAIRO_HINT_STYLE_DEFAULT
    #CAIRO_HINT_STYLE_NONE
    #CAIRO_HINT_STYLE_SLIGHT
    #CAIRO_HINT_STYLE_MEDIUM
    #CAIRO_HINT_STYLE_FULL
  EndEnumeration ; cairo_hint_style_t
  Enumeration ; _cairo_hint_metrics 
    #CAIRO_HINT_METRICS_DEFAULT
    #CAIRO_HINT_METRICS_OFF
    #CAIRO_HINT_METRICS_ON
  EndEnumeration ; cairo_hint_metrics_t
  Enumeration ; _cairo_font_type 
    #CAIRO_FONT_TYPE_TOY
    #CAIRO_FONT_TYPE_FT
    #CAIRO_FONT_TYPE_WIN32
    #CAIRO_FONT_TYPE_QUARTZ
    #CAIRO_FONT_TYPE_USER
  EndEnumeration ; cairo_font_type_t
  Enumeration ; _cairo_path_data_type 
    #CAIRO_PATH_MOVE_TO
    #CAIRO_PATH_LINE_TO
    #CAIRO_PATH_CURVE_TO
    #CAIRO_PATH_CLOSE_PATH
  EndEnumeration ; cairo_path_data_type_t
  Enumeration ; _cairo_surface_type 
    #CAIRO_SURFACE_TYPE_IMAGE
    #CAIRO_SURFACE_TYPE_PDF
    #CAIRO_SURFACE_TYPE_PS
    #CAIRO_SURFACE_TYPE_XLIB
    #CAIRO_SURFACE_TYPE_XCB
    #CAIRO_SURFACE_TYPE_GLITZ
    #CAIRO_SURFACE_TYPE_QUARTZ
    #CAIRO_SURFACE_TYPE_WIN32
    #CAIRO_SURFACE_TYPE_BEOS
    #CAIRO_SURFACE_TYPE_DIRECTFB
    #CAIRO_SURFACE_TYPE_SVG
    #CAIRO_SURFACE_TYPE_OS2
    #CAIRO_SURFACE_TYPE_WIN32_PRINTING
    #CAIRO_SURFACE_TYPE_QUARTZ_IMAGE
  EndEnumeration ; cairo_surface_type_t
  Enumeration ; _cairo_format 
    #CAIRO_FORMAT_ARGB32
    #CAIRO_FORMAT_RGB24
    #CAIRO_FORMAT_A8
    #CAIRO_FORMAT_A1
    ; The value of 4 is reserved by a deprecated enum value.
    ; The Next format added must have an explicit value of 5.
    ; #CAIRO_FORMAT_RGB16_565 = 4
  EndEnumeration ; cairo_format_t
  Enumeration ; _cairo_pattern_type 
    #CAIRO_PATTERN_TYPE_SOLID
    #CAIRO_PATTERN_TYPE_SURFACE
    #CAIRO_PATTERN_TYPE_LINEAR
    #CAIRO_PATTERN_TYPE_RADIAL
  EndEnumeration ; cairo_pattern_type_t
  Enumeration ; _cairo_extend 
    #CAIRO_EXTEND_NONE
    #CAIRO_EXTEND_REPEAT
    #CAIRO_EXTEND_REFLECT
    #CAIRO_EXTEND_PAD
  EndEnumeration ; cairo_extend_t
  Enumeration ; _cairo_filter 
    #CAIRO_FILTER_FAST
    #CAIRO_FILTER_GOOD
    #CAIRO_FILTER_BEST
    #CAIRO_FILTER_NEAREST
    #CAIRO_FILTER_BILINEAR
    #CAIRO_FILTER_GAUSSIAN
  EndEnumeration ; cairo_filter_t
  Enumeration ; _cairo_ps_level 
    #CAIRO_PS_LEVEL_2
    #CAIRO_PS_LEVEL_3
  EndEnumeration ; cairo_ps_level_t
  Enumeration ; _cairo_svg_version 
    #CAIRO_SVG_VERSION_1_1
    #CAIRO_SVG_VERSION_1_2
  EndEnumeration ; cairo_svg_version_t
;}
;{ Macros
  Macro M_CAIRO_VERSION_ENCODE(major, minor, micro) 
    (((major) * 10000) + ((minor) * 100) + ((micro) * 1))
  EndMacro
  Macro M_CAIRO_VERSION
    CAIRO_VERSION_ENCODE(#CAIRO_VERSION_MAJOR, #CAIRO_VERSION_MINOR, #CAIRO_VERSION_MICRO)
  EndMacro
  Macro M_CAIRO_VERSION_STRINGIZE_(major, minor, micro)	
  	#major"."#minor"."#micro
  EndMacro
  Macro M_CAIRO_VERSION_STRINGIZE(major, minor, micro)
  	CAIRO_VERSION_STRINGIZE_(major, minor, micro)
  EndMacro
  Macro M_CAIRO_VERSION_STRING 
    CAIRO_VERSION_STRINGIZE(#CAIRO_VERSION_MAJOR, #CAIRO_VERSION_MINOR, #CAIRO_VERSION_MICRO)
  EndMacro
  Macro cairo_pattern
    l
  EndMacro
  Macro cairo_pattern_t
    l
  EndMacro
  Macro cairo_bool_t
    l
  EndMacro
  Macro cairo_scaled_font
    l
  EndMacro
  Macro cairo_scaled_font_t
    l
  EndMacro
  Macro cairo_font_face
    l
  EndMacro
  Macro cairo_font_face_t
    l
  EndMacro
  Macro cairo_font_options
    l
  EndMacro
  Macro cairo_font_options_t
    l
  EndMacro
  Macro cairo_path_data_t
    cairo_path_data_t
  EndMacro
  Macro cairo_status
    l
  EndMacro
  Macro cairo_status_t
    l
  EndMacro
  Macro cairo_content
    l
  EndMacro
  Macro cairo_content_t
    l
  EndMacro
  Macro cairo_operator
    l
  EndMacro
  Macro cairo_operator_t
    l
  EndMacro
  Macro cairo_antialias
    l
  EndMacro
  Macro cairo_antialias_t
    l
  EndMacro
  Macro cairo_fill_rule
    l
  EndMacro
  Macro cairo_fill_rule_t
    l
  EndMacro
  Macro cairo_line_cap
    l
  EndMacro
  Macro cairo_line_cap_t
    l
  EndMacro
  Macro cairo_line_join
    l
  EndMacro
  Macro cairo_line_join_t
    l
  EndMacro
  Macro cairo_text_cluster_flags
    l
  EndMacro
  Macro cairo_text_cluster_flags_t
    l
  EndMacro
  Macro cairo_font_slant
    l
  EndMacro
  Macro cairo_font_slant_t
    l
  EndMacro
  Macro cairo_font_weight
    l
  EndMacro
  Macro cairo_font_weight_t
    l
  EndMacro
  Macro cairo_subpixel_order
    l
  EndMacro
  Macro cairo_subpixel_order_t
    l
  EndMacro
  Macro cairo_hint_style
    l
  EndMacro
  Macro cairo_hint_style_t
    l
  EndMacro
  Macro cairo_hint_metrics
    l
  EndMacro
  Macro cairo_hint_metrics_t
    l
  EndMacro
  Macro cairo_font_type
    l
  EndMacro
  Macro cairo_font_type_t
    l
  EndMacro
  Macro cairo_path_data_type
    l
  EndMacro
  Macro cairo_path_data_type_t
    l
  EndMacro
  Macro cairo_surface_type
    l
  EndMacro
  Macro cairo_surface_type_t
    l
  EndMacro
  Macro cairo_format
    l
  EndMacro
  Macro cairo_format_t
    l
  EndMacro
  Macro cairo_pattern_type
    l
  EndMacro
  Macro cairo_pattern_type_t
    l
  EndMacro
  Macro cairo_extend
    l
  EndMacro
  Macro cairo_extend_t
    l
  EndMacro
  Macro cairo_filter
    l
  EndMacro
  Macro cairo_filter_t
    l
  EndMacro
  Macro cairo_ps_level
    l
  EndMacro
  Macro cairo_ps_level_t
    l
  EndMacro
  Macro cairo_svg_version
    l
  EndMacro
  Macro cairo_svg_version_t
    l
  EndMacro
  Macro cairo_t
    l
  EndMacro
  Macro cairo_surface_t
    l
  EndMacro
  Macro cairo_user_data_key_t
    _cairo_user_data_key
  EndMacro
  Macro cairo_path_t
    cairo_path
  EndMacro
  Macro cairo_matrix_t
    _cairo_matrix
  EndMacro
  Macro cairo_rectangle_list_t
    _cairo_rectangle_list
  EndMacro

;} 
;{ Structures
  Structure _cairo_matrix ; cairo_matrix_t
    xx.d
    yx.d
    xy.d
    yy.d
    x0.d
    y0.d
  EndStructure
  Structure _cairo_user_data_key ; cairo_user_data_key_t
    unused.l
  EndStructure 
  Structure _cairo_rectangle ; cairo_rectangle_t
    x.d
    y.d
    width.d
    height.d
  EndStructure 
  Structure _cairo_rectangle_list ; cairo_rectangle_list_t
    status.cairo_status_t
    *rectangles.cairo_rectangle_t 
    num_rectangles.l
  EndStructure
  Structure cairo_glyph_t
    index.l
    x.d
    y.d
  EndStructure
  Structure cairo_text_cluster_t
    num_bytes.l
    num_glyphs.l
  EndStructure
  Structure cairo_text_extents_t
    x_bearing.d
    y_bearing.d
    width.d
    height.d
    x_advance.d
    y_advance.d
  EndStructure
  Structure cairo_font_extents_t
    ascent.d
    descent.d
    height.d
    max_x_advance.d
    max_y_advance.d
  EndStructure
  Structure _cairo_path_data_t
    StructureUnion ; header
      type.cairo_path_data_type_t
      length.l
    EndStructureUnion
    StructureUnion ; point
      x.d
      y.d
    EndStructureUnion
  EndStructure
  Structure cairo_path
    status.cairo_status_t
    *data_ ;.cairo_path_data_t
    num_data.l
  EndStructure
;}
;{ Prototypes
  ; typedef void (*cairo_destroy_func_t) (void *Data);
  ; typedef cairo_status_t (*cairo_write_func_t) (void *closure, const unsigned char *Data, unsigned int	   length);
  ; typedef cairo_status_t (*cairo_read_func_t) (void *closure, unsigned char	*Data, unsigned int	length);
  ; typedef cairo_status_t (*cairo_user_scaled_font_init_func_t) (cairo_scaled_font_t  *scaled_font, cairo_t *cr, cairo_font_extents_t *extents);
  ; typedef cairo_status_t (*cairo_user_scaled_font_render_glyph_func_t) (cairo_scaled_font_t  *scaled_font, unsigned long glyph, cairo_t *cr, cairo_text_extents_t *extents);
  ; typedef cairo_status_t (*cairo_user_scaled_font_text_to_glyphs_func_t) (cairo_scaled_font_t *scaled_font, const char *utf8, int utf8_len, cairo_glyph_t **glyphs, int *num_glyphs, cairo_text_cluster_t **clusters, int *num_clusters, cairo_text_cluster_flags_t *cluster_flags);
  ; typedef cairo_status_t (*cairo_user_scaled_font_unicode_to_glyph_func_t) (cairo_scaled_font_t *scaled_font, unsigned long unicode, unsigned long *glyph_index);
;}
