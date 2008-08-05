XIncludeFile "RW_LibHaru_Inc.pb"

	ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
	  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
	EndProcedure
    
  Global pdf.l, page.l, title_font.l, detail_font.l, page_height.l, page_width.l, pw.l
  Global fname.s{256}
  Global SAMP_TXT.s{2048}
  Global detail_font_name.s
  Global f.l
  
  SAMP_TXT = "The quick brown fox jumps over the lazy dog."
  
  pdf = HPDF_New(@Error_handler(), #Null)
  If pdf = 0 
    Debug "error: cannot create PdfDoc object"
    End
  EndIf

  ; declaration For using Japanese encoding. 
  HPDF_UseJPEncodings (pdf)

  HPDF_SetCompressionMode (pdf, #HPDF_COMP_ALL)

  ; load ttc file 
  detail_font_name = PeekS(HPDF_LoadTTFontFromFile (pdf, "Samples\ttfont\PenguinAttack.ttf", #HPDF_TRUE))

  ; add a new page object. 
  page = HPDF_AddPage (pdf)

  title_font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")

  detail_font = HPDF_GetFont (pdf, detail_font_name, "90msp-RKSJ-H")
  HPDF_Page_SetFontAndSize (page, title_font, 10)

  HPDF_Page_BeginText (page)

  ; move the position of the text To top of the page. 
  HPDF_Page_MoveTextPos(page, 10, 190)
  HPDF_Page_ShowText (page, detail_font_name)
  HPDF_Page_ShowText (page, " (")
  HPDF_Page_ShowText (page, PeekS(HPDF_Font_GetEncodingName (detail_font)))
  HPDF_Page_ShowText (page, ")")

  HPDF_Page_SetFontAndSize (page, detail_font, 15)
  HPDF_Page_MoveTextPos (page, 10, -20)
  HPDF_Page_ShowText (page, "abcdefghijklmnopqrstuvwxyz")
  HPDF_Page_MoveTextPos (page, 0, -20)
  HPDF_Page_ShowText (page, "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
  HPDF_Page_MoveTextPos (page, 0, -20)
  HPDF_Page_ShowText (page, "1234567890")
  HPDF_Page_MoveTextPos (page, 0, -20)

  HPDF_Page_SetFontAndSize (page, detail_font, 10)
  HPDF_Page_ShowText (page, SAMP_TXT)
  HPDF_Page_MoveTextPos (page, 0, -18)

  HPDF_Page_SetFontAndSize (page, detail_font, 16)
  HPDF_Page_ShowText (page, SAMP_TXT)
  HPDF_Page_MoveTextPos (page, 0, -27)

  HPDF_Page_SetFontAndSize (page, detail_font, 23)
  HPDF_Page_ShowText (page, SAMP_TXT)
  HPDF_Page_MoveTextPos (page, 0, -36)

  HPDF_Page_SetFontAndSize (page, detail_font, 30)
  HPDF_Page_ShowText (page, SAMP_TXT)
  HPDF_Page_MoveTextPos (page, 0, -36)

  Debug HPDF_Page_TextWidth(page, SAMP_TXT)
  pw = HPDF_Page_TextWidth (page, SAMP_TXT)
  page_height = 210
  page_width = pw + 40

  HPDF_Page_SetWidth (page, page_width)
  HPDF_Page_SetHeight (page, page_height)

  ; finish To print text. 
  HPDF_Page_EndText (page)

  HPDF_Page_SetLineWidth (page, 0.5)

  HPDF_Page_MoveTo (page, 10, page_height - 25)
  HPDF_Page_LineTo (page, page_width - 10, page_height - 25)
  HPDF_Page_Stroke (page)

  HPDF_Page_MoveTo (page, 10, page_height - 85)
  HPDF_Page_LineTo (page, page_width - 10, page_height - 85)
  HPDF_Page_Stroke (page)

  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_11.pdf")

  ; clean up 
  HPDF_Free (pdf)

; IDE Options = PureBasic 4.20 (Windows - x86)
; Folding = 9
; EnableCompileCount = 5
; EnableBuildCount = 0