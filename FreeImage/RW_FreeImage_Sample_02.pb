IncludeFile "RW_FreeImage_Inc.pb"

; PNG Image
Global dib     = FreeImage_Load(#FIF_PNG, "Samples\sample.png", #PNG_DEFAULT)
; JPEG Image
;Global dib     = FreeImage_Load(#FIF_JPEG, "Samples\exif.jpg", #JPEG_DEFAULT)
Global bitmap  = CreateDIBitmap_(GetDC_(#Null), FreeImage_GetInfoHeader(dib), #CBM_INIT, FreeImage_GetBits(dib), FreeImage_GetInfo(dib), #DIB_RGB_COLORS)

If OpenWindow(0, 0, 0, 245, 105, "Image with FreeImage", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  ResizeWindow(0, 100, 100, FreeImage_GetWidth(dib)+15, FreeImage_GetHeight(dib)+15)
  hDC = GetWindowDC_(WindowID(0)) 
  SetStretchBltMode_(hDC, #COLORONCOLOR)
  StretchDIBits_(hDC, 10, GetSystemMetrics_(#SM_CYCAPTION)+10, FreeImage_GetWidth(dib), FreeImage_GetHeight(dib), 0, 0, FreeImage_GetWidth(dib), FreeImage_GetHeight(dib), FreeImage_GetBits(dib), FreeImage_GetInfo(dib), #DIB_RGB_COLORS, #SRCCOPY)
  
  
  Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
EndIf

FreeImage_Unload(dib)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 5
; Folding = -