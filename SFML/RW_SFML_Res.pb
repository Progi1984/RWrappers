;{ Macros
  Macro sfBool
    l
  EndMacro
;}
;{ Enumerations
  Enumeration 0; sfSoundStatus
    #sfStopped  ; Sound / music is Not playing
    #sfPaused   ; Sound / music is paused
    #sfPlaying  ; Sound / music is playing
  EndEnumeration
  Enumeration 0; sfBlendMode
    #sfBlendAlpha    ; Pixel = Src * a + Dest * (1 - a)
    #sfBlendAdd      ; Pixel = Src + Dest
    #sfBlendMultiply ; Pixel = Src * Dest
    #sfBlendNone     ; No blending
  EndEnumeration
  Enumeration 0; sfStringStyle
    #sfStringRegular    = 0      ; Regular characters, no style
    #sfStringBold       = 1 << 0 ; Characters are bold
    #sfStringItalic     = 1 << 1 ; Characters are in italic
    #sfStringUnderlined = 1 << 2 ; Characters are underlined
  EndEnumeration
  Enumeration 0; sfSocketStatus
    #sfSocketDone
    #sfSocketNotReady
    #sfSocketDisconnected
    #sfSocketError
  EndEnumeration
  Enumeration 0; sfKeyCode
    #sfKeyA = 'a'
    #sfKeyB = 'b'
    #sfKeyC = 'c'
    #sfKeyD = 'd'
    #sfKeyE = 'e'
    #sfKeyF = 'f'
    #sfKeyG = 'g'
    #sfKeyH = 'h'
    #sfKeyI = 'i'
    #sfKeyJ = 'j'
    #sfKeyK = 'k'
    #sfKeyL = 'l'
    #sfKeyM = 'm'
    #sfKeyN = 'n'
    #sfKeyO = 'o'
    #sfKeyP = 'p'
    #sfKeyQ = 'q'
    #sfKeyR = 'r'
    #sfKeyS = 's'
    #sfKeyT = 't'
    #sfKeyU = 'u'
    #sfKeyV = 'v'
    #sfKeyW = 'w'
    #sfKeyX = 'x'
    #sfKeyY = 'y'
    #sfKeyZ = 'z'
    #sfKeyNum0 = '0'
    #sfKeyNum1 = '1'
    #sfKeyNum2 = '2'
    #sfKeyNum3 = '3'
    #sfKeyNum4 = '4'
    #sfKeyNum5 = '5'
    #sfKeyNum6 = '6'
    #sfKeyNum7 = '7'
    #sfKeyNum8 = '8'
    #sfKeyNum9 = '9' 
    #sfKeyEscape = 256
    #sfKeyLControl
    #sfKeyLShift
    #sfKeyLAlt
    #sfKeyLSystem      ; OS specific key (left side) : windows (Win And Linux) apple (MacOS) ...
    #sfKeyRControl
    #sfKeyRShift
    #sfKeyRAlt
    #sfKeyRSystem      ; OS specific key (right side) : windows (Win And Linux) apple (MacOS) ...
    #sfKeyMenu
    #sfKeyLBracket     ; [
    #sfKeyRBracket     ; ]
    #sfKeySemiColon    ; ;
    #sfKeyComma        ; 
    #sfKeyPeriod       ; .
    #sfKeyQuote        ; '
    #sfKeySlash        ; /
    #sfKeyBackSlash
    #sfKeyTilde        ; ~
    #sfKeyEqual        ; =
    #sfKeyDash         ; -
    #sfKeySpace
    #sfKeyReturn
    #sfKeyBack
    #sfKeyTab
    #sfKeyPageUp
    #sfKeyPageDown
    #sfKeyEnd
    #sfKeyHome
    #sfKeyInsert
    #sfKeyDelete
    #sfKeyAdd          ; +
    #sfKeySubtract     ; -
    #sfKeyMultiply     ; *
    #sfKeyDivide       ; /
    #sfKeyLeft         ; Left arrow
    #sfKeyRight        ; Right arrow
    #sfKeyUp           ; Up arrow
    #sfKeyDown         ; Down arrow
    #sfKeyNumpad0
    #sfKeyNumpad1
    #sfKeyNumpad2
    #sfKeyNumpad3
    #sfKeyNumpad4
    #sfKeyNumpad5
    #sfKeyNumpad6
    #sfKeyNumpad7
    #sfKeyNumpad8
    #sfKeyNumpad9
    #sfKeyF1
    #sfKeyF2
    #sfKeyF3
    #sfKeyF4
    #sfKeyF5
    #sfKeyF6
    #sfKeyF7
    #sfKeyF8
    #sfKeyF9
    #sfKeyF10
    #sfKeyF11
    #sfKeyF12
    #sfKeyF13
    #sfKeyF14
    #sfKeyF15
    #sfKeyPause

    #sfKeyCount ; For internal use
  EndEnumeration
  Enumeration 0; sfMouseButton
    #sfButtonLeft
    #sfButtonRight
    #sfButtonMiddle
    #sfButtonX1
    #sfButtonX2
  EndEnumeration
  Enumeration 0; sfJoyAxis
    #sfJoyAxisX
    #sfJoyAxisY
    #sfJoyAxisZ
    #sfJoyAxisR
    #sfJoyAxisU
    #sfJoyAxisV
    #sfJoyAxisPOV
  EndEnumeration
  Enumeration 0; sfEventType
    #sfEvtClosed
    #sfEvtResized
    #sfEvtLostFocus
    #sfEvtGainedFocus
    #sfEvtTextEntered
    #sfEvtKeyPressed
    #sfEvtKeyReleased
    #sfEvtMouseWheelMoved
    #sfEvtMouseButtonPressed
    #sfEvtMouseButtonReleased
    #sfEvtMouseMoved
    #sfEvtJoyButtonPressed
    #sfEvtJoyButtonReleased
    #sfEvtJoyMoved
  EndEnumeration
  Enumeration 0
    #sfNone       = 0       ; No border / title bar (this flag And all others are mutually exclusive)
    #sfTitlebar   = 1 << 0  ; Title bar + fixed border
    #sfResize     = 1 << 1  ; Titlebar + resizable border + maximize button
    #sfClose      = 1 << 2  ; Titlebar + close button
    #sfFullscreen = 1 << 3  ; Fullscreen mode (this flag And all others are mutually exclusive)
  EndEnumeration 
;}
;{ Constants
  #sfFalse = 0
  #sfTrue  = 1
;}
;{ Prototypes
  ; Callbacks
  Prototype.sfBool sfSoundStreamStartCallback()                ;Type of the callback used to start a sound stream
  Prototype.sfBool sfSoundStreamGetDataCallback(*arg1, *arg2)  ;Type of the callback used to get a sound stream data
;}
;{ Structures
  Structure sfSoundStreamChunk
    *Samples    ; Pointer to the audio samples
    NbSamples.l ; Number of samples pointed by Samples
  EndStructure
  Structure sfColor
    r.c
    g.c
    b.c
    a.c
  EndStructure
  Structure sfFloatRect
    Left.f
    Top.f
    Right.f
    Bottom.f
  EndStructure
  Structure sfIntRect
    Left.l
    Top.l
    Right.l
    Bottom.l
  EndStructure
  Structure sfIPAddress
    Address.c[16]
  EndStructure
  Structure KeyEvent
    ;Type.l 
    Code.l   
    Alt.sfBool
    Control.sfBool      
    Shift.sfBool      
  EndStructure
  Structure TextEvent
    ;Type.l
    Unicode.l
  EndStructure
  Structure MouseMoveEvent
    ;Type.l
    X.l
    Y.l
  EndStructure
  Structure MouseButtonEvent
    ;Type.l
    Button.l
  EndStructure
  Structure MouseWheelEvent
    ;Type.l
    Delta.l
  EndStructure
  Structure JoyMoveEvent
    ;Type.l
    JoystickId.l
    Axis.l
    Position.f
  EndStructure
  Structure JoyButtonEvent
    ;Type.l
    JoystickId.l
    Button.l
  EndStructure
  Structure SizeEvent
    ;Type.l
    Width.L
    Height.L
  EndStructure
  Structure sfEvent
    ; Member Data
    Type.l  ; Type of the event
    ;StructureUnion
      *Key.KeyEvent         
      *Text.TextEvent        
      *MouseMove.MouseMoveEvent   
      *MouseButton.MouseButtonEvent 
      *MouseWheel.MouseWheelEvent  
      *JoyMove.JoyMoveEvent     
      *JoyButton.JoyButtonEvent   
      *Size.SizeEvent        
    ;EndStructureUnion
  EndStructure
  Structure sfVideoMode
    Width.l         ; Video mode width, in pixels
    Height.l        ; Video mode height, in pixels
    BitsPerPixel.l  ; Video mode pixel depth, in bits per pixels
  EndStructure
  Structure sfWindowSettings
    DepthBits.l         ; Bits of the depth buffer
    StencilBits.l       ; Bits of the stencil buffer
    AntialiasingLevel.l ; Level of antialiasing
  EndStructure
;}

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 245
; FirstLine = 46
; Folding = EQE9f+
; EnableUnicode