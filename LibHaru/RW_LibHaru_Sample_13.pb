XIncludeFile "RW_LibHaru_Inc.pb"

	ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
	  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
	EndProcedure
	Procedure Print_Page(page.l, font.l, page_num.l)
	  Protected buf.s{50}
	  
	  HPDF_Page_SetWidth (page, 200)
	  HPDF_Page_SetHeight (page, 200)
	  HPDF_Page_SetFontAndSize (page, font, 20)
	  HPDF_Page_BeginText (page)
	  HPDF_Page_MoveTexTPos (page, 50, 150)
	  buf = "Page : "+Str(paeg_num)
	  HPDF_Page_ShowText (page, buf)
	  HPDF_Page_EndText (page)
	EndProcedure    

  Global pdf.l, font.l, index_page.l, Dst.l, annot.l, i.l
  Global Dim PageDim.l(7)
  Global fname.s{256}
  Global Rect.HPDF_Rect
  Global Tp.HPDF_Point, TpL.l
  Global uri.s = "htTp://sourceforge.net/projects/libharu"
	Global PosL.l
	Global Pos.HPDF_Point

  pdf = HPDF_New(@Error_handler(), #Null)
  If pdf = 0 
      Debug "error: cannot create PdfDoc object"
      End
  EndIf

  ; create Default-font 
  font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")

  ; create index page 
  index_page = HPDF_AddPage (pdf)
  HPDF_Page_SetWidth (index_page, 300)
  HPDF_Page_SetHeight (index_page, 220)

  ; Add 7 pages To the document. 
  For i = 0 To 6
    PageDim(i) = HPDF_AddPage (pdf)
    Print_Page(PageDim(i), font, i + 1)
  Next

  HPDF_Page_BeginText (index_page)
    HPDF_Page_SetFontAndSize (index_page, font, 10)
    HPDF_Page_MoveTexTPos (index_page, 15, 200)
    HPDF_Page_ShowText (index_page, "Link Annotation Demo")
  HPDF_Page_EndText (index_page)

  ; Create Link-Annotation object on index page.
  HPDF_Page_BeginText(index_page)
	  HPDF_Page_SetFontAndSize (index_page, font, 8)
	  HPDF_Page_MoveTexTPos (index_page, 20, 180)
	  HPDF_Page_SetTextLeading (index_page, 23)
	  ;{ Page1 (HPDF_ANNOT_NO_HIGHTLIGHT) 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "Jump to Page1 (HilightMode=HPDF_ANNOT_NO_HIGHTLIGHT)")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_MoveToNextLine (index_page)
		
		  Dst = HPDF_Page_CreateDestination(PageDim(0))
		  annot = HPDF_Page_CreateLinkAnnot(index_page, @Rect, Dst)
	    ;End
		  HPDF_LinkAnnot_SetHighlightMode (annot, #HPDF_ANNOT_NO_HIGHTLIGHT)
		;}
	  ;{ Page2 (HPDF_ANNOT_INVERT_BOX) 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "Jump to Page2 (HilightMode=HPDF_ANNOT_INVERT_BOX)")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_MoveToNextLine (index_page)
		  Dst = HPDF_Page_CreateDestination (PageDim(1))
		  annot = HPDF_Page_CreateLinkAnnot (index_page, Rect, Dst)
		  HPDF_LinkAnnot_SetHighlightMode (annot, #HPDF_ANNOT_INVERT_BOX)
		;}
	  ;{ Page3 (HPDF_ANNOT_INVERT_BORDER) 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "Jump to Page3 (HilightMode=HPDF_ANNOT_INVERT_BORDER)")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_MoveToNextLine (index_page)
		  Dst = HPDF_Page_CreateDestination (PageDim(2))
		  annot = HPDF_Page_CreateLinkAnnot (index_page, Rect, Dst)
		  HPDF_LinkAnnot_SetHighlightMode (annot, #HPDF_ANNOT_INVERT_BORDER)
		;}
	  ;{ Page4 (HPDF_ANNOT_DOWN_APPEARANCE) 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "Jump to Page4 (HilightMode=HPDF_ANNOT_DOWN_APPEARANCE)")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_MoveToNextLine (index_page)
		  Dst = HPDF_Page_CreateDestination (PageDim(3))
		  annot = HPDF_Page_CreateLinkAnnot (index_page, Rect, Dst)
		  HPDF_LinkAnnot_SetHighlightMode (annot, #HPDF_ANNOT_DOWN_APPEARANCE)
		;}
	  ;{ Page5 (dash border) 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "Jump to Page5 (dash border)")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_MoveToNextLine (index_page)
		  Dst = HPDF_Page_CreateDestination (PageDim(4))
		  annot = HPDF_Page_CreateLinkAnnot (index_page, Rect, Dst)
		  HPDF_LinkAnnot_SetBorderStyle (annot, 1, 3, 2)
		;}
	  ;{ Page6 (no border) 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "Jump to Page6 (no border)")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_MoveToNextLine (index_page)
		  Dst = HPDF_Page_CreateDestination (PageDim(5))
		  annot = HPDF_Page_CreateLinkAnnot (index_page, Rect, Dst)
		  HPDF_LinkAnnot_SetBorderStyle (annot, 0, 0, 0)
		;}
	  ;{ Page7 (bold border) 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "Jump to Page7 (bold border)")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_MoveToNextLine (index_page)
		  Dst = HPDF_Page_CreateDestination (PageDim(6))
		  annot = HPDF_Page_CreateLinkAnnot (index_page, Rect, Dst)
		  HPDF_LinkAnnot_SetBorderStyle (annot, 2, 0, 0)
		;}
	  ;{ URI link 
		  TpL = HPDF_Page_GetCurrentTexTPos (index_page)
		  *Tp = @TpL
		  HPDF_Page_ShowText (index_page, "URI (")
		  HPDF_Page_ShowText (index_page, uri)
		  HPDF_Page_ShowText (index_page, ")")
		  Rect\left = Tp\x - 4
		  Rect\bottom = Tp\y - 4
		  PosL =HPDF_Page_GetCurrentTexTPos(index_page)
		  *Pos = @PosL
		  Rect\right = Pos\x + 4
		  Rect\top = Tp\y + 10
		  HPDF_Page_CreateURILinkAnnot (index_page, Rect, uri)
		;}
  HPDF_Page_EndText (index_page)

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_13.pdf")

  ; clean up 
  HPDF_Free (pdf)


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 182
; FirstLine = 16
; Folding = AA-
; EnableCompileCount = 11
; EnableBuildCount = 0
; Watchlist = uri