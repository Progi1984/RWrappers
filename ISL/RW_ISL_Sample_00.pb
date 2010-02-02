XIncludeFile "RW_ISL_Inc.pb"

Global image.l
Global width.l, height.l

	; Check that ISL 2.5 was loaded 
  If ISL_GetVersion_S() = "2.5"
  	; Initialize the library 
  	ISL_Initialize()
	
	  ; Get "flower.jpg" image width And height 
  	ISL_GetJPGImageDimensions(@"Samples\flower.jpg",@width,@height)

	  ; Allocate memory For 32-bits RGB image Data 
  	image = AllocateMemory(width*height*4)

	  ; Load "flower.jpg" To the allocated memory 
  	ISL_LoadJPGImage(@"Samples\flower.jpg",image)

	  ; Add "LINES" effect To the script 
  	ISL_AddEffect(#ISL_LINES, #True)
  	; Set lines "Amount" value To 300 
  	ISL_SetEffectValue(#ISL_Effect1,#ISL_Value5,300)

	  ; Add "CIRCLES" effect To the script 
  	ISL_AddEffect(#ISL_CIRCLES,#True)
		; Set circles "Amount" value To 500 
		ISL_SetEffectValue(#ISL_Effect1,#ISL_Value5,500)

	  ; Execute script To generate the image 
  	ISL_ExecuteScriptOnImage(image,width,height)

	  ; Save generated image As bitmap file 
  	ISL_SaveBMPImage(@"Samples\RW_ISL_Ex0_Output.bmp",image,width,height)

	  ; Free all memory resources used by library 
    ISL_Finish()
	
	  FreeMemory(image)
	EndIf

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 33
; EnableCompileCount = 2
; EnableBuildCount = 0