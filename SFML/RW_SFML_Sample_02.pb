XIncludeFile "RW_SFML_Inc.pb"

	Global VideoMode.sfVideoMode
	Global WSettings.sfWindowSettings
	Global Event.sfEvent
	Global White.sfColor
	Global Event.sfEvent
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
	With White
	  \r = 255
	  \g = 255
	  \b = 255
	EndWith
	Macro Handler(type, struct)
	  *type.struct = AllocateMemory(SizeOf(struct))
	  *type = @Event\type
	EndMacro

    ; Create the main window
    App = sfRenderWindow_Create(@VideoMode, "SFML Views", #sfClose, @WSettings)

    ; Create a sprite For the background
    Global BackgroundImage = sfImage_CreateFromFile("data\background.jpg")
    Background = sfSprite_Create()
    sfSprite_SetImage(Background, BackgroundImage)
    
    ; Create another sprite For the cursor
    CursorImage = sfImage_CreateFromFile("data\cursor.tga")
    Cursor = sfSprite_Create()
    sfSprite_SetImage(Cursor, CursorImage)

    ; Resize the background, so that it's much bigger than the window
    sfSprite_Resize(Background, 2000, 2000)

    ; Define a text For displaying some instructions
    Text = sfString_Create()
    sfString_settext(Text, "Use the arrow keys to move the camera\nUse the + and - keys to zoom and unzoom")
    sfString_Move(Text, 10, 500)
    sfString_SetColor(Text, @White)

    ; Create a view With the same size As the window, located somewhere in the center of the background
    Vector2f = sfView_Create()
    sfView_SetCenter(Vector2f, 1000, 1000)
    sfView_SetHalfSize(Vector2f, 400, 300)

    ; To start, put the cursor at the center
    sfSprite_SetCenter(Cursor, 32, 32)
    ;sfSprite_SetPosition(Cursor, Center)

    ; Start game loop
    While sfRenderWindow_IsOpened(App)
      ; Process events
        While (sfRenderWindow_GetEvent(App, @Event))
          ; Close window : exit
          If (Event\Type = #sfEvtClosed)
            sfRenderWindow_Close(App)
          EndIf
          ; Escape key : exit
          If (Event\Type = #sfEvtKeyPressed) 
            Handler(Key, KeyEvent)
            If *Key\Code = #sfKeyEscape
              sfRenderWindow_Close(App)
            EndIf
          EndIf
        Wend

        ; Move the view using arrow keys
        Offset.f = 200 * sfRenderWindow_GetFrameTime(App)
        InputHandler = sfRenderWindow_GetInput(App)
        If (sfInput_IsKeyDown(InputHandler, #sfKeyUp))
          sfView_Move(Vector2f, 0, -Offset)
        EndIf
        If (sfInput_IsKeyDown(InputHandler, #sfKeyDown))
          sfView_Move(Vector2f, 0, Offset)
        EndIf
        If (sfInput_IsKeyDown(InputHandler, #sfKeyLeft))
          sfView_Move(Vector2f, -Offset, 0)
        EndIf
        If (sfInput_IsKeyDown(InputHandler, #sfKeyRight))
          sfView_Move(Vector2f, Offset, 0)
        EndIf

        ; Zoom And unzoom using + And - keys
        If (sfInput_IsKeyDown(InputHandler, #sfKeyAdd))
          sfView_Zoom(Vector2f, 1.001)
        EndIf
        If (sfInput_IsKeyDown(InputHandler, #sfKeySubtract))
          sfView_Zoom(Vector2f, 0.999)
        EndIf

        ; Set the view
        sfRenderWindow_SetView(App, Vector2f)

        ; Draw background
        sfRenderWindow_DrawSprite(App, Background)

        ; Draw cursor
        Define.f CursorPosX, CursorPosY
        X.f = sfInput_GetMouseX(InputHandler)
        Y.f = sfInput_GetMouseY(InputHandler)
        sfRenderWindow_ConvertCoords(App, X, Y, @CursorPosX, @CursorPosY, Vector2f)
        sfSprite_SetPosition(Cursor, CursorPosX, CursorPosY)
        sfRenderWindow_DrawSprite(App, Cursor)

        ; Reset To the Default view To draw the Interface
        sfRenderWindow_SetView(App, sfRenderWindow_GetDefaultView(App))

        ; Draw some instructions
        sfRenderWindow_DrawString(App, Text)

        ; Finally, display rendered frame on screen
        sfRenderWindow_Display(App)
    Wend

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 31
; FirstLine = 6
; Folding = f9-
; EnableUnicode