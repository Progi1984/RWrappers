XIncludeFile "RW_LibHaru_Inc.pb"

	ProcedureC Error_handler(error_no.l, detail_no.l, *user_data.l)
	  Debug "ERROR: error_no="+ Hex(error_no) +", detail_no="+Str(detail_no)
	EndProcedure
	Procedure Print_Page(page.l, page_num.l)
	  Protected buf.s{50}
	  
	  HPDF_Page_SetWidth (page, 800)
	  HPDF_Page_SetHeight (page, 800)
	
	  HPDF_Page_BeginText (page)
	  HPDF_Page_MoveTextPos (page, 30, 740)
	  buf = "Page : "+Str(page_num)
	  HPDF_Page_ShowText (page, buf)
	  HPDF_Page_EndText (page)
	EndProcedure 

  Global pdf.l, font.l, root.l, dst.l
  Global Dim PageDim.l(4)
  Global Dim OutlineDim.l(4)
  Global fname.s{256}
  Global Width = 800
  Global Height = 800
  
  pdf = HPDF_New(@Error_handler(), #Null)
  If pdf = 0 
      Debug "error: cannot create PdfDoc object"
      End
  EndIf

  ; create Default-font 
  font = HPDF_GetFont (pdf, "Helvetica", "StandardEncoding")

  ; Set page mode To use outlines. 
  HPDF_SetPageMode(pdf, #HPDF_PAGE_MODE_USE_OUTLINE)

  ; Add 3 pages To the document. 
  PageDim(0) = HPDF_AddPage (pdf)
  HPDF_Page_SetFontAndSize (PageDim(0), font, 30)
  Print_Page(PageDim(0), 1)

  PageDim(1) = HPDF_AddPage (pdf)
  HPDF_Page_SetFontAndSize (PageDim(1), font, 30)
  Print_Page(PageDim(1), 2)

  PageDim(2) = HPDF_AddPage (pdf)
  HPDF_Page_SetFontAndSize (PageDim(2), font, 30)
  Print_Page(PageDim(2), 3)

  ; create outline root. 
  root = HPDF_CreateOutline (pdf, #Null, "OutlineRoot", #Null)
  HPDF_Outline_SetOpened (root, #HPDF_TRUE)

  OutlineDim(0) = HPDF_CreateOutline (pdf, root, "page1", #Null)
  OutlineDim(1) = HPDF_CreateOutline (pdf, root, "page2", #Null)

  ; create outline With test which is ISO8859-2 encoding 
  OutlineDim(2) = HPDF_CreateOutline (pdf, root, "ISO8859-2 text гдежзий", HPDF_GetEncoder (pdf, "ISO8859-2"))

  ; create destination objects on each pages And link it To outline items.
  dst = HPDF_Page_CreateDestination (PageDim(0))
  HPDF_Destination_SetXYZ(dst, 0, Height, 1)
  HPDF_Outline_SetDestination(OutlineDim(0), dst)
  ;  HPDF_Catalog_SetOpenAction(dst)

  dst = HPDF_Page_CreateDestination (PageDim(1))
  HPDF_Destination_SetXYZ(dst, 0, Height, 1)
  HPDF_Outline_SetDestination(OutlineDim(1), dst)

  dst = HPDF_Page_CreateDestination (PageDim(2))
  HPDF_Destination_SetXYZ(dst, 0, Height, 1)
  HPDF_Outline_SetDestination(OutlineDim(2), dst)

  ; save the document To a file 
  HPDF_SaveToFile (pdf, "Samples\RW_LibHaru_Sample_14.pdf")

  ; clean up 
  HPDF_Free (pdf)


; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 75
; FirstLine = 27
; Folding = 0
; EnableCompileCount = 4
; EnableBuildCount = 0