XIncludeFile "RW_LibHaru_Inc.pb"

	ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
	  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
	EndProcedure
	Procedure Draw_Image(pdf.l, filename.s, x.f, y.f, text.s)
	  Protected filename1.s{255}
	  Protected page.l = HPDF_GetCurrentPage (pdf)
	  Protected image.l
	
	  filename1 = "Samples\images\"+filename
	  image = HPDF_LoadJpegImageFromFile (pdf, filename1)
	  ; Draw image To the canvas. 
	  HPDF_Page_DrawImage (page, image, x, y, HPDF_Image_GetWidth (image),HPDF_Image_GetHeight (image))
	  ; Print the text. 
	  HPDF_Page_BeginText (page)
	  HPDF_Page_SetTextLeading (page, 16)
	  HPDF_Page_MoveTextPos (page, x, y)
	  HPDF_Page_ShowTextNextLine (page, filename)
	  HPDF_Page_ShowTextNextLine (page, text)
	  HPDF_Page_EndText (page)
	EndProcedure

  Global pdf.l, font.l, page.l
  Global fname.s{256}
  Global dst.l;HPDF_Destination
  
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

  HPDF_Page_SetWidth (page, 650)
  Width = HPDF_Page_GetWidth(page)
  HPDF_Page_SetHeight (page, 500)
  Height = HPDF_Page_GetHeight(page)

  dst = HPDF_Page_CreateDestination (page)
  HPDF_Destination_SetXYZ (dst, 0, Height , 1)
  HPDF_SetOpenAction(pdf, dst)

  HPDF_Page_BeginText (page)
  HPDF_Page_SetFontAndSize (page, font, 20)
  HPDF_Page_MoveTextPos (page, 220, Height - 70)
  HPDF_Page_ShowText (page, "JpgDemo")
  HPDF_Page_EndText (page)

  HPDF_Page_SetFontAndSize (page, font, 12)

  draw_image (pdf, "rgb.jpg", 70, Height - 410, "24bit color image")
  draw_image (pdf, "gray.jpg", 340, Height - 410, "8bit grayscale image")

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_05.pdf")

  ; clean up 
  HPDF_Free (pdf)


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 62
; FirstLine = 9
; Folding = 6
; EnableCompileCount = 2
; EnableBuildCount = 0