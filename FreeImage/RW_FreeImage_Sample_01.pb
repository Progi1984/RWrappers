IncludeFile "RW_FreeImage_Inc.pb"

; PNG Image
;Global dib     = FreeImage_Load(#FIF_PNG, "Samples\sample.png", #PNG_DEFAULT)
; JPEG Image
Global dib     = FreeImage_Load(#FIF_JPEG, "Samples\exif.jpg", #JPEG_DEFAULT)
Global bitmap  = CreateDIBitmap_(GetDC_(#Null), FreeImage_GetInfoHeader(dib), #CBM_INIT, FreeImage_GetBits(dib), FreeImage_GetInfo(dib), #DIB_RGB_COLORS)

If OpenWindow(0, 0, 0, 245, 105, "Image with FreeImage", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  CreateGadgetList(WindowID(0))
  ImageGadget(0,  10, 10, 100, 83, bitmap)
  ResizeWindow(0, 100, 100, FreeImage_GetWidth(dib)+20, FreeImage_GetHeight(dib)+20)
  Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
EndIf

FreeImage_Unload(dib)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 3
; Folding = -