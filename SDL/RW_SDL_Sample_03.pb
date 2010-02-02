XIncludeFile "RW_SDL_Inc.pb"

SDLW_Init()
Procedure WaitKey()
  Protected event.SDL_Event
  Repeat
    SDL_WaitEvent(@event)
  Until event\type = #SDL_QUIT And event\key\keysym\scancode = #SDLK_ESCAPE
EndProcedure

Global *ecran.SDL_Surface
Global Dim Lignes.l(255)
Global position.SDL_Rect
Global IntI.l               = 0

  SDL_Init(#SDL_INIT_VIDEO)
  *ecran = SDL_SetVideoMode(640, 256, 32, #SDL_HWSURFACE)
  
  For IntI = 0 To 255 Step 1
    Lignes(IntI) = SDL_CreateRGBSurface(#SDL_HWSURFACE, 640, 1, 32, 0, 0, 0, 0) ; Allocation des 256 surfaces
  Next
  SDL_WM_SetCaption("Mon degrade en SDL !", #Nuls);
  SDL_FillRect(*ecran, #Null, SDL_MapRGB(*ecran\format, 0, 0, 0))
  For IntI = 0 To 255 Step 1
    position\x  = 0     ; Les lignes sont à gauche (abscisse de 0)
    position\y  = IntI  ; La position verticale dépend du numéro de la ligne actuelle
    SDL_FillRect(Lignes(IntI), #Null, SDL_MapRGB(*ecran\format, IntI, IntI, IntI)) ; Remplissage
    SDL_BlitSurface(Lignes(IntI), #Null, *ecran, @position) ; Collage
  Next
  SDL_Flip(*ecran)
  WaitKey()
  For IntI = 0 To 255 Step 1
    SDL_FreeSurface(Lignes(IntI))
  Next
  SDL_Quit()
SDLW_End()
End
; IDE Options = PureBasic 4.40 (Windows - x86)
; Folding = -
; EnableCompileCount = 8
; EnableBuildCount = 0