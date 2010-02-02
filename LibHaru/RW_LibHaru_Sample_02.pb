XIncludeFile "RW_LibHaru_Inc.pb"

  ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
    Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
  EndProcedure
	Procedure Show_Stripe_Pattern (page.l, x.l, y.l)
		iy = 0
		While(iy < 50) 
			HPDF_Page_SetRGBStroke(page, 0.0, 0.0, 0.5)
			HPDF_Page_SetLineWidth(page, 1)
			HPDF_Page_MoveTo(page, x, y + iy)
			HPDF_Page_LineTo(page, x + HPDF_Page_TextWidth(page, "ABCabc123"), y + iy)
			HPDF_Page_Stroke(page)
			iy + 3
		Wend
		HPDF_Page_SetLineWidth(page, 2.5)
	EndProcedure
	Procedure Print_Grid(pdf.l, page.l)
    Protected height 	= HPDF_Page_GetHeight(page)
    Protected width 	= HPDF_Page_GetWidth(page)
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
	Macro Show_Description(hPage, x, y, text)
		fsize.f = HPDF_Page_GetCurrentFontSize(hPage)
		font.l  = HPDF_Page_GetCurrentFont(hPage)
		HPDF_Page_BeginText(hPage)
  		HPDF_Page_SetRGBFill(hPage, 0, 0, 0)
  		HPDF_Page_SetTextRenderingMode(hPage, #HPDF_FILL)
  		HPDF_Page_SetFontAndSize(hPage, font, 10)
  		HPDF_Page_TextOut(hPage, x, y - 12, text)
		HPDF_Page_EndText(hPage)
		HPDF_Page_SetFontAndSize(hPage, font, fsize)
	EndMacro


  Global page_title.s = "Text Demo"
  Global pdf.l, font.l, page.l
  Global fname.s{256}
  Global samp_text.s = "abcdefgABCDEFG123!#$%&+-@?"
  Global samp_text2.s = "The quick brown fox jumps over the lazy dog."
  Global tw.f, fsize.f
  Global i.l, len.l
  Global angle1.f, angle2.f, rad1.f, rad2.f, ypos.f


    pdf = HPDF_New(@Error_handler(), #Null)
    If pdf = 0 
        Debug "error: cannot create PdfDoc object"
        End
    EndIf

    ; set compression mode 
    HPDF_SetCompressionMode(pdf, #HPDF_COMP_ALL)

    ; create Default-font 
    font = HPDF_GetFont(pdf, "Helvetica", "StandardEncoding")

    ; add a new page object. 
    page 		= HPDF_AddPage(pdf)
    height 	= HPDF_Page_GetHeight(page)
    width 	= HPDF_Page_GetWidth(page)

    ; draw grid To the page 
    Print_Grid (pdf, page)

    ; print the title of the page(With positioning center). 
    HPDF_Page_SetFontAndSize(page, font, 24)
    tw = HPDF_Page_TextWidth(page, page_title)
    HPDF_Page_BeginText(page)
    HPDF_Page_MoveTextPos (page, (width - tw) / 2, height - 50)
    HPDF_Page_ShowText (page, page_title)
    HPDF_Page_EndText(page)

    HPDF_Page_BeginText(page)
    HPDF_Page_MoveTextPos(page, 60, height - 60)

    ;font size
    fsize = 8
    While(fsize < 60)
        
        ; set style And size of font. 
        HPDF_Page_SetFontAndSize(page, font, fsize)

        ; set the position of the text. 
        HPDF_Page_MoveTextPos(page, 0, -5 - fsize)

        ; measure the number of characters which included in the page. 
        len = HPDF_Page_MeasureText(page, samp_text, width - 120, #HPDF_FALSE, #Null)
        buf.s = Left(samp_text, len)
        ; truncate the text. 
        HPDF_Page_ShowText(page, buf)

        ; print the description. 
        HPDF_Page_MoveTextPos(page, 0, -10)
        HPDF_Page_SetFontAndSize(page, font, 8)
        buf = "Fontsize="+Str(fsize)
        HPDF_Page_ShowText(page, buf)
        fsize * 1.5
    Wend

    ; font color
    HPDF_Page_SetFontAndSize(page, font, 8)
    HPDF_Page_MoveTextPos(page, 0, -30)
    HPDF_Page_ShowText(page, "Font color")

    HPDF_Page_SetFontAndSize(page, font, 18)
    HPDF_Page_MoveTextPos(page, 0, -20)
    len = Len(samp_text)
    For i = 0 To len Step 1
        r.f = i / len
        g.f = 1 -(i / len)
        buf = Mid(samp_text,i,1)

        HPDF_Page_SetRGBFill(page, r, g, 0.0)
        HPDF_Page_ShowText(page, buf)
    Next 
    HPDF_Page_MoveTextPos(page, 0, -25)
    For i = 0 To len Step 1
        r.f = i / len
        b.f = 1 -(i / len)
        buf = Mid(samp_text,i,1)

        HPDF_Page_SetRGBFill(page, r, 0.0, b)
        HPDF_Page_ShowText(page, buf)
    Next
    HPDF_Page_MoveTextPos(page, 0, -25)
    For i = 0 To len Step 1
        b.f = i / len
        g.f = 1 -(i / len)
        buf = Mid(samp_text,i,1)

        HPDF_Page_SetRGBFill(page, 0.0, g, b)
        HPDF_Page_ShowText(page, buf)
    Next
    HPDF_Page_EndText(page)

    
    ; Font rendering mode
    HPDF_Page_SetFontAndSize(page, font, 32)
    HPDF_Page_SetLineWidth(page, 1.5)
    
    ypos = 450
     ; PDF_FILL 
    Show_Description(page,  60, ypos, "")
    Show_Description(page,  60, ypos, "RenderingMode=PDF_FILL")
    HPDF_Page_SetRGBFill(page, 0.5, 0.5, 0.0)
    HPDF_Page_SetTextRenderingMode(page, #HPDF_FILL)
    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, ypos, "ABCabc123")
    HPDF_Page_EndText(page)
    ;Show_Description(page,  60, ypos, "=PDF_FILL")
    
    ; PDF_STROKE 
    Show_Description(page, 60, ypos - 50, "RenderingMode=PDF_STROKE")
    HPDF_Page_SetRGBFill(page, 0.5, 0.5, 0.0)
    HPDF_Page_SetTextRenderingMode(page, #HPDF_STROKE)
    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, ypos - 50, "ABCabc123")
    HPDF_Page_EndText(page)

    ; PDF_FILL_THEN_STROKE 
    Show_Description(page, 60, ypos - 100, "RenderingMode=PDF_FILL_THEN_STROKE")
    HPDF_Page_SetRGBFill(page, 0.5, 0.5, 0.0)
    HPDF_Page_SetTextRenderingMode(page, #HPDF_FILL_THEN_STROKE)
    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, ypos - 100, "ABCabc123")
    HPDF_Page_EndText(page)

    ; PDF_FILL_CLIPPING 
    Show_Description(page, 60, ypos - 150, "RenderingMode=PDF_FILL_CLIPPING")
    HPDF_Page_GSave(page)
    HPDF_Page_SetRGBFill(page, 0.5, 0.5, 0.0)
    HPDF_Page_SetTextRenderingMode(page, #HPDF_FILL_CLIPPING)
    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, ypos - 150, "ABCabc123")
    HPDF_Page_EndText(page)
    Show_Stripe_Pattern(page, 60, ypos - 150)
    HPDF_Page_GRestore(page)

    ; PDF_STROKE_CLIPPING 
    Show_Description(page, 60, ypos - 200, "RenderingMode=PDF_STROKE_CLIPPING")
    HPDF_Page_GSave(page)
    HPDF_Page_SetRGBFill(page, 0.5, 0.5, 0.0)
    HPDF_Page_SetTextRenderingMode(page, #HPDF_STROKE_CLIPPING)
    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, ypos - 200, "ABCabc123")
    HPDF_Page_EndText(page)
    Show_Stripe_Pattern(page, 60, ypos - 200)
    HPDF_Page_GRestore(page)

    ; PDF_FILL_STROKE_CLIPPING 
    Show_Description(page, 60, ypos - 250, "RenderingMode=PDF_FILL_STROKE_CLIPPING")
    HPDF_Page_GSave(page)
    HPDF_Page_SetRGBFill(page, 0.5, 0.5, 0.0)
    HPDF_Page_SetTextRenderingMode(page, #HPDF_FILL_STROKE_CLIPPING)
    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, ypos - 250, "ABCabc123")
    HPDF_Page_EndText(page)
    Show_Stripe_Pattern(page, 60, ypos - 250)
    HPDF_Page_GRestore(page)

    ; Reset text attributes 
    HPDF_Page_SetTextRenderingMode(page, #HPDF_FILL)
    HPDF_Page_SetRGBFill(page, 0, 0, 0)
    HPDF_Page_SetFontAndSize(page, font, 30)


    ; Rotating text
    angle1 = 30                   ; A rotation of 30 degrees. 
    rad1 = angle1 / 180 * 3.141592 ; Calcurate the radian value. 

    Show_Description(page, 320, ypos - 60, "Rotating text")
    HPDF_Page_BeginText(page)
    HPDF_Page_SetTextMatrix(page, Cos(rad1), Sin(rad1), -Sin(rad1), Cos(rad1), 330, ypos - 60)
    HPDF_Page_ShowText(page, "ABCabc123")
    HPDF_Page_EndText(page)


    ; Skewing text.
    Show_Description(page, 320, ypos - 120, "Skewing text")
    HPDF_Page_BeginText(page)

    angle1 = 10
    angle2 = 20
    rad1 = angle1 / 180 * 3.141592
    rad2 = angle2 / 180 * 3.141592

    HPDF_Page_SetTextMatrix(page, 1, Tan(rad1), Tan(rad2), 1, 320, ypos - 120)
    HPDF_Page_ShowText(page, "ABCabc123")
    HPDF_Page_EndText(page)


    ; scaling text(X direction)
    Show_Description(page, 320, ypos - 175, "Scaling text(X direction)")
    HPDF_Page_BeginText(page)
    HPDF_Page_SetTextMatrix(page, 1.5, 0, 0, 1, 320, ypos - 175)
    HPDF_Page_ShowText(page, "ABCabc12")
    HPDF_Page_EndText(page)


    ; scaling text(Y direction)
    Show_Description(page, 320, ypos - 250, "Scaling text(Y direction)")
    HPDF_Page_BeginText(page)
    HPDF_Page_SetTextMatrix(page, 1, 0, 0, 2, 320, ypos - 250)
    HPDF_Page_ShowText(page, "ABCabc123")
    HPDF_Page_EndText(page)


    ; char spacing, word spacing
    Show_Description(page, 60, 140, "char-spacing 0")
    Show_Description(page, 60, 100, "char-spacing 1.5")
    Show_Description(page, 60, 60, "char-spacing 1.5, word-spacing 2.5")

    HPDF_Page_SetFontAndSize(page, font, 20)
    HPDF_Page_SetRGBFill(page, 0.1, 0.3, 0.1)

    ; char-spacing 0 
    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, 140, samp_text2)
    HPDF_Page_EndText(page)

    ; char-spacing 1.5 
    HPDF_Page_SetCharSpace(page, 1.5)

    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, 100, samp_text2)
    HPDF_Page_EndText(page)

    ; char-spacing 1.5, word-spacing 3.5 
    HPDF_Page_SetWordSpace(page, 2.5)

    HPDF_Page_BeginText(page)
    HPDF_Page_TextOut(page, 60, 60, samp_text2)
    HPDF_Page_EndText(page)

    ; save the document To a file 
    HPDF_SaveToFile(pdf, "Samples\RW_LibHaru_Sample_02.pdf")

    ; clean up 
    HPDF_Free(pdf)


; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 20
; Folding = 1
; EnableCompileCount = 66
; EnableBuildCount = 0