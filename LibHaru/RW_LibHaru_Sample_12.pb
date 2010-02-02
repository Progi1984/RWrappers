XIncludeFile "RW_LibHaru_Inc.pb"

ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
EndProcedure
    
    Global *rect1.HPDF_Rect = AllocateMemory(SizeOf(HPDF_Rect))
      *rect1\left    = 50
      *rect1\bottom  = 350
      *rect1\right   = 150
      *rect1\top     = 400
    Global rect2.HPDF_Rect
      rect2\left    = 210
      rect2\bottom  = 350
      rect2\right   = 350
      rect2\top     = 400
    Global rect3.HPDF_Rect
      rect3\left    = 50
      rect3\bottom  = 250
      rect3\right   = 150
      rect3\top     = 300
    Global rect4.HPDF_Rect
      rect4\left    = 210
      rect4\bottom  = 250
      rect4\right   = 350
      rect4\top     = 300
    Global rect5.HPDF_Rect
      rect5\left    = 50
      rect5\bottom  = 150
      rect5\right   = 150
      rect5\top     = 200
    Global rect6.HPDF_Rect
      rect6\left    = 210
      rect6\bottom  = 150
      rect6\right   = 350
      rect6\top     = 200
    Global rect7.HPDF_Rect
      rect7\left    = 50
      rect7\bottom  = 50
      rect7\right   = 150
      rect7\top     = 100
    Global rect8.HPDF_Rect
      rect8\left    = 210
      rect8\bottom  = 50
      rect8\right   = 350
      rect8\top     = 100

    Global pdf.l
    Global fname.s{256}
    Global page.l
    Global font.l
    Global encoding.l
    Global annot.l


    
    pdf = HPDF_New(@Error_handler(), #Null)
    If pdf = 0 
        Debug "error: cannot create PdfDoc object"
        End
    EndIf

    ; use Times-Roman font. 
    font = HPDF_GetFont (pdf, "Times-Roman", "WinAnsiEncoding")

    page = HPDF_AddPage (pdf)

    HPDF_Page_SetWidth (page, 400)
    HPDF_Page_SetHeight (page, 500)

    HPDF_Page_BeginText (page)
    HPDF_Page_SetFontAndSize (page, font, 16)
    HPDF_Page_MoveTextPos (page, 130, 450)
    HPDF_Page_ShowText (page, "Annotation Demo")
    HPDF_Page_EndText (page)

    Debug "--> BUG Start"
    annot = HPDF_Page_CreateTextAnnot (page, *rect1, "Annotation with Comment Icon. \n This annotation set to be opened initially.", #Null)
    Debug "--> BUG End"
    ;End
    HPDF_TextAnnot_SetIcon (annot, #HPDF_ANNOT_ICON_COMMENT)
    HPDF_TextAnnot_SetOpened (annot, #HPDF_TRUE)

    annot = HPDF_Page_CreateTextAnnot (page, @rect2, "Annotation with Key Icon", #Null)
    HPDF_TextAnnot_SetIcon (annot, #HPDF_ANNOT_ICON_PARAGRAPH)

    annot = HPDF_Page_CreateTextAnnot (page, rect3, "Annotation with Note Icon", #Null)
    HPDF_TextAnnot_SetIcon (annot, #HPDF_ANNOT_ICON_NOTE)

    annot = HPDF_Page_CreateTextAnnot (page, rect4, "Annotation with Help Icon", #Null)
    HPDF_TextAnnot_SetIcon (annot, #HPDF_ANNOT_ICON_HELP)

    annot = HPDF_Page_CreateTextAnnot (page, rect5, "Annotation with NewParagraph Icon", #Null)
    HPDF_TextAnnot_SetIcon (annot, #HPDF_ANNOT_ICON_NEW_PARAGRAPH)

    annot = HPDF_Page_CreateTextAnnot (page, rect6, "Annotation with Paragraph Icon", #Null)
    HPDF_TextAnnot_SetIcon (annot, #HPDF_ANNOT_ICON_PARAGRAPH)

    annot = HPDF_Page_CreateTextAnnot (page, rect7, "Annotation with Insert Icon", #Null)
    HPDF_TextAnnot_SetIcon (annot, #HPDF_ANNOT_ICON_INSERT)

    encoding = HPDF_GetEncoder (pdf, "ISO8859-2")
    HPDF_Page_CreateTextAnnot (page, rect8, "Annotation with ISO8859 text гдежзий", encoding)

    HPDF_Page_SetFontAndSize (page, font, 11)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, *rect1\left + 35, *rect1\top - 20)
    HPDF_Page_ShowText (page, "Comment Icon.")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, rect2\left + 35, rect2\top - 20)
    HPDF_Page_ShowText (page, "Key Icon")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, rect3\left + 35, rect3\top - 20)
    HPDF_Page_ShowText (page, "Note Icon.")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, rect4\left + 35, rect4\top - 20)
    HPDF_Page_ShowText (page, "Help Icon")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, rect5\left + 35, rect5\top - 20)
    HPDF_Page_ShowText (page, "NewParagraph Icon")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, rect6\left + 35, rect6\top - 20)
    HPDF_Page_ShowText (page, "Paragraph Icon")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, rect7\left + 35, rect7\top - 20)
    HPDF_Page_ShowText (page, "Insert Icon")
    HPDF_Page_EndText (page)

    HPDF_Page_BeginText (page)
    HPDF_Page_MoveTextPos (page, rect8\left + 35, rect8\top - 20)
    HPDF_Page_ShowText (page, "Text Icon(ISO8859-2 text)")
    HPDF_Page_EndText (page)


    ; save the document To a file 
    HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_12.pdf")

    ; clean up 
    HPDF_Free (pdf)

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 107
; FirstLine = 69
; Folding = +
; EnableCompileCount = 22
; EnableBuildCount = 0