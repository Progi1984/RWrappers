XIncludeFile "RW_ISL_Inc.pb"

  Global width.l, height.l
	Global ish.ISL_ScriptHeader

	; Check that ISL 2.5 was loaded 
  If ISL_GetVersion_S() = "2.5"
  	; Initialize the library 
  	ISL_Initialize()
	
  	; Read header of Image Styles script file from memory 
  	Dim GrassDim.c(223)
  	For i = 0 To 223
  	  GrassDim(i)   = PeekC(?grass+i)
  	Next
   	ISL_ReadScriptHeaderFromMemory(@GrassDim(), @ish)
  	; Get image width And height from header's structure 
  	width   = ish\width
  	height  = ish\height
  
  	; Load Image Styles script file from memory 
  	If ISL_LoadScriptFromMemory(@GrassDim()) & #ISL_NOERROR
  		; Initialize the library buffers 
  		ISL_InitBuffers()
  		; Allocate memory For 32-bits RGB image Data 
  		image = AllocateMemory(width*height*4)
  		
  		; Execute loaded script To generate the image 
  		ISL_ExecuteScript(image)
  		
  		; Save generated image As bitmap file 
  		ISL_SaveBMPImage(@"Samples\RW_ISL_Ex2_Output.bmp", image, width, height)
  		
  		; Free all memory resources used by library
  		ISL_Finish()
  		
  		FreeMemory(image)
  	EndIf
	EndIf

DataSection
  grass:
    Data.c 96,0,0,0,73,83,70,50,45,1,0,0,3,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,40,67,41
    Data.c 32,50,48,48,50,32,80,97,117,114,101,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    Data.c 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0
    Data.c 1,1,1,76,0,0,0,4,0,0,0,0,0,0,0,186,91,0,0,224,10,0,0,4,0,0,0,64,0,0,0,32,0
    Data.c 0,0,1,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    Data.c 0,0,0,0,0,50,0,0,0,1,0,0,0,24,0,0,0,28,0,0,0,0,0,0,0,149,0,0,0,15,1,0,0,89
    Data.c 0,0,0,24,0,0,0,57,0,0,0,0,0,0,0,1,0,0,0,100,0,0,0,0,0,0,0,255
EndDataSection

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 31
; Folding = -
; EnableCompileCount = 6
; EnableBuildCount = 0