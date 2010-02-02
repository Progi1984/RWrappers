XIncludeFile "RW_ISL_Inc.pb"

Global filename.s = "Samples\cords.isf"
Global ish.ISL_ScriptHeader

If ISL_GetVersion_S() = "2.5"

	; Initialize the library 
	ISL_Initialize()

	; Read header of Image Styles script file 
	ISL_ReadScriptHeaderFromFile(@filename, @ish)

	; Get image width And height from header's structure 
	width   = ish\width
	height  = ish\height
	; Load Image Styles script file 
	If ISL_LoadScriptFromFile(@filename) & #ISL_NOERROR
		; Initialize the library buffers 
	  ISL_InitBuffers();

  	; Allocate memory For 32-bits RGB image Data 
  	image.l = AllocateMemory(width*height*4)

	  ; Execute loaded script To  generate the image 
  	ISL_ExecuteScript(image);

	  ; Save generated image As bitmap file 
  	ISL_SaveBMPImage(@"Samples\RW_ISL_Ex1_Output.bmp", image, width, height);

	  ; Free all memory resources used by library 
  	ISL_Finish();
	
	  FreeMemory(image)
	EndIf
EndIf


; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 28
; EnableCompileCount = 2
; EnableBuildCount = 0