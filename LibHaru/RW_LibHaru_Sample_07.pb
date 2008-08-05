XIncludeFile "RW_LibHaru_Inc.pb"

	#PAGE_WIDTH = 420
	#PAGE_HEIGHT = 400
	#CELL_WIDTH = 20
	#CELL_HEIGHT = 20
	#CELL_HEADER = 10

  ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
    Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
  EndProcedure
  Procedure Draw_Graph(page.l)
    Protected buf.s{50}
    Protected i.l
    ; Draw 16 X 15 cells 
      ; Draw vertical lines. 
      HPDF_Page_SetLineWidth (page, 0.5)
      For i = 0 To 17
        x = i * #CELL_WIDTH + 40
        
        HPDF_Page_MoveTo (page, x, #PAGE_HEIGHT - 60)
        HPDF_Page_LineTo (page, x, 40)
        HPDF_Page_Stroke (page)
        
        If i > 0 And i <= 16
          HPDF_Page_BeginText (page)
          HPDF_Page_MoveTextPos (page, x + 5, #PAGE_HEIGHT - 75)
          Select i-1
            Case 10
              buf = "A"
            Case 11
              buf = "B"
            Case 12
              buf = "C"
            Case 13
              buf = "D"
            Case 14
              buf = "E"
            Case 15
              buf = "F"
            Default
              buf = Str(i-1)    
          EndSelect
          HPDF_Page_ShowText (page, buf)
          HPDF_Page_EndText (page)
        EndIf
      Next
  
      ; Draw horizontal lines. 
      For i = 0 To 15
        y = i * #CELL_HEIGHT + 40
        HPDF_Page_MoveTo (page, 40, y)
        HPDF_Page_LineTo (page, #PAGE_WIDTH - 40, y)
        HPDF_Page_Stroke (page)
        If i < 14
          HPDF_Page_BeginText (page)
          HPDF_Page_MoveTextPos (page, 45, y + 5)
          Select 15-i
            Case 10
              buf = "A"
            Case 11
              buf = "B"
            Case 12
              buf = "C"
            Case 13
              buf = "D"
            Case 14
              buf = "E"
            Case 15
              buf = "F"
            Default
              buf = Str(15-i)    
          EndSelect

          HPDF_Page_ShowText (page, buf)
          HPDF_Page_EndText (page)
        EndIf
      Next
  EndProcedure
  Procedure Draw_Fonts(pdf.l, page.l)
    Protected i.l, j.l
    HPDF_Page_BeginText (page)
    ; Draw all character from 0x20 To 0xFF To the canvas. 
    For i = 1 To 16
      For j = 1 To 16
        Protected buf.s{2}
        Protected bufl.l
        y = #PAGE_HEIGHT - 55 - ((i - 1) * #CELL_HEIGHT)
        x = j * #CELL_WIDTH + 45
        bufl = (i - 1) * 16 + (j - 1)
        If bufl >=32
          HPDF_Page_TextOut (page, x, y, Chr(bufl))
        EndIf
      Next
    Next
    HPDF_Page_EndText (page)
  EndProcedure

  Global pdf.l, font.l, i.l = 0
  Global fname.s{256}
  Global font_name.s
  Global root.l ; HPDF_Outline
  Global Dim Encodings.s(22)
    Encodings(0) = "StandardEncoding"
    Encodings(1) = "MacRomanEncoding"
    Encodings(2) = "WinAnsiEncoding"
    Encodings(3) = "ISO8859-2"
    Encodings(4) = "ISO8859-3"
    Encodings(5) = "ISO8859-4"
    Encodings(6) = "ISO8859-5"
    Encodings(7) = "ISO8859-9"
    Encodings(8) = "ISO8859-10"
    Encodings(9) = "ISO8859-13"
    Encodings(10) = "ISO8859-14"
    Encodings(11) = "ISO8859-15"
    Encodings(12) = "ISO8859-16"
    Encodings(13) = "CP1250"
    Encodings(14) = "CP1251"
    Encodings(15) = "CP1252"
    Encodings(16) = "CP1254"
    Encodings(17) = "CP1257"
    Encodings(18) = "KOI8-R"
    Encodings(19) = "Symbol-Set"
    Encodings(20) = "ZapfDingbats-Set"
    Encodings(21) = ""

  pdf = HPDF_NewEx(@Error_handler(), #Null, #Null, 0, #Null)
  If pdf = 0 
      Debug "error: cannot create PdfDoc object"
      End
  EndIf

  ; set compression mode 
  HPDF_SetCompressionMode (pdf, #HPDF_COMP_ALL)

  ; Set page mode To use outlines. 
  HPDF_SetPageMode(pdf, #HPDF_PAGE_MODE_USE_OUTLINE)

  ; get Default font 
  font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")

  ; load font object 
  font_name = PeekS(HPDF_LoadType1FontFromFile (pdf, "Samples\type1\a010013l.afm","Samples\type1\a010013l.pfb"))

  ; create outline root. 
  root = HPDF_CreateOutline (pdf, #Null, "Encoding list", #Null)
  HPDF_Outline_SetOpened (root, #HPDF_TRUE)

  While encodings(i) <> ""
      Define.l page = HPDF_AddPage (pdf)
      Define.l outline  ; HPDF_Outline
      Define.l dst      ; HPDF_Destination
      Define.l font2    ; HPDF_Font

      HPDF_Page_SetWidth (page, #PAGE_WIDTH)
      HPDF_Page_SetHeight (page, #PAGE_HEIGHT)

      outline = HPDF_CreateOutline (pdf, root, Encodings(i), #Null)
      dst = HPDF_Page_CreateDestination (page)
      HPDF_Destination_SetXYZ(dst, 0, HPDF_Page_GetHeight(page), 1)
      ; HPDF_Destination_SetFitB(dst) 
      HPDF_Outline_SetDestination(outline, dst)

      HPDF_Page_SetFontAndSize (page, font, 15)
      Draw_Graph (page)

      HPDF_Page_BeginText (page)
      HPDF_Page_SetFontAndSize (page, font, 20)
      HPDF_Page_MoveTextPos (page, 40, #PAGE_HEIGHT - 50)
      HPDF_Page_ShowText (page, Encodings(i))
      HPDF_Page_ShowText (page, " Encoding")
      HPDF_Page_EndText (page)

      If Encodings(i) = "Symbol-Set"
        font2 = HPDF_GetFont (pdf, "Symbol", "StandardEncoding")
      ElseIf Encodings(i) = "ZapfDingbats-Set"
        font2 = HPDF_GetFont (pdf, "ZapfDingbats", "StandardEncoding")
      Else
        coding.s = Encodings(i)
        font2 = HPDF_GetFont (pdf, font_name, coding)
      EndIf
      HPDF_Page_SetFontAndSize (page, font2, 14)
      Draw_Fonts (pdf, page)
      i+1
  Wend 

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_07.pdf")

  ; clean up 
  HPDF_Free (pdf)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 191
; FirstLine = 66
; Folding = E5-
; EnableCompileCount = 56
; EnableBuildCount = 0