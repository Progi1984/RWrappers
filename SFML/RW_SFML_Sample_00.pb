XIncludeFile "RW_SFML_Inc.pb"

	
	Global VideoMode.sfVideoMode
	Global WSettings.sfWindowSettings
	Global Color.sfColor
	With VideoMode
	  \Width.l        = 640
	  \Height.l       = 480
	  \BitsPerPixel.l = 32
	EndWith
	With WSettings
	  \DepthBits.l         = 24
	  \StencilBits.l       = 8
	  \AntialiasingLevel.l = 0
	EndWith
	With Color
	  \r = 0
	  \g = 0
	  \b = 0
	  \a = 255
	EndWith
	
	Macro Handler(type, struct)
	  *type.struct = AllocateMemory(SizeOf(struct))
	  *type = @EventHandler\type
	EndMacro

	Buffer = sfSoundBuffer_CreateFromFile("data\fart.wav")
	Fart = sfSound_Create()
	sfSound_SetBuffer(Fart, Buffer) 
	sfSound_SetLoop(Fart, #False)

	App = sfRenderWindow_Create(@VideoMode, "Sound with SFML", #sfClose, @WSettings)
	
	sfRenderWindow_SetBackgroundColor(App, @Color)
	sfRenderWindow_SetFramerateLimit(App, 30)

	EventHandler.sfEvent
	InputHandler = sfRenderWindow_GetInput(App)

	Text = sfString_Create()
	sfString_SetText(Text, "Turn the sound on.\nClick anywhere on the screen.\nMove the mouse. Click again.\nTry clicking in the corners.")
	sfString_SetX(Text, 30.)
	sfString_SetY(Text, 20.)
	With Color
	  \r = 150
	  \g = 100
	  \b = 10
	  \a = 255
	EndWith
	sfString_SetColor(Text, @Color)

	While sfRenderWindow_IsOpened(App)
		While sfRenderWindow_GetEvent(App, @EventHandler);Event Handler
			If EventHandler\Type = #sfEvtClosed
				sfRenderWindow_Close(App)
		  EndIf
			If EventHandler\Type = #sfEvtKeyPressed 
        handler(key, keyevent)
			  If *Key\Code = #sfKeyEscape
				  sfRenderWindow_Close(App)
				EndIf
		  EndIf
			If EventHandler\Type = #sfEvtMouseButtonPressed 
			  Handler(MouseButton, MouseButtonEvent)
			  If *MouseButton\Button = #sfButtonLeft
  				sfSound_SetPitch(Fart, 1.5 - 1.*sfInput_GetMouseY(InputHandler)/WindowHeight)
  				sfSound_SetPosition(Fart, 1.*(sfInput_GetMouseX(InputHandler) - WindowWidth/2)/(WindowWidth/20), 2., -2.)
  				sfSound_Play(Fart)
				EndIf
		  EndIf
		Wend
		sfRenderWindow_DrawString(App, Text)
		sfRenderWindow_Display(App)
  Wend
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 33
; Folding = w--
; EnableUnicode