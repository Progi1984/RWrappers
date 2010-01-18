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

  ; On centre Zozor à l'écran 
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
          Case #SDLK_UP       ; Flèche haut
            positionZozor\y - 1
          Case #SDLK_DOWN     ; Flèche bas
            positionZozor\y + 1
          Case #SDLK_RIGHT    ; Flèche droite
            positionZozor\x + 1
          Case #SDLK_LEFT     ; Flèche gauche
            positionZozor\x - 1
          Case #SDLK_ESCAPE
            continuer = #False
        EndSelect
    EndSelect
    SDL_FillRect(*ecran, #Null, SDL_MapRGB(*ecran\format, 255, 255, 255)) ; On efface l'écran
    SDL_BlitSurface(*zozor, #Null, *ecran, @positionZozor) ; On place zozor à sa nouvelle position 
    SDL_Flip(*ecran) ; On met à jour l'affichage
    SDL_WarpMouse(*ecran\w / 2, *ecran\h / 2);
  Until continuer =#False
  SDL_FreeSurface(*zozor)
  SDL_Quit()  
  
SDLW_End()
End