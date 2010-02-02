XIncludeFile "RW_LibHaru_Res.pb"
ImportC "libhpdf.lib"
  HPDF_3DView_AddNode.HPDF__STATUS(*view.HPDF_Dict, name.s, opacity.HPDF__REAL, visible.HPDF__BOOL) As "_HPDF_3DView_AddNode"
  HPDF_3DView_SetBackgroundColor.HPDF__STATUS(*view.HPDF_Dict, r.HPDF__REAL, g.HPDF__REAL, b.HPDF__REAL) As "_HPDF_3DView_SetBackgroundColor"
  HPDF_3DView_SetCamera.HPDF__STATUS(*view.HPDF_Dict, coox.HPDF__REAL, cooy.HPDF__REAL, cooz.HPDF__REAL, c2cx.HPDF__REAL, c2cy.HPDF__REAL, c2cz.HPDF__REAL, roo.HPDF__REAL, roll.HPDF__REAL) As "_HPDF_3DView_SetCamera"
  HPDF_3DView_SetLighting.HPDF__STATUS(*view.HPDF_Dict, scheme.s) As "_HPDF_3DView_SetLighting"
  HPDF_3DView_SetOrthogonalProjection.HPDF__STATUS(*view.HPDF_Dict, mag.HPDF__REAL) As "_HPDF_3DView_SetOrthogonalProjection"
  HPDF_3DView_SetPerspectiveProjection.HPDF__STATUS(*view.HPDF_Dict, fov.HPDF__REAL) As "_HPDF_3DView_SetPerspectiveProjection"
  HPDF_Create3DView.l(*mmgr.HPDF_MMgr, name.s) As "_HPDF_Create3DView" ; HPDF_Dict
  HPDF_LoadU3DFromFile.l(*pdf.HPDF_Doc, filename.s) As "_HPDF_LoadU3DFromFile" ; HPDF_Image
  HPDF_U3D_Add3DView.HPDF__STATUS(*u3d.HPDF_U3D, *view.HPDF_Dict) As "_HPDF_U3D_Add3DView"
  ;-HPDF_U3D_LoadU3D() As "_HPDF_U3D_LoadU3D"
  ;-HPDF_U3D_LoadU3DFromMem() As "_HPDF_U3D_LoadU3DFromMem"
  HPDF_U3D_SetDefault3DView.HPDF__STATUS(*u3d.HPDF_U3D, name.s) As "_HPDF_U3D_SetDefault3DView"
  ;-ExtGState_Check() As "_ExtGState_Check"
  HPDF_ExtGState_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref) As "_HPDF_ExtGState_New" ; HPDF_Dict
  HPDF_ExtGState_SetAlphaFill.HPDF__STATUS(*ext_gstate.HPDF_ExtGState ,value.f) As "_HPDF_ExtGState_SetAlphaFill"
  HPDF_ExtGState_SetAlphaStroke.HPDF__STATUS(*ext_gstate.HPDF_ExtGState ,value.f) As "_HPDF_ExtGState_SetAlphaStroke"
  HPDF_ExtGState_SetBlendMode.HPDF__STATUS(*ext_gstate.HPDF_ExtGState, mode.HPDF_BlendMode) As "_HPDF_ExtGState_SetBlendMode"
  HPDF_ExtGState_Validate.HPDF__BOOL(*ext_gstate.HPDF_ExtGState) As "_HPDF_ExtGState_Validate"
  HPDF_LoadPngImageFromFile.l(*pdf.HPDF_Doc, filename.s) As "_HPDF_LoadPngImageFromFile" ; HPDF_Image
  HPDF_LoadPngImageFromFile2.l(*pdf.HPDF_Doc, filename.s) As "_HPDF_LoadPngImageFromFile2" ; HPDF_Image
  HPDF_Image_LoadPngImage.l(*mmgr.HPDF_MMgr, *png_data.HPDF_Stream, *xref.HPDF_Xref, delayed_loading.HPDF__BOOL) As "_HPDF_Image_LoadPngImage" ; HPDF_Image
  HPDF_UseCNTFonts.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseCNTFonts"
  HPDF_UseCNSFonts.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseCNSFonts"
  HPDF_UseKRFonts.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseKRFonts"
  HPDF_UseJPFonts.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseJPFonts"
  HPDF_UseCNTEncodings.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseCNTEncodings"
  HPDF_UseCNSEncodings.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseCNSEncodings"
  HPDF_UseKREncodings.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseKREncodings"
  HPDF_UseJPEncodings.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_UseJPEncodings"
  HPDF_Image_GetBitsPerComponent.l(*image.HPDF_Image) As "_HPDF_Image_GetBitsPerComponent"
  HPDF_Image_GetColorSpace.l(*image.HPDF_Image) As "_HPDF_Image_GetColorSpace";string
  HPDF_Image_GetHeight.l(*image.HPDF_Image) As "_HPDF_Image_GetHeight"
  HPDF_Image_GetSize.l(*image.HPDF_Image) As "_HPDF_Image_GetSize" ; HPDF_Point
  HPDF_Image_GetSize2.HPDF__STATUS(*image.HPDF_Image, *size.HPDF_Point) As "_HPDF_Image_GetSize2"
  HPDF_Image_GetWidth.l(*image.HPDF_Image) As "_HPDF_Image_GetWidth"
  HPDF_Image_LoadJpegImage.l(*mmgr.HPDF_MMgr, *jpeg_data.HPDF_Stream, *xref.HPDF_Xref) As "_HPDF_Image_LoadJpegImage" ; HPDF_Image
  HPDF_Image_LoadRawImage.l(*mmgr.HPDF_MMgr, *stream.HPDF_Stream, *xref.HPDF_Xref, width.l, height.l, color_space.HPDF_ColorSpace) As "_HPDF_Image_LoadRawImage" ; HPDF_Image
  HPDF_Image_LoadRawImageFromMem.l(*mmgr.HPDF_MMgr, *buf.HPDF__BYTE, *xref.HPDF_Xref, width.l, height.l, color_space.HPDF_ColorSpace, bits_per_component.l) As "_HPDF_Image_LoadRawImageFromMem" ; HPDF_Image
  HPDF_Image_SetColorMask.HPDF__STATUS(*image.HPDF_Image, rmin.w,  rmax.w, gmin.w, gmax.w, bmin.w, bmax.w) As "_HPDF_Image_SetColorMask"
  HPDF_Image_SetMask.HPDF__STATUS(*image.HPDF_Image, mask.HPDF__BOOL) As "_HPDF_Image_SetMask"
  HPDF_Image_SetMaskImage.HPDF__STATUS(*image.HPDF_Image, *image_mask.HPDF_Image) As "_HPDF_Image_SetMaskImage"
  HPDF_Image_Validate.HPDF__BOOL(*image.HPDF_Image) As "_HPDF_Image_Validate"
  HPDF_OutlineRoot_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref) As "_HPDF_OutlineRoot_New" ; HPDF_Outline
  HPDF_Outline_GetFirst.l(*outline.HPDF_Outline) As "_HPDF_Outline_GetFirst" ; HPDF_Outline
  HPDF_Outline_GetLast.l(*outline.HPDF_Outline) As "_HPDF_Outline_GetLast" ; HPDF_Outline
  HPDF_Outline_GetNext.l(*outline.HPDF_Outline) As "_HPDF_Outline_GetNext" ; HPDF_Outline
  HPDF_Outline_GetOpened.HPDF__BOOL(*outline.HPDF_Outline) As "_HPDF_Outline_GetOpened"
  HPDF_Outline_GetParent.l(*outline.HPDF_Outline) As "_HPDF_Outline_GetParent" ; HPDF_Outline
  HPDF_Outline_GetPrev.l(*outline.HPDF_Outline) As "_HPDF_Outline_GetPrev" ; HPDF_Outline
  HPDF_Outline_New.l(*mmgr.HPDF_MMgr, *parent.HPDF_Outline, title.s, *encoder.HPDF_Encoder, *xref.HPDF_Xref) As "_HPDF_Outline_New" ; HPDF_Outline
  HPDF_Outline_SetDestination.HPDF__STATUS(*outline.HPDF_Outline, *dst.HPDF_Destination) As "_HPDF_Outline_SetDestination"
  HPDF_Outline_SetOpened.HPDF__STATUS(*outline.HPDF_Outline, opened.HPDF__BOOL) As "_HPDF_Outline_SetOpened"
  HPDF_Outline_Validate.HPDF__BOOL(*obj.HPDF_Outline) As "_HPDF_Outline_Validate"
  HPDF_3DAnnot_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref, *rect.HPDF_Rect, *u3d.HPDF_U3D) As "_HPDF_3DAnnot_New" ; HPDF_Annotation
  ;-HPDF_3DAnnot_Set3DView() As "_HPDF_3DAnnot_Set3DView"
  HPDF_Annotation_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref, type.HPDF_AnnotType, *rect.HPDF_Rect) As "_HPDF_Annotation_New" ; HPDF_Annotation
  HPDF_Annotation_SetBorderStyle.HPDF__STATUS(*annot.HPDF_Annotation, subtype.HPDF_BSSubtype, width.f, dash_on.l, dash_off.l, dash_phase.l) As "_HPDF_Annotation_SetBorderStyle"
  HPDF_Annotation_Validate.HPDF__BOOL(*annot.HPDF_Annotation) As "_HPDF_Annotation_Validate"
  HPDF_LinkAnnot_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref, *rect.HPDF_Rect, *dest.HPDF_Destination) As "_HPDF_LinkAnnot_New" ; HPDF_Annotation
  HPDF_LinkAnnot_SetBorderStyle(*annot.HPDF_Annotation, width.f, dash_on.w, dash_off.w) As "_HPDF_LinkAnnot_SetBorderStyle"
  HPDF_LinkAnnot_SetHighlightMode(*annot.HPDF_Annotation, mode.HPDF_AnnotHighlightMode) As "_HPDF_LinkAnnot_SetHighlightMode"
  HPDF_TextAnnot_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref, *rect.HPDF_Rect, text.s, *encoder.HPDF_Encoder) As "_HPDF_TextAnnot_New" ; HPDF_Annotation
  HPDF_TextAnnot_SetIcon(*annot.HPDF_Annotation, icon.HPDF_AnnotIcon) As "_HPDF_TextAnnot_SetIcon"
  HPDF_TextAnnot_SetOpened(*annot.HPDF_Annotation, opened.HPDF__BOOL) As "_HPDF_TextAnnot_SetOpened"
  HPDF_URILinkAnnot_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref, *rect.HPDF_Rect, uri.s) As "_HPDF_URILinkAnnot_New" ; HPDF_Annotation
  ;-HPDF_DESTINATION_TYPE_NAMES() As "_HPDF_DESTINATION_TYPE_NAMES"
  HPDF_Destination_New.l(*mmgr.HPDF_MMgr, *target.HPDF_Page, *xref.HPDF_Xref) As "_HPDF_Destination_New" ; HPDF_Destination
  HPDF_Destination_SetFit.HPDF__STATUS(*dst.HPDF_Destination) As "_HPDF_Destination_SetFit"
  HPDF_Destination_SetFitB.HPDF__STATUS(*dst.HPDF_Destination) As "_HPDF_Destination_SetFitB"
  HPDF_Destination_SetFitBH.HPDF__STATUS(*dst.HPDF_Destination, top.f) As "_HPDF_Destination_SetFitBH"
  HPDF_Destination_SetFitBV.HPDF__STATUS(*dst.HPDF_Destination, left.f) As "_HPDF_Destination_SetFitBV"
  HPDF_Destination_SetFitH.HPDF__STATUS(*dst.HPDF_Destination, top.f) As "_HPDF_Destination_SetFitH"
  HPDF_Destination_SetFitR.HPDF__STATUS(*dst.HPDF_Destination, left.f, bottom.f, right.f, top.f) As "_HPDF_Destination_SetFitR"
  HPDF_Destination_SetFitV.HPDF__STATUS(*dst.HPDF_Destination, left.f) As "_HPDF_Destination_SetFitV"
  HPDF_Destination_SetXYZ.HPDF__STATUS(*dst.HPDF_Destination,left.f,top.f,zoom.f) As "_HPDF_Destination_SetXYZ"
  HPDF_Destination_Validate.HPDF__BOOL(*dst.HPDF_Destination) As "_HPDF_Destination_Validate"
  HPDF_Page_Arc.HPDF__STATUS(*page.HPDF_Page,x.f,y.f,ray.f,ang1.f,ang2.f) As "_HPDF_Page_Arc"
  HPDF_Page_BeginText.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_BeginText"
  HPDF_Page_Circle.HPDF__STATUS(*page.HPDF_Page,x.f,y.f,ray.f) As "_HPDF_Page_Circle"
  HPDF_Page_Clip.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_Clip"
  HPDF_Page_ClosePath.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_ClosePath"
  HPDF_Page_ClosePathEofillStroke.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_ClosePathEofillStroke"
  HPDF_Page_ClosePathFillStroke.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_ClosePathFillStroke"
  HPDF_Page_ClosePathStroke.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_ClosePathStroke"
  HPDF_Page_Concat.HPDF__STATUS(*page.HPDF_Page,a.f,b.f,c.f,d.f,x.f,y.f) As "_HPDF_Page_Concat"
  HPDF_Page_CurveTo.HPDF__STATUS(*page.HPDF_Page,x1.f,y1.f,x2.f,y2.f,x3.f,y3.f) As "_HPDF_Page_CurveTo"
  HPDF_Page_CurveTo2.HPDF__STATUS(*page.HPDF_Page,x2.f,y2.f,x3.f,y3.f) As "_HPDF_Page_CurveTo2"
  HPDF_Page_CurveTo3.HPDF__STATUS(*page.HPDF_Page,x1.f,y1.f,x3.f,y3.f) As "_HPDF_Page_CurveTo3"
  HPDF_Page_DrawImage.HPDF__STATUS(*page.HPDF_Page, *image.HPDF_Image,x.f,y.f,width.f,height.f) As "_HPDF_Page_DrawImage"
  HPDF_Page_Ellipse.HPDF__STATUS(*page.HPDF_Page,x.f,y.f,xray.f,yray.f) As "_HPDF_Page_Ellipse"
  HPDF_Page_EndPath.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_EndPath"
  HPDF_Page_EndText.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_EndText"
  HPDF_Page_Eoclip.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_Eoclip"
  HPDF_Page_Eofill.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_Eofill"
  HPDF_Page_EofillStroke.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_EofillStroke"
  HPDF_Page_ExecuteXObject.HPDF__STATUS(*page.HPDF_Page, *obj.HPDF_XObject) As "_HPDF_Page_ExecuteXObject"
  HPDF_Page_Fill.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_Fill"
  HPDF_Page_FillStroke.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_FillStroke"
  HPDF_Page_GRestore.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_GRestore"
  HPDF_Page_GSave.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_GSave"
  HPDF_Page_LineTo.HPDF__STATUS(*page.HPDF_Page,x.f,y.f) As "_HPDF_Page_LineTo"
  HPDF_Page_MoveTextPos.HPDF__STATUS(*page.HPDF_Page, x.f,y.f) As "_HPDF_Page_MoveTextPos"
  HPDF_Page_MoveTextPos2.HPDF__STATUS(*page.HPDF_Page, x.f,y.f) As "_HPDF_Page_MoveTextPos2"
  HPDF_Page_MoveTo.HPDF__STATUS(*page.HPDF_Page,x.f,y.f) As "_HPDF_Page_MoveTo"
  HPDF_Page_MoveToNextLine.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_MoveToNextLine"
  HPDF_Page_Rectangle.HPDF__STATUS(*page.HPDF_Page,x.f,y.f,width.f,height.f) As "_HPDF_Page_Rectangle"
  HPDF_Page_SetCMYKFill.HPDF__STATUS(*page.HPDF_Page,c.f,m.f,y.f,k.f) As "_HPDF_Page_SetCMYKFill"
  HPDF_Page_SetCMYKStroke.HPDF__STATUS(*page.HPDF_Page,c.f,m.f,y.f,k.f) As "_HPDF_Page_SetCMYKStroke"
  HPDF_Page_SetCharSpace.HPDF__STATUS(*page.HPDF_Page,value.f) As "_HPDF_Page_SetCharSpace"
  HPDF_Page_SetDash.HPDF__STATUS(*page.HPDF_Page, *dash_ptn.l, num_param.l, phase.l) As "_HPDF_Page_SetDash"
  HPDF_Page_SetExtGState.HPDF__STATUS(*page.HPDF_Page, *ext_gstate.HPDF_ExtGState) As "_HPDF_Page_SetExtGState"
  HPDF_Page_SetFlat.HPDF__STATUS(*page.HPDF_Page, flatness.HPDF__REAL) As "_HPDF_Page_SetFlat"
  HPDF_Page_SetFontAndSize.HPDF__STATUS(*page.HPDF_Page,*font.HPDF_Font,size.f) As "_HPDF_Page_SetFontAndSize"
  HPDF_Page_SetGrayFill.HPDF__STATUS(*page.HPDF_Page,gray.f) As "_HPDF_Page_SetGrayFill"
  HPDF_Page_SetGrayStroke.HPDF__STATUS(*page.HPDF_Page,gray.f) As "_HPDF_Page_SetGrayStroke"
  HPDF_Page_SetHorizontalScalling.HPDF__STATUS(*page.HPDF_Page,value.f) As "_HPDF_Page_SetHorizontalScalling"
  HPDF_Page_SetLineCap.HPDF__STATUS(*page.HPDF_Page,line_cap.HPDF_LineCap) As "_HPDF_Page_SetLineCap"
  HPDF_Page_SetLineJoin.HPDF__STATUS(*page.HPDF_Page, line_join.HPDF_LineJoin) As "_HPDF_Page_SetLineJoin"
  HPDF_Page_SetLineWidth.HPDF__STATUS(*page.HPDF_Page,line_width.f) As "_HPDF_Page_SetLineWidth"
  HPDF_Page_SetMiterLimit.HPDF__STATUS(*page.HPDF_Page, miter_limit.HPDF__REAL) As "_HPDF_Page_SetMiterLimit"
  HPDF_Page_SetRGBFill.HPDF__STATUS(*page.HPDF_Page, r.f, g.f, b.f) As "_HPDF_Page_SetRGBFill"
  HPDF_Page_SetRGBStroke.HPDF__STATUS(*page.HPDF_Page,r.f,g.f,b.f) As "_HPDF_Page_SetRGBStroke"
  HPDF_Page_SetSlideShow.HPDF__STATUS(*page.HPDF_Page,type.HPDF_TransitionStyle,disp_time.l,trans_time.l) As "_HPDF_Page_SetSlideShow"
  HPDF_Page_SetTextLeading.HPDF__STATUS(*page.HPDF_Page,value.f) As "_HPDF_Page_SetTextLeading"
  HPDF_Page_SetTextMatrix.HPDF__STATUS(*page.HPDF_Page,a.f,b.f,c.f,d.f,e.f,g.f) As "_HPDF_Page_SetTextMatrix"
  HPDF_Page_SetTextRaise.HPDF__STATUS(*page.HPDF_Page,value.HPDF__REAL) As "_HPDF_Page_SetTextRaise"
  HPDF_Page_SetTextRenderingMode.HPDF__STATUS(*page.HPDF_Page, mode.HPDF_TextRenderingMode) As "_HPDF_Page_SetTextRenderingMode"
  HPDF_Page_SetTextRise.HPDF__STATUS(*page.HPDF_Page,value.HPDF__REAL) As "_HPDF_Page_SetTextRise"
  HPDF_Page_SetWordSpace.HPDF__STATUS(*page.HPDF_Page,value.f) As "_HPDF_Page_SetWordSpace"
  HPDF_Page_ShowText.HPDF__STATUS(*page.HPDF_Page ,text.s) As "_HPDF_Page_ShowText"
  HPDF_Page_ShowTextNextLine.HPDF__STATUS(*page.HPDF_Page,text.s) As "_HPDF_Page_ShowTextNextLine"
  HPDF_Page_ShowTextNextLineEx.HPDF__STATUS(*page.HPDF_Page,word_space.f,char_space.f,text.s) As "_HPDF_Page_ShowTextNextLineEx"
  HPDF_Page_Stroke.HPDF__STATUS(*page.HPDF_Page) As "_HPDF_Page_Stroke"
  HPDF_Page_TextOut.HPDF__STATUS(*page.HPDF_Page,x.f,y.f,text.s) As "_HPDF_Page_TextOut"
  HPDF_Page_TextRect.HPDF__STATUS(*page.HPDF_Page,left.f,top.f,right.f,bottom.f,text.s,align.l,*len.w) As "_HPDF_Page_TextRect"
  HPDF_Page_CheckState.HPDF__STATUS(*page.HPDF_Page, mode.l) As "_HPDF_Page_CheckState"
  HPDF_Page_Create3DAnnot.l(*page.HPDF_Page, *rect.HPDF_Rect, *u3d.HPDF_U3D) As "_HPDF_Page_Create3DAnnot" ; HPDF_Annotation
  HPDF_Page_CreateDestination.l(*page.HPDF_Page) As "_HPDF_Page_CreateDestination" ; HPDF_Destination
  HPDF_Page_CreateLinkAnnot.l(*page.HPDF_Page, *rect.HPDF_Rect, *dst.HPDF_Destination) As "_HPDF_Page_CreateLinkAnnot" ; HPDF_Annotation
  HPDF_Page_CreateTextAnnot.l(*page.HPDF_Page, *rect.HPDF_Rect, text.s, encoder.HPDF_Encoder) As "_HPDF_Page_CreateTextAnnot" ; HPDF_Annotation
  HPDF_Page_CreateURILinkAnnot.l(*page.HPDF_Page,*rect.HPDF_Rect, uri.s) As "_HPDF_Page_CreateURILinkAnnot" ; HPDF_Annotation
  HPDF_Page_GetCMYKFill.l(*page.HPDF_Page) As "_HPDF_Page_GetCMYKFill" ; HPDF_CMYKColor
  HPDF_Page_GetCMYKStroke.l(*page.HPDF_Page) As "_HPDF_Page_GetCMYKStroke" ; HPDF_CMYKColor
  HPDF_Page_GetCharSpace.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetCharSpace"
  HPDF_Page_GetCurrentFont.l(*page.HPDF_Page) As "_HPDF_Page_GetCurrentFont" ; HPDF_Font
  HPDF_Page_GetCurrentFontSize.f(*page.HPDF_Page) As "_HPDF_Page_GetCurrentFontSize"
  HPDF_Page_GetCurrentPos.l(*page.HPDF_Page) As "_HPDF_Page_GetCurrentPos" ; HPDF_Point
  HPDF_Page_GetCurrentPos2.HPDF__STATUS(*page.HPDF_Page, *pos.HPDF_Point) As "_HPDF_Page_GetCurrentPos2"
  HPDF_Page_GetCurrentTextPos.l(*page.HPDF_Page) As "_HPDF_Page_GetCurrentTextPos" ; HPDF_Point
  HPDF_Page_GetCurrentTextPos2.HPDF__STATUS(*page.HPDF_Page, *pos.HPDF_Point) As "_HPDF_Page_GetCurrentTextPos2"
  HPDF_Page_GetDash.l(*page.HPDF_Page) As "_HPDF_Page_GetDash" ; HPDF_DashMode
  HPDF_Page_GetExtGStateName.l(*page.HPDF_Page, *gstate.HPDF_ExtGState) As "_HPDF_Page_GetExtGStateName";string 
  HPDF_Page_GetFillingColorSpace.HPDF_ColorSpace(*page.HPDF_Page) As "_HPDF_Page_GetFillingColorSpace"
  HPDF_Page_GetFlat.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetFlat"
  HPDF_Page_GetGMode.l(*page.HPDF_Page) As "_HPDF_Page_GetGMode"
  HPDF_Page_GetGStateDepth.l(*page.HPDF_Page) As "_HPDF_Page_GetGStateDepth"
  HPDF_Page_GetGrayFill.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetGrayFill"
  HPDF_Page_GetGrayStroke.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetGrayStroke"
  HPDF_Page_GetHeight.f(*page.HPDF_Page) As "_HPDF_Page_GetHeight"
  HPDF_Page_GetHorizontalScalling.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetHorizontalScalling"
  HPDF_Page_GetInheritableItem.l(*page.HPDF_Page, key.s, obj_class.l) As "_HPDF_Page_GetInheritableItem"
  HPDF_Page_GetLineCap.HPDF_LineCap(*page.HPDF_Page) As "_HPDF_Page_GetLineCap"
  HPDF_Page_GetLineJoin.HPDF_LineJoin(*page.HPDF_Page) As "_HPDF_Page_GetLineJoin"
  HPDF_Page_GetLineWidth.f(*page.HPDF_Page) As "_HPDF_Page_GetLineWidth"
  HPDF_Page_GetLocalFontName.l(*page.HPDF_Page, *font.HPDF_Font) As "_HPDF_Page_GetLocalFontName";string 
  HPDF_Page_GetMediaBox.l(*page.HPDF_Page) As "_HPDF_Page_GetMediaBox"; HPDF_Box
  HPDF_Page_GetMiterLimit.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetMiterLimit"
  HPDF_Page_GetRGBFill.l(*page.HPDF_Page) As "_HPDF_Page_GetRGBFill" ; HPDF_RGBColor
  HPDF_Page_GetRGBStroke.l(*page.HPDF_Page) As "_HPDF_Page_GetRGBStroke" ; HPDF_RGBColor
  HPDF_Page_GetStrokingColorSpace.HPDF_ColorSpace(*page.HPDF_Page) As "_HPDF_Page_GetStrokingColorSpace"
  HPDF_Page_GetTextLeading.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetTextLeading"
  HPDF_Page_GetTextMatrix.l(*page.HPDF_Page) As "_HPDF_Page_GetTextMatrix" ; HPDF_TransMatrix
  HPDF_Page_GetTextRaise.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetTextRaise"
  HPDF_Page_GetTextRenderingMode.HPDF_TextRenderingMode(*page.HPDF_Page) As "_HPDF_Page_GetTextRenderingMode"
  HPDF_Page_GetTextRise.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetTextRise"
  HPDF_Page_GetTransMatrix.l(*page.HPDF_Page) As "_HPDF_Page_GetTransMatrix";HPDF_TransMatrix
  HPDF_Page_GetWidth.f(*page.HPDF_Page) As "_HPDF_Page_GetWidth"
  HPDF_Page_GetWordSpace.HPDF__REAL(*page.HPDF_Page) As "_HPDF_Page_GetWordSpace"
  HPDF_Page_GetXObjectName.l(*page.HPDF_Page, *xobj.HPDF_XObject) As "_HPDF_Page_GetXObjectName";string 
  HPDF_Page_InsertBefore.HPDF__STATUS(*page.HPDF_Page, *target.HPDF_Page) As "_HPDF_Page_InsertBefore"
  HPDF_Page_MeasureText.l(*page.HPDF_Page, text.s, width.f, wordwrap.HPDF__BOOL, *real_width.f) As "_HPDF_Page_MeasureText"
  HPDF_Page_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref) As "_HPDF_Page_New"; HPDF_Page
  HPDF_Page_SetBoxValue.HPDF__STATUS(*page.HPDF_Page, name.s, index.l, value.HPDF__REAL) As "_HPDF_Page_SetBoxValue"
  HPDF_Page_SetFilter.l(*page.HPDF_Page, filter.l) As "_HPDF_Page_SetFilter"
  HPDF_Page_SetHeight.HPDF__STATUS(*page.HPDF_Page, value.f) As "_HPDF_Page_SetHeight"
  HPDF_Page_SetRotate.HPDF__STATUS(*page.HPDF_Page, angle.l) As "_HPDF_Page_SetRotate"
  HPDF_Page_SetSize.HPDF__STATUS(*page.HPDF_Page, size.HPDF_PageSizes, direction.HPDF_PageDirection) As "_HPDF_Page_SetSize"
  HPDF_Page_SetWidth.HPDF__STATUS(*page.HPDF_Page, value.f) As "_HPDF_Page_SetWidth"
  HPDF_Page_TextWidth.f(*page.HPDF_Page, text.s) As "_HPDF_Page_TextWidth"
  HPDF_Page_Validate.HPDF__BOOL(*page.HPDF_Page) As "_HPDF_Page_Validate"
  HPDF_Pages_AddKids.HPDF__STATUS(*parent.HPDF_Pages, *kid.HPDF_Dict) As "_HPDF_Pages_AddKids"
  HPDF_Pages_New.l(*mmgr.HPDF_MMgr, *parent.HPDF_Pages, *xref.HPDF_Xref) As "_HPDF_Pages_New";HPDF_Pages
  HPDF_Pages_Validate.HPDF__BOOL(*pages.HPDF_Pages) As "_HPDF_Pages_Validate"
  HPDF_GState_Free.l(*mmgr.HPDF_MMgr, *current.HPDF_GState) As "_HPDF_GState_Free";HPDF_GState
  HPDF_GState_New.l(*mmgr.HPDF_MMgr, *current.HPDF_GState) As "_HPDF_GState_New";HPDF_GState
  HPDF_PageLabel_New.l(*pdf.HPDF_Doc, style.HPDF_PageNumStyle, first_page.l, prefix.s) As "_HPDF_PageLabel_New";HPDF_Dict
  HPDF_Catalog_AddPageLabel.HPDF__STATUS(*catalog.HPDF_Catalog, page_num.l, *page_label.HPDF_Dict) As "_HPDF_Catalog_AddPageLabel"
  HPDF_Catalog_GetPageLayout.HPDF_PageLayout(*catalog.HPDF_Catalog) As "_HPDF_Catalog_GetPageLayout"
  HPDF_Catalog_GetPageMode.HPDF_PageMode(*catalog.HPDF_Catalog) As "_HPDF_Catalog_GetPageMode"
  HPDF_Catalog_GetRoot.l(*catalog.HPDF_Catalog) As "_HPDF_Catalog_GetRoot" ; HPDF_Pages
  HPDF_Catalog_GetViewerPreference.l(*catalog.HPDF_Catalog) As "_HPDF_Catalog_GetViewerPreference"
  HPDF_Catalog_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref) As "_HPDF_Catalog_New" ;HPDF_Catalog
  HPDF_Catalog_SetOpenAction.HPDF__STATUS(*catalog.HPDF_Catalog, *open_action.HPDF_Destination) As "_HPDF_Catalog_SetOpenAction"
  HPDF_Catalog_SetPageLayout.HPDF__STATUS(*catalog.HPDF_Catalog, layout.HPDF_PageLayout) As "_HPDF_Catalog_SetPageLayout"
  HPDF_Catalog_SetPageMode.HPDF__STATUS(*catalog.HPDF_Catalog, mode.HPDF_PageMode) As "_HPDF_Catalog_SetPageMode"
  HPDF_Catalog_SetViewerPreference.HPDF__STATUS(*catalog.HPDF_Catalog, value.l) As "_HPDF_Catalog_SetViewerPreference"
  HPDF_Catalog_Validate.HPDF__BOOL(*catalog.HPDF_Catalog) As "_HPDF_Catalog_Validate"
  HPDF_Info_GetInfoAttr.l(*info.HPDF_Dict, type.HPDF_InfoType) As "_HPDF_Info_GetInfoAttr";string
  HPDF_Info_SetInfoAttr.HPDF__STATUS(*info.HPDF_Dict, type.HPDF_InfoType, value.s, *encoder.HPDF_Encoder) As "_HPDF_Info_SetInfoAttr"
  HPDF_Info_SetInfoDateAttr.HPDF__STATUS(*info.HPDF_Dict, type.HPDF_InfoType, *value.HPDF_Date) As "_HPDF_Info_SetInfoDateAttr"
  HPDF_AddPage.l(*pdf.HPDF_Doc) As "_HPDF_AddPage" ; HPDF_Page
  HPDF_AddPageLabel.HPDF__STATUS(*pdf.HPDF_Doc, page_num.l, style.HPDF_PageNumStyle, first_page.l, prefix.s) As "_HPDF_AddPageLabel"
  HPDF_CreateExtGState.l(*pdf.HPDF_Doc) As "_HPDF_CreateExtGState" ; HPDF_ExtGState
  HPDF_CreateOutline.l(*pdf.HPDF_Doc, *parent.HPDF_Outline, title.s, *encoder.HPDF_Encoder) As "_HPDF_CreateOutline" ; HPDF_Outline
  HPDF_Doc_AddPagesTo.l(*pdf.HPDF_Doc, *parent.HPDF_Pages) As "_HPDF_Doc_AddPagesTo" ; HPDF_Pages
  HPDF_Doc_FindEncoder.l(*pdf.HPDF_Doc, encoding_name.s) As "_HPDF_Doc_FindEncoder" ; HPDF_Encoder
  HPDF_Doc_FindFont.l(*pdf.HPDF_Doc, font_name.s, encoding_name.s) As "_HPDF_Doc_FindFont"; HPDF_Font
  HPDF_Doc_FindFontDef.l(*pdf.HPDF_Doc, font_name.s) As "_HPDF_Doc_FindFontDef" ; HPDF_FontDef
  HPDF_Doc_GetCurrentPages.l(*pdf.HPDF_Doc) As "_HPDF_Doc_GetCurrentPages" ;HPDF_Pages
  HPDF_Doc_PrepareEncryption.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_Doc_PrepareEncryption"
  HPDF_Doc_RegisterEncoder.HPDF__STATUS(*pdf.HPDF_Doc, *encoder.HPDF_Encoder) As "_HPDF_Doc_RegisterEncoder"
  HPDF_Doc_RegisterFontDef.HPDF__STATUS(*pdf.HPDF_Doc, *fontdef.HPDF_FontDef) As "_HPDF_Doc_RegisterFontDef"
  HPDF_Doc_SetCurrentPage.HPDF__STATUS(*pdf.HPDF_Doc, *page.HPDF_Page) As "_HPDF_Doc_SetCurrentPage"
  HPDF_Doc_SetCurrentPages.HPDF__STATUS(*pdf.HPDF_Doc, *pages.HPDF_Pages) As "_HPDF_Doc_SetCurrentPages"
  HPDF_Doc_SetEncryptOff.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_Doc_SetEncryptOff"
  HPDF_Doc_SetEncryptOn.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_Doc_SetEncryptOn"
  HPDF_Doc_Validate.HPDF__BOOL(*pdf.HPDF_Doc) As "_HPDF_Doc_Validate"
  HPDF_Free.l(*pdf.HPDF_Doc) As "_HPDF_Free"
  HPDF_FreeDoc.l(*pdf.HPDF_Doc) As "_HPDF_FreeDoc"
  HPDF_FreeDocAll.l(*pdf.HPDF_Doc) As "_HPDF_FreeDocAll"
  HPDF_GetCurrentEncoder.l(*pdf.HPDF_Doc) As "_HPDF_GetCurrentEncoder" ; HPDF_Encoder
  HPDF_GetCurrentPage.l(*pdf.HPDF_Doc) As "_HPDF_GetCurrentPage" ; HPDF_Page
  HPDF_GetEncoder.l(*pdf.HPDF_Doc, encoding_name.s) As "_HPDF_GetEncoder" ; HPDF_Encoder
  HPDF_GetError.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_GetError"
  HPDF_GetErrorDetail.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_GetErrorDetail"
  HPDF_GetFont.l(*pdf.HPDF_Doc, font_name.s, encoding_name.s) As "_HPDF_GetFont"; HPDF_Font
  HPDF_GetFontDef.l(*pdf.HPDF_Doc, font_name.s) As "_HPDF_GetFontDef" ; HPDF_FontDef
  HPDF_GetInfoAttr.l(*pdf.HPDF_Doc, type.HPDF_InfoType) As "_HPDF_GetInfoAttr";string
  HPDF_GetPageByIndex.l(*pdf.HPDF_Doc, index.l) As "_HPDF_GetPageByIndex" ; HPDF_Page
  HPDF_GetPageLayout.HPDF_PageLayout(*pdf.HPDF_Doc) As "_HPDF_GetPageLayout"
  HPDF_GetPageMode.HPDF_PageMode(*pdf.HPDF_Doc) As "_HPDF_GetPageMode"
  HPDF_GetStreamSize.l(*pdf.HPDF_Doc) As "_HPDF_GetStreamSize"
  HPDF_GetTTFontDefFromFile.l(*pdf.HPDF_Doc, file_name.s, embedding.HPDF__BOOL) As "_HPDF_GetTTFontDefFromFile" ; HPDF_FontDef
  HPDF_GetVersion.l() As "_HPDF_GetVersion" ; String
  HPDF_GetViewerPreference.l(*pdf.HPDF_Doc) As "_HPDF_GetViewerPreference"
  HPDF_HasDoc.HPDF__BOOL(*pdf.HPDF_Doc) As "_HPDF_HasDoc"
  HPDF_InsertPage.l(*pdf.HPDF_Doc, HPDF_Page.l) As "_HPDF_InsertPage" ;HPDF_Page
  HPDF_LoadJpegImageFromFile.l(*pdf.HPDF_Doc, filename.s) As "_HPDF_LoadJpegImageFromFile" ;HPDF_Image
  HPDF_LoadRawImageFromFile.l(*pdf.HPDF_Doc, filename.s, width.l, height.l, color_space.l) As "_HPDF_LoadRawImageFromFile" ;HPDF_Image
  HPDF_LoadRawImageFromMem.l(*pdf.HPDF_Doc, *buf.l, width.l, height.l, color_space.HPDF_ColorSpace, bits_per_component.l) As "_HPDF_LoadRawImageFromMem" ;HPDF_Image
  HPDF_LoadTTFontFromFile(*pdf.HPDF_Doc, file_name.s, embedding.HPDF__BOOL) As "_HPDF_LoadTTFontFromFile" ;string
  HPDF_LoadTTFontFromFile2(*pdf.HPDF_Doc, file_name.s, index.l, embedding.HPDF__BOOL) As "_HPDF_LoadTTFontFromFile2" ;string
  HPDF_LoadType1FontFromFile.l(*pdf.HPDF_Doc, afm_filename.s, pfm_filename.s) As "_HPDF_LoadType1FontFromFile" ;string
  HPDF_New.l(user_error_fn.l, *user_data.l) As "_HPDF_New"; HPDF_Doc
  HPDF_NewDoc.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_NewDoc"
  HPDF_NewEx.l(user_error_fn.l, user_alloc_fn.l, user_free_fn.l, mem_pool_buf_size.l,*user_data.l) As "_HPDF_NewEx";HPDF_Doc
  HPDF_ReadFromStream.HPDF__STATUS(*pdf.HPDF_Doc,*buf, *buf_size) As "_HPDF_ReadFromStream"
  HPDF_ResetError.l(*pdf.HPDF_Doc) As "_HPDF_ResetError"
  HPDF_ResetStream.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_ResetStream"
  HPDF_SaveToFile.HPDF__STATUS(*pdf.HPDF_Doc,file_name.s) As "_HPDF_SaveToFile"
  HPDF_SaveToStream.HPDF__STATUS(*pdf.HPDF_Doc) As "_HPDF_SaveToStream"
  HPDF_SetCompressionMode.HPDF__STATUS(*pdf.HPDF_Doc, mode.l) As "_HPDF_SetCompressionMode"
  HPDF_SetCurrentEncoder.HPDF__STATUS(*pdf.HPDF_Doc,encoding_name.s) As "_HPDF_SetCurrentEncoder"
  HPDF_SetEncryptionMode.HPDF__STATUS(*pdf.HPDF_Doc, mode.HPDF_EncryptMode, key_len.l) As "_HPDF_SetEncryptionMode"
  HPDF_SetErrorHandler.HPDF__STATUS(*pdf.HPDF_Doc,*user_error_fn.l) As "_HPDF_SetErrorHandler"
  HPDF_SetInfoAttr.HPDF__STATUS(*pdf.HPDF_Doc, type.HPDF_InfoType, value.s) As "_HPDF_SetInfoAttr"
  HPDF_SetInfoDateAttr.HPDF__STATUS(*pdf.HPDF_Doc, type.HPDF_InfoType, *value.HPDF_date) As "_HPDF_SetInfoDateAttr"
  HPDF_SetOpenAction.HPDF__STATUS(*pdf.HPDF_Doc, *open_action.HPDF_Destination) As "_HPDF_SetOpenAction"
  HPDF_SetPageLayout.HPDF__STATUS(*pdf.HPDF_Doc, layout.HPDF_PageLayout) As "_HPDF_SetPageLayout"
  HPDF_SetPageMode.HPDF__STATUS(*pdf.HPDF_Doc, mode.HPDF_PageMode) As "_HPDF_SetPageMode"
  HPDF_SetPagesConfiguration.HPDF__STATUS(*pdf.HPDF_Doc,page_per_pages.l) As "_HPDF_SetPagesConfiguration"
  HPDF_SetPassword.HPDF__STATUS(*pdf.HPDF_Doc, owner_passwd.s, user_passwd.s) As "_HPDF_SetPassword"
  HPDF_SetPermission.HPDF__STATUS(*pdf.HPDF_Doc, permission.l) As "_HPDF_SetPermission"
  HPDF_SetViewerPreference.HPDF__STATUS(*pdf.HPDF_Doc, value.l) As "_HPDF_SetViewerPreference"
  HPDF_Type0Font_New.l(*mmgr.HPDF_MMgr, *fontdef.HPDF_FontDef, *encoder.HPDF_Encoder, *xref.HPDF_Xref) As "_HPDF_Type0Font_New" ; HPDF_Font
  HPDF_TTFont_New.l(*mmgr.HPDF_MMgr, *fontdef.HPDF_FontDef, *encoder.HPDF_Encoder, *xref.HPDF_Xref) As "_HPDF_TTFont_New" ; HPDF_Font
  HPDF_Type1Font_New.l(*mmgr.HPDF_MMgr, *fontdef.HPDF_FontDef, *encoder.HPDF_Encoder, *xref.HPDF_Xref) As "_HPDF_Type1Font_New" ; HPDF_Font
  HPDF_Font_GetAscent.l(*font.HPDF_Font) As "_HPDF_Font_GetAscent"
  HPDF_Font_GetBBox.l(*font.HPDF_Font) As "_HPDF_Font_GetBBox" ; HPDF_Box
  HPDF_Font_GetCapHeight.l(*font.HPDF_Font) As "_HPDF_Font_GetCapHeight"
  HPDF_Font_GetDescent.l(*font.HPDF_Font) As "_HPDF_Font_GetDescent"
  HPDF_Font_GetEncodingName.l(*font.HPDF_Font) As "_HPDF_Font_GetEncodingName";string
  HPDF_Font_GetFontName.l(*font.HPDF_Font) As "_HPDF_Font_GetFontName";string
  HPDF_Font_GetUnicodeWidth.l(*font.HPDF_Font, code.HPDF__UNICODE) As "_HPDF_Font_GetUnicodeWidth"
  HPDF_Font_GetXHeight.l(*font.HPDF_Font) As "_HPDF_Font_GetXHeight"
  HPDF_Font_MeasureText.l(*font.HPDF_Font, text.l, len.w, width.f, font_size.f, char_space.f, word_space.f, wordwrap.HPDF__BOOL, real_width.f) As "_HPDF_Font_MeasureText"
  HPDF_Font_TextWidth.l(*font.HPDF_Font, text.l, len.w) As "_HPDF_Font_TextWidth";HPDF_TextWidth
  HPDF_Font_Validate.HPDF__BOOL(*font.HPDF_Font) As "_HPDF_Font_Validate"
  HPDF__CIDFontDef_AddWidth.HPDF__STATUS(*fontdef.HPDF_FontDef, *widths.HPDF_CID_Width) As "_HPDF__CIDFontDef_AddWidth"
  HPDF__CIDFontDef_ChangeStyle.HPDF__STATUS(*fontdef.HPDF_FontDef, bold.HPDF__BOOL, italic.HPDF__BOOL) As "_HPDF__CIDFontDef_ChangeStyle"
  ;-HPDF__CIDFontDef_FreeFunc() As "_HPDF__CIDFontDef_FreeFunc"
  ;-HPDF__CIDFontDef_FreeWidth() As "_HPDF__CIDFontDef_FreeWidth"
  HPDF__CIDFontDef_GetCIDWidth.l(*fontdef.HPDF_FontDef, cid.l) As "_HPDF__CIDFontDef_GetCIDWidth"
  HPDF__CIDFontDef_New.l(*mmgr.HPDF_MMgr, *name.c, *init_fn) ; init_fn > PROTO_HPDF_FontDef_InitFunc As "_HPDF__CIDFontDef_New" ; returns HPDF_FontDef
  ;-HPDF_Base14FontDef_FindBuiltinData() As "_HPDF_Base14FontDef_FindBuiltinData"
  HPDF_Base14FontDef_New.l(*mmgr.HPDF_MMgr, font_name.s) As "_HPDF_Base14FontDef_New" ; HPDF_FontDef
  HPDF_Type1FontDef_Duplicate.l(*mmgr.HPDF_MMgr, *src.HPDF_FontDef) As "_HPDF_Type1FontDef_Duplicate" ; HPDF_FontDef
  HPDF_Type1FontDef_GetWidth.l(*fontdef.HPDF_FontDef, unicode.HPDF__UNICODE) As "_HPDF_Type1FontDef_GetWidth"
  HPDF_Type1FontDef_GetWidthByName.l(*fontdef.HPDF_FontDef, gryph_name.s) As "_HPDF_Type1FontDef_GetWidthByName"
  HPDF_Type1FontDef_Load.l(*mmgr.HPDF_MMgr, *afm.HPDF_Stream, *font_data.HPDF_Stream) As "_HPDF_Type1FontDef_Load" ; HPDF_FontDef
  HPDF_Type1FontDef_New.l(*mmgr.HPDF_MMgr) As "_HPDF_Type1FontDef_New" ; HPDF_FontDef
  HPDF_Type1FontDef_SetWidths.HPDF__STATUS(*fontdef.HPDF_FontDef, *widths.HPDF_CharData) As "_HPDF_Type1FontDef_SetWidths"
  HPDF_TTFontDef_GetCharBBox.l(*fontdef.HPDF_FontDef, unicode.l) As "_HPDF_TTFontDef_GetCharBBox" ;HPDF_Box
  HPDF_TTFontDef_GetCharWidth.l(*fontdef.HPDF_FontDef, unicode.l) As "_HPDF_TTFontDef_GetCharWidth"
  HPDF_TTFontDef_GetGidWidth.l(*fontdef.HPDF_FontDef, gid.l) As "_HPDF_TTFontDef_GetGidWidth"
  HPDF_TTFontDef_GetGlyphid.l(*fontdef.HPDF_FontDef, unicode.l) As "_HPDF_TTFontDef_GetGlyphid"
  HPDF_TTFontDef_Load.l(*mmgr.HPDF_MMgr, *stream.HPDF_Stream, embedding.HPDF__BOOL) As "_HPDF_TTFontDef_Load" ; HPDF_FontDef
  HPDF_TTFontDef_Load2.l(*mmgr.HPDF_MMgr, *stream.HPDF_Stream, index.l, embedding.HPDF__BOOL) As "_HPDF_TTFontDef_Load2" ; HPDF_FontDef
  HPDF_TTFontDef_New.l(*mmgr.HPDF_MMgr) As "_HPDF_TTFontDef_New" ; HPDF_FontDef
  HPDF_TTFontDef_SaveFontData.HPDF__STATUS(*fontdef.HPDF_FontDef, *stream.HPDF_Stream) As "_HPDF_TTFontDef_SaveFontData"
  HPDF_TTFontDef_SetTagName.l(*fontdef.HPDF_FontDef, tag.s) As "_HPDF_TTFontDef_SetTagName"
  HPDF_FontDef_Cleanup.l(*fontdef.HPDF_FontDef) As "_HPDF_FontDef_Cleanup"
  HPDF_FontDef_Free.l(*fontdef.HPDF_FontDef) As "_HPDF_FontDef_Free"
  HPDF_FontDef_Validate.HPDF__BOOL(*fontdef.HPDF_FontDef) As "_HPDF_FontDef_Validate"
  HPDF_EncryptDict_CreateID.l(*dict.HPDF_EncryptDict, *info.HPDF_Dict, *xref.HPDF_Xref) As "_HPDF_EncryptDict_CreateID"
  HPDF_EncryptDict_GetAttr.l(*dict.HPDF_EncryptDict) As "_HPDF_EncryptDict_GetAttr" ; HPDF_Encrypt
  HPDF_EncryptDict_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref) As "_HPDF_EncryptDict_New" ; HPDF_EncryptDict
  HPDF_EncryptDict_OnFree.l(*obj.HPDF_Dict) As "_HPDF_EncryptDict_OnFree"
  HPDF_EncryptDict_Prepare.HPDF__STATUS(*dict.HPDF_EncryptDict, *info.HPDF_Dict, *xref.HPDF_Xref) As "_HPDF_EncryptDict_Prepare"
  HPDF_EncryptDict_SetPassword.HPDF__STATUS(*dict.HPDF_EncryptDict, owner_passwd.s, user_passwd.s) As "_HPDF_EncryptDict_SetPassword"
  HPDF_EncryptDict_Validate.HPDF__BOOL(*dict.HPDF_EncryptDict) As "_HPDF_EncryptDict_Validate"
  HPDF_Encrypt_CreateEncryptionKey.l(*attr.HPDF_Encrypt) As "_HPDF_Encrypt_CreateEncryptionKey"
  HPDF_Encrypt_CreateOwnerKey.l(*attr.HPDF_Encrypt) As "_HPDF_Encrypt_CreateOwnerKey"
  HPDF_Encrypt_CreateUserKey.l(*attr.HPDF_Encrypt) As "_HPDF_Encrypt_CreateUserKey"
  HPDF_Encrypt_CryptBuf.l(*attr.HPDF_Encrypt, *src.HPDF__BYTE, *dst.HPDF__BYTE, len.l) As "_HPDF_Encrypt_CryptBuf"
  HPDF_Encrypt_Init.l(*attr.HPDF_Encrypt) As "_HPDF_Encrypt_Init"
  HPDF_Encrypt_InitKey.l(*attr.HPDF_Encrypt, object_id.l, gen_no.l) As "_HPDF_Encrypt_InitKey"
  HPDF_Encrypt_Reset.l(*attr.HPDF_Encrypt) As "_HPDF_Encrypt_Reset"
  HPDF_MD5Final.l(*digest.HPDF__BYTE, *ctx.HPDF_MD5Context) As "_HPDF_MD5Final"
  HPDF_MD5Init.l(*ctx.HPDF_MD5Context) As "_HPDF_MD5Init"
  HPDF_MD5Update.l(*ctx.HPDF_MD5Context, *buf.HPDF__BYTE, len.l) As "_HPDF_MD5Update"
  HPDF_PadOrTrancatePasswd.l(pwd.s, *new_pwd.HPDF__BYTE) As "_HPDF_PadOrTrancatePasswd"
  HPDF_Binary_Free.l(*obj.HPDF_Binary) As "_HPDF_Binary_Free"
  HPDF_Binary_GetLen.l(*obj.HPDF_Binary) As "_HPDF_Binary_GetLen"
  HPDF_Binary_GetValue.l(*obj.HPDF_Binary) As "_HPDF_Binary_GetValue"
  HPDF_Binary_New.l(*mmgr.HPDF_MMgr, *value, len.l) As "_HPDF_Binary_New" ; HPDF_Binary
  HPDF_Binary_SetValue.HPDF__STATUS(*obj.HPDF_Binary, *value, len.l) As "_HPDF_Binary_SetValue"
  HPDF_Binary_Write.HPDF__STATUS(*obj.HPDF_Binary, *stream.HPDF_Stream, *e.HPDF_Encrypt) As "_HPDF_Binary_Write"
  HPDF_String_Free.l(*obj.HPDF_String) As "_HPDF_String_Free"
  HPDF_String_New.l(*mmgr.HPDF_MMgr, value.s, *encoder.HPDF_Encoder) As "_HPDF_String_New" ; HPDF_String
  HPDF_String_SetValue.HPDF__STATUS(*obj.HPDF_String, value.s) As "_HPDF_String_SetValue"
  HPDF_String_Write.HPDF__STATUS(*obj.HPDF_String, *stream.HPDF_Stream, *e.HPDF_Encrypt) As "_HPDF_String_Write"
  ;-HPDF_BasicEncoder_CopyMap() As "_HPDF_BasicEncoder_CopyMap"
  ;-HPDF_BasicEncoder_FindBuiltinData() As "_HPDF_BasicEncoder_FindBuiltinData"
  HPDF_BasicEncoder_Free.l(*encoder.HPDF_Encoder) As "_HPDF_BasicEncoder_Free"
  HPDF_BasicEncoder_New.l(*mmgr.HPDF_MMgr, encoding_name.s) As "_HPDF_BasicEncoder_New" ; HPDF_Encoder
  ;-HPDF_BasicEncoder_OverrideMap() As "_HPDF_BasicEncoder_OverrideMap"
  HPDF_BasicEncoder_ToUnicode.HPDF__UNICODE(*encoder.HPDF_Encoder, code.l) As "_HPDF_BasicEncoder_ToUnicode"
  HPDF_BasicEncoder_Write.HPDF__STATUS(*encoder.HPDF_Encoder, *out.HPDF_Stream) As "_HPDF_BasicEncoder_Write"
  HPDF_CMapEncoder_AddCMap.HPDF__STATUS(*encoder.HPDF_Encoder, *range.HPDF_CidRange) As "_HPDF_CMapEncoder_AddCMap"
  HPDF_CMapEncoder_AddCodeSpaceRange.HPDF__STATUS(*encoder.HPDF_Encoder, *range.HPDF_CidRange) As "_HPDF_CMapEncoder_AddCodeSpaceRange"
  HPDF_CMapEncoder_AddJWWLineHead.HPDF__STATUS(*encoder.HPDF_Encoder, *code.l) As "_HPDF_CMapEncoder_AddJWWLineHead"
  HPDF_CMapEncoder_AddNotDefRange.HPDF__STATUS(*encoder.HPDF_Encoder, *range.HPDF_CidRange) As "_HPDF_CMapEncoder_AddNotDefRange"
  HPDF_CMapEncoder_ByteType.HPDF_ByteType(*encoder.HPDF_Encoder, *state.HPDF_ParseText) As "_HPDF_CMapEncoder_ByteType"
  HPDF_CMapEncoder_Free.l(*encoder.HPDF_Encoder) As "_HPDF_CMapEncoder_Free"
  HPDF_CMapEncoder_InitAttr.HPDF__STATUS(*encoder.HPDF_Encoder) As "_HPDF_CMapEncoder_InitAttr"
  HPDF_CMapEncoder_New.l(*mmgr.HPDF_MMgr, name.s, *init_fn) ; init_fn : HPDF_Encoder_Init_Func As "_HPDF_CMapEncoder_New" ; returns HPDF_Encoder
  HPDF_CMapEncoder_SetUnicodeArray.l(*encoder.HPDF_Encoder, *array1.HPDF_UnicodeMap) As "_HPDF_CMapEncoder_SetUnicodeArray"
  HPDF_CMapEncoder_ToCID.l(*encoder.HPDF_Encoder, code.l) As "_HPDF_CMapEncoder_ToCID"
  HPDF_CMapEncoder_ToUnicode.HPDF__UNICODE(*encoder.HPDF_Encoder, code.l) As "_HPDF_CMapEncoder_ToUnicode"
  HPDF_CMapEncoder_Write.HPDF__STATUS(*encoder.HPDF_Encoder, *out.HPDF_Stream) As "_HPDF_CMapEncoder_Write"
  HPDF_Encoder_ByteType.HPDF_ByteType(*encoder.HPDF_Encoder, *state.HPDF_ParseText) As "_HPDF_Encoder_ByteType"
  HPDF_Encoder_CheckJWWLineHead.HPDF__BOOL(*encoder.HPDF_Encoder, code.l) As "_HPDF_Encoder_CheckJWWLineHead"
  HPDF_Encoder_Free.l(*encoder.HPDF_Encoder) As "_HPDF_Encoder_Free"
  HPDF_Encoder_GetByteType.HPDF_ByteType(*encoder.HPDF_Encoder, text.s, index.l) As "_HPDF_Encoder_GetByteType"
  HPDF_Encoder_GetType.HPDF_EncoderType(*encoder.HPDF_Encoder) As "_HPDF_Encoder_GetType"
  HPDF_Encoder_GetUnicode.HPDF__UNICODE(*encoder.HPDF_Encoder, code.l) As "_HPDF_Encoder_GetUnicode"
  HPDF_Encoder_GetWritingMode.HPDF_WritingMode(*encoder.HPDF_Encoder) As "_HPDF_Encoder_GetWritingMode"
  HPDF_Encoder_SetParseText.l(*encoder.HPDF_Encoder, *state.HPDF_ParseText, *text, len.l) As "_HPDF_Encoder_SetParseText"
  HPDF_Encoder_ToUnicode.HPDF__UNICODE(*encoder.HPDF_Encoder, code.l) As "_HPDF_Encoder_ToUnicode"
  HPDF_Encoder_Validate.HPDF__STATUS(*encoder.HPDF_Encoder) As "_HPDF_Encoder_Validate"
  HPDF_GryphNameToUnicode.HPDF__UNICODE(gryph_name.s) As "_HPDF_GryphNameToUnicode"
  HPDF_UnicodeToGryphName.l(unicode.HPDF__UNICODE)As "_HPDF_UnicodeToGryphName";string 
  HPDF_Xref_Add.HPDF__STATUS(*xref.HPDF_Xref, *obj) As "_HPDF_Xref_Add"
  HPDF_Xref_Free.l(*xref.HPDF_Xref) As "_HPDF_Xref_Free"
  HPDF_Xref_GetEntry(*xref.HPDF_Xref, index.l) As "_HPDF_Xref_GetEntry"
  HPDF_Xref_GetEntryByObjectId.l(*xref.HPDF_Xref, obj_id.l) As "_HPDF_Xref_GetEntryByObjectId" ; HPDF_XrefEntry
  HPDF_Xref_New.l(*mmgr.HPDF_MMgr, offset.l) As "_HPDF_Xref_New" ; HPDF_Xref
  HPDF_Xref_WriteToStream.HPDF__STATUS(*xref.HPDF_Xref, *stream.HPDF_Stream, *e.HPDF_Encrypt) As "_HPDF_Xref_WriteToStream"
  ;-GetElement() As "_GetElement"
  HPDF_DictStream_New.l(*mmgr.HPDF_MMgr, *xref.HPDF_Xref) As "_HPDF_DictStream_New" ;HPDF_Dict
  HPDF_Dict_Add.HPDF__STATUS(*dict.HPDF_Dict, key.s, *obj) As "_HPDF_Dict_Add"
  HPDF_Dict_AddBoolean.HPDF__STATUS(*dict.HPDF_Dict, key.s, value.HPDF__BOOL) As "_HPDF_Dict_AddBoolean"
  HPDF_Dict_AddName.HPDF__STATUS(*dict.HPDF_Dict, key.s, value.s) As "_HPDF_Dict_AddName"
  HPDF_Dict_AddNumber.HPDF__STATUS(*dict.HPDF_Dict, key.s, value.l) As "_HPDF_Dict_AddNumber"
  HPDF_Dict_AddReal.HPDF__STATUS(*dict.HPDF_Dict, key.s, value.HPDF__REAL) As "_HPDF_Dict_AddReal"
  HPDF_Dict_Free.l(*dict.HPDF_Dict) As "_HPDF_Dict_Free"
  HPDF_Dict_GetItem.l(*dict.HPDF_Dict, key.s, obj_class.l) As "_HPDF_Dict_GetItem"
  HPDF_Dict_GetKeyByObj.l(*dict.HPDF_Dict, *obj) As "_HPDF_Dict_GetKeyByObj" ;string
  HPDF_Dict_New.l(*mmgr.HPDF_MMgr) As "_HPDF_Dict_New"; HPDF_Dict
  HPDF_Dict_RemoveElement.HPDF__STATUS(*dict.HPDF_Dict, key.s) As "_HPDF_Dict_RemoveElement"
  HPDF_Dict_Write.HPDF__STATUS(*dict.HPDF_Dict, *stream.HPDF_Stream, *e.HPDF_Encrypt) As "_HPDF_Dict_Write"
  HPDF_Array_Add.HPDF__STATUS(*array.HPDF_Array, *obj) As "_HPDF_Array_Add"
  HPDF_Array_AddName.HPDF__STATUS(*array.HPDF_Array, value.s) As "_HPDF_Array_AddName"
  HPDF_Array_AddNumber.HPDF__STATUS(*array.HPDF_Array, value.l) As "_HPDF_Array_AddNumber"
  HPDF_Array_AddReal.HPDF__STATUS(*array.HPDF_Array, value.HPDF__REAL) As "_HPDF_Array_AddReal"
  HPDF_Array_Clear.l(*array.HPDF_Array) As "_HPDF_Array_Clear"
  HPDF_Array_Free.l(*array.HPDF_Array) As "_HPDF_Array_Free"
  HPDF_Array_GetItem.l(*array.HPDF_Array, index.l, obj_class.l) As "_HPDF_Array_GetItem"
  HPDF_Array_Insert.HPDF__STATUS(*array.HPDF_Array, *target, *obj) As "_HPDF_Array_Insert"
  HPDF_Array_New.l(*mmgr.HPDF_MMgr) As "_HPDF_Array_New" ; HPDF_Array
  HPDF_Array_Write.HPDF__STATUS(*array.HPDF_Array, *stream.HPDF_Stream, *e.HPDF_Encrypt) As "_HPDF_Array_Write"
  HPDF_Box_Array_New.l(*mmgr.HPDF_MMgr, *box.HPDF_Box) As "_HPDF_Box_Array_New" ; HPDF_Array
  HPDF_Name_GetValue.l(*obj.HPDF_Name) As "_HPDF_Name_GetValue";string
  HPDF_Name_New.l(*mmgr.HPDF_MMgr, value.s) As "_HPDF_Name_New" ; HPDF_Name
  HPDF_Name_SetValue.HPDF__STATUS(*obj.HPDF_Name, value.s) As "_HPDF_Name_SetValue"
  HPDF_Name_Write.HPDF__STATUS(*obj.HPDF_Name, *stream.HPDF_Stream) As "_HPDF_Name_Write"
  HPDF_Real_New.HPDF__Real(*mmgr.HPDF_MMgr, value.HPDF__REAL) As "_HPDF_Real_New"
  HPDF_Real_SetValue.HPDF__STATUS(obj.HPDF__Real, value.HPDF__REAL) As "_HPDF_Real_SetValue"
  HPDF_Real_Write.HPDF__STATUS(obj.HPDF__Real, *stream.HPDF_Stream) As "_HPDF_Real_Write"
  HPDF_Number_New.l(*mmgr.HPDF_MMgr, value.l) As "_HPDF_Number_New" ; HPDF_Number
  HPDF_Number_SetValue.l(*obj.HPDF_Number, value.l) As "_HPDF_Number_SetValue"
  HPDF_Number_Write.HPDF__STATUS(*obj.HPDF_Number, *stream.HPDF_Stream) As "_HPDF_Number_Write"
  HPDF_Boolean_New.l(*mmgr.HPDF_MMgr, value.HPDF__BOOL) As "_HPDF_Boolean_New" ;HPDF_Boolean
  HPDF_Boolean_Write.HPDF__STATUS(*obj.HPDF_Boolean, *stream.HPDF_Stream) As "_HPDF_Boolean_Write"
  HPDF_Null_New.l(*mmgr.HPDF_MMgr) As "_HPDF_Null_New" ; HPDF_Null
  HPDF_Obj_ForceFree.l(*mmgr.HPDF_MMgr, *obj) As "_HPDF_Obj_ForceFree"
  HPDF_Obj_Free.l(*mmgr.HPDF_MMgr, *obj) As "_HPDF_Obj_Free"
  HPDF_Obj_Write.HPDF__STATUS(*obj, *stream.HPDF_Stream, *e.HPDF_Encrypt) As "_HPDF_Obj_Write"
  HPDF_Obj_WriteValue.HPDF__STATUS(*obj, *stream.HPDF_Stream, *e.HPDF_Encrypt) As "_HPDF_Obj_WriteValue"
  HPDF_Proxy_New.l(*mmgr.HPDF_MMgr, *obj) As "_HPDF_Proxy_New" ; HPDF_Proxy
  HPDF_CallbackReader_New.l(*mmgr.HPDF_MMgr, *read_fn, *seek_fn, *tell_fn, *size_fn, *data_) As "_HPDF_CallbackReader_New"; read_fn > Proto HPDF_Stream_Read_Func, seek_fn > Proto HPDF_Stream_Seek_Func, tell_fn > Proto HPDF_Stream_Tell_Func, size_fn > Proto HPDF_Stream_Size_Func  ; HPDF_Stream
  HPDF_CallbackWriter_New.l(*mmgr.HPDF_MMgr, *write_fn, *data_) As "_HPDF_CallbackWriter_New"; write_fn > Proto HPDF_Stream_Write_Func  ; HPDF_Stream
  HPDF_FileReader_New.l(*mmgr.HPDF_MMgr, fname.s) As "_HPDF_FileReader_New" ; HPDF_Stream
  ;-HPDF_FileReader_ReadFunc() As "_HPDF_FileReader_ReadFunc"
  ;-HPDF_FileReader_SeekFunc() As "_HPDF_FileReader_SeekFunc"
  ;-HPDF_FileStream_FreeFunc() As "_HPDF_FileStream_FreeFunc"
  ;-HPDF_FileStream_SizeFunc() As "_HPDF_FileStream_SizeFunc"
  ;-HPDF_FileStream_TellFunc() As "_HPDF_FileStream_TellFunc"
  HPDF_FileWriter_New.l(*mmgr.HPDF_MMgr, fname.s) As "_HPDF_FileWriter_New" ; HPDF_Stream
  ;-HPDF_FileWriter_WriteFunc() As "_HPDF_FileWriter_WriteFunc"
  HPDF_MemStream_FreeData.l(*stream.HPDF_Stream) As "_HPDF_MemStream_FreeData"
  ;-HPDF_MemStream_FreeFunc() As "_HPDF_MemStream_FreeFunc"
  HPDF_MemStream_GetBufCount.l(*stream.HPDF_Stream) As "_HPDF_MemStream_GetBufCount"
  HPDF_MemStream_GetBufPtr.HPDF__BYTE(*stream.HPDF_Stream, index.l, *length) As "_HPDF_MemStream_GetBufPtr"
  HPDF_MemStream_GetBufSize.l(*stream.HPDF_Stream) As "_HPDF_MemStream_GetBufSize"
  ;-HPDF_MemStream_InWrite() As "_HPDF_MemStream_InWrite"
  HPDF_MemStream_New.l(*mmgr.HPDF_MMgr, buf_siz.l) As "_HPDF_MemStream_New" ; HPDF_Stream
  ;-HPDF_MemStream_ReadFunc() As "_HPDF_MemStream_ReadFunc"
  HPDF_MemStream_Rewrite.HPDF__STATUS(*stream.HPDF_Stream, *buf.HPDF__BYTE, size.l) As "_HPDF_MemStream_Rewrite"
  ;-HPDF_MemStream_SeekFunc() As "_HPDF_MemStream_SeekFunc"
  ;-HPDF_MemStream_SizeFunc() As "_HPDF_MemStream_SizeFunc"
  ;-HPDF_MemStream_TellFunc() As "_HPDF_MemStream_TellFunc"
  ;-HPDF_MemStream_WriteFunc() As "_HPDF_MemStream_WriteFunc"
  HPDF_Stream_Free.l(*stream.HPDF_Stream) As "_HPDF_Stream_Free"
  HPDF_Stream_Read.HPDF__STATUS(*stream.HPDF_Stream, *ptr.HPDF__BYTE, *size.l) As "_HPDF_Stream_Read"
  HPDF_Stream_ReadLn.HPDF__STATUS(*stream.HPDF_Stream, *s.c, *size.l) As "_HPDF_Stream_ReadLn"
  HPDF_Stream_Seek.HPDF__STATUS(*stream.HPDF_Stream, pos.l, mode.HPDF_WhenceMode) As "_HPDF_Stream_Seek"
  HPDF_Stream_Size.l(*stream.HPDF_Stream) As "_HPDF_Stream_Size"
  HPDF_Stream_Tell.l(*stream.HPDF_Stream) As "_HPDF_Stream_Tell"
  HPDF_Stream_Validate.HPDF__STATUS(*stream.HPDF_Stream) As "_HPDF_Stream_Validate"
  HPDF_Stream_Write.HPDF__STATUS(*stream.HPDF_Stream, *ptr.HPDF__BYTE, size.l) As "_HPDF_Stream_Write"
  HPDF_Stream_WriteBinary.HPDF__STATUS(*stream.HPDF_Stream, *data_.HPDF__BYTE, len.l, *e.HPDF_Encrypt) As "_HPDF_Stream_WriteBinary"
  HPDF_Stream_WriteChar.HPDF__STATUS(*stream.HPDF_Stream, value.c) As "_HPDF_Stream_WriteChar"
  HPDF_Stream_WriteEscapeName.HPDF__STATUS(*stream.HPDF_Stream, value.s) As "_HPDF_Stream_WriteEscapeName"
  HPDF_Stream_WriteEscapeText.HPDF__STATUS(*stream.HPDF_Stream, text.s) As "_HPDF_Stream_WriteEscapeText"
  HPDF_Stream_WriteEscapeText2.HPDF__STATUS(*stream.HPDF_Stream, text.s, len.l) As "_HPDF_Stream_WriteEscapeText2"
  HPDF_Stream_WriteInt.HPDF__STATUS(*stream.HPDF_Stream, value.l) As "_HPDF_Stream_WriteInt"
  HPDF_Stream_WriteReal.HPDF__STATUS(*stream.HPDF_Stream, value.HPDF__REAL) As "_HPDF_Stream_WriteReal"
  HPDF_Stream_WriteStr.HPDF__STATUS(*stream.HPDF_Stream, value.s) As "_HPDF_Stream_WriteStr"
  HPDF_Stream_WriteToStream.HPDF__STATUS(*src.HPDF_Stream, *dst.HPDF_Stream, filter.l, *e.HPDF_Encrypt) As "_HPDF_Stream_WriteToStream"
  ;-HPDF_Stream_WriteToStreamWithDeflate() As "_HPDF_Stream_WriteToStreamWithDeflate"
  HPDF_Stream_WriteUChar.HPDF__STATUS(*stream.HPDF_Stream, value.HPDF__BYTE) As "_HPDF_Stream_WriteUChar"
  HPDF_Stream_WriteUInt.HPDF__STATUS(*stream.HPDF_Stream, value.l) As "_HPDF_Stream_WriteUInt"
  HPDF_List_Add.HPDF__STATUS(*list.HPDF_List, *item) As "_HPDF_List_Add"
  HPDF_List_Clear.l(*list.HPDF_List) As "_HPDF_List_Clear"
  HPDF_List_Find.l(*list.HPDF_List, *item) As "_HPDF_List_Find"
  HPDF_List_Free.l(*list.HPDF_List) As "_HPDF_List_Free"
  HPDF_List_Insert.HPDF__STATUS(*list.HPDF_List, *target, *item) As "_HPDF_List_Insert"
  HPDF_List_ItemAt.l(*list.HPDF_List, index.l) As "_HPDF_List_ItemAt"
  HPDF_List_New.l(*mmgr.HPDF_MMgr, items_per_block.l) As "_HPDF_List_New";HPDF_List
  HPDF_List_Remove.HPDF__STATUS(*list.HPDF_List, *item) As "_HPDF_List_Remove"
  HPDF_List_RemoveByIndex.l(*list.HPDF_List, index.l) As "_HPDF_List_RemoveByIndex"
  HPDF_FreeMem.l(*mmgr.HPDF_MMgr, *aptr) As "_HPDF_FreeMem"
  HPDF_GetMem.l(*mmgr.HPDF_MMgr, size.l) As "_HPDF_GetMem"
  HPDF_MMgr_Free.l(*mmgr.HPDF_MMgr) As "_HPDF_MMgr_Free"
  HPDF_MMgr_New.l(*error.HPDF_Error, buf_size.l, *alloc_fn, *free_fn) As "_HPDF_MMgr_New" ; alloc_fn : PROTO HPDF_Alloc_Func - free_fn : PROTO HPDF_Free_Func ; HPDF_MMgr
  HPDF_CheckError.HPDF__STATUS(*error.HPDF_Error) As "_HPDF_CheckError"
  ;-HPDF_CopyError() As "_HPDF_CopyError"
  HPDF_Error_GetCode.HPDF__STATUS(*error.HPDF_Error) As "_HPDF_Error_GetCode"
  HPDF_Error_GetDetailCode.HPDF__STATUS(*error.HPDF_Error) As "_HPDF_Error_GetDetailCode"
  HPDF_Error_Init.l(*error.HPDF_Error, *user_data) As "_HPDF_Error_Init"
  HPDF_Error_Reset.l(*error.HPDF_Error) As "_HPDF_Error_Reset"
  HPDF_RaiseError.HPDF__STATUS(*error.HPDF_Error, error_no.HPDF__STATUS, detail_no.HPDF__STATUS) As "_HPDF_RaiseError"
  HPDF_SetError.HPDF__STATUS(*error.HPDF_Error, error_no.HPDF__STATUS, detail_no.HPDF__STATUS) As "_HPDF_SetError"
  HPDF_AToF.d(s.s) As "_HPDF_AToF"
  HPDF_AToI.l(s.s) As "_HPDF_AToI"
  HPDF_FToA.l(*s.c, val.HPDF__REAL, *eptr.c) As "_HPDF_FToA"
  HPDF_IToA.l(s.c, val.l, *eptr.c) As "_HPDF_IToA"
  HPDF_IToA2.l(*s.c, val.l, len.l) As "_HPDF_IToA2"
  HPDF_MemCmp.l(*s1.HPDF__BYTE, *s2.HPDF__BYTE, n.l) As "_HPDF_MemCmp"
  HPDF_MemCpy.l(*out.HPDF__BYTE, *in.HPDF__BYTE, n.c) As "_HPDF_MemCpy"
  HPDF_MemSet.l(s.l, c.HPDF__BYTE, n.l) As "_HPDF_MemSet"
  HPDF_StrCmp.l(s1.s, s2.s) As "_HPDF_StrCmp"
  HPDF_StrCpy.l(*out.c, in.s, *eptr.c) As "_HPDF_StrCpy"
  HPDF_StrLen.l(s.s, maxlen.l) As "_HPDF_StrLen"
  HPDF_StrStr.l(s1.s, s2.s, maxlen.l)As "_HPDF_StrStr"; string 
  HPDF_ToBox.l(left.l, bottom.l, right.l, top.l) As "_HPDF_ToBox" ; HPDF_Box
  HPDF_ToPoint.l(x.l, y.l) As "_HPDF_ToPoint" ;HPDF_Point
  HPDF_ToRect.l(left.HPDF__REAL, bottom.HPDF__REAL, right.HPDF__REAL, top.HPDF__REAL) As "_HPDF_ToRect" ;HPDF_Rect
  l16Swap.l(*value.l) As "_l16Swap"
EndImport


; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 141
; FirstLine = 138