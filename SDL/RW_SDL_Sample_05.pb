XIncludeFile "RW_SDL_Inc.pb"

SDLW_Init()
Procedure WaitKey()
  Protected event.SDL_Event
  Repeat
    SDL_WaitEvent(@event)
  Until event\type = #SDL_KEYUP And event\key\keysym\scancode = #SDLK_ESCAPE
EndProcedure

Global *ecran.SDL_Surface      = #Null
Global *zozor.SDL_Surface      = #Null
Global positionZozor.SDL_Rect
Global event.SDL_Event
Global continuer.l             = 1

  SDL_Init(#SDL_INIT_VIDEO)
  
  *ecran = SDL_SetVideoMode(640, 480, 32, #SDL_HWSURFACE)
  SDL_WM_SetCaption("Gestion des evenements en SDL", #Nuls)

  ; Chargement de Zozor
  *zozor = SDL_LoadBMP("Samples\zozor.bmp")
  SDL_SetColorKey(*zozor, #SDL_SRCCOLORKEY, SDL_MapRGB(*zozor\format, 0, 0, 255))

  ; On centre Zozor � l'�cran 
  positionZozor\x = *ecran\w / 2 - *zozor\w / 2
  positionZozor\y = *ecran\h / 2 - *zozor\h / 2
  
  SDL_EnableKeyRepeat(10, 10)
  SDL_ShowCursor(#SDL_DISABLE)
  Repeat
    SDL_WaitEvent(@event)
    Select event\type
      Case #SDL_QUIT
        continuer = #False
      Case #SDL_KEYDOWN
        Select event\key\keysym\scancode
          Case #SDLK_UP       ; Fl�che haut
            positionZozor\y - 1
          Case #SDLK_DOWN     ; Fl�che bas
            positionZozor\y + 1
          Case #SDLK_RIGHT    ; Fl�che droite
            positionZozor\x + 1
          Case #SDLK_LEFT     ; Fl�che gauche
            positionZozor\x - 1
          Case #SDLK_ESCAPE
            continuer = #False
        EndSelect
    EndSelect
    SDL_FillRect(*ecran, #Null, SDL_MapRGB(*ecran\format, 255, 255, 255)) ; On efface l'�cran
    SDL_BlitSurface(*zozor, #Null, *ecran, @positionZozor) ; On place zozor � sa nouvelle position 
    SDL_Flip(*ecran) ; On met � jour l'affichage
    SDL_WarpMouse(*ecran\w / 2, *ecran\h / 2);
  Until continuer =#False
  SDL_FreeSurface(*zozor)
  SDL_Quit()  
  
SDLW_End()
End
; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 22
; FirstLine = 3
; Folding = -
; EnableCompileCount = 9
; EnableBuildCount = 0