XIncludeFile "RW_FreeImage_Inc.pb"

ProcedureC Sample_FreeImageErrorHandler(fif.l, message.l)
	Debug " *** Sample_FreeImageErrorHandler START"
	If fif <> #FIF_UNKNOWN
		Debug FreeImage_GetFormatFromFIF(fif)+" Format"
	EndIf
	Debug PeekS(message, -1, #PB_Ascii)
	Debug " *** Sample_FreeImageErrorHandler END"
EndProcedure
; Test plugins capabilities
Procedure Sample_ShowPlugins()
  Debug ">Sample_ShowPlugins..."
	; Version & Copyright infos
	Debug "FreeImage Version:"+ FreeImage_GetVersion()
	Debug "FreeImage Copyright : "+ FreeImage_GetCopyrightMessage()

	; Plugins Info
	For j = 0 To FreeImage_GetFIFCount()-1
		Debug "Bitmap Type #"+Str(j)+" ("+FreeImage_GetFormatFromFIF(j)+"): "+FreeImage_GetFIFDescription(j)+" ("+FreeImage_GetFIFExtensionList(j)+")"
	Next
EndProcedure
; Test the clone function
Procedure Sample_TestClone(lpszPathName.s)
	Protected dib1 = #Null
	Protected dib2 = #Null
  Debug ">Sample_TestClone..."
	fif = FreeImage_GetFIFFromFilename(lpszPathName)

	dib1 = FreeImage_Load(fif, lpszPathName)
	dib2 = FreeImage_Clone(dib1) 
		
	FreeImage_Unload(dib1) 
	FreeImage_Unload(dib2) 
EndProcedure
Procedure Sample_TestAllocateCloneUnload(filename.s)
	Debug ">Sample_TestAllocateCloneUnload ..."

	bResult = Sample_TestClone(filename)

	Debug "OK"
EndProcedure
; Test internal image types
Procedure Sample_TestAllocateCloneUnloadType(image_type.l, width.l, height.l)
	Protected image.l = #Null
	Protected clone.l = #Null
	Protected standard.l = #Null
	Protected x.l, y.l
  
  Debug ">Sample_TestAllocateCloneUnloadType..."
	
	; Test Allocation Function
	image = FreeImage_AllocateT(image_type, width, height, 8)
	type  = FreeImage_GetImageType(image)

	; Test Pixel Access
	Select image_type
		Case #FIT_BITMAP:
			If FreeImage_GetBPP(image) = 8
				For y = 0 To FreeImage_GetHeight(image)-1
					Dim BitsBYTE.b(FreeImage_GetScanLine(image, y))
					For x = 0 To FreeImage_GetWidth(image)-1
						BitsBYTE(x) = 128
					Next
				Next
			EndIf
		Case #FIT_UINT16:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsBYTE.b(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsBYTE(x) = 128
				Next
			Next
		Case #FIT_INT16:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsBYTE.b(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsBYTE(x) = 128
				Next
			Next
		Case #FIT_UINT32:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsLONG.l(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsLONG(x) = 128
				Next
			Next
		Case #FIT_INT32:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsLONG.l(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsLONG(x) = 128
				Next
			Next
		Case #FIT_FLOAT:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsFLOAT.f(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsFLOAT(x) = 128
				Next
			Next
		Case #FIT_DOUBLE:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsDOUBLE.d(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsDOUBLE(x) = 128
				Next
			Next
		Case #FIT_COMPLEX:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsFICOMPLEX.FICOMPLEX(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsFICOMPLEX(x)\r = 128
					BitsFICOMPLEX(x)\i = 128
				Next
			Next
		Case #FIT_RGB16:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsFIRGB16.FIRGB16(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsFIRGB16(x)\Red = 128
					BitsFIRGB16(x)\Green = 128
					BitsFIRGB16(x)\Blue = 128
				Next
			Next
		Case #FIT_RGBF:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsFIRGBF.FIRGBF(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsFIRGBF(x)\Red = 128
					BitsFIRGBF(x)\Green = 128
					BitsFIRGBF(x)\Blue = 128
				Next
			Next
		Case #FIT_RGBA16:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsFIRGBA16.FIRGBA16(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsFIRGBA16(x)\Red = 128
					BitsFIRGBA16(x)\Green = 128
					BitsFIRGBA16(x)\Blue = 128
					BitsFIRGBA16(x)\Alpha = 128
				Next
			Next	
		Case #FIT_RGBAF:
			For y = 0 To FreeImage_GetHeight(image)
				Dim BitsFIRGBAF.FIRGBAF(FreeImage_GetScanLine(image, y))
				For x = 0 To FreeImage_GetWidth(image)
					BitsFIRGBAF(x)\Red = 128
					BitsFIRGBAF(x)\Green = 128
					BitsFIRGBAF(x)\Blue = 128
					BitsFIRGBAF(x)\Alpha = 128
				Next
			Next
  EndSelect

	; Test Clone Function
	clone = FreeImage_Clone(image)
	If FreeImage_GetImageType(clone) <> image_type
	  ProcedureReturn
	EndIf

	Select image_type
		Case #FIT_BITMAP
			If FreeImage_GetBPP(clone) = 8
				For y = 0 To FreeImage_GetHeight(clone)
				  Dim BitsBYTE.b(FreeImage_GetWidth(clone))
				  *BitsBYTE = FreeImage_GetScanLine(clone, y)
					For x = 0 To FreeImage_GetWidth(clone)
						If BitsBYTE(x) <> 128
							Break 
					  EndIf
				  Next
			  Next
			EndIf
		Case #FIT_UINT16:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsBYTE.b(FreeImage_GetWidth(clone))
			  *BitsBYTE = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If BitsBYTE(x) <> 128
						Break
					EndIf
				Next
			Next
		Case #FIT_INT16:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsBYTE.b(FreeImage_GetWidth(clone))
			  *BitsBYTE = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If BitsBYTE(x) <> 128
						Break
				  EndIf
			  Next
			Next
		Case #FIT_UINT32:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsLONG.l(FreeImage_GetWidth(clone))
			  *BitsLONG = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If BitsLONG(x) <> 128
						Break
				  EndIf
				Next
			Next
		Case #FIT_INT32:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsLONG.l(FreeImage_GetWidth(clone))
			  *BitsLONG = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
			  	If BitsLONG(x) <> 128
						Break
				  EndIf
			  Next
      Next
		Case #FIT_FLOAT:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsFLOAT.f(FreeImage_GetWidth(clone))
			  *BitsFLOAT = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If BitsFLOAT(x) <> 128
						Break
				  EndIf
			  Next
      Next
		Case #FIT_DOUBLE:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsDOUBLE.d(FreeImage_GetWidth(clone))
			  *BitsDOUBLE = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
				  If BitsDOUBLE(x) <> 128
						Break
				  EndIf
			  Next
      Next
		Case #FIT_COMPLEX:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsFICOMPLEX.FICOMPLEX(FreeImage_GetWidth(clone))
			  *BitsFICOMPLEX = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If (BitsFICOMPLEX(x)\r <> 128 Or ((BitsFICOMPLEX(x)\r - BitsFICOMPLEX(x)\i) <> 0))
						Break
				  EndIf
			  Next
      Next
		Case #FIT_RGB16:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsFIRGB16.FIRGB16(FreeImage_GetWidth(clone))
			  *BitsFIRGB16 = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If (BitsFIRGB16(x)\Red <> 128) Or (BitsFIRGB16(x)\Green <> 128) Or (BitsFIRGB16(x)\Blue <> 128)
						Break
				  EndIf
			  Next
      Next
		Case #FIT_RGBF:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsFIRGBF.FIRGBF(FreeImage_GetWidth(clone))
			  *BitsFIRGBF = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If (BitsFIRGBF(x)\Red <> 128) Or (BitsFIRGBF(x)\Green <> 128) Or (BitsFIRGBF(x)\Blue <> 128)
						Break
				  EndIf
			  Next
      Next
		Case #FIT_RGBA16:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsFIRGBA16.FIRGBA16(FreeImage_GetWidth(clone))
			  *BitsFIRGBA16 = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If (BitsFIRGBA16(x)\Red <> 128) Or (BitsFIRGBA16(x)\Green <> 128) Or (BitsFIRGBA16(x)\Blue <> 128) Or (BitsFIRGBA16(x)\Alpha <> 128)
						Break
				  EndIf
			  Next
      Next
		Case #FIT_RGBAF:
			For y = 0 To FreeImage_GetHeight(clone)
				Dim BitsFIRGBAF.FIRGBAF(FreeImage_GetWidth(clone))
			  *BitsFIRGBAF = FreeImage_GetScanLine(clone, y)
				For x = 0 To FreeImage_GetWidth(clone)
					If (BitsFIRGBAF(x)\Red <> 128) Or (BitsFIRGBAF(x)\Green <> 128) Or (BitsFIRGBAF(x)\Blue <> 128) Or (BitsFIRGBAF(x)\Alpha <> 128)
						Break
				  EndIf
			  Next
      Next
  EndSelect
	; Test Unload Function
	FreeImage_Unload(clone)
	clone = #Null;
	FreeImage_Unload(image)
	image = #Null;
EndProcedure
Procedure Sample_TestImageType(width.l, height.l)
	Protected bResult.l = #False;

	Debug ">Sample_TestImageType..."

	bResult = Sample_TestAllocateCloneUnloadType(#FIT_BITMAP, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_UINT16, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_INT16, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_UINT32, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_INT32, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_FLOAT, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_DOUBLE, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_COMPLEX, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_RGB16, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_RGBA16, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_RGBF, width, height)
	bResult = Sample_TestAllocateCloneUnloadType(#FIT_RGBAF, width, height)
	Debug "OK"
EndProcedure 
; Test loading / saving / converting image types using the TIFF plugin
Procedure Sample_CreateZonePlateImage(width.l, height.l, scale.l)
	Protected Dim SinTab.b(255)
	Protected dst.l
	Protected i.l, j.l, x.l, y.l
	Protected cx.l, cy.l, d.l
  
  Debug ">Sample_CreateZonePlateImage..."
  
	; Allocate a 8-bit dib
	dst = FreeImage_Allocate(width, height, 8)
  
  ; Build a greyscale palette
	Dim pal.RGBQUAD(255)
  *pal = FreeImage_GetPalette(dst)
  For i = 0 To 255
    pal(i)\rgbRed   = i
    pal(i)\rgbGreen = i
    pal(i)\rgbBlue  = i
  Next

	; Build the sinus table
	For i = 0 To 255
		SinTab(i) = 127.5 * Sin(#PI * (i - 127.5) / 127.5) + 127.5
  Next

	cx = width / 2
	cy = height / 2
	
	; create a zone plate
	y = -cY
  For i = height To 0 Step -1
    Protected Dim dst_bits.l(width)
    *dst_bits = FreeImage_GetScanLine(dst, i)
    x = -cX
    For j = width To 0 Step -1
      d = ((x * x + y * y) * scale) >> 8
      dst_bits(j) = sinTab(d & $FF)
      x+1
    Next
    y+1
  Next 
	ProcedureReturn dst
EndProcedure
Procedure Sample_TestLoadSaveConvertComplexType(*src, width.l, height.l, channel.l)
	*dst = #Null
	*chk_double = #Null
	*chk = #Null
	bResult = #True
  
  Debug ">Sample_TestLoadSaveConvertComplexType..."
  
	; convert To type FICOMPLEX
	*dst = FreeImage_ConvertToType(*src, #FIT_COMPLEX)

	; save image As TIFF
	bResult = FreeImage_Save(#FIF_TIFF, *dst, "Samples\TestLoadSaveConvertComplexType_0.tif", #TIFF_DEFAULT)

	; destroy dst
	FreeImage_Unload(dst)
	*dst = #Null;

	; load image
	*dst = FreeImage_Load(#FIF_TIFF, "Samples\TestLoadSaveConvertComplexType_0.tif", #TIFF_DEFAULT)
	
	; convert To type FIT_DOUBLE
	*chk_double = FreeImage_GetComplexChannel(*dst, channel)
	FreeImage_Unload(*dst)
	*dst = #Null;
	
	; convert To standard bitmap (linear scaling)
	*chk = FreeImage_ConvertToType(*chk_double, #FIT_BITMAP, #True)
	FreeImage_Unload(*chk_double)
	*chk_double = #Null;

	; save image As TIFF
	bResult = FreeImage_Save(#FIF_TIFF, *chk, "Samples\TestLoadSaveConvertComplexType_1.tif", #TIFF_DEFAULT)
	FreeImage_Unload(*chk)
	*chk = #Null;

	ProcedureReturn #True;
EndProcedure
Procedure Sample_TestLoadSaveConvertImageType(*src, image_type.l, width.l, height.l)
	*dst    = #Null
	*chk    = #Null
	bResult = #True
  Debug ">Sample_TestLoadSaveConvertImageType..."
	; convert To type image_type
	*dst = FreeImage_ConvertToType(*src, image_type)

	; save image As TIFF
	bResult = FreeImage_Save(#FIF_TIFF, *dst, "Samples\TestLoadSaveConvertImageType_0.tif", #TIFF_DEFAULT)

	; destroy dst
	FreeImage_Unload(*dst)
	*dst = #Null;

	; load image
	*dst = FreeImage_Load(#FIF_TIFF, "Samples\TestLoadSaveConvertImageType_0.tif", #TIFF_DEFAULT)

	; convert To standard bitmap (linear scaling)
	chk = FreeImage_ConvertToType(*dst, #FIT_BITMAP, #True)
	FreeImage_Unload(*dst)
	*dst = #Null;

	; save image As TIFF
	bResult = FreeImage_Save(#FIF_TIFF, *chk, "Samples\TestLoadSaveConvertImageType_1.tif", #TIFF_DEFAULT)
	FreeImage_Unload(*chk)
	*chk = #Null;

	ProcedureReturn #True
EndProcedure
Procedure Sample_TestImageTypeTIFF(width.l, height.l)
	Protected bResult = #False;

	Debug ">Sample_TestImageTypeTIFF ..."

	; create a test 8-bit image
	Protected src.l 
	src = Sample_CreateZonePlateImage(width, height, 128)

	; save For further examination
	bResult = FreeImage_Save(#FIF_PNG, src, "Samples\TestImageTypeTIFF.png", #PNG_DEFAULT)

	; test load /save / convert
	bResult = Sample_TestLoadSaveConvertImageType(src, #FIT_BITMAP, width, height)
	bResult = Sample_TestLoadSaveConvertImageType(src, #FIT_UINT16, width, height)
	bResult = Sample_TestLoadSaveConvertImageType(src, #FIT_INT16, width, height)
	bResult = Sample_TestLoadSaveConvertImageType(src, #FIT_UINT32, width, height)
	bResult = Sample_TestLoadSaveConvertImageType(src, #FIT_INT32, width, height)
	bResult = Sample_TestLoadSaveConvertImageType(src, #FIT_FLOAT, width, height)
	bResult = Sample_TestLoadSaveConvertImageType(src, #FIT_DOUBLE, width, height)

	; complex type
	bResult = Sample_TestLoadSaveConvertComplexType(src, width, height, #FICC_REAL)
	bResult = Sample_TestLoadSaveConvertComplexType(src, width, height, #FICC_IMAG)
	bResult = Sample_TestLoadSaveConvertComplexType(src, width, height, #FICC_MAG)
	bResult = Sample_TestLoadSaveConvertComplexType(src, width, height, #FICC_PHASE)

	; free test image
	FreeImage_Unload(src)

	Debug "OK"
EndProcedure
; Test multipage creation
Procedure Sample_TestBuildMPage(src_filename.s, dst_filename.s, dst_fif.l, bpp.l)
	Debug ">Sample_TestBuildMPage..."
	; get the file type
	src_fif = FreeImage_GetFileType(src_filename)
	; load the file
	src = FreeImage_Load(src_fif, src_filename, 0) ; 24bit image 
	src_bpp = FreeImage_GetBPP(src)
	
	; convert To the requested bitdepth
	If src_bpp <> bpp
		tmp = #Null;
		Select bpp
			Case 8
				tmp = FreeImage_ConvertTo8Bits(src)
			Case 24
				tmp = FreeImage_ConvertTo24Bits(src)
		EndSelect
		FreeImage_Unload(src)
		src = tmp;
	EndIf

	out = FreeImage_OpenMultiBitmap(dst_fif, dst_filename, #True, #False, #False) 
	For size = 16 To  48 Step 16
		rescaled = FreeImage_Rescale(src, size, size, #FILTER_CATMULLROM)
		If src_bpp = 8 And FreeImage_IsTransparent(src)
			; copy the transparency table
			trns = FreeImage_GetTransparencyTable(src)
			count = FreeImage_GetTransparencyCount(src)
			FreeImage_SetTransparencyTable(rescaled, trns, count)
		EndIf
		FreeImage_AppendPage(out, rescaled) 
		FreeImage_Unload(rescaled) 
	Next
	
	FreeImage_Unload(src) 
	
	FreeImage_CloseMultiBitmap(out, 0) 
  Debug "OK"
EndProcedure
; Test multipage cache
Procedure Sample_TestMPageCache(src_filename.s)
	Protected dst_filename.s = "Samples\TestMPageCache.tif";
  Protected keep_cache_in_memory = #False;

  Debug ">Sample_TestMPageCache..."
	; get the file type
	src_fif = FreeImage_GetFileType(src_filename)
	; load the file
	src = FreeImage_Load(src_fif, src_filename, 0) ; 24bit image 

	; convert To 24-bit
	If FreeImage_GetBPP(src) <> 24 
		tmp = FreeImage_ConvertTo24Bits(src)
		FreeImage_Unload(src) 
		src = tmp;
	EndIf

	out = FreeImage_OpenMultiBitmap(#FIF_TIFF, dst_filename, #True, #False, keep_cache_in_memory) 

	; attempt To create 16 480X360 images in a 24-bit TIFF multipage file
	rescaled = FreeImage_Rescale(src, 480, 360, #FILTER_CATMULLROM)
	For i = 0 To 15
		FreeImage_AppendPage(out, rescaled) 
	Next
	FreeImage_Unload(rescaled) 
	FreeImage_Unload(src) 
	FreeImage_CloseMultiBitmap(out, 0) 
  Debug "OK"
EndProcedure
; Test memory IO
Procedure Sample_TestSaveMemIO(lpszPathName.s)
	Protected hmem = #Null;
  
  Debug ">Sample_TestSaveMemIO..."
  
  ; load a regular file
	fif = FreeImage_GetFileType(lpszPathName)
	
	dib = FreeImage_Load(fif, lpszPathName)

	; open a memory handle
	hmem = FreeImage_OpenMemory()
  
	; save the file To memory
	FreeImage_SaveToMemory(fif, dib, hmem, 0)

	; at this point, hmem contains the entire PNG Data in memory. 
	; the amount of space used by the memory is equal To file_size
	file_size = FreeImage_TellMemory(hmem)
	Debug "File size : "+Str(file_size)


	; its easy load an image from memory As well

	; seek To the start of the memory stream
	FreeImage_SeekMemory(hmem, 0, #SEEK_SET)
	
	; get the file type
	mem_fif = FreeImage_GetFileTypeFromMemory(hmem, 0)
	
	; load an image from the memory handle 
	check = FreeImage_LoadFromMemory(mem_fif, hmem, 0)

	; save As a regular file
	FreeImage_Save(#FIF_PNG, check, "Samples\TestSaveMemIO.png", #PNG_DEFAULT)

	; make sure To free the Data since FreeImage_SaveToMemory 
	; will cause it To be malloc'd
	FreeImage_CloseMemory(hmem)

	FreeImage_Unload(check)
	FreeImage_Unload(dib)
EndProcedure
Procedure Sample_TestLoadMemIO(lpszPathName.s)
	
	Debug ">Sample_TestLoadMemIO..."
	
	Protected result.l

  stream = OpenFile(#PB_Any, lpszPathName)
	If stream
	  mem_buffer = AllocateMemory(Lof(stream))
	  ReadData(stream, mem_buffer, Lof(stream))
		CloseFile(stream)

		; attach the binary Data To a memory stream
		hmem = FreeImage_OpenMemory(mem_buffer, MemorySize(mem_buffer))

		; get the file type
		fif = FreeImage_GetFileTypeFromMemory(hmem, 0)

		; load an image from the memory stream
		check = FreeImage_LoadFromMemory(fif, hmem, #PNG_DEFAULT)

		; save As a regular file
		FreeImage_Save(#FIF_PNG, check, "Samples\TestLoadMemIO.png", #PNG_DEFAULT)
		FreeImage_Unload(check)
		
		; close the stream
		FreeImage_CloseMemory(hmem)
	EndIf
	; user is responsible For freeing the Data
	FreeMemory(mem_buffer)
EndProcedure
Procedure Sample_TestAcquireMemIO(lpszPathName.s)
	hmem = #Null; 
	
	Debug ">Sample_TestAcquireMemIO..."
	
	; load a regular file
	fif = FreeImage_GetFileType(lpszPathName)
	dib = FreeImage_Load(fif, lpszPathName, 0)

	; open And allocate a memory stream
	hmem = FreeImage_OpenMemory()

	; save the file To memory
	FreeImage_SaveToMemory(#FIF_PNG, dib, hmem, #PNG_DEFAULT)

	FreeImage_Unload(dib)

	; get the buffer from the memory stream
  mem_buffer    = #Null
	size_in_bytes = #Null

	FreeImage_AcquireMemory(hmem, @mem_buffer, @size_in_bytes)

	; save the buffer in a file stream
	stream = ReadFile(#PB_Any,"buffer.png")
	If stream
	  WriteData(stream, mem_buffer, size_in_bytes)
	  CloseFile(stream)
	EndIf

	; close And free the memory stream
	FreeImage_CloseMemory(hmem)

EndProcedure
Procedure Sample_TestMemIO(lpszPathName.s)
	Debug ">Sample_TestMemIO..."
	Sample_TestSaveMemIO(lpszPathName)
	Sample_TestLoadMemIO(lpszPathName)
	Sample_TestAcquireMemIO(lpszPathName)
  Debug "OK"
EndProcedure
; Test JPEG lossless transform & cropping
Procedure Sample_TestJPEGTransform(src_file.s)
	Protected bResult.l
	Protected perfect.l
  Debug ">Sample_TestJPEGTransform..."
	; perfect transformation
	perfect = #True;
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_00.jpg", #FIJPEG_OP_FLIP_H, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_01.jpg", #FIJPEG_OP_FLIP_V, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_02.jpg", #FIJPEG_OP_TRANSPOSE, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_03.jpg", #FIJPEG_OP_TRANSVERSE, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_04.jpg", #FIJPEG_OP_ROTATE_90, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_05.jpg", #FIJPEG_OP_ROTATE_180, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_06.jpg", #FIJPEG_OP_ROTATE_270, perfect)

	; non perfect transformation
	perfect = #False;
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_07.jpg", #FIJPEG_OP_FLIP_H, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_08.jpg", #FIJPEG_OP_FLIP_V, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_09.jpg", #FIJPEG_OP_TRANSPOSE, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_10.jpg", #FIJPEG_OP_TRANSVERSE, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_11.jpg", #FIJPEG_OP_ROTATE_90, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_12.jpg", #FIJPEG_OP_ROTATE_180, perfect)
	bResult = FreeImage_JPEGTransform(src_file, "Samples\TestJPEGTransform_13.jpg", #FIJPEG_OP_ROTATE_270, perfect)
EndProcedure
Procedure Sample_TestJPEGCrop(src_file.s)
	Protected bResult.l
	Debug ">Sample_TestJPEGCrop..."
	bResult = FreeImage_JPEGCrop(src_file, "Samples\TestJPEGCrop_0.jpg", 50, 100, 359, 354)
	bResult = FreeImage_JPEGCrop(src_file, "Samples\TestJPEGCrop_1.jpg", 50, 100, 550, 400)
EndProcedure
Procedure Sample_TestJPEG()
  Protected src_file.s = "Samples\exif.jpg"

	Debug ">Sample_TestJPEG (should throw exceptions) ..."

	; lossless transform - both perfect/non perfect
	Sample_TestJPEGTransform(src_file)
	; cropping - both perfect/non perfect
	Sample_TestJPEGCrop(src_file)

	Debug("OK")
EndProcedure

FreeImage_Initialise()
  ; Initialize our own FreeImage error handler
	FreeImage_SetOutputMessage(@Sample_FreeImageErrorHandler())
  width   = 512
  height  = 512
  
	; Test plugins capabilities
	Debug "===Test plugins capabilities==="
	Sample_ShowPlugins()

	; Test the clone function
	Debug "===Test the clone function==="
	Sample_TestAllocateCloneUnload("Samples\exif.jpg")

	; Test internal image types
	Debug "===Test internal image types==="
	Sample_TestImageType(width, height)

	; Test loading / saving / converting image types using the TIFF plugin
	Debug "===Test loading / saving / converting image types using the TIFF plugin==="
	Sample_TestImageTypeTIFF(width, height)
    
	; Test multipage creation
  Debug "===Test multipage creation==="
	Sample_TestBuildMPage("Samples\sample.png", "Samples\TestBuildMPage.ico", #FIF_ICO, 24)
	Sample_TestBuildMPage("Samples\sample.png", "Samples\TestBuildMPage.tif", #FIF_TIFF, 24)
	;Sample_TestBuildMPage("Samples\sample.png", "Samples\TestBuildMPage.gif", #FIF_GIF, 8)

	; Test multipage cache
  Debug "===Test multipage cache==="
  Sample_TestMPageCache("Samples\sample.png")

	; Test memory IO
  Debug "===Test memory IO==="
  Sample_TestMemIO("Samples\sample.png")

	; Test JPEG lossless transform & cropping
  Debug "===Test JPEG lossless transform & cropping==="
  Sample_TestJPEG()
	
FreeImage_DeInitialise()

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 673
; FirstLine = 26
; Folding = BAQ-