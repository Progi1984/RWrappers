XIncludeFile "RW_LibHaru_Inc.pb"

	ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
	  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
	EndProcedure
	DataSection 
	  HPDFBYTERAWIMAGEDATA:
	    Data.c $ff, $ff, $ff, $fe, $ff, $ff, $ff, $fc
	    Data.c $ff, $ff, $ff, $f8, $ff, $ff, $ff, $f0
	    Data.c $f3, $f3, $ff, $e0, $f3, $f3, $ff, $c0
	    Data.c $f3, $f3, $ff, $80, $f3, $33, $ff, $00
	    Data.c $f3, $33, $fe, $00, $f3, $33, $fc, $00
	    Data.c $f8, $07, $f8, $00, $f8, $07, $f0, $00
	    Data.c $fc, $cf, $e0, $00, $fc, $cf, $c0, $00
	    Data.c $ff, $ff, $80, $00, $ff, $ff, $00, $00
	    Data.c $ff, $fe, $00, $00, $ff, $fc, $00, $00
	    Data.c $ff, $f8, $0f, $e0, $ff, $f0, $0f, $e0
	    Data.c $ff, $e0, $0c, $30, $ff, $c0, $0c, $30
	    Data.c $ff, $80, $0f, $e0, $ff, $00, $0f, $e0
	    Data.c $fe, $00, $0c, $30, $fc, $00, $0c, $30
	    Data.c $f8, $00, $0f, $e0, $f0, $00, $0f, $e0
	    Data.c $e0, $00, $00, $00, $c0, $00, $00, $00
	    Data.c $80, $00, $00, $00, $00, $00, $00, $00
	EndDataSection


  Global pdf.l, font.l, page.l
  Global fname.s{256}
  Global image.l;HPDF_Image
  Global x.l, y.l

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

  HPDF_Page_SetWidth (page, 172)
  Width = HPDF_Page_GetWidth(page)
  HPDF_Page_SetHeight (page, 80)
  Height = HPDF_Page_GetHeight(page)

  HPDF_Page_BeginText (page)
  HPDF_Page_SetFontAndSize (page, font, 20)
  HPDF_Page_MoveTextPos (page, 220, Height - 70)
  HPDF_Page_ShowText (page, "RawImageDemo")
  HPDF_Page_EndText (page)

  ; load RGB raw-image file. 
  image = HPDF_LoadRawImageFromFile (pdf, "Samples/rawimage/32_32_rgb.dat", 32, 32, #HPDF_CS_DEVICE_RGB)

  x = 20
  y = 20

  ; Draw image To the canvas. (normal-mode With actual size.)
  HPDF_Page_DrawImage (page, image, x, y, 32, 32)

  ; load GrayScale raw-image file. 
  image = HPDF_LoadRawImageFromFile (pdf, "Samples/rawimage/32_32_gray.dat", 32, 32, #HPDF_CS_DEVICE_GRAY)

  x = 70
  y = 20
  ; Draw image To the canvas. (normal-mode With actual size.)
  HPDF_Page_DrawImage (page, image, x, y, 32, 32)

  ; load GrayScale raw-image (1bit) file from memory. 
  image = HPDF_LoadRawImageFromMem (pdf, ?HPDFBYTERAWIMAGEDATA, 32, 32, #HPDF_CS_DEVICE_GRAY, 1)

  x = 120
  y = 20
  ; Draw image To the canvas. (normal-mode With actual size.)
  HPDF_Page_DrawImage (page, image, x, y, 32, 32)

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_06.pdf")

  ; clean up 
  HPDF_Free (pdf)

; IDE Options = PureBasic 4.20 (Windows - x86)
; Folding = 9
; EnableCompileCount = 2
; EnableBuildCount = 0