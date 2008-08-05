XIncludeFile "RW_LibHaru_Inc.pb"

  ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
    Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
  EndProcedure
  Procedure Draw_Image(pdf.l, filename.s, x.l, y.l, text.s)
    Protected filename1.s{255}
    Protected page.l = HPDF_GetCurrentPage (pdf)
    Protected *image.HPDF_Image

    filename1 = "Samples\pngsuite\"+filename
    *image = HPDF_LoadPngImageFromFile (pdf, filename1)
    ; Draw image To the canvas. 
    HPDF_Page_DrawImage (page, *image, x, y, HPDF_Image_GetWidth (*image),HPDF_Image_GetHeight (*image))
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

  HPDF_Page_SetWidth (page, 550)
  width = HPDF_Page_GetWidth(page)
  HPDF_Page_SetHeight (page, 650)
  height = HPDF_Page_GetHeight(page)

  dst = HPDF_Page_CreateDestination (page)
  HPDF_Destination_SetXYZ (dst, 0, height, 1)
  HPDF_SetOpenAction(pdf, dst)

  HPDF_Page_BeginText (page)
  HPDF_Page_SetFontAndSize (page, font, 20)
  HPDF_Page_MoveTextPos (page, 220, height - 70)
  HPDF_Page_ShowText (page, "PngDemo")
  HPDF_Page_EndText (page)

  HPDF_Page_SetFontAndSize (page, font, 12)

  Draw_Image(pdf, "basn0g01.png", 100, height - 150,"1bit grayscale.")
  Draw_Image(pdf, "basn0g02.png", 200, height - 150,"2bit grayscale.")
  Draw_Image(pdf, "basn0g04.png", 300, height - 150,"4bit grayscale.")
  Draw_Image(pdf, "basn0g08.png", 400, height - 150,"8bit grayscale.")
  Draw_Image(pdf, "basn2c08.png", 100, height - 250,"8bit color.")
  Draw_Image(pdf, "basn2c16.png", 200, height - 250,"16bit color.")
  Draw_Image(pdf, "basn3p01.png", 100, height - 350,"1bit pallet.")
  Draw_Image(pdf, "basn3p02.png", 200, height - 350,"2bit pallet.")
  Draw_Image(pdf, "basn3p04.png", 300, height - 350,"4bit pallet.")
  Draw_Image(pdf, "basn3p08.png", 400, height - 350,"8bit pallet.")
  Draw_Image(pdf, "basn4a08.png", 100, height - 450,"8bit alpha.")
  Draw_Image(pdf, "basn4a16.png", 200, height - 450,"16bit alpha.")
  Draw_Image(pdf, "basn6a08.png", 100, height - 550,"8bit alpha.")
  Draw_Image(pdf, "basn6a16.png", 200, height - 550,"16bit alpha.")

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_04.pdf")

  ; clean up 
  HPDF_Free (pdf)


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 74
; FirstLine = 35
; Folding = 7
; EnableCompileCount = 2
; EnableBuildCount = 0