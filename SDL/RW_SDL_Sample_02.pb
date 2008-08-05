XIncludeFile "RW_SDL_Inc.pb"

SDLW_Init()

Global *affichage.SDL_Surface

Procedure InitSDL()
  If SDL_Init(#SDL_INIT_VIDEO) < 0
    Debug "Erreur à l'initialisation de la SDL : "+SDL_GetError()
    End
  EndIf
  *affichage = SDL_SetVideoMode(800,600,32, #SDL_SWSURFACE|#SDL_RESIZABLE)
  If *affichage = #Null
    Debug "Impossible d'activer le mode graphique : "+SDL_GetError()
    End
  EndIf
  SDL_WM_SetCaption("Mon premier programme SDL", "");
EndProcedure
Procedure WaitKey()
  Protected event.SDL_Event
  Repeat
    SDL_WaitEvent(@event)
    Debug event\type
  Until event\type = #SDL_QUIT
EndProcedure

  InitSDL()
  WaitKey()

SDL_Quit()
SDLW_End()
Debug "End"
End

; IDE Options = PureBasic 4.20 (Windows - x86)
; Folding = -
; EnableCompileCount = 1
; EnableBuildCount = 0