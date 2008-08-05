XIncludeFile "RW_ISL_Inc.pb"

	Global filename.s = "Samples\volumetric.isf"
	Global image.l
	Global a.l, width.l, height.l ,val.l
	Global ish.ISL_ScriptHeader
	Global output_filename.s

	; Check that ISL 2.5 was loaded 
	If ISL_GetVersion_S() = "2.5"
		; Initialize the library 
		ISL_Initialize()
	
		; Read header of Image Styles script file 
		ISL_ReadScriptHeaderFromFile(@filename,@ish)
	
		; Get image width And height from header's structure 
		width		= ish\width
		height	= ish\height
		
		; Load Image Styles script file 
		If ISL_LoadScriptFromFile(@filename) & #ISL_NOERROR 
			; Initialize the library buffers 
			ISL_InitBuffers()
	
			; Allocate memory For 32-bits RGB image Data 
			image = AllocateMemory(width*height*4)
			
			; Start loop For 25 animation frames 
			For a = 0 To 90 Step 10
				output_filename = "Samples\RW_ISL_Ex3_Output_"+Str(a/10)+".bmp"
		
				; Execute loaded script To generate the image 
				ISL_ExecuteScript(image)
		
				; Save generated image As bitmap file 
				ISL_SaveBMPImage(@output_filename, image, width, height)
			
				; Get "Sine Distortion" (second by order) "X Offset" effect's variable value 
				val=ISL_GetEffectValue(1,#ISL_Value8)
				; Increase it by 10 
				val + 10
				
				; Set changed value back 
				ISL_SetEffectValue(1, #ISL_Value8, val)
			Next
			; Free all memory resources used by library
			ISL_Finish()
			FreeMemory(image)
		EndIf	
	EndIf


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 30
; FirstLine = 3
; Folding = -
; EnableXP
; EnableCompileCount = 7
; EnableBuildCount = 0