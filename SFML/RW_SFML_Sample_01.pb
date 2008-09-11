XIncludeFile "RW_SFML_Inc.pb"

	Global VideoMode.sfVideoMode
	Global WSettings.sfWindowSettings
	Global Event.sfEvent
  Global Red.sfColor
  Global Blue.sfColor
  Global Green.sfColor
  Global Yellow.sfColor
	With WSettings
	  \DepthBits.l         = 24
	  \StencilBits.l       = 8
	  \AntialiasingLevel.l = 0
	EndWith
	With VideoMode
	  \Width.l        = 800
	  \Height.l       = 600
	  \BitsPerPixel.l = 32
	EndWith
	With Red
	  \r = 255
	EndWith
	With Blue
	  \b = 255
	EndWith
	With Green
	  \g = 255
	EndWith
	With Yellow
	  \r = 255
	  \g = 255
	EndWith
    
	App = sfRenderWindow_Create(@VideoMode, "SFML Shapes", #sfClose, @WSettings)
  
  ; Draw predefined shapes
  sfRenderWindow_DrawShape(App, sfShape_CreateLine(10, 10, 710, 100, 15, @Red,0,0))
  sfRenderWindow_DrawShape(App, sfShape_CreateCircle(200, 200, 100, @Yellow, 10, @Blue))
  sfRenderWindow_DrawShape(App, sfShape_CreateRectangle(350, 200, 600, 350, @Green,0,0))

  ; Build a custom convex shape
  Polygon = sfShape_Create()
  sfShape_AddPoint(Polygon, 0, -50,  sfColor_FromRGB(255, 0, 0),     sfColor_FromRGB(0, 128, 128))
  sfShape_AddPoint(Polygon, 50, 0,   sfColor_FromRGB(255, 85, 85),   sfColor_FromRGB(0, 128, 128))
  sfShape_AddPoint(Polygon, 50, 50,  sfColor_FromRGB(255, 170, 170), sfColor_FromRGB(0, 128, 128))
  sfShape_AddPoint(Polygon, 0, 100,  sfColor_FromRGB(255, 255, 255), sfColor_FromRGB(0, 128, 128))
  sfShape_AddPoint(Polygon, -50, 50, sfColor_FromRGB(255, 170, 170), sfColor_FromRGB(0, 128, 128))
  sfShape_AddPoint(Polygon, -50, 0,  sfColor_FromRGB(255, 85, 85),   sfColor_FromRGB(0, 128, 128))

  ; Define an outline width
  sfShape_SetOutlineWidth(Polygon, 10)

  ; Disable filling And enable the outline
  sfShape_EnableFill(Polygon, #False)
  sfShape_EnableOutline(Polygon, #True)

  ; We can still use the functions common To all SFML drawable objects
  sfShape_SetColor(Polygon, sfColor_FromRGBA(255, 255, 255, 200))
  sfShape_Move(Polygon, 300, 300)
  sfShape_Scale(Polygon, 3, 2)
  sfShape_Rotate(Polygon, 45)
  
  ; Start game loop
  While sfRenderWindow_IsOpened(App)
    ; Process events
    While sfRenderWindow_GetEvent(App, @Event)
      ; Close window : exit
      If Event\Type = #sfEvtClosed
          sfRenderWindow_Close(App)
      EndIf
    Wend

    ; Draw it
    sfRenderWindow_DrawShape(App, Polygon)
    ; Finally, display the rendered frame on screen
    sfRenderWindow_Display(App)
  Wend

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 33
; Folding = A-