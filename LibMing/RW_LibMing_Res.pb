;{ Macros
  ; Structures
  Macro SWFBlock : l : EndMacro
  Macro SWFMatrix : l : EndMacro
  Macro SWFInput : l : EndMacro
  Macro SWFCharacter : l : EndMacro
  Macro SWFDBLBitmap : l : EndMacro
  Macro SWFDBLBitmapData : l : EndMacro
  Macro SWFJpegBitmap : l : EndMacro
  Macro SWFJpegWithAlpha : l : EndMacro
  Macro SWFGradient : l : EndMacro
  Macro SWFFillStyle : l : EndMacro
  Macro SWFLineStyle : l : EndMacro
  Macro SWFShape : l : EndMacro
  Macro SWFMorph : l : EndMacro
  Macro SWFFont : l : EndMacro
  Macro SWFText : l : EndMacro
  Macro SWFBrowserFont : l : EndMacro
  Macro SWFFontCharacter : l : EndMacro
  Macro SWFFontCollection : l : EndMacro
  Macro SWFTextField : l : EndMacro
  Macro SWFSoundStream : l : EndMacro
  Macro SWFSound : l : EndMacro
  Macro SWFSoundInstance : l : EndMacro
  Macro SWFCXform : l : EndMacro
  Macro SWFAction : l : EndMacro
  Macro SWFInitAction : l : EndMacro
  Macro SWFButton : l : EndMacro
  Macro SWFSprite : l : EndMacro
  Macro SWFPosition : l : EndMacro
  Macro SWFDisplayItem : l : EndMacro
  Macro SWFFill : l : EndMacro
  Macro SWFMovieClip : l : EndMacro
  Macro SWFMovie : l : EndMacro
  Macro SWFVideoStream : l : EndMacro
  Macro SWFPrebuiltClip : l : EndMacro
  Macro SWFFilter : l : EndMacro
  Macro SWFButtonRecord : l : EndMacro
  Macro SWFSymbolClass : l : EndMacro
  Macro SWFBinaryData : l : EndMacro
  Macro SWFSceneData : l : EndMacro
  Macro SWFMovieBlockType_u : l : EndMacro
  Macro SWFShadow : l : EndMacro
  Macro SWFBlur : l : EndMacro
  Macro SWFFilterMatrix : l : EndMacro
  Macro SWFBitmap : SWFCharacter : EndMacro
  
  ; Enumerations
  Macro SWFBitmapFmt : l : EndMacro
  Macro SWFRawImgFmt : l : EndMacro
  Macro GradientSpreadMode : l : EndMacro
  Macro GradientInterpolationMode : l : EndMacro
  Macro SWFTextFieldAlignment : l : EndMacro
  Macro SWFFilterFmt : l : EndMacro
  
  ; Fonctions
  Macro SWFFont_getStringWidth : SWFFont_getWidth : EndMacro
  Macro SWFText_moveTo : SWFText_setXY : EndMacro
  Macro SWFDisplayItem_addColor : SWFDisplayItem_setColorAdd : EndMacro
  Macro SWFDisplayItem_multColor : SWFDisplayItem_setColorMult : EndMacro
  Macro SWFFill_scale : SWFFill_scaleXY : EndMacro 
  Macro SWFFill_scaleTo : SWFFill_scaleXYTo : EndMacro 
  Macro SWFShape_drawFontGlyph : SWFShape_drawGlyph : EndMacro
  
  ; Macros
  Macro SWFBUTTON_KEYPRESS(c) : ((c & $7f)<<9) : EndMacro
  Macro SWFBUTTON_ONKEYPRESS(c) : ((c & $7f)<<9):EndMacro
;}
;{ Constantes
  #MING_VERSION       = "0.4.2"
  #MING_VERSION_TEXT  = "0.4.2"
  
  #SWFFILL_SOLID				              = $00
  #SWFFILL_GRADIENT			              = $10
  #SWFFILL_LINEAR_GRADIENT 		        = $10
  #SWFFILL_RADIAL_GRADIENT 		        = $12
  #SWFFILL_FOCAL_GRADIENT			        = $13
  #SWFFILL_BITMAP				              = $40
  #SWFFILL_TILED_BITMAP			          = $40
  #SWFFILL_CLIPPED_BITMAP			        = $41
  #SWFFILL_NONSMOOTHED_TILED_BITMAP 	= $42
  #SWFFILL_NONSMOOTHED_CLIPPED_BITMAP = $43
  
  
  #SWF_LINESTYLE_CAP_ROUND            = 0<<14
  #SWF_LINESTYLE_CAP_NONE             = 1<<14
  #SWF_LINESTYLE_CAP_SQUARE           = 2<<14
  
  #SWF_LINESTYLE_JOIN_ROUND           = 0<<12
  #SWF_LINESTYLE_JOIN_BEVEL           = 1<<12
  #SWF_LINESTYLE_JOIN_MITER           = 2<<12
  
  #SWF_LINESTYLE_FLAG_NOHSCALE        = 1<<10
  #SWF_LINESTYLE_FLAG_NOVSCALE        = 1<<9
  #SWF_LINESTYLE_FLAG_HINTING         = 1<<8
  
  #SWF_LINESTYLE_FLAG_NOCLOSE         = 1<<2
  
  #SWF_LINESTYLE_FLAG_ENDCAP_ROUND    = 0<<0
  #SWF_LINESTYLE_FLAG_ENDCAP_NONE     = 1<<0
  #SWF_LINESTYLE_FLAG_ENDCAP_SQUARE   = 2<<0
  
  #SWF_SHAPE1                         = 1
  #SWF_SHAPE2                         = 2
  #SWF_SHAPE3                         = 3
  #SWF_SHAPE4                         = 4
  
  #SWF_SHAPE_USESCALINGSTROKES 	      = 1<<0
  #SWF_SHAPE_USENONSCALINGSTROKES	    = 1<<1
  
  #SWFTEXTFIELD_HASFONT   = 1<<0   ; private 
  #SWFTEXTFIELD_HASLENGTH = 1<<1   ; private 
  #SWFTEXTFIELD_HASCOLOR  = 1<<2   ; private  
  #SWFTEXTFIELD_NOEDIT    = 1<<3   ; disables editing 
  #SWFTEXTFIELD_PASSWORD  = 1<<4   ; hides characters 
  #SWFTEXTFIELD_MULTILINE = 1<<5   ; multiline And scrollable 
  #SWFTEXTFIELD_WORDWRAP  = 1<<6   ; enable automatic line wrap 
  #SWFTEXTFIELD_HASTEXT   = 1<<7   ; private 
  #SWFTEXTFIELD_USEFONT   = 1<<8   ; private 
  #SWFTEXTFIELD_HTML      = 1<<9   ; renders some HTML tags
  #SWFTEXTFIELD_DRAWBOX   = 1<<11  ; draws a border 
  #SWFTEXTFIELD_NOSELECT  = 1<<12  ; disabled selection 
  #SWFTEXTFIELD_HASLAYOUT = 1<<13  ; private 
  #SWFTEXTFIELD_AUTOSIZE  = 1<<14  ; resizes To textlen 
  
  #SWF_SOUND_COMPRESSION       = $f0
  #SWF_SOUND_NOT_COMPRESSED    = 0<<4
  #SWF_SOUND_ADPCM_COMPRESSED  = 1<<4
  #SWF_SOUND_MP3_COMPRESSED    = 2<<4
  #SWF_SOUND_NOT_COMPRESSED_LE = 3<<4
  #SWF_SOUND_NELLY_COMPRESSED  = 6<<4
  
  #SWF_SOUND_RATE              = $0c
  #SWF_SOUND_5KHZ              = 0<<2
  #SWF_SOUND_11KHZ             = 1<<2
  #SWF_SOUND_22KHZ             = 2<<2
  #SWF_SOUND_44KHZ             = 3<<2
  
  #SWF_SOUND_BITS              = $02
  #SWF_SOUND_8BITS             = 0<<1
  #SWF_SOUND_16BITS            = 1<<1
  
  #SWF_SOUND_CHANNELS          = $01
  #SWF_SOUND_MONO              = 0<<0
  #SWF_SOUND_STEREO            = 1<<0
  
  #SWFBUTTON_HIT               = 1<<3
  #SWFBUTTON_DOWN              = 1<<2
  #SWFBUTTON_OVER              = 1<<1
  #SWFBUTTON_UP                = 1<<0
  
  
  #SWFBUTTONRECORD_HITSTATE    = 1<<3
  #SWFBUTTONRECORD_DOWNSTATE   = 1<<2
  #SWFBUTTONRECORD_OVERSTATE   = 1<<1
  #SWFBUTTONRECORD_UPSTATE     = 1<<0
  
  #SWFBUTTON_OVERDOWNTOIDLE    = 1<<8
  #SWFBUTTON_IDLETOOVERDOWN    = 1<<7
  #SWFBUTTON_OUTDOWNTOIDLE     = 1<<6
  #SWFBUTTON_OUTDOWNTOOVERDOWN = 1<<5
  #SWFBUTTON_OVERDOWNTOOUTDOWN = 1<<4
  #SWFBUTTON_OVERDOWNTOOVERUP  = 1<<3
  #SWFBUTTON_OVERUPTOOVERDOWN  = 1<<2
  #SWFBUTTON_OVERUPTOIDLE      = 1<<1
  #SWFBUTTON_IDLETOOVERUP      = 1<<0
  
  #SWFBUTTON_MOUSEUPOUTSIDE    = #SWFBUTTON_OUTDOWNTOIDLE
  #SWFBUTTON_DRAGOVER          = (#SWFBUTTON_OUTDOWNTOOVERDOWN | #SWFBUTTON_IDLETOOVERDOWN)
  #SWFBUTTON_DRAGOUT           = (#SWFBUTTON_OVERDOWNTOOUTDOWN | #SWFBUTTON_OVERDOWNTOIDLE)
  #SWFBUTTON_MOUSEUP           = #SWFBUTTON_OVERDOWNTOOVERUP
  #SWFBUTTON_MOUSEDOWN         = #SWFBUTTON_OVERUPTOOVERDOWN
  #SWFBUTTON_MOUSEOUT          = #SWFBUTTON_OVERUPTOIDLE
  #SWFBUTTON_MOUSEOVER         = #SWFBUTTON_IDLETOOVERUP
  
  #SWFVIDEOSTREAM_MODE_AUTO 	 = 0
  #SWFVIDEOSTREAM_MODE_MANUAL  = 1
  
  #FILTER_MODE_INNER           = 1<<7
  #FILTER_MODE_KO              = 1<<6
  #FILTER_MODE_COMPOSITE       = 1<<5
  #FILTER_MODE_ONTOP           = 1<<4
  
  #FILTER_FLAG_CLAMP           = 1<<1
  #FILTER_FLAG_PRESERVE_ALPHA  = 1<<0
  
  #SWFACTION_ONLOAD  = 1<<0
  #SWFACTION_ENTERFRAME  = 1<<1
  #SWFACTION_UNLOAD  = 1<<2
  #SWFACTION_MOUSEMOVE = 1<<3
  #SWFACTION_MOUSEDOWN = 1<<4
  #SWFACTION_MOUSEUP   = 1<<5
  #SWFACTION_KEYDOWN   = 1<<6
  #SWFACTION_KEYUP   = 1<<7
  #SWFACTION_DATA    = 1<<8
  #SWFACTION_INIT   = 1<<9
  #SWFACTION_PRESS      = 1<<10
  #SWFACTION_RELEASE   = 1<<11
  #SWFACTION_RELEASEOUTSIDE = 1<<12
  #SWFACTION_ROLLOVER  = 1<<13
  #SWFACTION_ROLLOUT   = 1<<14
  #SWFACTION_DRAGOVER  = 1<<15
  #SWFACTION_DRAGOUT   = 1<<16
  #SWFACTION_KEYPRESS  = 1<<17
  #SWFACTION_CONSTRUCT = 1<<18
;}
;{ Enumerations
  Enumeration 0 ; SWFBitmapFmt
  	#SWF_DBL_COLORTABLE
  	#SWF_DBL_RGB15
  	#SWF_DBL_RGB24
  	#SWF_DBL_RGB32
  EndEnumeration
  Enumeration 0 ; SWFRawImgFmt
  	#SWF_RAWIMG_ARGB
  EndEnumeration 
  Enumeration 0 ; GradientSpreadMode
    #SWF_GRADIENT_PAD
    #SWF_GRADIENT_REFLECT
    #SWF_GRADIENT_REPEAT
  EndEnumeration 
  Enumeration 0 ; GradientInterpolationMode
    #SWF_GRADIENT_NORMAL
    #SWF_GRADIENT_LINEAR
  EndEnumeration
  Enumeration ; SWFTextFieldAlignment
    #SWFTEXTFIELD_ALIGN_LEFT    = 0
    #SWFTEXTFIELD_ALIGN_RIGHT   = 1
    #SWFTEXTFIELD_ALIGN_CENTER  = 2
    #SWFTEXTFIELD_ALIGN_JUSTIFY = 3
  EndEnumeration 
  Enumeration 0 ; SWFFilterFmt
    #SWFFILTER_TYPE_DROPSHADOW
    #SWFFILTER_TYPE_BLUR
    #SWFFILTER_TYPE_GLOW
    #SWFFILTER_TYPE_BEVEL
    #SWFFILTER_TYPE_GRADIENTGLOW
    #SWFFILTER_TYPE_CONVOLUTION
    #SWFFILTER_TYPE_COLORMATRIX
    #SWFFILTER_TYPE_GRADIENTBEVEL
  EndEnumeration
  Enumeration 0 ; 
  	#SWFBLEND_MODE_NULL
  	#SWFBLEND_MODE_NORMAL
  	#SWFBLEND_MODE_LAYER
  	#SWFBLEND_MODE_MULT
  	#SWFBLEND_MODE_SCREEN
  	#SWFBLEND_MODE_LIGHTEN
  	#SWFBLEND_MODE_DARKEN
  	#SWFBLEND_MODE_DIFF
  	#SWFBLEND_MODE_ADD
  	#SWFBLEND_MODE_SUB
  	#SWFBLEND_MODE_INV
  	#SWFBLEND_MODE_ALPHA
  	#SWFBLEND_MODE_ERASE
  	#SWFBLEND_MODE_OVERLAY
  	#SWFBLEND_MODE_HARDLIGHT
  EndEnumeration
;}
;{ Structures 
  Structure SWFMovieBlockType
    StructureUnion
      block.SWFBlock
      character.SWFCharacter
      dblbmp.SWFDBLBitmap
      dblbmp_data.SWFDBLBitmapData
      jpegbmp.SWFJpegBitmap
      jpegbmp_alpha.SWFJpegWithAlpha
      shape.SWFShape
      morph.SWFMorph
      text.SWFText
      textfield.SWFTextField
      sound.SWFSound
      sound_instance.SWFSoundInstance
      action.SWFAction
      button.SWFButton
      sprite.SWFSprite
      mc.SWFMovieClip
      stream.SWFVideoStream
      prebuild.SWFPrebuiltClip
      binary.SWFBinaryData
      init.SWFInitAction  
    EndStructureUnion
  EndStructure
  Structure SWFColor
    red.b
    green.b
    blue.b
    alpha.b
  EndStructure
;}
;{ Prototypes
  ; Error And warning callbacks.
  Prototype.l LibMing_CB_SWFMsgFunc(msg.s)
  Prototype.l SWFByteOutputMethod(b.b, *data_)
;}

