XIncludeFile "RW_LibHaru_Inc.pb"

  ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
    Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
  EndProcedure

  Global Text.s         = "This is an encrypt document example."
  Global Owner_passwd.s = "owner"
  Global User_passwd.s  = "user"
  Global pdf.l, font.l, page.l, tw.l
  Global fname.s{256}

  pdf = HPDF_New(@Error_handler(), #Null)
  If pdf = 0 
      Debug "error: cannot create PdfDoc object"
      End
  EndIf

  ; create Default-font 
  font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")

  ; add a new page object. 
  page = HPDF_AddPage (pdf)

  HPDF_Page_SetSize (page, #HPDF_PAGE_SIZE_B5, #HPDF_PAGE_LANDSCAPE)
  width   = HPDF_Page_GetWidth(page)
  height  = HPDF_Page_GetHeight(page)
  HPDF_Page_BeginText (page)
  HPDF_Page_SetFontAndSize (page, font, 20)
  tw = HPDF_Page_TextWidth (page, text)
  HPDF_Page_MoveTextPos (page, (width - tw) / 2, (height   - 20) / 2)
  HPDF_Page_ShowText (page, text)
  HPDF_Page_EndText (page)

  HPDF_SetPassword (pdf, Owner_passwd, User_passwd)

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_08.pdf")

  ; clean up 
  HPDF_Free (pdf)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 25
; Folding = 0
; EnableCompileCount = 11
; EnableBuildCount = 0