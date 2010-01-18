;{ Constantes
#SDL_MAX_TRACKS       = 99
#SDL_INIT_TIMER       = $00000001
#SDL_INIT_AUDIO       = $00000010
#SDL_INIT_VIDEO       = $00000020
#SDL_INIT_CDROM       = $00000100
#SDL_INIT_JOYSTICK    = $00000200
#SDL_INIT_NOPARACHUTE = $00100000 ; Don't catch fatal signals
#SDL_INIT_EVENTTHREAD = $00000000 ;Not supported on all OS's
#SDL_INIT_EVERYTHING  = $0000FFFF

#SDL_SWSURFACE        = $00000000 ;Surface is in system memory
#SDL_HWSURFACE        = $00000001 ;Surface is in video memory
#SDL_ASYNCBLIT        = $00000004 ;Use asynchronous blits If possibleProcedure.l SDL_SetVideoMode(width.l, height.l, bpp.l, flags.l)

;Available For SDL_SetVideoMode()
#SDL_ANYFORMAT        = $10000000 ;Allow any video depth/pixel-format
#SDL_HWPALETTE        = $20000000 ;Surface has exclusive palette
#SDL_DOUBLEBUF        = $40000000 ;Set up double-buffered video mode
#SDL_FULLSCREEN       = $80000000 ;Surface is a full screen display
#SDL_OPENGL           = $00000002 ;Create an OpenGL rendering context
#SDL_OPENGLBLIT       = $0000000A ;Create an OpenGL rendering context And use it For blitting
#SDL_RESIZABLE        = $00000010 ;This video mode may be resized
#SDL_NOFRAME          = $00000020 ;No window caption Or edge frame

;Used internally (read-only)
#SDL_HWACCEL          = $00000100 ;Blit uses hardware acceleration
#SDL_SRCCOLORKEY      = $00001000 ;Blit uses a source color key
#SDL_RLEACCELOK       = $00002000 ;Private flag
#SDL_RLEACCEL         = $00004000 ;Surface is RLE encoded
#SDL_SRCALPHA         = $00010000 ;Blit uses source alpha blending
#SDL_PREALLOC         = $01000000 ;Surface uses preallocated memory

#SDL_QUERY            = -1
#SDL_IGNORE           = 0
#SDL_DISABLE          = 0
#SDL_ENABLE           = 1


; Event enumerations
Enumeration ;  #SDL_EventType
  #SDL_NOEVENT            = 0; Unused (do Not remove) 
  #SDL_ACTIVEEVENT			  ; Application loses/gains visibility 
  #SDL_KEYDOWN			      =65538; Keys pressed 
  #SDL_KEYUP	        		=3; Keys released 
  #SDL_MOUSEMOTION			  ; Mouse moved 
  #SDL_MOUSEBUTTONDOWN		; Mouse button pressed 
  #SDL_MOUSEBUTTONUP		  ; Mouse button released 
  #SDL_JOYAXISMOTION	  	; Joystick axis motion 
  #SDL_JOYBALLMOTION		  ; Joystick trackball motion 
  #SDL_JOYHATMOTION  		  ; Joystick hat position change 
  #SDL_JOYBUTTONDOWN  		; Joystick button pressed 
  #SDL_JOYBUTTONUP  			; Joystick button released 
  #SDL_QUIT			          =65538; User-requested quit 
  #SDL_SYSWMEVENT			    ; System specific event 
  #SDL_EVENT_RESERVEDA		; Reserved For future use.. 
  #SDL_EVENT_RESERVEDB		; Reserved For future use.. 
  #SDL_VIDEORESIZE			  =268547600; User resized video mode 
  #SDL_VIDEOEXPOSE			  ; Screen needs To be redrawn 
  #SDL_EVENT_RESERVED2		; Reserved For future use.. 
  #SDL_EVENT_RESERVED3		; Reserved For future use.. 
  #SDL_EVENT_RESERVED4		; Reserved For future use.. 
  #SDL_EVENT_RESERVED5		; Reserved For future use.. 
  #SDL_EVENT_RESERVED6		; Reserved For future use.. 
  #SDL_EVENT_RESERVED7		; Reserved For future use.. 
                          ; Events #SDL_USEREVENT through #SDL_MAXEVENTS-1 are For your use 
  #SDL_USEREVENT          = 24; This last event is only For bounding internal arrays
	                        ; It is the number of bits in the event mask datatype -- Uint32
  #SDL_NUMEVENTS          = 32
EndEnumeration

Enumeration 
	#SDLK_UNKNOWN		= 0
	#SDLK_FIRST		= 0
	#SDLK_BACKSPACE		= 8
	#SDLK_TAB		= 9
	#SDLK_CLEAR		= 12
	#SDLK_RETURN		= 13
	#SDLK_PAUSE		= 19
	#SDLK_ESCAPE		= 65539
	#SDLK_SPACE		= 32
	#SDLK_EXCLAIM		= 33
	#SDLK_QUOTEDBL		= 34
	#SDLK_HASH		= 35
	#SDLK_DOLLAR		= 36
	#SDLK_AMPERSAND		= 38
	#SDLK_QUOTE		= 39
	#SDLK_LEFTPAREN		= 40
	#SDLK_RIGHTPAREN		= 41
	#SDLK_ASTERISK		= 42
	#SDLK_PLUS		= 43
	#SDLK_COMMA		= 44
	#SDLK_MINUS		= 45
	#SDLK_PERIOD		= 46
	#SDLK_SLASH		= 47
	#SDLK_0			= 48
	#SDLK_1			= 49
	#SDLK_2			= 50
	#SDLK_3			= 51
	#SDLK_4			= 52
	#SDLK_5			= 53
	#SDLK_6			= 54
	#SDLK_7			= 55
	#SDLK_8			= 56
	#SDLK_9			= 57
	#SDLK_COLON		= 58
	#SDLK_SEMICOLON		= 59
	#SDLK_LESS		= 60
	#SDLK_EQUALS		= 61
	#SDLK_GREATER		= 62
	#SDLK_QUESTION		= 63
	#SDLK_AT			= 64
	;  Skip uppercase letters
	 
	#SDLK_LEFTBRACKET	= 91
	#SDLK_BACKSLASH		= 92
	#SDLK_RIGHTBRACKET	= 93
	#SDLK_CARET		= 94
	#SDLK_UNDERSCORE		= 95
	#SDLK_BACKQUOTE		= 96
	#SDLK_a			= 97
	#SDLK_b			= 98
	#SDLK_c			= 99
	#SDLK_d			= 100
	#SDLK_e			= 101
	#SDLK_f			= 102
	#SDLK_g			= 103
	#SDLK_h			= 104
	#SDLK_i			= 105
	#SDLK_j			= 106
	#SDLK_k			= 107
	#SDLK_l			= 108
	#SDLK_m			= 109
	#SDLK_n			= 110
	#SDLK_o			= 111
	#SDLK_p			= 112
	#SDLK_q			= 113
	#SDLK_r			= 114
	#SDLK_s			= 115
	#SDLK_t			= 116
	#SDLK_u			= 117
	#SDLK_v			= 118
	#SDLK_w			= 119
	#SDLK_x			= 120
	#SDLK_y			= 121
	#SDLK_z			= 122
	#SDLK_DELETE		= 127
	; End of ASCII mapped keysyms 

	; International keyboard syms 
	#SDLK_WORLD_0		= 160		; 0xA0 
	#SDLK_WORLD_1		= 161
	#SDLK_WORLD_2		= 162
	#SDLK_WORLD_3		= 163
	#SDLK_WORLD_4		= 164
	#SDLK_WORLD_5		= 165
	#SDLK_WORLD_6		= 166
	#SDLK_WORLD_7		= 167
	#SDLK_WORLD_8		= 168
	#SDLK_WORLD_9		= 169
	#SDLK_WORLD_10		= 170
	#SDLK_WORLD_11		= 171
	#SDLK_WORLD_12		= 172
	#SDLK_WORLD_13		= 173
	#SDLK_WORLD_14		= 174
	#SDLK_WORLD_15		= 175
	#SDLK_WORLD_16		= 176
	#SDLK_WORLD_17		= 177
	#SDLK_WORLD_18		= 178
	#SDLK_WORLD_19		= 179
	#SDLK_WORLD_20		= 180
	#SDLK_WORLD_21		= 181
	#SDLK_WORLD_22		= 182
	#SDLK_WORLD_23		= 183
	#SDLK_WORLD_24		= 184
	#SDLK_WORLD_25		= 185
	#SDLK_WORLD_26		= 186
	#SDLK_WORLD_27		= 187
	#SDLK_WORLD_28		= 188
	#SDLK_WORLD_29		= 189
	#SDLK_WORLD_30		= 190
	#SDLK_WORLD_31		= 191
	#SDLK_WORLD_32		= 192
	#SDLK_WORLD_33		= 193
	#SDLK_WORLD_34		= 194
	#SDLK_WORLD_35		= 195
	#SDLK_WORLD_36		= 196
	#SDLK_WORLD_37		= 197
	#SDLK_WORLD_38		= 198
	#SDLK_WORLD_39		= 199
	#SDLK_WORLD_40		= 200
	#SDLK_WORLD_41		= 201
	#SDLK_WORLD_42		= 202
	#SDLK_WORLD_43		= 203
	#SDLK_WORLD_44		= 204
	#SDLK_WORLD_45		= 205
	#SDLK_WORLD_46		= 206
	#SDLK_WORLD_47		= 207
	#SDLK_WORLD_48		= 208
	#SDLK_WORLD_49		= 209
	#SDLK_WORLD_50		= 210
	#SDLK_WORLD_51		= 211
	#SDLK_WORLD_52		= 212
	#SDLK_WORLD_53		= 213
	#SDLK_WORLD_54		= 214
	#SDLK_WORLD_55		= 215
	#SDLK_WORLD_56		= 216
	#SDLK_WORLD_57		= 217
	#SDLK_WORLD_58		= 218
	#SDLK_WORLD_59		= 219
	#SDLK_WORLD_60		= 220
	#SDLK_WORLD_61		= 221
	#SDLK_WORLD_62		= 222
	#SDLK_WORLD_63		= 223
	#SDLK_WORLD_64		= 224
	#SDLK_WORLD_65		= 225
	#SDLK_WORLD_66		= 226
	#SDLK_WORLD_67		= 227
	#SDLK_WORLD_68		= 228
	#SDLK_WORLD_69		= 229
	#SDLK_WORLD_70		= 230
	#SDLK_WORLD_71		= 231
	#SDLK_WORLD_72		= 232
	#SDLK_WORLD_73		= 233
	#SDLK_WORLD_74		= 234
	#SDLK_WORLD_75		= 235
	#SDLK_WORLD_76		= 236
	#SDLK_WORLD_77		= 237
	#SDLK_WORLD_78		= 238
	#SDLK_WORLD_79		= 239
	#SDLK_WORLD_80		= 240
	#SDLK_WORLD_81		= 241
	#SDLK_WORLD_82		= 242
	#SDLK_WORLD_83		= 243
	#SDLK_WORLD_84		= 244
	#SDLK_WORLD_85		= 245
	#SDLK_WORLD_86		= 246
	#SDLK_WORLD_87		= 247
	#SDLK_WORLD_88		= 248
	#SDLK_WORLD_89		= 249
	#SDLK_WORLD_90		= 250
	#SDLK_WORLD_91		= 251
	#SDLK_WORLD_92		= 252
	#SDLK_WORLD_93		= 253
	#SDLK_WORLD_94		= 254
	#SDLK_WORLD_95		= 255		; 0xFF 

	; Numeric keypad 
	#SDLK_KP0		= 256
	#SDLK_KP1		= 257
	#SDLK_KP2		= 258
	#SDLK_KP3		= 259
	#SDLK_KP4		= 260
	#SDLK_KP5		= 261
	#SDLK_KP6		= 262
	#SDLK_KP7		= 263
	#SDLK_KP8		= 264
	#SDLK_KP9		= 265
	#SDLK_KP_PERIOD		= 266
	#SDLK_KP_DIVIDE		= 267
	#SDLK_KP_MULTIPLY	= 268
	#SDLK_KP_MINUS		= 269
	#SDLK_KP_PLUS		= 270
	#SDLK_KP_ENTER		= 271
	#SDLK_KP_EQUALS		= 272

	; Arrows + Home/End pad 
	#SDLK_UP			= 273
	#SDLK_DOWN		= 274
	#SDLK_RIGHT		= 275
	#SDLK_LEFT		= 276
	#SDLK_INSERT		= 277
	#SDLK_HOME		= 278
	#SDLK_END		= 279
	#SDLK_PAGEUP		= 280
	#SDLK_PAGEDOWN		= 281

	; Function keys 
	#SDLK_F1			= 282
	#SDLK_F2			= 283
	#SDLK_F3			= 284
	#SDLK_F4			= 285
	#SDLK_F5			= 286
	#SDLK_F6			= 287
	#SDLK_F7			= 288
	#SDLK_F8			= 289
	#SDLK_F9			= 290
	#SDLK_F10		= 291
	#SDLK_F11		= 292
	#SDLK_F12		= 293
	#SDLK_F13		= 294
	#SDLK_F14		= 295
	#SDLK_F15		= 296

	; Key state modifier keys 
	#SDLK_NUMLOCK		= 300
	#SDLK_CAPSLOCK		= 301
	#SDLK_SCROLLOCK		= 302
	#SDLK_RSHIFT		= 303
	#SDLK_LSHIFT		= 304
	#SDLK_RCTRL		= 305
	#SDLK_LCTRL		= 306
	#SDLK_RALT		= 307
	#SDLK_LALT		= 308
	#SDLK_RMETA		= 309
	#SDLK_LMETA		= 310
	#SDLK_LSUPER		= 311		; Left "Windows" key 
	#SDLK_RSUPER		= 312		; Right "Windows" key 
	#SDLK_MODE		= 313		; "Alt Gr" key 
	#SDLK_COMPOSE		= 314		; Multi-key compose key 

	; Miscellaneous function keys 
	#SDLK_HELP		= 315
	#SDLK_PRINT		= 316
	#SDLK_SYSREQ		= 317
	#SDLK_BREAK		= 318
	#SDLK_MENU		= 319
	#SDLK_POWER		= 320		; Power Macintosh power key 
	#SDLK_EURO		= 321		; Some european keyboards 
	#SDLK_UNDO		= 322		; Atari keyboard has Undo 

	; Add any other keys here 

	#SDLK_LAST
EndEnumeration
Enumeration ; CDstatus
  #CD_TRAYEMPTY
  #CD_STOPPED
  #CD_PLAYING
  #CD_PAUSED
  #CD_ERROR = -1
EndEnumeration
Enumeration ; SDL_audiostatus
  #SDL_AUDIO_STOPPED
  #SDL_AUDIO_PAUSED
  #SDL_AUDIO_PLAYING
EndEnumeration
Enumeration ; SDLMod
  #KMOD_NONE  = $0000
  #KMOD_LSHIFT= $0001
  #KMOD_RSHIFT= $0002
  #KMOD_LCTRL = $0040
  #KMOD_RCTRL = $0080
  #KMOD_LALT  = $0100
  #KMOD_RALT  = $0200
  #KMOD_LMETA = $0400
  #KMOD_RMETA = $0800
  #KMOD_NUM   = $1000
  #KMOD_CAPS  = $2000
  #KMOD_MODE  = $4000
EndEnumeration

#Nuls     = ""
;}
;{ Structures
Structure SDL_Rect
  x.w
  y.w
  w.w
  h.w
EndStructure
Structure SDL_Color
 r.c
 g.c
 b.c
 unused.c
EndStructure
Structure SDL_Palette
 ncolors.l
 *colors.SDL_Color
EndStructure
Structure SDL_PixelFormat
 *palette.SDL_Palette
 BitsPerPixel.c
 BytesPerPixel.c
 Rloss.c
 Gloss.c
 Bloss.c
 Aloss.c
 Rshift.c
 Gshift.c
 Bshift.c
 Ashift.c
 Rmask.l
 Gmask.l
 Bmask.l
 Amask.l
 colorkey.l
 alpha.c
EndStructure
Structure SDL_Surface
  flags.l                     
  format.SDL_PixelFormat     
  w.l
  h.l 
  pitch.w   
  pixels.l   
  offset.l   
  clip_rect.SDL_Rect   
  unused1.l   
  locked.l   
  *map.SDL_BlitMap
  format_version.l
  refcount.l
EndStructure

Structure SDL_keysym
  scancode.l
  sym     .l ; Enumeration SDlKey
  mod     .l ; Enumeration SDLMod
  unicode .l
EndStructure
Structure SDL_ActiveEvent
  type  .c
  gain  .c
  state .c
EndStructure
Structure SDL_KeyboardEvent
  type  .c
  state .c
  keysym.SDL_keysym
EndStructure
Structure SDL_MouseMotionEvent
  type  .l
  state .l
  x     .l
  y     .l
  xrel  .l
  yrel  .l
EndStructure
Structure SDL_MouseButtonEvent
  type.l
  button.l
  state.l
  x.l
  y.l
EndStructure
Structure SDL_JoyAxisEvent
  type    .l
  which   .l
  axis    .l
  value   .l
EndStructure
Structure SDL_JoyBallEvent
  type    .l
  which   .l
  ball    .l
  xrel    .l
  yrel    .l
EndStructure
Structure SDL_JoyHatEvent
  type    .l
  which   .l
  hat     .l
  value   .l
EndStructure
Structure SDL_JoyButtonEvent
  type    .l
  which   .l
  button  .l
  state   .l
EndStructure
Structure SDL_ResizeEvent
  type  .l
  w     .l
  h     .l
EndStructure
Structure SDL_QuitEvent
  type    .l
EndStructure
Structure SDL_UserEvent
  type    .l
  code    .l
  *data1  .l
  *data2  .l
EndStructure
Structure SDL_SywWMEvent
  type    .l
EndStructure
Structure SDL_Event
  StructureUnion
    type    .l
    active  .SDL_ActiveEvent
    key     .SDL_KeyboardEvent
    motion  .SDL_MouseMotionEvent
    button  .SDL_MouseButtonEvent
    jaxis   .SDL_JoyAxisEvent
    jball   .SDL_JoyBallEvent
    jhat    .SDL_JoyHatEvent
    jbutton .SDL_JoyButtonEvent
    resize  .SDL_ResizeEvent
    quit    .SDL_QuitEvent
    user    .SDL_UserEvent
    syswm   .SDL_SywWMEvent
  EndStructureUnion
EndStructure

Prototype PSeek(*This, offset, whence)
Prototype PRead(*This, *ptr, Size, maxnum)
Prototype PWrite(*This, *ptr, Size, Num)
Prototype PClose(*This)
Structure FILE
   _ptr.s
   _cnt.l
   _base.s
   _flag.l
   _file.l
   _charbuf.l
   _bufsiz.l
   _tmpfname.s
EndStructure
Structure stdio
   autoclose.l
   *fp.FILE
EndStructure
Structure mem
   *base.c
   *here.c
   *stop.c
EndStructure
Structure unknown
   *data1.l
EndStructure
Structure SDL_RWops
   Seek.PSeek
   Read.PRead
   Write.PWrite
   Close.PClose
   StructureUnion
      hidden1.stdio
      hidden2.mem
      hidden3.unknown
   EndStructureUnion
EndStructure 

Structure SDL_AudioCVT
  needed.l
  src_format.l
  dest_format.l
  rate_incr.d
  *buf.l
  len.l
  len_cvt.l
  len_mult.l
  len_ratio.d
  filters.l[10]
  filter_index.l
EndStructure
Structure SDL_CDtrack
  id.l
  type.l
  length.l
  offset.l
EndStructure
Structure SDL_CD
  id.l
  status.l ; Enum CDstatus 
  numtracks.l
  cur_track.l
  cur_frame.l
  track.SDL_CDtrack[#SDL_MAX_TRACKS+1]
EndStructure
Structure SDL_Overlay
  format.l
  w.l
  h.l
  planes.l
  pitches.l
  pixels.l
  hw_overlay.l
EndStructure
Structure SDL_SysWMinfo
  version.l
  data_.l
EndStructure
Structure SDL_AudioSpec
  freq.l
  format.l
  channels.l
  silence.l
  samples.l
  size.l
  callback.l
  userdata.l
EndStructure
Structure SDL_iconv_t
  src_fmt.l
  dst_fmt.l
EndStructure


;Structure SDL_Cond       = Long 
;Structure SDL_mutex      = Long
;Structure SDL_Sem        = Long
;Structure SDL_Joystick   = Long
;}
