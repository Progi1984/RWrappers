XIncludeFile "RW_SDL_Inc.pb"

SDLW_Init()
Procedure WaitKey()
  Protected event.SDL_Event
  Repeat
    SDL_WaitEvent(@event)
  Until event\type = #SDL_KEYUP And event\key\keysym\scancode = #SDLK_ESCAPE
EndProcedure

Global *ecran.SDL_Surface = #Null
Global imageDeFond.l      = #Null
Global sapin.l            = #Null
Global positionFond.SDL_Rect
Global positionSapin.SDL_Rect

    positionFond\x    = 0
    positionFond\y    = 0
    positionSapin\x   = 500
    positionSapin\y   = 260

    SDL_Init(#SDL_INIT_VIDEO)

    SDL_WM_SetIcon(SDL_IMG_Load("Samples\sdl_icone.bmp"), #Null)

    *ecran = SDL_SetVideoMode(800, 600, 32, #SDL_HWSURFACE)
    SDL_WM_SetCaption("Chargement d'images en SDL", #Nuls)

    imageDeFond = SDL_IMG_Load("Samples\lac_en_montagne.bmp")
    SDL_BlitSurface(imageDeFond, #Null, *ecran, @positionFond)

    ; Chargement d'un PNG avec IMG_Load
    ;   Celui-ci est automatiquement rendu transparent car les informations de
    ;   transparence sont codées à l'intérieur du fichier PNG 
    sapin = SDL_IMG_Load("Samples\sapin.png")
    SDL_BlitSurface(sapin, #Null, *ecran, @positionSapin)

    SDL_Flip(*ecran)
    WaitKey()

    SDL_FreeSurface(imageDeFond)
    SDL_FreeSurface(sapin)
    SDL_Quit()

SDLW_End()
End
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 34
; FirstLine = 2
; Folding = -
; EnableCompileCount = 1
; EnableBuildCount = 0