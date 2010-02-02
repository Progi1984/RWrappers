XIncludeFile "RW_LibHaru_Inc.pb"

	ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
	  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
	EndProcedure
	Procedure Show_Description (page.l, x.f, y.f, text.s)
	    Protected buf.s{255}
	
	    HPDF_Page_MoveTo (page, x, y - 10)
	    HPDF_Page_LineTo (page, x, y + 10)
	    HPDF_Page_MoveTo (page, x - 10, y)
	    HPDF_Page_LineTo (page, x + 10, y)
	    HPDF_Page_Stroke (page)
	
	    HPDF_Page_SetFontAndSize (page, HPDF_Page_GetCurrentFont (page), 8)
	    HPDF_Page_SetRGBFill (page, 0, 0, 0)
	
	    HPDF_Page_BeginText (page)
	    buf = "(x="+Str(Int(x))+", y="+Str(Int(y))+")"
	    HPDF_Page_MoveTextPos (page, x - HPDF_Page_TextWidth (page, buf) - 5, y - 10)
	    HPDF_Page_ShowText (page, buf)
	    HPDF_Page_EndText (page)
	
	    HPDF_Page_BeginText (page)
	    HPDF_Page_MoveTextPos (page, x - 20, y - 25)
	    HPDF_Page_ShowText (page, text)
	    HPDF_Page_EndText (page)
	EndProcedure

  Global pdf.l, font.l, page.l, dst.l, image.l, image1.l, image2.l, image3.l
  Global x.d, y.d, angle.d, angle1.d, angled2.d, rad.d, rad1.d, rad2.d, iw.d, ih.d
  Global PageHeight 
  Global PageWidth

  pdf = HPDF_New(@Error_handler(), #Null)
  If pdf = 0 
      Debug "error: cannot create PdfDoc object"
      End
  EndIf

  HPDF_SetCompressionMode (pdf, #HPDF_COMP_ALL)

  ; create Default-font 
  font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")

  ; add a new page object. 
  page = HPDF_AddPage (pdf)

  HPDF_Page_SetWidth (page, 550)
  HPDF_Page_SetHeight (page, 500)
  PageWidth = HPDF_Page_GetWidth(page)
  PageHeight = HPDF_Page_GetHeight(page)

  dst = HPDF_Page_CreateDestination (page)
  HPDF_Destination_SetXYZ (dst, 0, PageHeight, 1)
  HPDF_SetOpenAction(pdf, dst)

  HPDF_Page_BeginText (page)
  HPDF_Page_SetFontAndSize (page, font, 20)
  HPDF_Page_MoveTextPos (page, 220, PageHeight - 70)
  HPDF_Page_ShowText (page, "ImageDemo")
  HPDF_Page_EndText (page)

  ; load image file. 
  image = HPDF_LoadPngImageFromFile (pdf, "Samples/pngsuite/basn3p02.png")

  ; image1 is masked by image2. 
  image1 = HPDF_LoadPngImageFromFile (pdf, "Samples/pngsuite/basn3p02.png")

  ; image2 is a mask image. 
  image2 = HPDF_LoadPngImageFromFile (pdf, "Samples/pngsuite/basn0g01.png")

  ; image3 is a RGB-color image. we use this image For color-mask demo.
  image3 = HPDF_LoadPngImageFromFile (pdf, "Samples/pngsuite/maskimage.png")

  iw = HPDF_Image_GetWidth (image)
  ih = HPDF_Image_GetHeight (image)

  HPDF_Page_SetLineWidth (page, 0.5)

  x = 100
  y = PageHeight - 150

  ; Draw image To the canvas. (normal-mode With actual size.)
  HPDF_Page_DrawImage (page, image, x, y, iw, ih)

  Show_Description (page, x, y, "Actual Size")

  x + 150

  ; Scalling image (X direction) 
  HPDF_Page_DrawImage (page, image, x, y, iw * 1.5, ih)

  Show_Description (page, x, y, "Scalling image (X direction)")

  x + 150

  ; Scalling image (Y direction). 
  HPDF_Page_DrawImage (page, image, x, y, iw, ih * 1.5)
  Show_Description (page, x, y, "Scalling image (Y direction)")

  x = 100
  y - 120

  ; Skewing image. 
  angle1 = 10
  angle2 = 20
  rad1 = angle1 / 180 * 3.141592
  rad2 = angle2 / 180 * 3.141592

  HPDF_Page_GSave (page)

  HPDF_Page_Concat (page, iw, Tan(rad1) * iw, Tan(rad2) * ih, ih, x, y)

  HPDF_Page_ExecuteXObject (page, image)
  HPDF_Page_GRestore (page)

  Show_Description (page, x, y, "Skewing image")

  x + 150

  ; Rotating image 
  angle = 30     ; rotation of 30 degrees. 
  rad = angle / 180 * 3.141592 ; Calcurate the radian value. 

  HPDF_Page_GSave (page)

  HPDF_Page_Concat (page, iw * Cos(rad), iw * Sin(rad), ih * Sin(rad) * -1, ih * Cos(rad), x, y)

  HPDF_Page_ExecuteXObject (page, image)
  HPDF_Page_GRestore (page)

  Show_Description (page, x, y, "Rotating image")

  x + 150

  ; draw masked image. 
  ; Set image2 To the mask image of image1 
  HPDF_Image_SetMaskImage (image1, image2)

  HPDF_Page_SetRGBFill (page, 0, 0, 0)
  HPDF_Page_BeginText (page)
  HPDF_Page_MoveTextPos (page, x - 6, y + 14)
  HPDF_Page_ShowText (page, "MASKMASK")
  HPDF_Page_EndText (page)

  HPDF_Page_DrawImage (page, image1, x - 3, y - 3, iw + 6, ih + 6)

  Show_Description (page, x, y, "masked image")

  x = 100
  y - 120

  ; color mask. 
  HPDF_Page_SetRGBFill (page, 0, 0, 0)
  HPDF_Page_BeginText (page)
  HPDF_Page_MoveTextPos (page, x - 6, y + 14)
  HPDF_Page_ShowText (page, "MASKMASK")
  HPDF_Page_EndText (page)

  HPDF_Image_SetColorMask (image3, 0, 255, 0, 0, 0, 255)
  HPDF_Page_DrawImage (page, image3, x, y, iw, ih)

  Show_Description (page, x, y, "Color Mask")

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_15.pdf")

  ; clean up 
  HPDF_Free (pdf)


; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 166
; FirstLine = 105
; Folding = 9
; EnableCompileCount = 3
; EnableBuildCount = 0