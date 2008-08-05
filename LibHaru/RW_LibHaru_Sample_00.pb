IncludeFile "RW_LibHaru_Inc.pb"

ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
EndProcedure

Global Dim Font_List.s(14)
  Font_List(0) = "Courier"
  Font_List(1) = "Courier-Bold"
  Font_List(2) = "Courier-Oblique"
  Font_List(3) = "Courier-BoldOblique"
  Font_List(4) = "Helvetica"
  Font_List(5) = "Helvetica-Bold"
  Font_List(6) = "Helvetica-Oblique"
  Font_List(7) = "Helvetica-BoldOblique"
  Font_List(8) = "Times-Roman"
  Font_List(9) = "Times-Bold"
  Font_List(10) = "Times-Italic"
  Font_List(11) = "Times-BoldItalic"
  Font_List(12) = "Symbol"
  Font_List(13) = "ZapfDingbats"

Global page_title.s = "Font Demo"
Global pdf.l
Global fname.s
Global page.l
Global def_font.l
Global tw.l
Global height.l
Global width.l
Global i.l

    pdf = HPDF_New(@Error_handler(), #Null)
    If pdf = 0 
      Debug "error: cannot create PdfDoc object"
      End
    EndIf

    ; Add a new page object. 
    page = HPDF_AddPage (pdf)

    height = HPDF_Page_GetHeight (page)
    width = HPDF_Page_GetWidth (page)

    ; Print the lines of the page. 
    HPDF_Page_SetLineWidth (page, 1)
    HPDF_Page_Rectangle (page, 50, 50, width - 100, height - 110)
    HPDF_Page_Stroke (page)

    ; Print the title of the page (With positioning center). 
    def_font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")
    HPDF_Page_SetFontAndSize (page, def_font, 24)

    tw = HPDF_Page_TextWidth (page, page_title)
    HPDF_Page_BeginText (page)
    HPDF_Page_TextOut (page, (width - tw) / 2, height - 50, page_title)
    HPDF_Page_EndText (page)

    ; output subtitle. 
    HPDF_Page_BeginText (page)
    HPDF_Page_SetFontAndSize (page, def_font, 16)
    HPDF_Page_TextOut (page, 60, height - 80, "<Standard Type1 fonts samples>")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, 60, height - 105)

    i = 0
    While (font_list(i))
        samp_text.s = "abcdefgABCDEFG12345!#$%&+-@?"
        font = HPDF_GetFont (pdf, font_list(i), "StandardEncoding")

        ; print a label of text 
        HPDF_Page_SetFontAndSize (page, def_font, 9)
        HPDF_Page_ShowText (page, font_list(i))
        HPDF_Page_MoveTextPos (page, 0, -18)

        ; print a sample text. 
        HPDF_Page_SetFontAndSize (page, font, 20)
        HPDF_Page_ShowText (page, samp_text)
        HPDF_Page_MoveTextPos (page, 0, -20)

        i + 1
    Wend

    HPDF_Page_EndText (page)

    HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_00.pdf")

    ; clean up 
    HPDF_Free (pdf)



; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 87
; FirstLine = 54
; Folding = -
; EnableCompileCount = 5
; EnableBuildCount = 0