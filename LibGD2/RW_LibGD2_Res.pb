;{ Constantes
  #ENTITY_NAME_LENGTH_MAX = 8
  #NR_OF_ENTITIES         = 252
  #GD_H                   = 1
  #GD_MAJOR_VERSION       = 2
  #GD_MINOR_VERSION       = 0
  #GD_RELEASE_VERSION     = 34
  #GD_EXTRA_VERSION       = ""
  #GD_VERSION_STRING      = "2.0.34"
  #gdMaxColors            = 256
  #gdAlphaMax             = 127
  #gdAlphaOpaque          = 0
  #gdAlphaTransparent     = 127
  #gdRedMax               = 255
  #gdGreenMax             = 255
  #gdBlueMax              = 255
  #gdDashSize             = 4
  #gdStyled               = -2
  #gdBrushed              = -3
  #gdStyledBrushed        = -4
  #gdTiled                = -5
  #gdTransparent          = -6
  #gdAntiAliased          = -7
  
  #gdFTEX_LINESPACE       = 1
  #gdFTEX_CHARMAP         = 2
  #gdFTEX_RESOLUTION      = 4
  #gdFTEX_DISABLE_KERNING = 8
  #gdFTEX_XSHOW           = 16
  #gdFTEX_FONTPATHNAME    = 32
  #gdFTEX_FONTCONFIG      = 64
  #gdFTEX_RETURNFONTPATHNAME  = 128

  #gdFTEX_Unicode         = 0
  #gdFTEX_Shift_JIS       = 1
  #gdFTEX_Big5            = 2
  #gdFTEX_Adobe_Custom    = 3

  
  #gdArc                  = 0
  #gdPie                  = #gdArc
  #gdChord                = 1
  #gdNoFill               = 2
  #gdEdged                = 4
  
  #GD2_CHUNKSIZE          = 128
  #GD2_CHUNKSIZE_MIN	    = 64
  #GD2_CHUNKSIZE_MAX      = 4096
  
  #GD2_VERS               = 2
  #GD2_ID                 = "gd2"
  
  #GD2_FMT_RAW            = 1
  #GD2_FMT_COMPRESSED     = 2
  
  #GD_CMP_IMAGE		        = 1	; Actual image IS different 
  #GD_CMP_NUM_COLORS      = 2	; Number of Colours in pallette differ 
  #GD_CMP_COLOR		        = 4	; Image colours differ 
  #GD_CMP_SIZE_X		      = 8	; Image width differs 
  #GD_CMP_SIZE_Y		      = 16	; Image heights differ 
  #GD_CMP_TRANSPARENT	    = 32	; Transparent colour 
  #GD_CMP_BACKGROUND	    = 64	; Background colour 
  #GD_CMP_INTERLACE	      = 128	; Interlaced setting 
  #GD_CMP_TRUECOLOR	      = 256	; Truecolor vs palette differs 
  
  ; resolution affects ttf font rendering, particularly hinting 
  #GD_RESOLUTION          = 96	; pixels per inch 
  
  #WBMP_WHITE             = 1
  #WBMP_BLACK             = 0
;}
;{ Enumerations
  Enumeration 
  	#gdDisposalUnknown
  	#gdDisposalNone
  	#gdDisposalRestoreBackground
  	#gdDisposalRestorePrevious
  EndEnumeration
;}
;{ Structures
  Structure entities_s
  	name.s
  	value.l
  EndStructure
  Structure gdImage
    ; Palette-based image pixels 
    *pixels
    sx.l
    sy.l
    ; These are valid in palette images only. See also
      ; 'alpha', which appears later in the Structure To
      ; preserve binary backwards compatibility 
    colorsTotal.l
    red.l[#gdMaxColors]
    green.l[#gdMaxColors]
    blue.l[#gdMaxColors]
    open.l[#gdMaxColors]
    ; For backwards compatibility, this is set To the
      ; first palette entry With 100% transparency,
      ; And is also set And reset by the 
      ; gdImageColorTransparent function. Newer
      ; applications can allocate palette entries
      ; With any desired level of transparency; however,
      ; bear in mind that many viewers, notably
      ; many web browsers, fail To implement
      ; full alpha channel For PNG And provide
      ; support For full opacity Or transparency only. 
    transparent.l
    *polyInts
    polyAllocated.l
    *brush.gdImage
    *tile.gdImage
    brushColorMap.l[#gdMaxColors]
    tileColorMap.l[#gdMaxColors]
    styleLength.l
    stylePos.l
    *style
    interlace.l
    ; New in 2.0: thickness of line. Initialized To 1. 
    thick.l
    ; New in 2.0: alpha channel For palettes. Note that only
      ; Macintosh Internet Explorer And (possibly) Netscape 6
      ; really support multiple levels of transparency in
      ; palettes, To my knowledge, As of 2/15/01. Most
      ; common browsers will display 100% opaque And
      ; 100% transparent correctly, And do something 
      ; unpredictable And/Or undesirable For levels
      ; in between. TBB 
    alpha.l[#gdMaxColors]
    ; Truecolor flag And pixels. New 2.0 fields appear here at the
      ; End To minimize breakage of existing object code. 
    trueColor.l
    *tpixels
    ; Should alpha channel be copied, Or applied, each time a
      ; pixel is drawn? This applies To truecolor images only.
      ; No attempt is made To alpha-blend in palette images,
      ; even If semitransparent palette entries exist. 
      ; To do that, build your image As a truecolor image,
      ; then quantize down To 8 bits. 
    alphaBlendingFlag.l
    ; Should the alpha channel of the image be saved? This affects
      ; PNG at the moment; other future formats may also
      ; have that capability. JPEG doesn't. */
    saveAlphaFlag.l
    ; There should NEVER BE ACCESSOR MACROS For ITEMS BELOW HERE, so this
      ; part of the Structure can be safely changed in new releases. 
    ; 2.0.12: anti-aliased globals. 2.0.26: just a few vestiges after
     ; switching To the fast, memory-cheap implementation from PHP-gd. 
    AA.l
    AA_color.l
    AA_dont_blend.l
    ; 2.0.12: simple clipping rectangle. These values
     ; must be checked For safety when set; please use
     ; gdImageSetClip 
    cx1.l
    cy1.l
    cx2.l
    cy2.l
  EndStructure
  Structure gdFont
    ; # of characters in font 
    nchars.l
    ; First character is numbered... (usually 32 = space) 
    offset.l
    ; Character width And height 
    w.l
    h.l
    ; Font Data array of characters, one row after another.
      ; Easily included in code, also easily loaded from
      ; Data files. 
    data_.s
  EndStructure
  Structure gdSource
    *source
    *context
  EndStructure
  Structure gdFTStringExtra
    flags.l			  ; Logical Or of gdFTEX_ values 
    linespacing.d	; fine tune line spacing For '\n' 
    charmap.l		  ; TBB: 2.0.12: may be gdFTEX_Unicode,
				            ; gdFTEX_Shift_JIS, gdFTEX_Big5,
				            ; Or gdFTEX_Adobe_Custom
				            ; when Not specified, maps are searched
				            ; For in the above order. 
    hdpi.l        ; If (flags & gdFTEX_RESOLUTION) 
    vdpi.l		    ; If (flags & gdFTEX_RESOLUTION) 
    xshow.s	      ; If (flags & gdFTEX_XSHOW)
			              ; then, on Return, xshow is a malloc'ed
			              ; string contining xshow position Data For
			              ; the last string.
			              ; NB. The caller is responsible For gdFree'ing
			              ; the xshow string. 
    fontpath.s	  ; If (flags & gdFTEX_RETURNFONTPATHNAME)
                    ; then, on Return, fontpath is a malloc'ed
                    ; string containing the actual font file path name
                    ; used, which can be interesting when fontconfig
                    ; is in use. 
                    ; The caller is responsible For gdFree'ing the
                    ; fontpath string.
  EndStructure
  Structure gdPoint
    x.l
    y.l
  EndStructure
  Structure gdSink
    *sink
    *context;
  EndStructure
  Structure gdIOCtx
    *getC
    *getBuf
    *putC
    *putBuf
    ; seek must Return 1 on SUCCESS, 0 on FAILURE. Unlike fseek! 
    *seek
    *tell
    *gd_free
  EndStructure 
  Structure gdCache_element_s
    *Next_.gdCache_element_t
    *userdata
  EndStructure
  Structure gdCache_head_s
    *mru.gdCache_element_t
    size.l
    error.s
    *gdCacheTest    ; gdCacheTestFn_t
    *gdCacheFetch   ; gdCacheFetchFn_t
    *gdCacheRelease ; gdCacheReleaseFn_t
  EndStructure
  Structure Wbmp
    type.l		; type of the wbmp
    width.l		;	width of the image
    height.l	;	height of the image
    *bitmap.l	;	pointer To Data: 0 = WHITE , 1 = BLACK
  EndStructure
;}
;{ Linked Lists
  Global NewList entities.entities_s()
  ;{
    AddElement(entities()) : entities()\name = "AElig"    : entities()\value = 198
    AddElement(entities()) : entities()\name = "Aacute"   : entities()\value = 193
    AddElement(entities()) : entities()\name = "Acirc"    : entities()\value = 194
    AddElement(entities()) : entities()\name = "Agrave"   : entities()\value = 192
    AddElement(entities()) : entities()\name = "Alpha"    : entities()\value = 913
    AddElement(entities()) : entities()\name = "Aring"    : entities()\value = 197
    AddElement(entities()) : entities()\name = "Atilde"   : entities()\value = 195
    AddElement(entities()) : entities()\name = "Auml"     : entities()\value = 196
    AddElement(entities()) : entities()\name = "Beta"     : entities()\value = 914
    AddElement(entities()) : entities()\name = "Ccedil"   : entities()\value = 199
    AddElement(entities()) : entities()\name = "Chi"      : entities()\value = 935
    AddElement(entities()) : entities()\name = "Dagger"   : entities()\value = 8225
    AddElement(entities()) : entities()\name = "Delta"    : entities()\value = 916
    AddElement(entities()) : entities()\name = "ETH"      : entities()\value = 208
    AddElement(entities()) : entities()\name = "Eacute"   : entities()\value = 201
    AddElement(entities()) : entities()\name = "Ecirc"    : entities()\value = 202
    AddElement(entities()) : entities()\name = "Egrave"   : entities()\value = 200
    AddElement(entities()) : entities()\name = "Epsilon"  : entities()\value = 917
    AddElement(entities()) : entities()\name = "Eta"      : entities()\value = 919
    AddElement(entities()) : entities()\name = "Euml"     : entities()\value = 203
    AddElement(entities()) : entities()\name = "Gamma"    : entities()\value = 915
    AddElement(entities()) : entities()\name = "Iacute"   : entities()\value = 205
    AddElement(entities()) : entities()\name = "Icirc"    : entities()\value = 206
    AddElement(entities()) : entities()\name = "Igrave"   : entities()\value = 204
    AddElement(entities()) : entities()\name = "Iota"     : entities()\value = 921
    AddElement(entities()) : entities()\name = "Iuml"     : entities()\value = 207
    AddElement(entities()) : entities()\name = "Kappa"    : entities()\value = 922
    AddElement(entities()) : entities()\name = "Lambda"   : entities()\value = 923
    AddElement(entities()) : entities()\name = "Mu"       : entities()\value = 924
    AddElement(entities()) : entities()\name = "Ntilde"   : entities()\value = 209
    AddElement(entities()) : entities()\name = "Nu"       : entities()\value = 925
    AddElement(entities()) : entities()\name = "OElig"    : entities()\value = 338
    AddElement(entities()) : entities()\name = "Oacute"   : entities()\value = 211
    AddElement(entities()) : entities()\name = "Ocirc"    : entities()\value = 212
    AddElement(entities()) : entities()\name = "Ograve"   : entities()\value = 210
    AddElement(entities()) : entities()\name = "Omega"    : entities()\value = 937
    AddElement(entities()) : entities()\name = "Omicron"  : entities()\value = 927
    AddElement(entities()) : entities()\name = "Oslash"   : entities()\value = 216
    AddElement(entities()) : entities()\name = "Otilde"   : entities()\value = 213
    AddElement(entities()) : entities()\name = "Ouml"     : entities()\value = 214
    AddElement(entities()) : entities()\name = "Phi"      : entities()\value = 934
    AddElement(entities()) : entities()\name = "Pi"       : entities()\value = 928
    AddElement(entities()) : entities()\name = "Prime"    : entities()\value = 8243
    AddElement(entities()) : entities()\name = "Psi"      : entities()\value = 936
    AddElement(entities()) : entities()\name = "Rho"      : entities()\value = 929
    AddElement(entities()) : entities()\name = "Scaron"   : entities()\value = 352
    AddElement(entities()) : entities()\name = "Sigma"    : entities()\value = 931
    AddElement(entities()) : entities()\name = "THORN"    : entities()\value = 222
    AddElement(entities()) : entities()\name = "Tau"      : entities()\value = 932
    AddElement(entities()) : entities()\name = "Theta"    : entities()\value = 920
    AddElement(entities()) : entities()\name = "Uacute"   : entities()\value = 218
    AddElement(entities()) : entities()\name = "Ucirc"    : entities()\value = 219
    AddElement(entities()) : entities()\name = "Ugrave"   : entities()\value = 217
    AddElement(entities()) : entities()\name = "Upsilon"  : entities()\value = 933
    AddElement(entities()) : entities()\name = "Uuml"     : entities()\value = 220
    AddElement(entities()) : entities()\name = "Xi"       : entities()\value = 926
    AddElement(entities()) : entities()\name = "Yacute"   : entities()\value = 221
    AddElement(entities()) : entities()\name = "Yuml"     : entities()\value = 376
    AddElement(entities()) : entities()\name = "Zeta"     : entities()\value = 918
    AddElement(entities()) : entities()\name = "aacute"   : entities()\value = 225
    AddElement(entities()) : entities()\name = "acirc"    : entities()\value = 226
    AddElement(entities()) : entities()\name = "acute"    : entities()\value = 180
    AddElement(entities()) : entities()\name = "aelig"    : entities()\value = 230
    AddElement(entities()) : entities()\name = "agrave"   : entities()\value = 224
    AddElement(entities()) : entities()\name = "alefsym"  : entities()\value = 8501
    AddElement(entities()) : entities()\name = "alpha"    : entities()\value = 945
    AddElement(entities()) : entities()\name = "amp"      : entities()\value = 38
    AddElement(entities()) : entities()\name = "and"      : entities()\value = 8743
    AddElement(entities()) : entities()\name = "ang"      : entities()\value = 8736
    AddElement(entities()) : entities()\name = "aring"    : entities()\value = 229
    AddElement(entities()) : entities()\name = "asymp"    : entities()\value = 8776
    AddElement(entities()) : entities()\name = "atilde"   : entities()\value = 227
    AddElement(entities()) : entities()\name = "auml"     : entities()\value = 228
    AddElement(entities()) : entities()\name = "bdquo"    : entities()\value = 8222
    AddElement(entities()) : entities()\name = "beta"     : entities()\value = 946
    AddElement(entities()) : entities()\name = "brvbar"   : entities()\value = 166
    AddElement(entities()) : entities()\name = "bull"     : entities()\value = 8226
    AddElement(entities()) : entities()\name = "cap"      : entities()\value = 8745
    AddElement(entities()) : entities()\name = "ccedil"   : entities()\value = 231
    AddElement(entities()) : entities()\name = "cedil"    : entities()\value = 184
    AddElement(entities()) : entities()\name = "cent"     : entities()\value = 162
    AddElement(entities()) : entities()\name = "chi"      : entities()\value = 967
    AddElement(entities()) : entities()\name = "circ"     : entities()\value = 710
    AddElement(entities()) : entities()\name = "clubs"    : entities()\value = 9827
    AddElement(entities()) : entities()\name = "cong"     : entities()\value = 8773
    AddElement(entities()) : entities()\name = "copy"     : entities()\value = 169
    AddElement(entities()) : entities()\name = "crarr"    : entities()\value = 8629
    AddElement(entities()) : entities()\name = "cup"      : entities()\value = 8746
    AddElement(entities()) : entities()\name = "curren"   : entities()\value = 164
    AddElement(entities()) : entities()\name = "dArr"     : entities()\value = 8659
    AddElement(entities()) : entities()\name = "dagger"   : entities()\value = 8224
    AddElement(entities()) : entities()\name = "darr"     : entities()\value = 8595
    AddElement(entities()) : entities()\name = "deg"      : entities()\value = 176
    AddElement(entities()) : entities()\name = "delta"    : entities()\value = 948
    AddElement(entities()) : entities()\name = "diams"    : entities()\value = 9830
    AddElement(entities()) : entities()\name = "divide"   : entities()\value = 247
    AddElement(entities()) : entities()\name = "eacute"   : entities()\value = 233
    AddElement(entities()) : entities()\name = "ecirc"    : entities()\value = 234
    AddElement(entities()) : entities()\name = "egrave"   : entities()\value = 232
    AddElement(entities()) : entities()\name = "empty"    : entities()\value = 8709
    AddElement(entities()) : entities()\name = "emsp"     : entities()\value = 8195
    AddElement(entities()) : entities()\name = "ensp"     : entities()\value = 8194
    AddElement(entities()) : entities()\name = "epsilon"  : entities()\value = 949
    AddElement(entities()) : entities()\name = "equiv"    : entities()\value = 8801
    AddElement(entities()) : entities()\name = "eta"      : entities()\value = 951
    AddElement(entities()) : entities()\name = "eth"      : entities()\value = 240
    AddElement(entities()) : entities()\name = "euml"     : entities()\value = 235
    AddElement(entities()) : entities()\name = "euro"     : entities()\value = 8364
    AddElement(entities()) : entities()\name = "exist"    : entities()\value = 8707
    AddElement(entities()) : entities()\name = "fnof"     : entities()\value = 402
    AddElement(entities()) : entities()\name = "forall"   : entities()\value = 8704
    AddElement(entities()) : entities()\name = "frac12"   : entities()\value = 189
    AddElement(entities()) : entities()\name = "frac14"   : entities()\value = 188
    AddElement(entities()) : entities()\name = "frac34"   : entities()\value = 190
    AddElement(entities()) : entities()\name = "frasl"    : entities()\value = 8260
    AddElement(entities()) : entities()\name = "gamma"    : entities()\value = 947
    AddElement(entities()) : entities()\name = "ge"       : entities()\value = 8805
    AddElement(entities()) : entities()\name = "gt"       : entities()\value = 62
    AddElement(entities()) : entities()\name = "hArr"     : entities()\value = 8660
    AddElement(entities()) : entities()\name = "harr"     : entities()\value = 8596
    AddElement(entities()) : entities()\name = "hearts"   : entities()\value = 9829
    AddElement(entities()) : entities()\name = "hellip"   : entities()\value = 8230
    AddElement(entities()) : entities()\name = "iacute"   : entities()\value = 237
    AddElement(entities()) : entities()\name = "icirc"    : entities()\value = 238
    AddElement(entities()) : entities()\name = "iexcl"    : entities()\value = 161
    AddElement(entities()) : entities()\name = "igrave"   : entities()\value = 236
    AddElement(entities()) : entities()\name = "image"    : entities()\value = 8465
    AddElement(entities()) : entities()\name = "infin"    : entities()\value = 8734
    AddElement(entities()) : entities()\name = "int"      : entities()\value = 8747
    AddElement(entities()) : entities()\name = "iota"     : entities()\value = 953
    AddElement(entities()) : entities()\name = "iquest"   : entities()\value = 191
    AddElement(entities()) : entities()\name = "isin"     : entities()\value = 8712
    AddElement(entities()) : entities()\name = "iuml"     : entities()\value = 239
    AddElement(entities()) : entities()\name = "kappa"    : entities()\value = 954
    AddElement(entities()) : entities()\name = "lArr"     : entities()\value = 8656
    AddElement(entities()) : entities()\name = "lambda"   : entities()\value = 955
    AddElement(entities()) : entities()\name = "lang"     : entities()\value = 9001
    AddElement(entities()) : entities()\name = "laquo"    : entities()\value = 171
    AddElement(entities()) : entities()\name = "larr"     : entities()\value = 8592
    AddElement(entities()) : entities()\name = "lceil"    : entities()\value = 8968
    AddElement(entities()) : entities()\name = "ldquo"    : entities()\value = 8220
    AddElement(entities()) : entities()\name = "le"       : entities()\value = 8804
    AddElement(entities()) : entities()\name = "lfloor"   : entities()\value = 8970
    AddElement(entities()) : entities()\name = "lowast"   : entities()\value = 8727
    AddElement(entities()) : entities()\name = "loz"      : entities()\value = 9674
    AddElement(entities()) : entities()\name = "lrm"      : entities()\value = 8206
    AddElement(entities()) : entities()\name = "lsaquo"   : entities()\value = 8249
    AddElement(entities()) : entities()\name = "lsquo"    : entities()\value = 8216
    AddElement(entities()) : entities()\name = "lt"       : entities()\value = 60
    AddElement(entities()) : entities()\name = "macr"     : entities()\value = 175
    AddElement(entities()) : entities()\name = "mdash"    : entities()\value = 8212
    AddElement(entities()) : entities()\name = "micro"    : entities()\value = 181
    AddElement(entities()) : entities()\name = "middot"   : entities()\value = 183
    AddElement(entities()) : entities()\name = "minus"    : entities()\value = 8722
    AddElement(entities()) : entities()\name = "mu"       : entities()\value = 956
    AddElement(entities()) : entities()\name = "nabla"    : entities()\value = 8711
    AddElement(entities()) : entities()\name = "nbsp"     : entities()\value = 160
    AddElement(entities()) : entities()\name = "ndash"    : entities()\value = 8211
    AddElement(entities()) : entities()\name = "ne"       : entities()\value = 8800
    AddElement(entities()) : entities()\name = "ni"       : entities()\value = 8715
    AddElement(entities()) : entities()\name = "not"      : entities()\value = 172
    AddElement(entities()) : entities()\name = "notin"    : entities()\value = 8713
    AddElement(entities()) : entities()\name = "nsub"     : entities()\value = 8836
    AddElement(entities()) : entities()\name = "ntilde"   : entities()\value = 241
    AddElement(entities()) : entities()\name = "nu"       : entities()\value = 957
    AddElement(entities()) : entities()\name = "oacute"   : entities()\value = 243
    AddElement(entities()) : entities()\name = "ocirc"    : entities()\value = 244
    AddElement(entities()) : entities()\name = "oelig"    : entities()\value = 339
    AddElement(entities()) : entities()\name = "ograve"   : entities()\value = 242
    AddElement(entities()) : entities()\name = "oline"    : entities()\value = 8254
    AddElement(entities()) : entities()\name = "omega"    : entities()\value = 969
    AddElement(entities()) : entities()\name = "omicron"  : entities()\value = 959
    AddElement(entities()) : entities()\name = "oplus"    : entities()\value = 8853
    AddElement(entities()) : entities()\name = "or"       : entities()\value = 8744
    AddElement(entities()) : entities()\name = "ordf"     : entities()\value = 170
    AddElement(entities()) : entities()\name = "ordm"     : entities()\value = 186
    AddElement(entities()) : entities()\name = "oslash"   : entities()\value = 248
    AddElement(entities()) : entities()\name = "otilde"   : entities()\value = 245
    AddElement(entities()) : entities()\name = "otimes"   : entities()\value = 8855
    AddElement(entities()) : entities()\name = "ouml"     : entities()\value = 246
    AddElement(entities()) : entities()\name = "para"     : entities()\value = 182
    AddElement(entities()) : entities()\name = "part"     : entities()\value = 8706
    AddElement(entities()) : entities()\name = "permil"   : entities()\value = 8240
    AddElement(entities()) : entities()\name = "perp"     : entities()\value = 8869
    AddElement(entities()) : entities()\name = "phi"      : entities()\value = 966
    AddElement(entities()) : entities()\name = "pi"       : entities()\value = 960
    AddElement(entities()) : entities()\name = "piv"      : entities()\value = 982
    AddElement(entities()) : entities()\name = "plusmn"   : entities()\value = 177
    AddElement(entities()) : entities()\name = "pound"    : entities()\value = 163
    AddElement(entities()) : entities()\name = "prime"    : entities()\value = 8242
    AddElement(entities()) : entities()\name = "prod"     : entities()\value = 8719
    AddElement(entities()) : entities()\name = "prop"     : entities()\value = 8733
    AddElement(entities()) : entities()\name = "psi"      : entities()\value = 968
    AddElement(entities()) : entities()\name = "quot"     : entities()\value = 34
    AddElement(entities()) : entities()\name = "rArr"     : entities()\value = 8658
    AddElement(entities()) : entities()\name = "radic"    : entities()\value = 8730
    AddElement(entities()) : entities()\name = "rang"     : entities()\value = 9002
    AddElement(entities()) : entities()\name = "raquo"    : entities()\value = 187
    AddElement(entities()) : entities()\name = "rarr"     : entities()\value = 8594
    AddElement(entities()) : entities()\name = "rceil"    : entities()\value = 8969
    AddElement(entities()) : entities()\name = "rdquo"    : entities()\value = 8221
    AddElement(entities()) : entities()\name = "real"     : entities()\value = 8476
    AddElement(entities()) : entities()\name = "reg"      : entities()\value = 174
    AddElement(entities()) : entities()\name = "rfloor"   : entities()\value = 8971
    AddElement(entities()) : entities()\name = "rho"      : entities()\value = 961
    AddElement(entities()) : entities()\name = "rlm"      : entities()\value = 8207
    AddElement(entities()) : entities()\name = "rsaquo"   : entities()\value = 8250
    AddElement(entities()) : entities()\name = "rsquo"    : entities()\value = 8217
    AddElement(entities()) : entities()\name = "sbquo"    : entities()\value = 8218
    AddElement(entities()) : entities()\name = "scaron"   : entities()\value = 353
    AddElement(entities()) : entities()\name = "sdot"     : entities()\value = 8901
    AddElement(entities()) : entities()\name = "sect"     : entities()\value = 167
    AddElement(entities()) : entities()\name = "shy"      : entities()\value = 173
    AddElement(entities()) : entities()\name = "sigma"    : entities()\value = 963
    AddElement(entities()) : entities()\name = "sigmaf"   : entities()\value = 962
    AddElement(entities()) : entities()\name = "sim"      : entities()\value = 8764
    AddElement(entities()) : entities()\name = "spades"   : entities()\value = 9824
    AddElement(entities()) : entities()\name = "sub"      : entities()\value = 8834
    AddElement(entities()) : entities()\name = "sube"     : entities()\value = 8838
    AddElement(entities()) : entities()\name = "sum"      : entities()\value = 8721
    AddElement(entities()) : entities()\name = "sup"      : entities()\value = 8835
    AddElement(entities()) : entities()\name = "sup1"     : entities()\value = 185
    AddElement(entities()) : entities()\name = "sup2"     : entities()\value = 178
    AddElement(entities()) : entities()\name = "sup3"     : entities()\value = 179
    AddElement(entities()) : entities()\name = "supe"     : entities()\value = 8839
    AddElement(entities()) : entities()\name = "szlig"    : entities()\value = 223
    AddElement(entities()) : entities()\name = "tau"      : entities()\value = 964
    AddElement(entities()) : entities()\name = "there4"   : entities()\value = 8756
    AddElement(entities()) : entities()\name = "theta"    : entities()\value = 952
    AddElement(entities()) : entities()\name = "thetasym" : entities()\value = 977
    AddElement(entities()) : entities()\name = "thinsp"   : entities()\value = 8201
    AddElement(entities()) : entities()\name = "thorn"    : entities()\value = 254
    AddElement(entities()) : entities()\name = "tilde"    : entities()\value = 732
    AddElement(entities()) : entities()\name = "times"    : entities()\value = 215
    AddElement(entities()) : entities()\name = "trade"    : entities()\value = 8482
    AddElement(entities()) : entities()\name = "uArr"     : entities()\value = 8657
    AddElement(entities()) : entities()\name = "uacute"   : entities()\value = 250
    AddElement(entities()) : entities()\name = "uarr"     : entities()\value = 8593
    AddElement(entities()) : entities()\name = "ucirc"    : entities()\value = 251
    AddElement(entities()) : entities()\name = "ugrave"   : entities()\value = 249
    AddElement(entities()) : entities()\name = "uml"      : entities()\value = 168
    AddElement(entities()) : entities()\name = "upsih"    : entities()\value = 978
    AddElement(entities()) : entities()\name = "upsilon"  : entities()\value = 965
    AddElement(entities()) : entities()\name = "uuml"     : entities()\value = 252
    AddElement(entities()) : entities()\name = "weierp"   : entities()\value = 8472
    AddElement(entities()) : entities()\name = "xi"       : entities()\value = 958
    AddElement(entities()) : entities()\name = "yacute"   : entities()\value = 253
    AddElement(entities()) : entities()\name = "yen"      : entities()\value = 165
    AddElement(entities()) : entities()\name = "yuml"     : entities()\value = 255
    AddElement(entities()) : entities()\name = "zeta"     : entities()\value = 950
    AddElement(entities()) : entities()\name = "zwj"      : entities()\value = 8205
    AddElement(entities()) : entities()\name = "zwnj"     : entities()\value = 8204
  ;}
;}
;{ Macros
  Macro gdTrueColorGetAlpha(c) 
    (c & $7F000000) >> 24
  EndMacro
  Macro gdTrueColorGetRed(c) 
    (c & $FF0000) >> 16
  EndMacro
  Macro gdTrueColorGetGreen(c) 
    (c & $00FF00) >> 8
  EndMacro
  Macro gdTrueColorGetBlue(c) 
    c & $0000FF
  EndMacro
  Macro gdImageCreatePalette 
    gdImageCreate
  EndMacro
  Macro gdTrueColor(r, g, b) 
    ((r << 16) + (g << 8) + b)
  EndMacro
  Macro gdTrueColorAlpha(r, g, b, a) 
    ((a << 24) + (r << 16) + (g << 8) + b)
  EndMacro
  Macro gdImageTrueColor(im) 
    im\trueColor
  EndMacro
  Macro gdImageSX(im) 
    im\sx
  EndMacro
  Macro gdImageSY(im) 
    im\sy
  EndMacro
  Macro gdImageColorsTotal(im) 
    im\colorsTotal
  EndMacro
  Macro gdImageGetTransparent(im) 
    im\transparent
  EndMacro
  Macro gdImageGetInterlaced(im) 
    im\interlace
  EndMacro
  Macro gdImagePalettePixel(im, x, y) 
    im\pixels[y][x]
  EndMacro
  Macro gdImageTrueColorPixel(im, x, y) 
    im\tpixels[y][x]
  EndMacro
;}
;{ Datas
  DataSection
    Data_UnicodeTbl_Category_01:
     Data.l $0000, $3001, $3002, $FF0C, $FF0E, $30FB, $FF1A, $FF1B
     Data.l $FF1F, $FF01, $309B, $309C, $00B4, $FF40, $00A8, $FF3E
     Data.l $FFE3, $FF3F, $30FD, $30FE, $309D, $309E, $3003, $4EDD
     Data.l $3005, $3006, $3007, $30FC, $2015, $2010, $FF0F, $FF3C
     Data.l $FF5E, $2225, $FF5C, $2026, $2025, $2018, $2019, $201C
     Data.l $201D, $FF08, $FF09, $3014, $3015, $FF3B, $FF3D, $FF5B
     Data.l $FF5D, $3008, $3009, $300A, $300B, $300C, $300D, $300E
     Data.l $300F, $3010, $3011, $FF0B, $FF0D, $00B1, $00D7, $00F7
     Data.l $FF1D, $2260, $FF1C, $FF1E, $2266, $2267, $221E, $2234
     Data.l $2642, $2640, $00B0, $2032, $2033, $2103, $FFE5, $FF04
     Data.l $FFE0, $FFE1, $FF05, $FF03, $FF06, $FF0A, $FF20, $00A7
     Data.l $2606, $2605, $25CB, $25CF, $25CE, $25C7
    Data_UnicodeTbl_Category_02:
     Data.l $25C6, $25A1, $25A0, $25B3, $25B2, $25BD, $25BC, $203B
     Data.l $3012, $2192, $2190, $2191, $2193, $3013, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $2208, $220B, $2286, $2287, $2282, $2283, $222A
     Data.l $2229, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $2227, $2228, $FFE2, $21D2, $21D4, $2200, $2203
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $2220, $22A5, $2312, $2202, $2207
     Data.l $2261, $2252, $226A, $226B, $221A, $223D, $221D, $2235
     Data.l $222B, $222C, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $212B, $2030, $266F, $266D, $266A, $2020, $2021
     Data.l $00B6, $0000, $0000, $0000, $0000, $25EF
    Data_UnicodeTbl_Category_03:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $FF10
     Data.l $FF11, $FF12, $FF13, $FF14, $FF15, $FF16, $FF17, $FF18
     Data.l $FF19, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $FF21, $FF22, $FF23, $FF24, $FF25, $FF26, $FF27, $FF28
     Data.l $FF29, $FF2A, $FF2B, $FF2C, $FF2D, $FF2E, $FF2F, $FF30
     Data.l $FF31, $FF32, $FF33, $FF34, $FF35, $FF36, $FF37, $FF38
     Data.l $FF39, $FF3A, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $FF41, $FF42, $FF43, $FF44, $FF45, $FF46, $FF47, $FF48
     Data.l $FF49, $FF4A, $FF4B, $FF4C, $FF4D, $FF4E, $FF4F, $FF50
     Data.l $FF51, $FF52, $FF53, $FF54, $FF55, $FF56, $FF57, $FF58
     Data.l $FF59, $FF5A, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_04:
     Data.l $3041, $3042, $3043, $3044, $3045, $3046, $3047, $3048
     Data.l $3049, $304A, $304B, $304C, $304D, $304E, $304F, $3050
     Data.l $3051, $3052, $3053, $3054, $3055, $3056, $3057, $3058
     Data.l $3059, $305A, $305B, $305C, $305D, $305E, $305F, $3060
     Data.l $3061, $3062, $3063, $3064, $3065, $3066, $3067, $3068
     Data.l $3069, $306A, $306B, $306C, $306D, $306E, $306F, $3070
     Data.l $3071, $3072, $3073, $3074, $3075, $3076, $3077, $3078
     Data.l $3079, $307A, $307B, $307C, $307D, $307E, $307F, $3080
     Data.l $3081, $3082, $3083, $3084, $3085, $3086, $3087, $3088
     Data.l $3089, $308A, $308B, $308C, $308D, $308E, $308F, $3090
     Data.l $3091, $3092, $3093, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_05:
     Data.l $30A1, $30A2, $30A3, $30A4, $30A5, $30A6, $30A7, $30A8
     Data.l $30A9, $30AA, $30AB, $30AC, $30AD, $30AE, $30AF, $30B0
     Data.l $30B1, $30B2, $30B3, $30B4, $30B5, $30B6, $30B7, $30B8
     Data.l $30B9, $30BA, $30BB, $30BC, $30BD, $30BE, $30BF, $30C0
     Data.l $30C1, $30C2, $30C3, $30C4, $30C5, $30C6, $30C7, $30C8
     Data.l $30C9, $30CA, $30CB, $30CC, $30CD, $30CE, $30CF, $30D0
     Data.l $30D1, $30D2, $30D3, $30D4, $30D5, $30D6, $30D7, $30D8
     Data.l $30D9, $30DA, $30DB, $30DC, $30DD, $30DE, $30DF, $30E0
     Data.l $30E1, $30E2, $30E3, $30E4, $30E5, $30E6, $30E7, $30E8
     Data.l $30E9, $30EA, $30EB, $30EC, $30ED, $30EE, $30EF, $30F0
     Data.l $30F1, $30F2, $30F3, $30F4, $30F5, $30F6, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_06:
     Data.l $0391, $0392, $0393, $0394, $0395, $0396, $0397, $0398
     Data.l $0399, $039A, $039B, $039C, $039D, $039E, $039F, $03A0
     Data.l $03A1, $03A3, $03A4, $03A5, $03A6, $03A7, $03A8, $03A9
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $03B1, $03B2, $03B3, $03B4, $03B5, $03B6, $03B7, $03B8
     Data.l $03B9, $03BA, $03BB, $03BC, $03BD, $03BE, $03BF, $03C0
     Data.l $03C1, $03C3, $03C4, $03C5, $03C6, $03C7, $03C8, $03C9
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_07:
     Data.l $0410, $0411, $0412, $0413, $0414, $0415, $0401, $0416
     Data.l $0417, $0418, $0419, $041A, $041B, $041C, $041D, $041E
     Data.l $041F, $0420, $0421, $0422, $0423, $0424, $0425, $0426
     Data.l $0427, $0428, $0429, $042A, $042B, $042C, $042D, $042E
     Data.l $042F, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0430, $0431, $0432, $0433, $0434, $0435, $0451, $0436
     Data.l $0437, $0438, $0439, $043A, $043B, $043C, $043D, $043E
     Data.l $043F, $0440, $0441, $0442, $0443, $0444, $0445, $0446
     Data.l $0447, $0448, $0449, $044A, $044B, $044C, $044D, $044E
     Data.l $044F, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_08:
     Data.l $2500, $2502, $250C, $2510, $2518, $2514, $251C, $252C
     Data.l $2524, $2534, $253C, $2501, $2503, $250F, $2513, $251B
     Data.l $2517, $2523, $2533, $252B, $253B, $254B, $2520, $252F
     Data.l $2528, $2537, $253F, $251D, $2530, $2525, $2538, $2542
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_09:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_10:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_11:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_12:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_13:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_14:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_15:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_16:
     Data.l $4E9C, $5516, $5A03, $963F, $54C0, $611B, $6328, $59F6
     Data.l $9022, $8475, $831C, $7A50, $60AA, $63E1, $6E25, $65ED
     Data.l $8466, $82A6, $9BF5, $6893, $5727, $65A1, $6271, $5B9B
     Data.l $59D0, $867B, $98F4, $7D62, $7DBE, $9B8E, $6216, $7C9F
     Data.l $88B7, $5B89, $5EB5, $6309, $6697, $6848, $95C7, $978D
     Data.l $674F, $4EE5, $4F0A, $4F4D, $4F9D, $5049, $56F2, $5937
     Data.l $59D4, $5A01, $5C09, $60DF, $610F, $6170, $6613, $6905
     Data.l $70BA, $754F, $7570, $79FB, $7DAD, $7DEF, $80C3, $840E
     Data.l $8863, $8B02, $9055, $907A, $533B, $4E95, $4EA5, $57DF
     Data.l $80B2, $90C1, $78EF, $4E00, $58F1, $6EA2, $9038, $7A32
     Data.l $8328, $828B, $9C2F, $5141, $5370, $54BD, $54E1, $56E0
     Data.l $59FB, $5F15, $98F2, $6DEB, $80E4, $852D
    Data_UnicodeTbl_Category_17:
     Data.l $9662, $9670, $96A0, $97FB, $540B, $53F3, $5B87, $70CF
     Data.l $7FBD, $8FC2, $96E8, $536F, $9D5C, $7ABA, $4E11, $7893
     Data.l $81FC, $6E26, $5618, $5504, $6B1D, $851A, $9C3B, $59E5
     Data.l $53A9, $6D66, $74DC, $958F, $5642, $4E91, $904B, $96F2
     Data.l $834F, $990C, $53E1, $55B6, $5B30, $5F71, $6620, $66F3
     Data.l $6804, $6C38, $6CF3, $6D29, $745B, $76C8, $7A4E, $9834
     Data.l $82F1, $885B, $8A60, $92ED, $6DB2, $75AB, $76CA, $99C5
     Data.l $60A6, $8B01, $8D8A, $95B2, $698E, $53AD, $5186, $5712
     Data.l $5830, $5944, $5BB4, $5EF6, $6028, $63A9, $63F4, $6CBF
     Data.l $6F14, $708E, $7114, $7159, $71D5, $733F, $7E01, $8276
     Data.l $82D1, $8597, $9060, $925B, $9D1B, $5869, $65BC, $6C5A
     Data.l $7525, $51F9, $592E, $5965, $5F80, $5FDC
    Data_UnicodeTbl_Category_18:
     Data.l $62BC, $65FA, $6A2A, $6B27, $6BB4, $738B, $7FC1, $8956
     Data.l $9D2C, $9D0E, $9EC4, $5CA1, $6C96, $837B, $5104, $5C4B
     Data.l $61B6, $81C6, $6876, $7261, $4E59, $4FFA, $5378, $6069
     Data.l $6E29, $7A4F, $97F3, $4E0B, $5316, $4EEE, $4F55, $4F3D
     Data.l $4FA1, $4F73, $52A0, $53EF, $5609, $590F, $5AC1, $5BB6
     Data.l $5BE1, $79D1, $6687, $679C, $67B6, $6B4C, $6CB3, $706B
     Data.l $73C2, $798D, $79BE, $7A3C, $7B87, $82B1, $82DB, $8304
     Data.l $8377, $83EF, $83D3, $8766, $8AB2, $5629, $8CA8, $8FE6
     Data.l $904E, $971E, $868A, $4FC4, $5CE8, $6211, $7259, $753B
     Data.l $81E5, $82BD, $86FE, $8CC0, $96C5, $9913, $99D5, $4ECB
     Data.l $4F1A, $89E3, $56DE, $584A, $58CA, $5EFB, $5FEB, $602A
     Data.l $6094, $6062, $61D0, $6212, $62D0, $6539
    Data_UnicodeTbl_Category_19:
     Data.l $9B41, $6666, $68B0, $6D77, $7070, $754C, $7686, $7D75
     Data.l $82A5, $87F9, $958B, $968E, $8C9D, $51F1, $52BE, $5916
     Data.l $54B3, $5BB3, $5D16, $6168, $6982, $6DAF, $788D, $84CB
     Data.l $8857, $8A72, $93A7, $9AB8, $6D6C, $99A8, $86D9, $57A3
     Data.l $67FF, $86CE, $920E, $5283, $5687, $5404, $5ED3, $62E1
     Data.l $64B9, $683C, $6838, $6BBB, $7372, $78BA, $7A6B, $899A
     Data.l $89D2, $8D6B, $8F03, $90ED, $95A3, $9694, $9769, $5B66
     Data.l $5CB3, $697D, $984D, $984E, $639B, $7B20, $6A2B, $6A7F
     Data.l $68B6, $9C0D, $6F5F, $5272, $559D, $6070, $62EC, $6D3B
     Data.l $6E07, $6ED1, $845B, $8910, $8F44, $4E14, $9C39, $53F6
     Data.l $691B, $6A3A, $9784, $682A, $515C, $7AC3, $84B2, $91DC
     Data.l $938C, $565B, $9D28, $6822, $8305, $8431
    Data_UnicodeTbl_Category_20:
     Data.l $7CA5, $5208, $82C5, $74E6, $4E7E, $4F83, $51A0, $5BD2
     Data.l $520A, $52D8, $52E7, $5DFB, $559A, $582A, $59E6, $5B8C
     Data.l $5B98, $5BDB, $5E72, $5E79, $60A3, $611F, $6163, $61BE
     Data.l $63DB, $6562, $67D1, $6853, $68FA, $6B3E, $6B53, $6C57
     Data.l $6F22, $6F97, $6F45, $74B0, $7518, $76E3, $770B, $7AFF
     Data.l $7BA1, $7C21, $7DE9, $7F36, $7FF0, $809D, $8266, $839E
     Data.l $89B3, $8ACC, $8CAB, $9084, $9451, $9593, $9591, $95A2
     Data.l $9665, $97D3, $9928, $8218, $4E38, $542B, $5CB8, $5DCC
     Data.l $73A9, $764C, $773C, $5CA9, $7FEB, $8D0B, $96C1, $9811
     Data.l $9854, $9858, $4F01, $4F0E, $5371, $559C, $5668, $57FA
     Data.l $5947, $5B09, $5BC4, $5C90, $5E0C, $5E7E, $5FCC, $63EE
     Data.l $673A, $65D7, $65E2, $671F, $68CB, $68C4
    Data_UnicodeTbl_Category_21:
     Data.l $6A5F, $5E30, $6BC5, $6C17, $6C7D, $757F, $7948, $5B63
     Data.l $7A00, $7D00, $5FBD, $898F, $8A18, $8CB4, $8D77, $8ECC
     Data.l $8F1D, $98E2, $9A0E, $9B3C, $4E80, $507D, $5100, $5993
     Data.l $5B9C, $622F, $6280, $64EC, $6B3A, $72A0, $7591, $7947
     Data.l $7FA9, $87FB, $8ABC, $8B70, $63AC, $83CA, $97A0, $5409
     Data.l $5403, $55AB, $6854, $6A58, $8A70, $7827, $6775, $9ECD
     Data.l $5374, $5BA2, $811A, $8650, $9006, $4E18, $4E45, $4EC7
     Data.l $4F11, $53CA, $5438, $5BAE, $5F13, $6025, $6551, $673D
     Data.l $6C42, $6C72, $6CE3, $7078, $7403, $7A76, $7AAE, $7B08
     Data.l $7D1A, $7CFE, $7D66, $65E7, $725B, $53BB, $5C45, $5DE8
     Data.l $62D2, $62E0, $6319, $6E20, $865A, $8A31, $8DDD, $92F8
     Data.l $6F01, $79A6, $9B5A, $4EA8, $4EAB, $4EAC
    Data_UnicodeTbl_Category_22:
     Data.l $4F9B, $4FA0, $50D1, $5147, $7AF6, $5171, $51F6, $5354
     Data.l $5321, $537F, $53EB, $55AC, $5883, $5CE1, $5F37, $5F4A
     Data.l $602F, $6050, $606D, $631F, $6559, $6A4B, $6CC1, $72C2
     Data.l $72ED, $77EF, $80F8, $8105, $8208, $854E, $90F7, $93E1
     Data.l $97FF, $9957, $9A5A, $4EF0, $51DD, $5C2D, $6681, $696D
     Data.l $5C40, $66F2, $6975, $7389, $6850, $7C81, $50C5, $52E4
     Data.l $5747, $5DFE, $9326, $65A4, $6B23, $6B3D, $7434, $7981
     Data.l $79BD, $7B4B, $7DCA, $82B9, $83CC, $887F, $895F, $8B39
     Data.l $8FD1, $91D1, $541F, $9280, $4E5D, $5036, $53E5, $533A
     Data.l $72D7, $7396, $77E9, $82E6, $8EAF, $99C6, $99C8, $99D2
     Data.l $5177, $611A, $865E, $55B0, $7A7A, $5076, $5BD3, $9047
     Data.l $9685, $4E32, $6ADB, $91E7, $5C51, $5C48
    Data_UnicodeTbl_Category_23:
     Data.l $6398, $7A9F, $6C93, $9774, $8F61, $7AAA, $718A, $9688
     Data.l $7C82, $6817, $7E70, $6851, $936C, $52F2, $541B, $85AB
     Data.l $8A13, $7FA4, $8ECD, $90E1, $5366, $8888, $7941, $4FC2
     Data.l $50BE, $5211, $5144, $5553, $572D, $73EA, $578B, $5951
     Data.l $5F62, $5F84, $6075, $6176, $6167, $61A9, $63B2, $643A
     Data.l $656C, $666F, $6842, $6E13, $7566, $7A3D, $7CFB, $7D4C
     Data.l $7D99, $7E4B, $7F6B, $830E, $834A, $86CD, $8A08, $8A63
     Data.l $8B66, $8EFD, $981A, $9D8F, $82B8, $8FCE, $9BE8, $5287
     Data.l $621F, $6483, $6FC0, $9699, $6841, $5091, $6B20, $6C7A
     Data.l $6F54, $7A74, $7D50, $8840, $8A23, $6708, $4EF6, $5039
     Data.l $5026, $5065, $517C, $5238, $5263, $55A7, $570F, $5805
     Data.l $5ACC, $5EFA, $61B2, $61F8, $62F3, $6372
    Data_UnicodeTbl_Category_24:
     Data.l $691C, $6A29, $727D, $72AC, $732E, $7814, $786F, $7D79
     Data.l $770C, $80A9, $898B, $8B19, $8CE2, $8ED2, $9063, $9375
     Data.l $967A, $9855, $9A13, $9E78, $5143, $539F, $53B3, $5E7B
     Data.l $5F26, $6E1B, $6E90, $7384, $73FE, $7D43, $8237, $8A00
     Data.l $8AFA, $9650, $4E4E, $500B, $53E4, $547C, $56FA, $59D1
     Data.l $5B64, $5DF1, $5EAB, $5F27, $6238, $6545, $67AF, $6E56
     Data.l $72D0, $7CCA, $88B4, $80A1, $80E1, $83F0, $864E, $8A87
     Data.l $8DE8, $9237, $96C7, $9867, $9F13, $4E94, $4E92, $4F0D
     Data.l $5348, $5449, $543E, $5A2F, $5F8C, $5FA1, $609F, $68A7
     Data.l $6A8E, $745A, $7881, $8A9E, $8AA4, $8B77, $9190, $4E5E
     Data.l $9BC9, $4EA4, $4F7C, $4FAF, $5019, $5016, $5149, $516C
     Data.l $529F, $52B9, $52FE, $539A, $53E3, $5411
    Data_UnicodeTbl_Category_25:
     Data.l $540E, $5589, $5751, $57A2, $597D, $5B54, $5B5D, $5B8F
     Data.l $5DE5, $5DE7, $5DF7, $5E78, $5E83, $5E9A, $5EB7, $5F18
     Data.l $6052, $614C, $6297, $62D8, $63A7, $653B, $6602, $6643
     Data.l $66F4, $676D, $6821, $6897, $69CB, $6C5F, $6D2A, $6D69
     Data.l $6E2F, $6E9D, $7532, $7687, $786C, $7A3F, $7CE0, $7D05
     Data.l $7D18, $7D5E, $7DB1, $8015, $8003, $80AF, $80B1, $8154
     Data.l $818F, $822A, $8352, $884C, $8861, $8B1B, $8CA2, $8CFC
     Data.l $90CA, $9175, $9271, $783F, $92FC, $95A4, $964D, $9805
     Data.l $9999, $9AD8, $9D3B, $525B, $52AB, $53F7, $5408, $58D5
     Data.l $62F7, $6FE0, $8C6A, $8F5F, $9EB9, $514B, $523B, $544A
     Data.l $56FD, $7A40, $9177, $9D60, $9ED2, $7344, $6F09, $8170
     Data.l $7511, $5FFD, $60DA, $9AA8, $72DB, $8FBC
    Data_UnicodeTbl_Category_26:
     Data.l $6B64, $9803, $4ECA, $56F0, $5764, $58BE, $5A5A, $6068
     Data.l $61C7, $660F, $6606, $6839, $68B1, $6DF7, $75D5, $7D3A
     Data.l $826E, $9B42, $4E9B, $4F50, $53C9, $5506, $5D6F, $5DE6
     Data.l $5DEE, $67FB, $6C99, $7473, $7802, $8A50, $9396, $88DF
     Data.l $5750, $5EA7, $632B, $50B5, $50AC, $518D, $6700, $54C9
     Data.l $585E, $59BB, $5BB0, $5F69, $624D, $63A1, $683D, $6B73
     Data.l $6E08, $707D, $91C7, $7280, $7815, $7826, $796D, $658E
     Data.l $7D30, $83DC, $88C1, $8F09, $969B, $5264, $5728, $6750
     Data.l $7F6A, $8CA1, $51B4, $5742, $962A, $583A, $698A, $80B4
     Data.l $54B2, $5D0E, $57FC, $7895, $9DFA, $4F5C, $524A, $548B
     Data.l $643E, $6628, $6714, $67F5, $7A84, $7B56, $7D22, $932F
     Data.l $685C, $9BAD, $7B39, $5319, $518A, $5237
    Data_UnicodeTbl_Category_27:
     Data.l $5BDF, $62F6, $64AE, $64E6, $672D, $6BBA, $85A9, $96D1
     Data.l $7690, $9BD6, $634C, $9306, $9BAB, $76BF, $6652, $4E09
     Data.l $5098, $53C2, $5C71, $60E8, $6492, $6563, $685F, $71E6
     Data.l $73CA, $7523, $7B97, $7E82, $8695, $8B83, $8CDB, $9178
     Data.l $9910, $65AC, $66AB, $6B8B, $4ED5, $4ED4, $4F3A, $4F7F
     Data.l $523A, $53F8, $53F2, $55E3, $56DB, $58EB, $59CB, $59C9
     Data.l $59FF, $5B50, $5C4D, $5E02, $5E2B, $5FD7, $601D, $6307
     Data.l $652F, $5B5C, $65AF, $65BD, $65E8, $679D, $6B62, $6B7B
     Data.l $6C0F, $7345, $7949, $79C1, $7CF8, $7D19, $7D2B, $80A2
     Data.l $8102, $81F3, $8996, $8A5E, $8A69, $8A66, $8A8C, $8AEE
     Data.l $8CC7, $8CDC, $96CC, $98FC, $6B6F, $4E8B, $4F3C, $4F8D
     Data.l $5150, $5B57, $5BFA, $6148, $6301, $6642
    Data_UnicodeTbl_Category_28:
     Data.l $6B21, $6ECB, $6CBB, $723E, $74BD, $75D4, $78C1, $793A
     Data.l $800C, $8033, $81EA, $8494, $8F9E, $6C50, $9E7F, $5F0F
     Data.l $8B58, $9D2B, $7AFA, $8EF8, $5B8D, $96EB, $4E03, $53F1
     Data.l $57F7, $5931, $5AC9, $5BA4, $6089, $6E7F, $6F06, $75BE
     Data.l $8CEA, $5B9F, $8500, $7BE0, $5072, $67F4, $829D, $5C61
     Data.l $854A, $7E1E, $820E, $5199, $5C04, $6368, $8D66, $659C
     Data.l $716E, $793E, $7D17, $8005, $8B1D, $8ECA, $906E, $86C7
     Data.l $90AA, $501F, $52FA, $5C3A, $6753, $707C, $7235, $914C
     Data.l $91C8, $932B, $82E5, $5BC2, $5F31, $60F9, $4E3B, $53D6
     Data.l $5B88, $624B, $6731, $6B8A, $72E9, $73E0, $7A2E, $816B
     Data.l $8DA3, $9152, $9996, $5112, $53D7, $546A, $5BFF, $6388
     Data.l $6A39, $7DAC, $9700, $56DA, $53CE, $5468
    Data_UnicodeTbl_Category_29:
     Data.l $5B97, $5C31, $5DDE, $4FEE, $6101, $62FE, $6D32, $79C0
     Data.l $79CB, $7D42, $7E4D, $7FD2, $81ED, $821F, $8490, $8846
     Data.l $8972, $8B90, $8E74, $8F2F, $9031, $914B, $916C, $96C6
     Data.l $919C, $4EC0, $4F4F, $5145, $5341, $5F93, $620E, $67D4
     Data.l $6C41, $6E0B, $7363, $7E26, $91CD, $9283, $53D4, $5919
     Data.l $5BBF, $6DD1, $795D, $7E2E, $7C9B, $587E, $719F, $51FA
     Data.l $8853, $8FF0, $4FCA, $5CFB, $6625, $77AC, $7AE3, $821C
     Data.l $99FF, $51C6, $5FAA, $65EC, $696F, $6B89, $6DF3, $6E96
     Data.l $6F64, $76FE, $7D14, $5DE1, $9075, $9187, $9806, $51E6
     Data.l $521D, $6240, $6691, $66D9, $6E1A, $5EB6, $7DD2, $7F72
     Data.l $66F8, $85AF, $85F7, $8AF8, $52A9, $53D9, $5973, $5E8F
     Data.l $5F90, $6055, $92E4, $9664, $50B7, $511F
    Data_UnicodeTbl_Category_30:
     Data.l $52DD, $5320, $5347, $53EC, $54E8, $5546, $5531, $5617
     Data.l $5968, $59BE, $5A3C, $5BB5, $5C06, $5C0F, $5C11, $5C1A
     Data.l $5E84, $5E8A, $5EE0, $5F70, $627F, $6284, $62DB, $638C
     Data.l $6377, $6607, $660C, $662D, $6676, $677E, $68A2, $6A1F
     Data.l $6A35, $6CBC, $6D88, $6E09, $6E58, $713C, $7126, $7167
     Data.l $75C7, $7701, $785D, $7901, $7965, $79F0, $7AE0, $7B11
     Data.l $7CA7, $7D39, $8096, $83D6, $848B, $8549, $885D, $88F3
     Data.l $8A1F, $8A3C, $8A54, $8A73, $8C61, $8CDE, $91A4, $9266
     Data.l $937E, $9418, $969C, $9798, $4E0A, $4E08, $4E1E, $4E57
     Data.l $5197, $5270, $57CE, $5834, $58CC, $5B22, $5E38, $60C5
     Data.l $64FE, $6761, $6756, $6D44, $72B6, $7573, $7A63, $84B8
     Data.l $8B72, $91B8, $9320, $5631, $57F4, $98FE
    Data_UnicodeTbl_Category_31:
     Data.l $62ED, $690D, $6B96, $71ED, $7E54, $8077, $8272, $89E6
     Data.l $98DF, $8755, $8FB1, $5C3B, $4F38, $4FE1, $4FB5, $5507
     Data.l $5A20, $5BDD, $5BE9, $5FC3, $614E, $632F, $65B0, $664B
     Data.l $68EE, $699B, $6D78, $6DF1, $7533, $75B9, $771F, $795E
     Data.l $79E6, $7D33, $81E3, $82AF, $85AA, $89AA, $8A3A, $8EAB
     Data.l $8F9B, $9032, $91DD, $9707, $4EBA, $4EC1, $5203, $5875
     Data.l $58EC, $5C0B, $751A, $5C3D, $814E, $8A0A, $8FC5, $9663
     Data.l $976D, $7B25, $8ACF, $9808, $9162, $56F3, $53A8, $9017
     Data.l $5439, $5782, $5E25, $63A8, $6C34, $708A, $7761, $7C8B
     Data.l $7FE0, $8870, $9042, $9154, $9310, $9318, $968F, $745E
     Data.l $9AC4, $5D07, $5D69, $6570, $67A2, $8DA8, $96DB, $636E
     Data.l $6749, $6919, $83C5, $9817, $96C0, $88FE
    Data_UnicodeTbl_Category_32:
     Data.l $6F84, $647A, $5BF8, $4E16, $702C, $755D, $662F, $51C4
     Data.l $5236, $52E2, $59D3, $5F81, $6027, $6210, $653F, $6574
     Data.l $661F, $6674, $68F2, $6816, $6B63, $6E05, $7272, $751F
     Data.l $76DB, $7CBE, $8056, $58F0, $88FD, $897F, $8AA0, $8A93
     Data.l $8ACB, $901D, $9192, $9752, $9759, $6589, $7A0E, $8106
     Data.l $96BB, $5E2D, $60DC, $621A, $65A5, $6614, $6790, $77F3
     Data.l $7A4D, $7C4D, $7E3E, $810A, $8CAC, $8D64, $8DE1, $8E5F
     Data.l $78A9, $5207, $62D9, $63A5, $6442, $6298, $8A2D, $7A83
     Data.l $7BC0, $8AAC, $96EA, $7D76, $820C, $8749, $4ED9, $5148
     Data.l $5343, $5360, $5BA3, $5C02, $5C16, $5DDD, $6226, $6247
     Data.l $64B0, $6813, $6834, $6CC9, $6D45, $6D17, $67D3, $6F5C
     Data.l $714E, $717D, $65CB, $7A7F, $7BAD, $7DDA
    Data_UnicodeTbl_Category_33:
     Data.l $7E4A, $7FA8, $817A, $821B, $8239, $85A6, $8A6E, $8CCE
     Data.l $8DF5, $9078, $9077, $92AD, $9291, $9583, $9BAE, $524D
     Data.l $5584, $6F38, $7136, $5168, $7985, $7E55, $81B3, $7CCE
     Data.l $564C, $5851, $5CA8, $63AA, $66FE, $66FD, $695A, $72D9
     Data.l $758F, $758E, $790E, $7956, $79DF, $7C97, $7D20, $7D44
     Data.l $8607, $8A34, $963B, $9061, $9F20, $50E7, $5275, $53CC
     Data.l $53E2, $5009, $55AA, $58EE, $594F, $723D, $5B8B, $5C64
     Data.l $531D, $60E3, $60F3, $635C, $6383, $633F, $63BB, $64CD
     Data.l $65E9, $66F9, $5DE3, $69CD, $69FD, $6F15, $71E5, $4E89
     Data.l $75E9, $76F8, $7A93, $7CDF, $7DCF, $7D9C, $8061, $8349
     Data.l $8358, $846C, $84BC, $85FB, $88C5, $8D70, $9001, $906D
     Data.l $9397, $971C, $9A12, $50CF, $5897, $618E
    Data_UnicodeTbl_Category_34:
     Data.l $81D3, $8535, $8D08, $9020, $4FC3, $5074, $5247, $5373
     Data.l $606F, $6349, $675F, $6E2C, $8DB3, $901F, $4FD7, $5C5E
     Data.l $8CCA, $65CF, $7D9A, $5352, $8896, $5176, $63C3, $5B58
     Data.l $5B6B, $5C0A, $640D, $6751, $905C, $4ED6, $591A, $592A
     Data.l $6C70, $8A51, $553E, $5815, $59A5, $60F0, $6253, $67C1
     Data.l $8235, $6955, $9640, $99C4, $9A28, $4F53, $5806, $5BFE
     Data.l $8010, $5CB1, $5E2F, $5F85, $6020, $614B, $6234, $66FF
     Data.l $6CF0, $6EDE, $80CE, $817F, $82D4, $888B, $8CB8, $9000
     Data.l $902E, $968A, $9EDB, $9BDB, $4EE3, $53F0, $5927, $7B2C
     Data.l $918D, $984C, $9DF9, $6EDD, $7027, $5353, $5544, $5B85
     Data.l $6258, $629E, $62D3, $6CA2, $6FEF, $7422, $8A17, $9438
     Data.l $6FC1, $8AFE, $8338, $51E7, $86F8, $53EA
    Data_UnicodeTbl_Category_35:
     Data.l $53E9, $4F46, $9054, $8FB0, $596A, $8131, $5DFD, $7AEA
     Data.l $8FBF, $68DA, $8C37, $72F8, $9C48, $6A3D, $8AB0, $4E39
     Data.l $5358, $5606, $5766, $62C5, $63A2, $65E6, $6B4E, $6DE1
     Data.l $6E5B, $70AD, $77ED, $7AEF, $7BAA, $7DBB, $803D, $80C6
     Data.l $86CB, $8A95, $935B, $56E3, $58C7, $5F3E, $65AD, $6696
     Data.l $6A80, $6BB5, $7537, $8AC7, $5024, $77E5, $5730, $5F1B
     Data.l $6065, $667A, $6C60, $75F4, $7A1A, $7F6E, $81F4, $8718
     Data.l $9045, $99B3, $7BC9, $755C, $7AF9, $7B51, $84C4, $9010
     Data.l $79E9, $7A92, $8336, $5AE1, $7740, $4E2D, $4EF2, $5B99
     Data.l $5FE0, $62BD, $663C, $67F1, $6CE8, $866B, $8877, $8A3B
     Data.l $914E, $92F3, $99D0, $6A17, $7026, $732A, $82E7, $8457
     Data.l $8CAF, $4E01, $5146, $51CB, $558B, $5BF5
    Data_UnicodeTbl_Category_36:
     Data.l $5E16, $5E33, $5E81, $5F14, $5F35, $5F6B, $5FB4, $61F2
     Data.l $6311, $66A2, $671D, $6F6E, $7252, $753A, $773A, $8074
     Data.l $8139, $8178, $8776, $8ABF, $8ADC, $8D85, $8DF3, $929A
     Data.l $9577, $9802, $9CE5, $52C5, $6357, $76F4, $6715, $6C88
     Data.l $73CD, $8CC3, $93AE, $9673, $6D25, $589C, $690E, $69CC
     Data.l $8FFD, $939A, $75DB, $901A, $585A, $6802, $63B4, $69FB
     Data.l $4F43, $6F2C, $67D8, $8FBB, $8526, $7DB4, $9354, $693F
     Data.l $6F70, $576A, $58F7, $5B2C, $7D2C, $722A, $540A, $91E3
     Data.l $9DB4, $4EAD, $4F4E, $505C, $5075, $5243, $8C9E, $5448
     Data.l $5824, $5B9A, $5E1D, $5E95, $5EAD, $5EF7, $5F1F, $608C
     Data.l $62B5, $633A, $63D0, $68AF, $6C40, $7887, $798E, $7A0B
     Data.l $7DE0, $8247, $8A02, $8AE6, $8E44, $9013
    Data_UnicodeTbl_Category_37:
     Data.l $90B8, $912D, $91D8, $9F0E, $6CE5, $6458, $64E2, $6575
     Data.l $6EF4, $7684, $7B1B, $9069, $93D1, $6EBA, $54F2, $5FB9
     Data.l $64A4, $8F4D, $8FED, $9244, $5178, $586B, $5929, $5C55
     Data.l $5E97, $6DFB, $7E8F, $751C, $8CBC, $8EE2, $985B, $70B9
     Data.l $4F1D, $6BBF, $6FB1, $7530, $96FB, $514E, $5410, $5835
     Data.l $5857, $59AC, $5C60, $5F92, $6597, $675C, $6E21, $767B
     Data.l $83DF, $8CED, $9014, $90FD, $934D, $7825, $783A, $52AA
     Data.l $5EA6, $571F, $5974, $6012, $5012, $515A, $51AC, $51CD
     Data.l $5200, $5510, $5854, $5858, $5957, $5B95, $5CF6, $5D8B
     Data.l $60BC, $6295, $642D, $6771, $6843, $68BC, $68DF, $76D7
     Data.l $6DD8, $6E6F, $6D9B, $706F, $71C8, $5F53, $75D8, $7977
     Data.l $7B49, $7B54, $7B52, $7CD6, $7D71, $5230
    Data_UnicodeTbl_Category_38:
     Data.l $8463, $8569, $85E4, $8A0E, $8B04, $8C46, $8E0F, $9003
     Data.l $900F, $9419, $9676, $982D, $9A30, $95D8, $50CD, $52D5
     Data.l $540C, $5802, $5C0E, $61A7, $649E, $6D1E, $77B3, $7AE5
     Data.l $80F4, $8404, $9053, $9285, $5CE0, $9D07, $533F, $5F97
     Data.l $5FB3, $6D9C, $7279, $7763, $79BF, $7BE4, $6BD2, $72EC
     Data.l $8AAD, $6803, $6A61, $51F8, $7A81, $6934, $5C4A, $9CF6
     Data.l $82EB, $5BC5, $9149, $701E, $5678, $5C6F, $60C7, $6566
     Data.l $6C8C, $8C5A, $9041, $9813, $5451, $66C7, $920D, $5948
     Data.l $90A3, $5185, $4E4D, $51EA, $8599, $8B0E, $7058, $637A
     Data.l $934B, $6962, $99B4, $7E04, $7577, $5357, $6960, $8EDF
     Data.l $96E3, $6C5D, $4E8C, $5C3C, $5F10, $8FE9, $5302, $8CD1
     Data.l $8089, $8679, $5EFF, $65E5, $4E73, $5165
    Data_UnicodeTbl_Category_39:
     Data.l $5982, $5C3F, $97EE, $4EFB, $598A, $5FCD, $8A8D, $6FE1
     Data.l $79B0, $7962, $5BE7, $8471, $732B, $71B1, $5E74, $5FF5
     Data.l $637B, $649A, $71C3, $7C98, $4E43, $5EFC, $4E4B, $57DC
     Data.l $56A2, $60A9, $6FC3, $7D0D, $80FD, $8133, $81BF, $8FB2
     Data.l $8997, $86A4, $5DF4, $628A, $64AD, $8987, $6777, $6CE2
     Data.l $6D3E, $7436, $7834, $5A46, $7F75, $82AD, $99AC, $4FF3
     Data.l $5EC3, $62DD, $6392, $6557, $676F, $76C3, $724C, $80CC
     Data.l $80BA, $8F29, $914D, $500D, $57F9, $5A92, $6885, $6973
     Data.l $7164, $72FD, $8CB7, $58F2, $8CE0, $966A, $9019, $877F
     Data.l $79E4, $77E7, $8429, $4F2F, $5265, $535A, $62CD, $67CF
     Data.l $6CCA, $767D, $7B94, $7C95, $8236, $8584, $8FEB, $66DD
     Data.l $6F20, $7206, $7E1B, $83AB, $99C1, $9EA6
    Data_UnicodeTbl_Category_40:
     Data.l $51FD, $7BB1, $7872, $7BB8, $8087, $7B48, $6AE8, $5E61
     Data.l $808C, $7551, $7560, $516B, $9262, $6E8C, $767A, $9197
     Data.l $9AEA, $4F10, $7F70, $629C, $7B4F, $95A5, $9CE9, $567A
     Data.l $5859, $86E4, $96BC, $4F34, $5224, $534A, $53CD, $53DB
     Data.l $5E06, $642C, $6591, $677F, $6C3E, $6C4E, $7248, $72AF
     Data.l $73ED, $7554, $7E41, $822C, $85E9, $8CA9, $7BC4, $91C6
     Data.l $7169, $9812, $98EF, $633D, $6669, $756A, $76E4, $78D0
     Data.l $8543, $86EE, $532A, $5351, $5426, $5983, $5E87, $5F7C
     Data.l $60B2, $6249, $6279, $62AB, $6590, $6BD4, $6CCC, $75B2
     Data.l $76AE, $7891, $79D8, $7DCB, $7F77, $80A5, $88AB, $8AB9
     Data.l $8CBB, $907F, $975E, $98DB, $6A0B, $7C38, $5099, $5C3E
     Data.l $5FAE, $6787, $6BD8, $7435, $7709, $7F8E
    Data_UnicodeTbl_Category_41:
     Data.l $9F3B, $67CA, $7A17, $5339, $758B, $9AED, $5F66, $819D
     Data.l $83F1, $8098, $5F3C, $5FC5, $7562, $7B46, $903C, $6867
     Data.l $59EB, $5A9B, $7D10, $767E, $8B2C, $4FF5, $5F6A, $6A19
     Data.l $6C37, $6F02, $74E2, $7968, $8868, $8A55, $8C79, $5EDF
     Data.l $63CF, $75C5, $79D2, $82D7, $9328, $92F2, $849C, $86ED
     Data.l $9C2D, $54C1, $5F6C, $658C, $6D5C, $7015, $8CA7, $8CD3
     Data.l $983B, $654F, $74F6, $4E0D, $4ED8, $57E0, $592B, $5A66
     Data.l $5BCC, $51A8, $5E03, $5E9C, $6016, $6276, $6577, $65A7
     Data.l $666E, $6D6E, $7236, $7B26, $8150, $819A, $8299, $8B5C
     Data.l $8CA0, $8CE6, $8D74, $961C, $9644, $4FAE, $64AB, $6B66
     Data.l $821E, $8461, $856A, $90E8, $5C01, $6953, $98A8, $847A
     Data.l $8557, $4F0F, $526F, $5FA9, $5E45, $670D
    Data_UnicodeTbl_Category_42:
     Data.l $798F, $8179, $8907, $8986, $6DF5, $5F17, $6255, $6CB8
     Data.l $4ECF, $7269, $9B92, $5206, $543B, $5674, $58B3, $61A4
     Data.l $626E, $711A, $596E, $7C89, $7CDE, $7D1B, $96F0, $6587
     Data.l $805E, $4E19, $4F75, $5175, $5840, $5E63, $5E73, $5F0A
     Data.l $67C4, $4E26, $853D, $9589, $965B, $7C73, $9801, $50FB
     Data.l $58C1, $7656, $78A7, $5225, $77A5, $8511, $7B86, $504F
     Data.l $5909, $7247, $7BC7, $7DE8, $8FBA, $8FD4, $904D, $4FBF
     Data.l $52C9, $5A29, $5F01, $97AD, $4FDD, $8217, $92EA, $5703
     Data.l $6355, $6B69, $752B, $88DC, $8F14, $7A42, $52DF, $5893
     Data.l $6155, $620A, $66AE, $6BCD, $7C3F, $83E9, $5023, $4FF8
     Data.l $5305, $5446, $5831, $5949, $5B9D, $5CF0, $5CEF, $5D29
     Data.l $5E96, $62B1, $6367, $653E, $65B9, $670B
    Data_UnicodeTbl_Category_43:
     Data.l $6CD5, $6CE1, $70F9, $7832, $7E2B, $80DE, $82B3, $840C
     Data.l $84EC, $8702, $8912, $8A2A, $8C4A, $90A6, $92D2, $98FD
     Data.l $9CF3, $9D6C, $4E4F, $4EA1, $508D, $5256, $574A, $59A8
     Data.l $5E3D, $5FD8, $5FD9, $623F, $66B4, $671B, $67D0, $68D2
     Data.l $5192, $7D21, $80AA, $81A8, $8B00, $8C8C, $8CBF, $927E
     Data.l $9632, $5420, $982C, $5317, $50D5, $535C, $58A8, $64B2
     Data.l $6734, $7267, $7766, $7A46, $91E6, $52C3, $6CA1, $6B86
     Data.l $5800, $5E4C, $5954, $672C, $7FFB, $51E1, $76C6, $6469
     Data.l $78E8, $9B54, $9EBB, $57CB, $59B9, $6627, $679A, $6BCE
     Data.l $54E9, $69D9, $5E55, $819C, $6795, $9BAA, $67FE, $9C52
     Data.l $685D, $4EA6, $4FE3, $53C8, $62B9, $672B, $6CAB, $8FC4
     Data.l $4FAD, $7E6D, $9EBF, $4E07, $6162, $6E80
    Data_UnicodeTbl_Category_44:
     Data.l $6F2B, $8513, $5473, $672A, $9B45, $5DF3, $7B95, $5CAC
     Data.l $5BC6, $871C, $6E4A, $84D1, $7A14, $8108, $5999, $7C8D
     Data.l $6C11, $7720, $52D9, $5922, $7121, $725F, $77DB, $9727
     Data.l $9D61, $690B, $5A7F, $5A18, $51A5, $540D, $547D, $660E
     Data.l $76DF, $8FF7, $9298, $9CF4, $59EA, $725D, $6EC5, $514D
     Data.l $68C9, $7DBF, $7DEC, $9762, $9EBA, $6478, $6A21, $8302
     Data.l $5984, $5B5F, $6BDB, $731B, $76F2, $7DB2, $8017, $8499
     Data.l $5132, $6728, $9ED9, $76EE, $6762, $52FF, $9905, $5C24
     Data.l $623B, $7C7E, $8CB0, $554F, $60B6, $7D0B, $9580, $5301
     Data.l $4E5F, $51B6, $591C, $723A, $8036, $91CE, $5F25, $77E2
     Data.l $5384, $5F79, $7D04, $85AC, $8A33, $8E8D, $9756, $67F3
     Data.l $85AE, $9453, $6109, $6108, $6CB9, $7652
    Data_UnicodeTbl_Category_45:
     Data.l $8AED, $8F38, $552F, $4F51, $512A, $52C7, $53CB, $5BA5
     Data.l $5E7D, $60A0, $6182, $63D6, $6709, $67DA, $6E67, $6D8C
     Data.l $7336, $7337, $7531, $7950, $88D5, $8A98, $904A, $9091
     Data.l $90F5, $96C4, $878D, $5915, $4E88, $4F59, $4E0E, $8A89
     Data.l $8F3F, $9810, $50AD, $5E7C, $5996, $5BB9, $5EB8, $63DA
     Data.l $63FA, $64C1, $66DC, $694A, $69D8, $6D0B, $6EB6, $7194
     Data.l $7528, $7AAF, $7F8A, $8000, $8449, $84C9, $8981, $8B21
     Data.l $8E0A, $9065, $967D, $990A, $617E, $6291, $6B32, $6C83
     Data.l $6D74, $7FCC, $7FFC, $6DC0, $7F85, $87BA, $88F8, $6765
     Data.l $83B1, $983C, $96F7, $6D1B, $7D61, $843D, $916A, $4E71
     Data.l $5375, $5D50, $6B04, $6FEB, $85CD, $862D, $89A7, $5229
     Data.l $540F, $5C65, $674E, $68A8, $7406, $7483
    Data_UnicodeTbl_Category_46:
     Data.l $75E2, $88CF, $88E1, $91CC, $96E2, $9678, $5F8B, $7387
     Data.l $7ACB, $844E, $63A0, $7565, $5289, $6D41, $6E9C, $7409
     Data.l $7559, $786B, $7C92, $9686, $7ADC, $9F8D, $4FB6, $616E
     Data.l $65C5, $865C, $4E86, $4EAE, $50DA, $4E21, $51CC, $5BEE
     Data.l $6599, $6881, $6DBC, $731F, $7642, $77AD, $7A1C, $7CE7
     Data.l $826F, $8AD2, $907C, $91CF, $9675, $9818, $529B, $7DD1
     Data.l $502B, $5398, $6797, $6DCB, $71D0, $7433, $81E8, $8F2A
     Data.l $96A3, $9C57, $9E9F, $7460, $5841, $6D99, $7D2F, $985E
     Data.l $4EE4, $4F36, $4F8B, $51B7, $52B1, $5DBA, $601C, $73B2
     Data.l $793C, $82D3, $9234, $96B7, $96F6, $970A, $9E97, $9F62
     Data.l $66A6, $6B74, $5217, $52A3, $70C8, $88C2, $5EC9, $604B
     Data.l $6190, $6F23, $7149, $7C3E, $7DF4, $806F
    Data_UnicodeTbl_Category_47:
     Data.l $84EE, $9023, $932C, $5442, $9B6F, $6AD3, $7089, $8CC2
     Data.l $8DEF, $9732, $52B4, $5A41, $5ECA, $5F04, $6717, $697C
     Data.l $6994, $6D6A, $6F0F, $7262, $72FC, $7BED, $8001, $807E
     Data.l $874B, $90CE, $516D, $9E93, $7984, $808B, $9332, $8AD6
     Data.l $502D, $548C, $8A71, $6B6A, $8CC4, $8107, $60D1, $67A0
     Data.l $9DF2, $4E99, $4E98, $9C10, $8A6B, $85C1, $8568, $6900
     Data.l $6E7E, $7897, $8155, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_48:
     Data.l $5F0C, $4E10, $4E15, $4E2A, $4E31, $4E36, $4E3C, $4E3F
     Data.l $4E42, $4E56, $4E58, $4E82, $4E85, $8C6B, $4E8A, $8212
     Data.l $5F0D, $4E8E, $4E9E, $4E9F, $4EA0, $4EA2, $4EB0, $4EB3
     Data.l $4EB6, $4ECE, $4ECD, $4EC4, $4EC6, $4EC2, $4ED7, $4EDE
     Data.l $4EED, $4EDF, $4EF7, $4F09, $4F5A, $4F30, $4F5B, $4F5D
     Data.l $4F57, $4F47, $4F76, $4F88, $4F8F, $4F98, $4F7B, $4F69
     Data.l $4F70, $4F91, $4F6F, $4F86, $4F96, $5118, $4FD4, $4FDF
     Data.l $4FCE, $4FD8, $4FDB, $4FD1, $4FDA, $4FD0, $4FE4, $4FE5
     Data.l $501A, $5028, $5014, $502A, $5025, $5005, $4F1C, $4FF6
     Data.l $5021, $5029, $502C, $4FFE, $4FEF, $5011, $5006, $5043
     Data.l $5047, $6703, $5055, $5050, $5048, $505A, $5056, $506C
     Data.l $5078, $5080, $509A, $5085, $50B4, $50B2
    Data_UnicodeTbl_Category_49:
     Data.l $50C9, $50CA, $50B3, $50C2, $50D6, $50DE, $50E5, $50ED
     Data.l $50E3, $50EE, $50F9, $50F5, $5109, $5101, $5102, $5116
     Data.l $5115, $5114, $511A, $5121, $513A, $5137, $513C, $513B
     Data.l $513F, $5140, $5152, $514C, $5154, $5162, $7AF8, $5169
     Data.l $516A, $516E, $5180, $5182, $56D8, $518C, $5189, $518F
     Data.l $5191, $5193, $5195, $5196, $51A4, $51A6, $51A2, $51A9
     Data.l $51AA, $51AB, $51B3, $51B1, $51B2, $51B0, $51B5, $51BD
     Data.l $51C5, $51C9, $51DB, $51E0, $8655, $51E9, $51ED, $51F0
     Data.l $51F5, $51FE, $5204, $520B, $5214, $520E, $5227, $522A
     Data.l $522E, $5233, $5239, $524F, $5244, $524B, $524C, $525E
     Data.l $5254, $526A, $5274, $5269, $5273, $527F, $527D, $528D
     Data.l $5294, $5292, $5271, $5288, $5291, $8FA8
    Data_UnicodeTbl_Category_50:
     Data.l $8FA7, $52AC, $52AD, $52BC, $52B5, $52C1, $52CD, $52D7
     Data.l $52DE, $52E3, $52E6, $98ED, $52E0, $52F3, $52F5, $52F8
     Data.l $52F9, $5306, $5308, $7538, $530D, $5310, $530F, $5315
     Data.l $531A, $5323, $532F, $5331, $5333, $5338, $5340, $5346
     Data.l $5345, $4E17, $5349, $534D, $51D6, $535E, $5369, $536E
     Data.l $5918, $537B, $5377, $5382, $5396, $53A0, $53A6, $53A5
     Data.l $53AE, $53B0, $53B6, $53C3, $7C12, $96D9, $53DF, $66FC
     Data.l $71EE, $53EE, $53E8, $53ED, $53FA, $5401, $543D, $5440
     Data.l $542C, $542D, $543C, $542E, $5436, $5429, $541D, $544E
     Data.l $548F, $5475, $548E, $545F, $5471, $5477, $5470, $5492
     Data.l $547B, $5480, $5476, $5484, $5490, $5486, $54C7, $54A2
     Data.l $54B8, $54A5, $54AC, $54C4, $54C8, $54A8
    Data_UnicodeTbl_Category_51:
     Data.l $54AB, $54C2, $54A4, $54BE, $54BC, $54D8, $54E5, $54E6
     Data.l $550F, $5514, $54FD, $54EE, $54ED, $54FA, $54E2, $5539
     Data.l $5540, $5563, $554C, $552E, $555C, $5545, $5556, $5557
     Data.l $5538, $5533, $555D, $5599, $5580, $54AF, $558A, $559F
     Data.l $557B, $557E, $5598, $559E, $55AE, $557C, $5583, $55A9
     Data.l $5587, $55A8, $55DA, $55C5, $55DF, $55C4, $55DC, $55E4
     Data.l $55D4, $5614, $55F7, $5616, $55FE, $55FD, $561B, $55F9
     Data.l $564E, $5650, $71DF, $5634, $5636, $5632, $5638, $566B
     Data.l $5664, $562F, $566C, $566A, $5686, $5680, $568A, $56A0
     Data.l $5694, $568F, $56A5, $56AE, $56B6, $56B4, $56C2, $56BC
     Data.l $56C1, $56C3, $56C0, $56C8, $56CE, $56D1, $56D3, $56D7
     Data.l $56EE, $56F9, $5700, $56FF, $5704, $5709
    Data_UnicodeTbl_Category_52:
     Data.l $5708, $570B, $570D, $5713, $5718, $5716, $55C7, $571C
     Data.l $5726, $5737, $5738, $574E, $573B, $5740, $574F, $5769
     Data.l $57C0, $5788, $5761, $577F, $5789, $5793, $57A0, $57B3
     Data.l $57A4, $57AA, $57B0, $57C3, $57C6, $57D4, $57D2, $57D3
     Data.l $580A, $57D6, $57E3, $580B, $5819, $581D, $5872, $5821
     Data.l $5862, $584B, $5870, $6BC0, $5852, $583D, $5879, $5885
     Data.l $58B9, $589F, $58AB, $58BA, $58DE, $58BB, $58B8, $58AE
     Data.l $58C5, $58D3, $58D1, $58D7, $58D9, $58D8, $58E5, $58DC
     Data.l $58E4, $58DF, $58EF, $58FA, $58F9, $58FB, $58FC, $58FD
     Data.l $5902, $590A, $5910, $591B, $68A6, $5925, $592C, $592D
     Data.l $5932, $5938, $593E, $7AD2, $5955, $5950, $594E, $595A
     Data.l $5958, $5962, $5960, $5967, $596C, $5969
    Data_UnicodeTbl_Category_53:
     Data.l $5978, $5981, $599D, $4F5E, $4FAB, $59A3, $59B2, $59C6
     Data.l $59E8, $59DC, $598D, $59D9, $59DA, $5A25, $5A1F, $5A11
     Data.l $5A1C, $5A09, $5A1A, $5A40, $5A6C, $5A49, $5A35, $5A36
     Data.l $5A62, $5A6A, $5A9A, $5ABC, $5ABE, $5ACB, $5AC2, $5ABD
     Data.l $5AE3, $5AD7, $5AE6, $5AE9, $5AD6, $5AFA, $5AFB, $5B0C
     Data.l $5B0B, $5B16, $5B32, $5AD0, $5B2A, $5B36, $5B3E, $5B43
     Data.l $5B45, $5B40, $5B51, $5B55, $5B5A, $5B5B, $5B65, $5B69
     Data.l $5B70, $5B73, $5B75, $5B78, $6588, $5B7A, $5B80, $5B83
     Data.l $5BA6, $5BB8, $5BC3, $5BC7, $5BC9, $5BD4, $5BD0, $5BE4
     Data.l $5BE6, $5BE2, $5BDE, $5BE5, $5BEB, $5BF0, $5BF6, $5BF3
     Data.l $5C05, $5C07, $5C08, $5C0D, $5C13, $5C20, $5C22, $5C28
     Data.l $5C38, $5C39, $5C41, $5C46, $5C4E, $5C53
    Data_UnicodeTbl_Category_54:
     Data.l $5C50, $5C4F, $5B71, $5C6C, $5C6E, $4E62, $5C76, $5C79
     Data.l $5C8C, $5C91, $5C94, $599B, $5CAB, $5CBB, $5CB6, $5CBC
     Data.l $5CB7, $5CC5, $5CBE, $5CC7, $5CD9, $5CE9, $5CFD, $5CFA
     Data.l $5CED, $5D8C, $5CEA, $5D0B, $5D15, $5D17, $5D5C, $5D1F
     Data.l $5D1B, $5D11, $5D14, $5D22, $5D1A, $5D19, $5D18, $5D4C
     Data.l $5D52, $5D4E, $5D4B, $5D6C, $5D73, $5D76, $5D87, $5D84
     Data.l $5D82, $5DA2, $5D9D, $5DAC, $5DAE, $5DBD, $5D90, $5DB7
     Data.l $5DBC, $5DC9, $5DCD, $5DD3, $5DD2, $5DD6, $5DDB, $5DEB
     Data.l $5DF2, $5DF5, $5E0B, $5E1A, $5E19, $5E11, $5E1B, $5E36
     Data.l $5E37, $5E44, $5E43, $5E40, $5E4E, $5E57, $5E54, $5E5F
     Data.l $5E62, $5E64, $5E47, $5E75, $5E76, $5E7A, $9EBC, $5E7F
     Data.l $5EA0, $5EC1, $5EC2, $5EC8, $5ED0, $5ECF
    Data_UnicodeTbl_Category_55:
     Data.l $5ED6, $5EE3, $5EDD, $5EDA, $5EDB, $5EE2, $5EE1, $5EE8
     Data.l $5EE9, $5EEC, $5EF1, $5EF3, $5EF0, $5EF4, $5EF8, $5EFE
     Data.l $5F03, $5F09, $5F5D, $5F5C, $5F0B, $5F11, $5F16, $5F29
     Data.l $5F2D, $5F38, $5F41, $5F48, $5F4C, $5F4E, $5F2F, $5F51
     Data.l $5F56, $5F57, $5F59, $5F61, $5F6D, $5F73, $5F77, $5F83
     Data.l $5F82, $5F7F, $5F8A, $5F88, $5F91, $5F87, $5F9E, $5F99
     Data.l $5F98, $5FA0, $5FA8, $5FAD, $5FBC, $5FD6, $5FFB, $5FE4
     Data.l $5FF8, $5FF1, $5FDD, $60B3, $5FFF, $6021, $6060, $6019
     Data.l $6010, $6029, $600E, $6031, $601B, $6015, $602B, $6026
     Data.l $600F, $603A, $605A, $6041, $606A, $6077, $605F, $604A
     Data.l $6046, $604D, $6063, $6043, $6064, $6042, $606C, $606B
     Data.l $6059, $6081, $608D, $60E7, $6083, $609A
    Data_UnicodeTbl_Category_56:
     Data.l $6084, $609B, $6096, $6097, $6092, $60A7, $608B, $60E1
     Data.l $60B8, $60E0, $60D3, $60B4, $5FF0, $60BD, $60C6, $60B5
     Data.l $60D8, $614D, $6115, $6106, $60F6, $60F7, $6100, $60F4
     Data.l $60FA, $6103, $6121, $60FB, $60F1, $610D, $610E, $6147
     Data.l $613E, $6128, $6127, $614A, $613F, $613C, $612C, $6134
     Data.l $613D, $6142, $6144, $6173, $6177, $6158, $6159, $615A
     Data.l $616B, $6174, $616F, $6165, $6171, $615F, $615D, $6153
     Data.l $6175, $6199, $6196, $6187, $61AC, $6194, $619A, $618A
     Data.l $6191, $61AB, $61AE, $61CC, $61CA, $61C9, $61F7, $61C8
     Data.l $61C3, $61C6, $61BA, $61CB, $7F79, $61CD, $61E6, $61E3
     Data.l $61F6, $61FA, $61F4, $61FF, $61FD, $61FC, $61FE, $6200
     Data.l $6208, $6209, $620D, $620C, $6214, $621B
    Data_UnicodeTbl_Category_57:
     Data.l $621E, $6221, $622A, $622E, $6230, $6232, $6233, $6241
     Data.l $624E, $625E, $6263, $625B, $6260, $6268, $627C, $6282
     Data.l $6289, $627E, $6292, $6293, $6296, $62D4, $6283, $6294
     Data.l $62D7, $62D1, $62BB, $62CF, $62FF, $62C6, $64D4, $62C8
     Data.l $62DC, $62CC, $62CA, $62C2, $62C7, $629B, $62C9, $630C
     Data.l $62EE, $62F1, $6327, $6302, $6308, $62EF, $62F5, $6350
     Data.l $633E, $634D, $641C, $634F, $6396, $638E, $6380, $63AB
     Data.l $6376, $63A3, $638F, $6389, $639F, $63B5, $636B, $6369
     Data.l $63BE, $63E9, $63C0, $63C6, $63E3, $63C9, $63D2, $63F6
     Data.l $63C4, $6416, $6434, $6406, $6413, $6426, $6436, $651D
     Data.l $6417, $6428, $640F, $6467, $646F, $6476, $644E, $652A
     Data.l $6495, $6493, $64A5, $64A9, $6488, $64BC
    Data_UnicodeTbl_Category_58:
     Data.l $64DA, $64D2, $64C5, $64C7, $64BB, $64D8, $64C2, $64F1
     Data.l $64E7, $8209, $64E0, $64E1, $62AC, $64E3, $64EF, $652C
     Data.l $64F6, $64F4, $64F2, $64FA, $6500, $64FD, $6518, $651C
     Data.l $6505, $6524, $6523, $652B, $6534, $6535, $6537, $6536
     Data.l $6538, $754B, $6548, $6556, $6555, $654D, $6558, $655E
     Data.l $655D, $6572, $6578, $6582, $6583, $8B8A, $659B, $659F
     Data.l $65AB, $65B7, $65C3, $65C6, $65C1, $65C4, $65CC, $65D2
     Data.l $65DB, $65D9, $65E0, $65E1, $65F1, $6772, $660A, $6603
     Data.l $65FB, $6773, $6635, $6636, $6634, $661C, $664F, $6644
     Data.l $6649, $6641, $665E, $665D, $6664, $6667, $6668, $665F
     Data.l $6662, $6670, $6683, $6688, $668E, $6689, $6684, $6698
     Data.l $669D, $66C1, $66B9, $66C9, $66BE, $66BC
    Data_UnicodeTbl_Category_59:
     Data.l $66C4, $66B8, $66D6, $66DA, $66E0, $663F, $66E6, $66E9
     Data.l $66F0, $66F5, $66F7, $670F, $6716, $671E, $6726, $6727
     Data.l $9738, $672E, $673F, $6736, $6741, $6738, $6737, $6746
     Data.l $675E, $6760, $6759, $6763, $6764, $6789, $6770, $67A9
     Data.l $677C, $676A, $678C, $678B, $67A6, $67A1, $6785, $67B7
     Data.l $67EF, $67B4, $67EC, $67B3, $67E9, $67B8, $67E4, $67DE
     Data.l $67DD, $67E2, $67EE, $67B9, $67CE, $67C6, $67E7, $6A9C
     Data.l $681E, $6846, $6829, $6840, $684D, $6832, $684E, $68B3
     Data.l $682B, $6859, $6863, $6877, $687F, $689F, $688F, $68AD
     Data.l $6894, $689D, $689B, $6883, $6AAE, $68B9, $6874, $68B5
     Data.l $68A0, $68BA, $690F, $688D, $687E, $6901, $68CA, $6908
     Data.l $68D8, $6922, $6926, $68E1, $690C, $68CD
    Data_UnicodeTbl_Category_60:
     Data.l $68D4, $68E7, $68D5, $6936, $6912, $6904, $68D7, $68E3
     Data.l $6925, $68F9, $68E0, $68EF, $6928, $692A, $691A, $6923
     Data.l $6921, $68C6, $6979, $6977, $695C, $6978, $696B, $6954
     Data.l $697E, $696E, $6939, $6974, $693D, $6959, $6930, $6961
     Data.l $695E, $695D, $6981, $696A, $69B2, $69AE, $69D0, $69BF
     Data.l $69C1, $69D3, $69BE, $69CE, $5BE8, $69CA, $69DD, $69BB
     Data.l $69C3, $69A7, $6A2E, $6991, $69A0, $699C, $6995, $69B4
     Data.l $69DE, $69E8, $6A02, $6A1B, $69FF, $6B0A, $69F9, $69F2
     Data.l $69E7, $6A05, $69B1, $6A1E, $69ED, $6A14, $69EB, $6A0A
     Data.l $6A12, $6AC1, $6A23, $6A13, $6A44, $6A0C, $6A72, $6A36
     Data.l $6A78, $6A47, $6A62, $6A59, $6A66, $6A48, $6A38, $6A22
     Data.l $6A90, $6A8D, $6AA0, $6A84, $6AA2, $6AA3
    Data_UnicodeTbl_Category_61:
     Data.l $6A97, $8617, $6ABB, $6AC3, $6AC2, $6AB8, $6AB3, $6AAC
     Data.l $6ADE, $6AD1, $6ADF, $6AAA, $6ADA, $6AEA, $6AFB, $6B05
     Data.l $8616, $6AFA, $6B12, $6B16, $9B31, $6B1F, $6B38, $6B37
     Data.l $76DC, $6B39, $98EE, $6B47, $6B43, $6B49, $6B50, $6B59
     Data.l $6B54, $6B5B, $6B5F, $6B61, $6B78, $6B79, $6B7F, $6B80
     Data.l $6B84, $6B83, $6B8D, $6B98, $6B95, $6B9E, $6BA4, $6BAA
     Data.l $6BAB, $6BAF, $6BB2, $6BB1, $6BB3, $6BB7, $6BBC, $6BC6
     Data.l $6BCB, $6BD3, $6BDF, $6BEC, $6BEB, $6BF3, $6BEF, $9EBE
     Data.l $6C08, $6C13, $6C14, $6C1B, $6C24, $6C23, $6C5E, $6C55
     Data.l $6C62, $6C6A, $6C82, $6C8D, $6C9A, $6C81, $6C9B, $6C7E
     Data.l $6C68, $6C73, $6C92, $6C90, $6CC4, $6CF1, $6CD3, $6CBD
     Data.l $6CD7, $6CC5, $6CDD, $6CAE, $6CB1, $6CBE
    Data_UnicodeTbl_Category_62:
     Data.l $6CBA, $6CDB, $6CEF, $6CD9, $6CEA, $6D1F, $884D, $6D36
     Data.l $6D2B, $6D3D, $6D38, $6D19, $6D35, $6D33, $6D12, $6D0C
     Data.l $6D63, $6D93, $6D64, $6D5A, $6D79, $6D59, $6D8E, $6D95
     Data.l $6FE4, $6D85, $6DF9, $6E15, $6E0A, $6DB5, $6DC7, $6DE6
     Data.l $6DB8, $6DC6, $6DEC, $6DDE, $6DCC, $6DE8, $6DD2, $6DC5
     Data.l $6DFA, $6DD9, $6DE4, $6DD5, $6DEA, $6DEE, $6E2D, $6E6E
     Data.l $6E2E, $6E19, $6E72, $6E5F, $6E3E, $6E23, $6E6B, $6E2B
     Data.l $6E76, $6E4D, $6E1F, $6E43, $6E3A, $6E4E, $6E24, $6EFF
     Data.l $6E1D, $6E38, $6E82, $6EAA, $6E98, $6EC9, $6EB7, $6ED3
     Data.l $6EBD, $6EAF, $6EC4, $6EB2, $6ED4, $6ED5, $6E8F, $6EA5
     Data.l $6EC2, $6E9F, $6F41, $6F11, $704C, $6EEC, $6EF8, $6EFE
     Data.l $6F3F, $6EF2, $6F31, $6EEF, $6F32, $6ECC
    Data_UnicodeTbl_Category_63:
     Data.l $6F3E, $6F13, $6EF7, $6F86, $6F7A, $6F78, $6F81, $6F80
     Data.l $6F6F, $6F5B, $6FF3, $6F6D, $6F82, $6F7C, $6F58, $6F8E
     Data.l $6F91, $6FC2, $6F66, $6FB3, $6FA3, $6FA1, $6FA4, $6FB9
     Data.l $6FC6, $6FAA, $6FDF, $6FD5, $6FEC, $6FD4, $6FD8, $6FF1
     Data.l $6FEE, $6FDB, $7009, $700B, $6FFA, $7011, $7001, $700F
     Data.l $6FFE, $701B, $701A, $6F74, $701D, $7018, $701F, $7030
     Data.l $703E, $7032, $7051, $7063, $7099, $7092, $70AF, $70F1
     Data.l $70AC, $70B8, $70B3, $70AE, $70DF, $70CB, $70DD, $70D9
     Data.l $7109, $70FD, $711C, $7119, $7165, $7155, $7188, $7166
     Data.l $7162, $714C, $7156, $716C, $718F, $71FB, $7184, $7195
     Data.l $71A8, $71AC, $71D7, $71B9, $71BE, $71D2, $71C9, $71D4
     Data.l $71CE, $71E0, $71EC, $71E7, $71F5, $71FC
    Data_UnicodeTbl_Category_64:
     Data.l $71F9, $71FF, $720D, $7210, $721B, $7228, $722D, $722C
     Data.l $7230, $7232, $723B, $723C, $723F, $7240, $7246, $724B
     Data.l $7258, $7274, $727E, $7282, $7281, $7287, $7292, $7296
     Data.l $72A2, $72A7, $72B9, $72B2, $72C3, $72C6, $72C4, $72CE
     Data.l $72D2, $72E2, $72E0, $72E1, $72F9, $72F7, $500F, $7317
     Data.l $730A, $731C, $7316, $731D, $7334, $732F, $7329, $7325
     Data.l $733E, $734E, $734F, $9ED8, $7357, $736A, $7368, $7370
     Data.l $7378, $7375, $737B, $737A, $73C8, $73B3, $73CE, $73BB
     Data.l $73C0, $73E5, $73EE, $73DE, $74A2, $7405, $746F, $7425
     Data.l $73F8, $7432, $743A, $7455, $743F, $745F, $7459, $7441
     Data.l $745C, $7469, $7470, $7463, $746A, $7476, $747E, $748B
     Data.l $749E, $74A7, $74CA, $74CF, $74D4, $73F1
    Data_UnicodeTbl_Category_65:
     Data.l $74E0, $74E3, $74E7, $74E9, $74EE, $74F2, $74F0, $74F1
     Data.l $74F8, $74F7, $7504, $7503, $7505, $750C, $750E, $750D
     Data.l $7515, $7513, $751E, $7526, $752C, $753C, $7544, $754D
     Data.l $754A, $7549, $755B, $7546, $755A, $7569, $7564, $7567
     Data.l $756B, $756D, $7578, $7576, $7586, $7587, $7574, $758A
     Data.l $7589, $7582, $7594, $759A, $759D, $75A5, $75A3, $75C2
     Data.l $75B3, $75C3, $75B5, $75BD, $75B8, $75BC, $75B1, $75CD
     Data.l $75CA, $75D2, $75D9, $75E3, $75DE, $75FE, $75FF, $75FC
     Data.l $7601, $75F0, $75FA, $75F2, $75F3, $760B, $760D, $7609
     Data.l $761F, $7627, $7620, $7621, $7622, $7624, $7634, $7630
     Data.l $763B, $7647, $7648, $7646, $765C, $7658, $7661, $7662
     Data.l $7668, $7669, $766A, $7667, $766C, $7670
    Data_UnicodeTbl_Category_66:
     Data.l $7672, $7676, $7678, $767C, $7680, $7683, $7688, $768B
     Data.l $768E, $7696, $7693, $7699, $769A, $76B0, $76B4, $76B8
     Data.l $76B9, $76BA, $76C2, $76CD, $76D6, $76D2, $76DE, $76E1
     Data.l $76E5, $76E7, $76EA, $862F, $76FB, $7708, $7707, $7704
     Data.l $7729, $7724, $771E, $7725, $7726, $771B, $7737, $7738
     Data.l $7747, $775A, $7768, $776B, $775B, $7765, $777F, $777E
     Data.l $7779, $778E, $778B, $7791, $77A0, $779E, $77B0, $77B6
     Data.l $77B9, $77BF, $77BC, $77BD, $77BB, $77C7, $77CD, $77D7
     Data.l $77DA, $77DC, $77E3, $77EE, $77FC, $780C, $7812, $7926
     Data.l $7820, $792A, $7845, $788E, $7874, $7886, $787C, $789A
     Data.l $788C, $78A3, $78B5, $78AA, $78AF, $78D1, $78C6, $78CB
     Data.l $78D4, $78BE, $78BC, $78C5, $78CA, $78EC
    Data_UnicodeTbl_Category_67:
     Data.l $78E7, $78DA, $78FD, $78F4, $7907, $7912, $7911, $7919
     Data.l $792C, $792B, $7940, $7960, $7957, $795F, $795A, $7955
     Data.l $7953, $797A, $797F, $798A, $799D, $79A7, $9F4B, $79AA
     Data.l $79AE, $79B3, $79B9, $79BA, $79C9, $79D5, $79E7, $79EC
     Data.l $79E1, $79E3, $7A08, $7A0D, $7A18, $7A19, $7A20, $7A1F
     Data.l $7980, $7A31, $7A3B, $7A3E, $7A37, $7A43, $7A57, $7A49
     Data.l $7A61, $7A62, $7A69, $9F9D, $7A70, $7A79, $7A7D, $7A88
     Data.l $7A97, $7A95, $7A98, $7A96, $7AA9, $7AC8, $7AB0, $7AB6
     Data.l $7AC5, $7AC4, $7ABF, $9083, $7AC7, $7ACA, $7ACD, $7ACF
     Data.l $7AD5, $7AD3, $7AD9, $7ADA, $7ADD, $7AE1, $7AE2, $7AE6
     Data.l $7AED, $7AF0, $7B02, $7B0F, $7B0A, $7B06, $7B33, $7B18
     Data.l $7B19, $7B1E, $7B35, $7B28, $7B36, $7B50
    Data_UnicodeTbl_Category_68:
     Data.l $7B7A, $7B04, $7B4D, $7B0B, $7B4C, $7B45, $7B75, $7B65
     Data.l $7B74, $7B67, $7B70, $7B71, $7B6C, $7B6E, $7B9D, $7B98
     Data.l $7B9F, $7B8D, $7B9C, $7B9A, $7B8B, $7B92, $7B8F, $7B5D
     Data.l $7B99, $7BCB, $7BC1, $7BCC, $7BCF, $7BB4, $7BC6, $7BDD
     Data.l $7BE9, $7C11, $7C14, $7BE6, $7BE5, $7C60, $7C00, $7C07
     Data.l $7C13, $7BF3, $7BF7, $7C17, $7C0D, $7BF6, $7C23, $7C27
     Data.l $7C2A, $7C1F, $7C37, $7C2B, $7C3D, $7C4C, $7C43, $7C54
     Data.l $7C4F, $7C40, $7C50, $7C58, $7C5F, $7C64, $7C56, $7C65
     Data.l $7C6C, $7C75, $7C83, $7C90, $7CA4, $7CAD, $7CA2, $7CAB
     Data.l $7CA1, $7CA8, $7CB3, $7CB2, $7CB1, $7CAE, $7CB9, $7CBD
     Data.l $7CC0, $7CC5, $7CC2, $7CD8, $7CD2, $7CDC, $7CE2, $9B3B
     Data.l $7CEF, $7CF2, $7CF4, $7CF6, $7CFA, $7D06
    Data_UnicodeTbl_Category_69:
     Data.l $7D02, $7D1C, $7D15, $7D0A, $7D45, $7D4B, $7D2E, $7D32
     Data.l $7D3F, $7D35, $7D46, $7D73, $7D56, $7D4E, $7D72, $7D68
     Data.l $7D6E, $7D4F, $7D63, $7D93, $7D89, $7D5B, $7D8F, $7D7D
     Data.l $7D9B, $7DBA, $7DAE, $7DA3, $7DB5, $7DC7, $7DBD, $7DAB
     Data.l $7E3D, $7DA2, $7DAF, $7DDC, $7DB8, $7D9F, $7DB0, $7DD8
     Data.l $7DDD, $7DE4, $7DDE, $7DFB, $7DF2, $7DE1, $7E05, $7E0A
     Data.l $7E23, $7E21, $7E12, $7E31, $7E1F, $7E09, $7E0B, $7E22
     Data.l $7E46, $7E66, $7E3B, $7E35, $7E39, $7E43, $7E37, $7E32
     Data.l $7E3A, $7E67, $7E5D, $7E56, $7E5E, $7E59, $7E5A, $7E79
     Data.l $7E6A, $7E69, $7E7C, $7E7B, $7E83, $7DD5, $7E7D, $8FAE
     Data.l $7E7F, $7E88, $7E89, $7E8C, $7E92, $7E90, $7E93, $7E94
     Data.l $7E96, $7E8E, $7E9B, $7E9C, $7F38, $7F3A
    Data_UnicodeTbl_Category_70:
     Data.l $7F45, $7F4C, $7F4D, $7F4E, $7F50, $7F51, $7F55, $7F54
     Data.l $7F58, $7F5F, $7F60, $7F68, $7F69, $7F67, $7F78, $7F82
     Data.l $7F86, $7F83, $7F88, $7F87, $7F8C, $7F94, $7F9E, $7F9D
     Data.l $7F9A, $7FA3, $7FAF, $7FB2, $7FB9, $7FAE, $7FB6, $7FB8
     Data.l $8B71, $7FC5, $7FC6, $7FCA, $7FD5, $7FD4, $7FE1, $7FE6
     Data.l $7FE9, $7FF3, $7FF9, $98DC, $8006, $8004, $800B, $8012
     Data.l $8018, $8019, $801C, $8021, $8028, $803F, $803B, $804A
     Data.l $8046, $8052, $8058, $805A, $805F, $8062, $8068, $8073
     Data.l $8072, $8070, $8076, $8079, $807D, $807F, $8084, $8086
     Data.l $8085, $809B, $8093, $809A, $80AD, $5190, $80AC, $80DB
     Data.l $80E5, $80D9, $80DD, $80C4, $80DA, $80D6, $8109, $80EF
     Data.l $80F1, $811B, $8129, $8123, $812F, $814B
    Data_UnicodeTbl_Category_71:
     Data.l $968B, $8146, $813E, $8153, $8151, $80FC, $8171, $816E
     Data.l $8165, $8166, $8174, $8183, $8188, $818A, $8180, $8182
     Data.l $81A0, $8195, $81A4, $81A3, $815F, $8193, $81A9, $81B0
     Data.l $81B5, $81BE, $81B8, $81BD, $81C0, $81C2, $81BA, $81C9
     Data.l $81CD, $81D1, $81D9, $81D8, $81C8, $81DA, $81DF, $81E0
     Data.l $81E7, $81FA, $81FB, $81FE, $8201, $8202, $8205, $8207
     Data.l $820A, $820D, $8210, $8216, $8229, $822B, $8238, $8233
     Data.l $8240, $8259, $8258, $825D, $825A, $825F, $8264, $8262
     Data.l $8268, $826A, $826B, $822E, $8271, $8277, $8278, $827E
     Data.l $828D, $8292, $82AB, $829F, $82BB, $82AC, $82E1, $82E3
     Data.l $82DF, $82D2, $82F4, $82F3, $82FA, $8393, $8303, $82FB
     Data.l $82F9, $82DE, $8306, $82DC, $8309, $82D9
    Data_UnicodeTbl_Category_72:
     Data.l $8335, $8334, $8316, $8332, $8331, $8340, $8339, $8350
     Data.l $8345, $832F, $832B, $8317, $8318, $8385, $839A, $83AA
     Data.l $839F, $83A2, $8396, $8323, $838E, $8387, $838A, $837C
     Data.l $83B5, $8373, $8375, $83A0, $8389, $83A8, $83F4, $8413
     Data.l $83EB, $83CE, $83FD, $8403, $83D8, $840B, $83C1, $83F7
     Data.l $8407, $83E0, $83F2, $840D, $8422, $8420, $83BD, $8438
     Data.l $8506, $83FB, $846D, $842A, $843C, $855A, $8484, $8477
     Data.l $846B, $84AD, $846E, $8482, $8469, $8446, $842C, $846F
     Data.l $8479, $8435, $84CA, $8462, $84B9, $84BF, $849F, $84D9
     Data.l $84CD, $84BB, $84DA, $84D0, $84C1, $84C6, $84D6, $84A1
     Data.l $8521, $84FF, $84F4, $8517, $8518, $852C, $851F, $8515
     Data.l $8514, $84FC, $8540, $8563, $8558, $8548
    Data_UnicodeTbl_Category_73:
     Data.l $8541, $8602, $854B, $8555, $8580, $85A4, $8588, $8591
     Data.l $858A, $85A8, $856D, $8594, $859B, $85EA, $8587, $859C
     Data.l $8577, $857E, $8590, $85C9, $85BA, $85CF, $85B9, $85D0
     Data.l $85D5, $85DD, $85E5, $85DC, $85F9, $860A, $8613, $860B
     Data.l $85FE, $85FA, $8606, $8622, $861A, $8630, $863F, $864D
     Data.l $4E55, $8654, $865F, $8667, $8671, $8693, $86A3, $86A9
     Data.l $86AA, $868B, $868C, $86B6, $86AF, $86C4, $86C6, $86B0
     Data.l $86C9, $8823, $86AB, $86D4, $86DE, $86E9, $86EC, $86DF
     Data.l $86DB, $86EF, $8712, $8706, $8708, $8700, $8703, $86FB
     Data.l $8711, $8709, $870D, $86F9, $870A, $8734, $873F, $8737
     Data.l $873B, $8725, $8729, $871A, $8760, $875F, $8778, $874C
     Data.l $874E, $8774, $8757, $8768, $876E, $8759
    Data_UnicodeTbl_Category_74:
     Data.l $8753, $8763, $876A, $8805, $87A2, $879F, $8782, $87AF
     Data.l $87CB, $87BD, $87C0, $87D0, $96D6, $87AB, $87C4, $87B3
     Data.l $87C7, $87C6, $87BB, $87EF, $87F2, $87E0, $880F, $880D
     Data.l $87FE, $87F6, $87F7, $880E, $87D2, $8811, $8816, $8815
     Data.l $8822, $8821, $8831, $8836, $8839, $8827, $883B, $8844
     Data.l $8842, $8852, $8859, $885E, $8862, $886B, $8881, $887E
     Data.l $889E, $8875, $887D, $88B5, $8872, $8882, $8897, $8892
     Data.l $88AE, $8899, $88A2, $888D, $88A4, $88B0, $88BF, $88B1
     Data.l $88C3, $88C4, $88D4, $88D8, $88D9, $88DD, $88F9, $8902
     Data.l $88FC, $88F4, $88E8, $88F2, $8904, $890C, $890A, $8913
     Data.l $8943, $891E, $8925, $892A, $892B, $8941, $8944, $893B
     Data.l $8936, $8938, $894C, $891D, $8960, $895E
    Data_UnicodeTbl_Category_75:
     Data.l $8966, $8964, $896D, $896A, $896F, $8974, $8977, $897E
     Data.l $8983, $8988, $898A, $8993, $8998, $89A1, $89A9, $89A6
     Data.l $89AC, $89AF, $89B2, $89BA, $89BD, $89BF, $89C0, $89DA
     Data.l $89DC, $89DD, $89E7, $89F4, $89F8, $8A03, $8A16, $8A10
     Data.l $8A0C, $8A1B, $8A1D, $8A25, $8A36, $8A41, $8A5B, $8A52
     Data.l $8A46, $8A48, $8A7C, $8A6D, $8A6C, $8A62, $8A85, $8A82
     Data.l $8A84, $8AA8, $8AA1, $8A91, $8AA5, $8AA6, $8A9A, $8AA3
     Data.l $8AC4, $8ACD, $8AC2, $8ADA, $8AEB, $8AF3, $8AE7, $8AE4
     Data.l $8AF1, $8B14, $8AE0, $8AE2, $8AF7, $8ADE, $8ADB, $8B0C
     Data.l $8B07, $8B1A, $8AE1, $8B16, $8B10, $8B17, $8B20, $8B33
     Data.l $97AB, $8B26, $8B2B, $8B3E, $8B28, $8B41, $8B4C, $8B4F
     Data.l $8B4E, $8B49, $8B56, $8B5B, $8B5A, $8B6B
    Data_UnicodeTbl_Category_76:
     Data.l $8B5F, $8B6C, $8B6F, $8B74, $8B7D, $8B80, $8B8C, $8B8E
     Data.l $8B92, $8B93, $8B96, $8B99, $8B9A, $8C3A, $8C41, $8C3F
     Data.l $8C48, $8C4C, $8C4E, $8C50, $8C55, $8C62, $8C6C, $8C78
     Data.l $8C7A, $8C82, $8C89, $8C85, $8C8A, $8C8D, $8C8E, $8C94
     Data.l $8C7C, $8C98, $621D, $8CAD, $8CAA, $8CBD, $8CB2, $8CB3
     Data.l $8CAE, $8CB6, $8CC8, $8CC1, $8CE4, $8CE3, $8CDA, $8CFD
     Data.l $8CFA, $8CFB, $8D04, $8D05, $8D0A, $8D07, $8D0F, $8D0D
     Data.l $8D10, $9F4E, $8D13, $8CCD, $8D14, $8D16, $8D67, $8D6D
     Data.l $8D71, $8D73, $8D81, $8D99, $8DC2, $8DBE, $8DBA, $8DCF
     Data.l $8DDA, $8DD6, $8DCC, $8DDB, $8DCB, $8DEA, $8DEB, $8DDF
     Data.l $8DE3, $8DFC, $8E08, $8E09, $8DFF, $8E1D, $8E1E, $8E10
     Data.l $8E1F, $8E42, $8E35, $8E30, $8E34, $8E4A
    Data_UnicodeTbl_Category_77:
     Data.l $8E47, $8E49, $8E4C, $8E50, $8E48, $8E59, $8E64, $8E60
     Data.l $8E2A, $8E63, $8E55, $8E76, $8E72, $8E7C, $8E81, $8E87
     Data.l $8E85, $8E84, $8E8B, $8E8A, $8E93, $8E91, $8E94, $8E99
     Data.l $8EAA, $8EA1, $8EAC, $8EB0, $8EC6, $8EB1, $8EBE, $8EC5
     Data.l $8EC8, $8ECB, $8EDB, $8EE3, $8EFC, $8EFB, $8EEB, $8EFE
     Data.l $8F0A, $8F05, $8F15, $8F12, $8F19, $8F13, $8F1C, $8F1F
     Data.l $8F1B, $8F0C, $8F26, $8F33, $8F3B, $8F39, $8F45, $8F42
     Data.l $8F3E, $8F4C, $8F49, $8F46, $8F4E, $8F57, $8F5C, $8F62
     Data.l $8F63, $8F64, $8F9C, $8F9F, $8FA3, $8FAD, $8FAF, $8FB7
     Data.l $8FDA, $8FE5, $8FE2, $8FEA, $8FEF, $9087, $8FF4, $9005
     Data.l $8FF9, $8FFA, $9011, $9015, $9021, $900D, $901E, $9016
     Data.l $900B, $9027, $9036, $9035, $9039, $8FF8
    Data_UnicodeTbl_Category_78:
     Data.l $904F, $9050, $9051, $9052, $900E, $9049, $903E, $9056
     Data.l $9058, $905E, $9068, $906F, $9076, $96A8, $9072, $9082
     Data.l $907D, $9081, $9080, $908A, $9089, $908F, $90A8, $90AF
     Data.l $90B1, $90B5, $90E2, $90E4, $6248, $90DB, $9102, $9112
     Data.l $9119, $9132, $9130, $914A, $9156, $9158, $9163, $9165
     Data.l $9169, $9173, $9172, $918B, $9189, $9182, $91A2, $91AB
     Data.l $91AF, $91AA, $91B5, $91B4, $91BA, $91C0, $91C1, $91C9
     Data.l $91CB, $91D0, $91D6, $91DF, $91E1, $91DB, $91FC, $91F5
     Data.l $91F6, $921E, $91FF, $9214, $922C, $9215, $9211, $925E
     Data.l $9257, $9245, $9249, $9264, $9248, $9295, $923F, $924B
     Data.l $9250, $929C, $9296, $9293, $929B, $925A, $92CF, $92B9
     Data.l $92B7, $92E9, $930F, $92FA, $9344, $932E
    Data_UnicodeTbl_Category_79:
     Data.l $9319, $9322, $931A, $9323, $933A, $9335, $933B, $935C
     Data.l $9360, $937C, $936E, $9356, $93B0, $93AC, $93AD, $9394
     Data.l $93B9, $93D6, $93D7, $93E8, $93E5, $93D8, $93C3, $93DD
     Data.l $93D0, $93C8, $93E4, $941A, $9414, $9413, $9403, $9407
     Data.l $9410, $9436, $942B, $9435, $9421, $943A, $9441, $9452
     Data.l $9444, $945B, $9460, $9462, $945E, $946A, $9229, $9470
     Data.l $9475, $9477, $947D, $945A, $947C, $947E, $9481, $947F
     Data.l $9582, $9587, $958A, $9594, $9596, $9598, $9599, $95A0
     Data.l $95A8, $95A7, $95AD, $95BC, $95BB, $95B9, $95BE, $95CA
     Data.l $6FF6, $95C3, $95CD, $95CC, $95D5, $95D4, $95D6, $95DC
     Data.l $95E1, $95E5, $95E2, $9621, $9628, $962E, $962F, $9642
     Data.l $964C, $964F, $964B, $9677, $965C, $965E
    Data_UnicodeTbl_Category_80:
     Data.l $965D, $965F, $9666, $9672, $966C, $968D, $9698, $9695
     Data.l $9697, $96AA, $96A7, $96B1, $96B2, $96B0, $96B4, $96B6
     Data.l $96B8, $96B9, $96CE, $96CB, $96C9, $96CD, $894D, $96DC
     Data.l $970D, $96D5, $96F9, $9704, $9706, $9708, $9713, $970E
     Data.l $9711, $970F, $9716, $9719, $9724, $972A, $9730, $9739
     Data.l $973D, $973E, $9744, $9746, $9748, $9742, $9749, $975C
     Data.l $9760, $9764, $9766, $9768, $52D2, $976B, $9771, $9779
     Data.l $9785, $977C, $9781, $977A, $9786, $978B, $978F, $9790
     Data.l $979C, $97A8, $97A6, $97A3, $97B3, $97B4, $97C3, $97C6
     Data.l $97C8, $97CB, $97DC, $97ED, $9F4F, $97F2, $7ADF, $97F6
     Data.l $97F5, $980F, $980C, $9838, $9824, $9821, $9837, $983D
     Data.l $9846, $984F, $984B, $986B, $986F, $9870
    Data_UnicodeTbl_Category_81:
     Data.l $9871, $9874, $9873, $98AA, $98AF, $98B1, $98B6, $98C4
     Data.l $98C3, $98C6, $98E9, $98EB, $9903, $9909, $9912, $9914
     Data.l $9918, $9921, $991D, $991E, $9924, $9920, $992C, $992E
     Data.l $993D, $993E, $9942, $9949, $9945, $9950, $994B, $9951
     Data.l $9952, $994C, $9955, $9997, $9998, $99A5, $99AD, $99AE
     Data.l $99BC, $99DF, $99DB, $99DD, $99D8, $99D1, $99ED, $99EE
     Data.l $99F1, $99F2, $99FB, $99F8, $9A01, $9A0F, $9A05, $99E2
     Data.l $9A19, $9A2B, $9A37, $9A45, $9A42, $9A40, $9A43, $9A3E
     Data.l $9A55, $9A4D, $9A5B, $9A57, $9A5F, $9A62, $9A65, $9A64
     Data.l $9A69, $9A6B, $9A6A, $9AAD, $9AB0, $9ABC, $9AC0, $9ACF
     Data.l $9AD1, $9AD3, $9AD4, $9ADE, $9ADF, $9AE2, $9AE3, $9AE6
     Data.l $9AEF, $9AEB, $9AEE, $9AF4, $9AF1, $9AF7
    Data_UnicodeTbl_Category_82:
     Data.l $9AFB, $9B06, $9B18, $9B1A, $9B1F, $9B22, $9B23, $9B25
     Data.l $9B27, $9B28, $9B29, $9B2A, $9B2E, $9B2F, $9B32, $9B44
     Data.l $9B43, $9B4F, $9B4D, $9B4E, $9B51, $9B58, $9B74, $9B93
     Data.l $9B83, $9B91, $9B96, $9B97, $9B9F, $9BA0, $9BA8, $9BB4
     Data.l $9BC0, $9BCA, $9BB9, $9BC6, $9BCF, $9BD1, $9BD2, $9BE3
     Data.l $9BE2, $9BE4, $9BD4, $9BE1, $9C3A, $9BF2, $9BF1, $9BF0
     Data.l $9C15, $9C14, $9C09, $9C13, $9C0C, $9C06, $9C08, $9C12
     Data.l $9C0A, $9C04, $9C2E, $9C1B, $9C25, $9C24, $9C21, $9C30
     Data.l $9C47, $9C32, $9C46, $9C3E, $9C5A, $9C60, $9C67, $9C76
     Data.l $9C78, $9CE7, $9CEC, $9CF0, $9D09, $9D08, $9CEB, $9D03
     Data.l $9D06, $9D2A, $9D26, $9DAF, $9D23, $9D1F, $9D44, $9D15
     Data.l $9D12, $9D41, $9D3F, $9D3E, $9D46, $9D48
    Data_UnicodeTbl_Category_83:
     Data.l $9D5D, $9D5E, $9D64, $9D51, $9D50, $9D59, $9D72, $9D89
     Data.l $9D87, $9DAB, $9D6F, $9D7A, $9D9A, $9DA4, $9DA9, $9DB2
     Data.l $9DC4, $9DC1, $9DBB, $9DB8, $9DBA, $9DC6, $9DCF, $9DC2
     Data.l $9DD9, $9DD3, $9DF8, $9DE6, $9DED, $9DEF, $9DFD, $9E1A
     Data.l $9E1B, $9E1E, $9E75, $9E79, $9E7D, $9E81, $9E88, $9E8B
     Data.l $9E8C, $9E92, $9E95, $9E91, $9E9D, $9EA5, $9EA9, $9EB8
     Data.l $9EAA, $9EAD, $9761, $9ECC, $9ECE, $9ECF, $9ED0, $9ED4
     Data.l $9EDC, $9EDE, $9EDD, $9EE0, $9EE5, $9EE8, $9EEF, $9EF4
     Data.l $9EF6, $9EF7, $9EF9, $9EFB, $9EFC, $9EFD, $9F07, $9F08
     Data.l $76B7, $9F15, $9F21, $9F2C, $9F3E, $9F4A, $9F52, $9F54
     Data.l $9F63, $9F5F, $9F60, $9F61, $9F66, $9F67, $9F6C, $9F6A
     Data.l $9F77, $9F72, $9F76, $9F95, $9F9C, $9FA0
    Data_UnicodeTbl_Category_84:
     Data.l $582F, $69C7, $9059, $7464, $51DC, $7199, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_85:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_86:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_87:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_88:
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
     Data.l $0000, $0000, $0000, $0000, $0000, $0000
    Data_UnicodeTbl_Category_89:
     Data.l $7E8A, $891C, $9348, $9288, $84DC, $4FC9, $70BB, $6631
     Data.l $68C8, $92F9, $66FB, $5F45, $4E28, $4EE1, $4EFC, $4F00
     Data.l $4F03, $4F39, $4F56, $4F92, $4F8A, $4F9A, $4F94, $4FCD
     Data.l $5040, $5022, $4FFF, $501E, $5046, $5070, $5042, $5094
     Data.l $50F4, $50D8, $514A, $5164, $519D, $51BE, $51EC, $5215
     Data.l $529C, $52A6, $52C0, $52DB, $5300, $5307, $5324, $5372
     Data.l $5393, $53B2, $53DD, $FA0E, $549C, $548A, $54A9, $54FF
     Data.l $5586, $5759, $5765, $57AC, $57C8, $57C7, $FA0F, $FA10
     Data.l $589E, $58B2, $590B, $5953, $595B, $595D, $5963, $59A4
     Data.l $59BA, $5B56, $5BC0, $752F, $5BD8, $5BEC, $5C1E, $5CA6
     Data.l $5CBA, $5CF5, $5D27, $5D53, $FA11, $5D42, $5D6D, $5DB8
     Data.l $5DB9, $5DD0, $5F21, $5F34, $5F67, $5FB7
    Data_UnicodeTbl_Category_90:
     Data.l $5FDE, $605D, $6085, $608A, $60DE, $60D5, $6120, $60F2
     Data.l $6111, $6137, $6130, $6198, $6213, $62A6, $63F5, $6460
     Data.l $649D, $64CE, $654E, $6600, $6615, $663B, $6609, $662E
     Data.l $661E, $6624, $6665, $6657, $6659, $FA12, $6673, $6699
     Data.l $66A0, $66B2, $66BF, $66FA, $670E, $F929, $6766, $67BB
     Data.l $6852, $67C0, $6801, $6844, $68CF, $FA13, $6968, $FA14
     Data.l $6998, $69E2, $6A30, $6A6B, $6A46, $6A73, $6A7E, $6AE2
     Data.l $6AE4, $6BD6, $6C3F, $6C5C, $6C86, $6C6F, $6CDA, $6D04
     Data.l $6D87, $6D6F, $6D96, $6DAC, $6DCF, $6DF8, $6DF2, $6DFC
     Data.l $6E39, $6E5C, $6E27, $6E3C, $6EBF, $6F88, $6FB5, $6FF5
     Data.l $7005, $7007, $7028, $7085, $70AB, $710F, $7104, $715C
     Data.l $7146, $7147, $FA15, $71C1, $71FE, $72B1
    Data_UnicodeTbl_Category_91:
     Data.l $72BE, $7324, $FA16, $7377, $73BD, $73C9, $73D6, $73E3
     Data.l $73D2, $7407, $73F5, $7426, $742A, $7429, $742E, $7462
     Data.l $7489, $749F, $7501, $756F, $7682, $769C, $769E, $769B
     Data.l $76A6, $FA17, $7746, $52AF, $7821, $784E, $7864, $787A
     Data.l $7930, $FA18, $FA19, $FA1A, $7994, $FA1B, $799B, $7AD1
     Data.l $7AE7, $FA1C, $7AEB, $7B9E, $FA1D, $7D48, $7D5C, $7DB7
     Data.l $7DA0, $7DD6, $7E52, $7F47, $7FA1, $FA1E, $8301, $8362
     Data.l $837F, $83C7, $83F6, $8448, $84B4, $8553, $8559, $856B
     Data.l $FA1F, $85B0, $FA20, $FA21, $8807, $88F5, $8A12, $8A37
     Data.l $8A79, $8AA7, $8ABE, $8ADF, $FA22, $8AF6, $8B53, $8B7F
     Data.l $8CF0, $8CF4, $8D12, $8D76, $FA23, $8ECF, $FA24, $FA25
     Data.l $9067, $90DE, $FA26, $9115, $9127, $91DA
    Data_UnicodeTbl_Category_92:
     Data.l $91D7, $91DE, $91ED, $91EE, $91E4, $91E5, $9206, $9210
     Data.l $920A, $923A, $9240, $923C, $924E, $9259, $9251, $9239
     Data.l $9267, $92A7, $9277, $9278, $92E7, $92D7, $92D9, $92D0
     Data.l $FA27, $92D5, $92E0, $92D3, $9325, $9321, $92FB, $FA28
     Data.l $931E, $92FF, $931D, $9302, $9370, $9357, $93A4, $93C6
     Data.l $93DE, $93F8, $9431, $9445, $9448, $9592, $F9DC, $FA29
     Data.l $969D, $96AF, $9733, $973B, $9743, $974D, $974F, $9751
     Data.l $9755, $9857, $9865, $FA2A, $FA2B, $9927, $FA2C, $999E
     Data.l $9A4E, $9AD9, $9ADC, $9B75, $9B72, $9B8F, $9BB1, $9BBB
     Data.l $9C00, $9D70, $9D6B, $FA2D, $9E19, $9ED1, $0000, $0000
     Data.l $2170, $2171, $2172, $2173, $2174, $2175, $2176, $2177
     Data.l $2178, $2179, $FFE2, $FFE4, $FF07, $FF02
  EndDataSection
;}

ProcedureDLL gdImageRed(*im.gdImage, *c.gdImage) 
  If *im\trueColor
    ProcedureReturn gdTrueColorGetRed(*c)
  Else
    ProcedureReturn *im\red[*c]
  EndIf
EndProcedure
ProcedureDLL gdImageGreen(*im.gdImage, *c.gdImage) 
  If *im\trueColor
    ProcedureReturn gdTrueColorGetGreen(*c)
  Else
    ProcedureReturn *im\green[*c]
  EndIf
EndProcedure
ProcedureDLL gdImageBlue(*im.gdImage, *c.gdImage) 
  If *im\trueColor
    ProcedureReturn gdTrueColorGetBlue(*c)
  Else
    ProcedureReturn *im\blue[*c]
  EndIf
EndProcedure
ProcedureDLL gdImageAlpha(*im.gdImage, *c.gdImage) 
  If *im\trueColor
    ProcedureReturn gdTrueColorGetAlpha(*c)
  Else
    ProcedureReturn *im\alpha[*c]
  EndIf
EndProcedure

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 1770
; Folding = AAAAAAA-