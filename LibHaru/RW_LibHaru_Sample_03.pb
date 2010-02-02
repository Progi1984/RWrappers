XIncludeFile "RW_LibHaru_Inc.pb"

	Procedure Print_Grid(pdf.l, page.l)
    Protected height 	= HPDF_Page_GetHeight (page)
    Protected width 	  = HPDF_Page_GetWidth (page)
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
        buffer = Str(x)
        HPDF_Page_BeginText (page)
          HPDF_Page_MoveTextPos (page, x, 5)
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
  ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
    Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
  EndProcedure
  Procedure PrintText(page.l)
    Protected buf.s
    Protected PosL.l
    Protected Pos.HPDF_Point
    PosL = HPDF_Page_GetCurrentTextPos (page);
    *Pos = @PosL
    no + 1
    buf = "["+Str(no)+"] "+Str(Pos\x)+" "+Str(Pos\y)
    HPDF_Page_ShowText(page, buf);
  EndProcedure


  Global no.l = 0
  Global pdf.l, page.l
  Global fname.s{256}
  Global angle1.f, angle2.f, rad1.f, rad2.f
  Global page_height.l
  Global rect.HPDF_Rect
  Global RectL.l, i.l
  Global SAMP_TXT.s = "The quick brown fox jumps over the lazy dog. "

  pdf = HPDF_New(@Error_handler(), #Null)
  If pdf = 0 
      Debug "error: cannot create PdfDoc object"
      End
  EndIf

  ; add a new page object
  page = HPDF_AddPage (pdf)
  HPDF_Page_SetSize (page, #HPDF_PAGE_SIZE_A5, #HPDF_PAGE_PORTRAIT);

  print_grid  (pdf, page);
  page_height = HPDF_Page_GetHeight (page)
  page_width = HPDF_Page_GetWidth (page)
  font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")
  HPDF_Page_SetTextLeading (page, 20);

  ;text_rect method 

  ; HPDF_TALIGN_LEFT 
  rect\left   = 25;
  rect\top    = 545;
  rect\right  = 200;
  rect\bottom = rect\top - 40;

  HPDF_Page_Rectangle (page, rect\left, rect\bottom, rect\right - rect\left, rect\top - rect\bottom);
  HPDF_Page_Stroke (page);

  HPDF_Page_BeginText (page);
    HPDF_Page_TextOut (page, rect\left, rect\top, "")
  HPDF_Page_EndText (page);
  HPDF_Page_BeginText (page);
    HPDF_Page_SetFontAndSize (page, font, 10);
      HPDF_Page_TextOut (page, rect\left, rect\top + 3, "HPDF_TALIGN_LEFT")
    HPDF_Page_SetFontAndSize (page, font, 13);
      HPDF_Page_TextRect (page, rect\left, rect\top, rect\right, rect\bottom, SAMP_TXT, #HPDF_TALIGN_LEFT, #Null);
  HPDF_Page_EndText (page);

  ; HPDF_TALIGN_RIGTH 
  rect\left   = 220;
  rect\right  = 395;

  HPDF_Page_Rectangle (page, rect\left, rect\bottom, rect\right - rect\left,rect\top - rect\bottom);
  HPDF_Page_Stroke (page);

  HPDF_Page_BeginText (page);

  HPDF_Page_SetFontAndSize (page, font, 10);
  HPDF_Page_TextOut (page, rect\left, rect\top + 3, "HPDF_TALIGN_RIGTH");

  HPDF_Page_SetFontAndSize (page, font, 13);
  HPDF_Page_TextRect (page, rect\left, rect\top, rect\right, rect\bottom, SAMP_TXT, #HPDF_TALIGN_RIGHT, #Null);

  HPDF_Page_EndText (page);

  ; HPDF_TALIGN_CENTER 
  rect\left   = 25;
  rect\top    = 475;
  rect\right  = 200;
  rect\bottom = rect\top - 40;

  HPDF_Page_Rectangle (page, rect\left, rect\bottom, rect\right - rect\left, rect\top - rect\bottom);
  HPDF_Page_Stroke (page);

  HPDF_Page_BeginText (page);

  HPDF_Page_SetFontAndSize (page, font, 10);
  HPDF_Page_TextOut (page, rect\left, rect\top + 3, "HPDF_TALIGN_CENTER");

  HPDF_Page_SetFontAndSize (page, font, 13);
  HPDF_Page_TextRect (page, rect\left, rect\top, rect\right, rect\bottom, SAMP_TXT, #HPDF_TALIGN_CENTER, #Null);

  HPDF_Page_EndText (page);

  ; HPDF_TALIGN_JUSTIFY 
  rect\left   = 220;
  rect\right  = 395;

  HPDF_Page_Rectangle (page, rect\left, rect\bottom, rect\right - rect\left, rect\top - rect\bottom);
  HPDF_Page_Stroke (page);

  HPDF_Page_BeginText (page);

  HPDF_Page_SetFontAndSize (page, font, 10);
  HPDF_Page_TextOut (page, rect\left, rect\top + 3, "HPDF_TALIGN_JUSTIFY");

  HPDF_Page_SetFontAndSize (page, font, 13);
  HPDF_Page_TextRect (page, rect\left, rect\top, rect\right, rect\bottom, SAMP_TXT, #HPDF_TALIGN_JUSTIFY, #Null);

  HPDF_Page_EndText (page);



  ; Skewed coordinate system 
  HPDF_Page_GSave (page);
  angle1  = 5;
  angle2  = 10;
  rad1    = angle1 / 180 * 3.141592;
  rad2    = angle2 / 180 * 3.141592;

  HPDF_Page_Concat (page, 1, Tan(rad1), Tan(rad2), 1, 25, 350);
  rect\left   = 0;
  rect\top    = 40;
  rect\right  = 175;
  rect\bottom = 0;

  HPDF_Page_Rectangle (page, rect\left, rect\bottom, rect\right - rect\left, rect\top - rect\bottom);
  HPDF_Page_Stroke (page);

  HPDF_Page_BeginText (page);

  HPDF_Page_SetFontAndSize (page, font, 10);
  HPDF_Page_TextOut (page, rect\left, rect\top + 3, "Skewed coordinate system");

  HPDF_Page_SetFontAndSize (page, font, 13);
  HPDF_Page_TextRect (page, rect\left, rect\top, rect\right, rect\bottom, SAMP_TXT, #HPDF_TALIGN_LEFT, #Null);

  HPDF_Page_EndText (page);

  HPDF_Page_GRestore (page);


  ; Rotated coordinate system 
  HPDF_Page_GSave (page);

  angle1 = 5;
  rad1 = angle1 / 180 * 3.141592;

  HPDF_Page_Concat (page, Cos(rad1), Sin(rad1), -Sin(rad1), Cos(rad1), 220, 350);
  rect\left = 0;
  rect\top = 40;
  rect\right = 175;
  rect\bottom = 0;

  HPDF_Page_Rectangle (page, rect\left, rect\bottom, rect\right - rect\left, rect\top - rect\bottom);
  HPDF_Page_Stroke (page);

  HPDF_Page_BeginText (page);

  HPDF_Page_SetFontAndSize (page, font, 10);
  HPDF_Page_TextOut (page, rect\left, rect\top + 3, "Rotated coordinate system");

  HPDF_Page_SetFontAndSize (page, font, 13);
  HPDF_Page_TextRect (page, rect\left, rect\top, rect\right, rect\bottom, SAMP_TXT, #HPDF_TALIGN_LEFT, #Null);

  HPDF_Page_EndText (page);

  HPDF_Page_GRestore (page);


  ; text along a circle 
  HPDF_Page_SetGrayStroke (page, 0);
  HPDF_Page_Circle (page, 210, 190, 145);
  HPDF_Page_Circle (page, 210, 190, 113);
  HPDF_Page_Stroke (page);

  angle1 = 360 / (Len(SAMP_TXT));
  angle2 = 180;

  HPDF_Page_BeginText (page);
  font = HPDF_GetFont (pdf, "Courier-Bold", "StandardEncoding");
  HPDF_Page_SetFontAndSize (page, font, 30);

  For i = 1 To Len (SAMP_TXT)
      Define.s buf
      Define.f x, y

      rad1 = (angle2 - 90) / 180 * 3.141592;
      rad2 = angle2 / 180 * 3.141592;

      x = 210 + Cos(rad2) * 122;
      y = 190 + Sin(rad2) * 122;

      HPDF_Page_SetTextMatrix(page, Cos(rad1), Sin(rad1), -Sin(rad1), Cos(rad1), x, y);

      buf = Mid(SAMP_TXT, i, 1)
      HPDF_Page_ShowText (page, buf);
      angle2 - angle1
  Next

  HPDF_Page_EndText (page);

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_03.pdf");

  ; clean up 
  HPDF_Free (pdf);

; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 296
; FirstLine = 156
; Folding = 5
; EnableCompileCount = 3
; EnableBuildCount = 0