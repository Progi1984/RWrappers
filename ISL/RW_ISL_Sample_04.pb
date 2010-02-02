XIncludeFile "RW_ISL_Inc.pb"

Global filename.s = "Samples\bricks2.isf"
Global image.l, width.l, height.l
Global ish.ISL_ScriptHeader

	; Check that ISL 2.5 was loaded 
  If ISL_GetVersion_S() = "2.5"
		; Initialize the library 
  	ISL_Initialize()
	
	  ; Read header of Image Styles script file 
  	ISL_ReadScriptHeaderFromFile(@filename,@ish)

	  ; Load Image Styles script file 
  	If ISL_LoadScriptFromFile(@filename) & #ISL_NOERROR

    	; Get "flower.jpg" image width And height 
      ISL_GetJPGImageDimensions(@"Samples\flower.jpg",@width,@height)

    	; Allocate memory For 32-bits RGB image Data 
    	image = AllocateMemory(width*height*4)

	    ; Load "flower.jpg" To the allocated memory 
    	ISL_LoadJPGImage(@"Samples\flower.jpg",image)

	    ; Execute loaded script To generate the image 
    	ISL_ExecuteScriptOnImage(image,width,height)

	    ; Save generated image As bitmap file 
    	ISL_SaveBMPImage(@"Samples\RW_ISL_Ex4_Output.bmp",image,width,height)

	    ; Free all memory resources used by library 
    	ISL_Finish()
	
	    FreeMemory(image)
	  EndIf
	EndIf

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 18
; EnableCompileCount = 1
; EnableBuildCount = 0