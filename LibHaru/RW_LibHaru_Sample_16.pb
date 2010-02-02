XIncludeFile "RW_LibHaru_Inc.pb"

	ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
	  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
	EndProcedure
	Procedure Print_Grid(pdf.l, page.l)
    Protected height 	= 600
    Protected width 	  = 400	;width
    Protected font.l	= HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")
    Protected x.l, y.l
    Protected buffer.s
    HPDF_Page_SetFontAndSize (page, font, 5)
    HPDF_Page_SetGrayFill (page, 0.5)
    HPDF_Page_SetGrayStroke (page, 0.8)

    ; Draw horizontal lines 
    y = 0
    While (y < height)
      If (y % 10 = 0)
        HPDF_Page_SetLineWidth (page, 0.5)
        Else 
        If HPDF_Page_GetLineWidth (page) <> 0.25
          HPDF_Page_SetLineWidth (page, 0.25)
        EndIf
      EndIf
      HPDF_Page_MoveTo (page, 0, y)
      HPDF_Page_LineTo (page, width, y)
      HPDF_Page_Stroke (page)
      If y % 10 = 0 And y > 0
        HPDF_Page_SetGrayStroke (page, 0.5)
        HPDF_Page_MoveTo (page, 0, y)
        HPDF_Page_LineTo (page, 5, y)
        HPDF_Page_Stroke (page)
        HPDF_Page_SetGrayStroke (page, 0.8)
      EndIf
      y + 5
    Wend


    ; Draw virtical lines
    x = 0;
    While (x < width)
        If (x % 10 = 0)
          HPDF_Page_SetLineWidth (page, 0.5)
        Else
          If (HPDF_Page_GetLineWidth (page) <> 0.25)
            HPDF_Page_SetLineWidth (page, 0.25)
          EndIf
        EndIf
        HPDF_Page_MoveTo (page, x, 0)
        HPDF_Page_LineTo (page, x, height)
        HPDF_Page_Stroke (page)
        If (x % 50 = 0 And x > 0)
            HPDF_Page_SetGrayStroke (page, 0.5)
            HPDF_Page_MoveTo (page, x, 0)
            HPDF_Page_LineTo (page, x, 5)
            HPDF_Page_Stroke (page)
            HPDF_Page_MoveTo (page, x, height)
            HPDF_Page_LineTo (page, x, height - 5)
            HPDF_Page_Stroke (page)
            HPDF_Page_SetGrayStroke (page, 0.8)
        EndIf
        x + 5
    Wend

    ; Draw horizontal text
    y = 0;
    While (y < height)
      If (y % 10 = 0 And y > 0)
        HPDF_Page_BeginText (page);
        HPDF_Page_MoveTextPos (page, 5, y - 2);
        buffer = Str(y)
        HPDF_Page_ShowText (page, buffer)
        HPDF_Page_EndText (page)
      EndIf
      y + 5
    Wend

    ; Draw virtical text
    x = 0;
    While (x < width)
      If (x % 50 = 0 And x > 0) 
        HPDF_Page_BeginText (page)
        HPDF_Page_MoveTextPos (page, x, 5)
        buffer = Str(x)
        HPDF_Page_ShowText (page, buffer)
        HPDF_Page_EndText (page)
        HPDF_Page_BeginText (page)
        HPDF_Page_MoveTextPos (page, x, height - 10)
        HPDF_Page_ShowText (page, buffer)
        HPDF_Page_EndText (page)
        EndIf
      x + 5
    Wend

    HPDF_Page_SetGrayFill (page, 0);
    HPDF_Page_SetGrayStroke (page, 0);
	EndProcedure

  Global pdf.l, page.l
  pdf = HPDF_New(@Error_handler(), #Null)
  If pdf = 0 
    Debug "error: cannot create PdfDoc object"
    End
  EndIf

  ; add a new page object. 
  page = HPDF_AddPage (pdf)

  HPDF_Page_SetHeight (page, 600)
  HPDF_Page_SetWidth (page, 400)

  Print_Grid  (pdf, page)


  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_16.pdf")

  ; clean up 
  HPDF_Free (pdf)


; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 116
; Folding = 9
; EnableCompileCount = 3
; EnableBuildCount = 0