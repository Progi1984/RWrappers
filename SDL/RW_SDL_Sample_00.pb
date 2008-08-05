XIncludeFile "RW_SDL_Inc.pb"

SDLW_Init()
Global *ecran   .SDL_Surface      = #Null
Global event    .SDL_Event
Global done     .b                = #False

  SDL_Init(#SDL_INIT_VIDEO)
  *ecran = SDL_SetVideoMode(640, 480, 32, #SDL_HWSURFACE|#SDL_RESIZABLE)
  
  Repeat
    Repeat
      Select event\type
        Case #SDL_QUIT
          done = #True
          Break
        Case #SDL_VIDEORESIZE
          *ecran = SDL_SetVideoMode(event\resize\w, event\resize\h, 32, #SDL_HWSURFACE|#SDL_RESIZABLE)
      EndSelect
    Until SDL_PollEvent(@event)=0
  Until done = #True
  
  SDL_Quit()  
SDLW_End()
End
; IDE Options = PureBasic 4.20 (Windows - x86)
; Folding = -
; EnableCompileCount = 3
; EnableBuildCount = 0