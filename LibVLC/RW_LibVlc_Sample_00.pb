XIncludeFile "RW_LibVlc_Inc.pb"


Debug "Version > "+ PeekS(VLC_Version())
Debug "Compiler Author > "+ PeekS(VLC_CompileBy())
Debug "Compiler Domain > "+ PeekS(VLC_CompileDomain())
Debug "Compiler Host > "+ PeekS(VLC_CompileHost())
Debug "Compiler Name > "+ PeekS(VLC_Compiler())

hVLC = VLC_Create()
Dim DimCommande.s(2)
DimCommande(0)= "C:\Program Files\VideoLAN\VLC\libvlc.dll"
DimCommande(1)="C:\\Program Files\\IBM\Client Access\\cwbwait.avi"

Debug VLC_Init(hVLC,2,@DimCommande())
Debug VLC_Play(hVLC)
Delay(30000)
Debug VLC_Die(hVLC)
Debug VLC_CleanUp(hVLC)
Debug VLC_Destroy(hVLC)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 20
; Folding = -