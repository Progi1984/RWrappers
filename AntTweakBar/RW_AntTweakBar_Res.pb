;{ Macros
  ; Fonctions
  ;Macro TwEventWin32 : TwEventWin : EndMacro
  Macro TwEventMousePosGLFW : TwMouseMotion : EndMacro
  Macro TwEventMouseWheelGLFW : TwMouseWheel : EndMacro
  ; Enumerations
  Macro TwType : l : EndMacro
  Macro TwParamValueType : l : EndMacro
  Macro TwGraphAPI : l : EndMacro
  Macro TwKeyModifier : l : EndMacro
  Macro KeySpecial : l : EndMacro
  Macro TwMouseAction : l : EndMacro
  Macro TwMouseButtonID : l : EndMacro
  ; Structures
  Macro TwBar : l : EndMacro
  ; Macros
  Macro TW_TYPE_CSSTRING(n) ;Null-terminated C Static String of size n (defined As char[n], With n<2^28)
    ($30000000+(n & $fffffff)) 
  EndMacro
;}
;{ Constantes

;}
;{ Enumerations
  Enumeration 0 ; ETwType
    #TW_TYPE_UNDEF   = 0
    #TW_TYPE_BOOL8   = 2
    #TW_TYPE_BOOL16
    #TW_TYPE_BOOL32
    #TW_TYPE_CHAR
    #TW_TYPE_INT8
    #TW_TYPE_UINT8
    #TW_TYPE_INT16
    #TW_TYPE_UINT16
    #TW_TYPE_INT32
    #TW_TYPE_UINT32
    #TW_TYPE_FLOAT
    #TW_TYPE_DOUBLE
    #TW_TYPE_COLOR32      ; 32 bits color. Order is RGBA If API is OpenGL Or Direct3D10 And inversed If API is Direct3D9 (can be modified by defining 'colorOrder=...' see doc)
    #TW_TYPE_COLOR3F      ; 3 floats color. Order is RGB.
    #TW_TYPE_COLOR4F      ; 4 floats color. Order is RGBA.
    #TW_TYPE_CDSTRING     ; Null-terminated C Dynamic String (pointer To an Array of char dynamically allocated With malloc/realloc/strdup)
    #TW_TYPE_QUAT4F = #TW_TYPE_CDSTRING+2 ; 4 floats encoding a quaternion {qxqyqzqs}
    #TW_TYPE_QUAT4D       ; 4 doubles encoding a quaternion {qxqyqzqs}
    #TW_TYPE_DIR3F        ; direction vector represented by 3 floats
    #TW_TYPE_DIR3D        ; direction vector represented by 3 doubles
  EndEnumeration
  Enumeration 0 ; ETwParamValueType
    #TW_PARAM_INT32
    #TW_PARAM_FLOAT
    #TW_PARAM_DOUBLE
    #TW_PARAM_CSTRING ; Null-terminated Array of char (ie, c-string)
  EndEnumeration
  Enumeration 0 ; ETwGraphAPI
    #TW_OPENGL           = 1
    #TW_DIRECT3D9        = 2
    #TW_DIRECT3D10       = 3
  EndEnumeration
  Enumeration 0 ; ETwKeyModifier
    #TW_KMOD_NONE        = $0000   ; same codes As SDL keysym.mod
    #TW_KMOD_SHIFT       = $0003
    #TW_KMOD_CTRL        = $00c0
    #TW_KMOD_ALT         = $0100
    #TW_KMOD_META        = $0c00
  EndEnumeration
  Enumeration 0 ; EKeySpecial
    #TW_KEY_BACKSPACE    = '\b'
    #TW_KEY_TAB          = '\t'
    #TW_KEY_CLEAR        = $0c
    #TW_KEY_RETURN       = '\r'
    #TW_KEY_PAUSE        = $13
    #TW_KEY_ESCAPE       = $1b
    #TW_KEY_SPACE        = ' '
    #TW_KEY_DELETE       = $7f
    #TW_KEY_UP           = 273      ; same codes And order As SDL keysym.sym
    #TW_KEY_DOWN
    #TW_KEY_RIGHT
    #TW_KEY_LEFT
    #TW_KEY_INSERT
    #TW_KEY_HOME
    #TW_KEY_END
    #TW_KEY_PAGE_UP
    #TW_KEY_PAGE_DOWN
    #TW_KEY_F1
    #TW_KEY_F2
    #TW_KEY_F3
    #TW_KEY_F4
    #TW_KEY_F5
    #TW_KEY_F6
    #TW_KEY_F7
    #TW_KEY_F8
    #TW_KEY_F9
    #TW_KEY_F10
    #TW_KEY_F11
    #TW_KEY_F12
    #TW_KEY_F13
    #TW_KEY_F14
    #TW_KEY_F15
    #TW_KEY_LAST
  EndEnumeration
  Enumeration 0 ; ETwMouseAction
    #TW_MOUSE_RELEASED
    #TW_MOUSE_PRESSED  
  EndEnumeration
  Enumeration 0 ; ETwMouseButtonID
    #TW_MOUSE_LEFT       = 1    ; same code As SDL_BUTTON_LEFT
    #TW_MOUSE_MIDDLE     = 2    ; same code As SDL_BUTTON_MIDDLE
    #TW_MOUSE_RIGHT      = 3    ; same code As SDL_BUTTON_RIGHT
  EndEnumeration
;}
;{ Structures
  Structure TwEnumVal
    Value.l
    Label.s
  EndStructure
  Structure TwStructMember
    Name.s
    Type.TwType
    Offset.l
    DefString.s
  EndStructure
;}
;{ Prototypes
  Prototype.l RW_AntTweakBar_TwSetVarCallback(value.l, *clientData)
  Prototype.l RW_AntTweakBar_TwGetVarCallback(*value, *clientData)
  Prototype.l RW_AntTweakBar_TwButtonCallback(*clientData)
  Prototype.l RW_AntTweakBar_TwSummaryCallback(summaryString.s, summaryMaxLength.l, *value, *clientData)
  Prototype.l RW_AntTweakBar_TwCopyCDStringToClient(*destinationClientStringPtr.s, sourceString.s)
  Prototype.l RW_AntTweakBar_TwErrorHandler(mouseX.l, mouseY.l)
  Prototype.l RW_AntTweakBar_GLUTmousebuttonfun(glutButton.l, glutState.l, mouseX.l, mouseY.l)
  Prototype.l RW_AntTweakBar_GLUTmousemotionfun(mouseX.l, mouseY.l)
  Prototype.l RW_AntTweakBar_GLUTkeyboardfun(glutKey.s, mouseX.l, mouseY.l)
  Prototype.l RW_AntTweakBar_GLUTspecialfun(glutKey.l, mouseX.l, mouseY.l)
;}
