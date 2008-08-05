XIncludeFile "RW_LibGD2_Res.pb"

ImportC "bgd.lib"
  gdImageCreate(sx.l, sy.l) As "_gdImageCreate@8"
  gdImageCreateTrueColor(sx.l, sy.l) As "_gdImageCreateTrueColor@8"
  gdImageDestroy(*im.gdImage) As "_gdImageDestroy@4"
  gdImageColorClosest(*im.gdImage, r.l, g.l, b.l) As "_gdImageColorClosest@16"
  gdImageColorClosestAlpha(*im.gdImage, r.l, g.l, b.l, a.l) As "_gdImageColorClosestAlpha@20"
  gdImageColorClosestHWB(*im.gdImage, r.l, g.l, b.l) As "_gdImageColorClosestHWB@16"
  gdImageColorExact(*im.gdImage, r.l, g.l, b.l) As "_gdImageColorExact@16"
  gdImageColorExactAlpha(*im.gdImage, r.l, g.l, b.l, a.l) As "_gdImageColorExactAlpha@20"
  gdImageColorAllocate(*im.gdImage, r.l, g.l, b.l) As "_gdImageColorAllocate@16"
  gdImageColorAllocateAlpha(*im.gdImage, r.l, g.l, b.l, a.l) As "_gdImageColorAllocateAlpha@20"
  gdImageColorResolve(*im.gdImage, r.l, g.l, b.l) As "_gdImageColorResolve@16"
  gdImageColorResolveAlpha(*im.gdImage, r.l, g.l, b.l, a.l) As "_gdImageColorResolveAlpha@20"
  gdImageColorDeallocate(*im.gdImage, color.l) As "_gdImageColorDeallocate@8"
  gdImageColorTransparent(*im.gdImage, color.l) As "_gdImageColorTransparent@8"
  gdImagePaletteCopy(*dst.gdImage, *src.gdImage) As "_gdImagePaletteCopy@8"
  gdImageSetPixel(*im.gdImage, x.l, y.l, color.l) As "_gdImageSetPixel@16"
  gdAlphaBlend(dest.l, src.l) As "_gdAlphaBlend@8"
  gdImageGetPixel(*im.gdImage, x.l, y.l) As "_gdImageGetPixel@12"
  gdImageGetTrueColorPixel(*im.gdImage, x.l, y.l) As "_gdImageGetTrueColorPixel@12"
  gdImageAABlend(*im.gdImage) As "_gdImageAABlend@4"
  gdImageLine(*im.gdImage, x1.l, y1.l, x2.l, y2.l, color.l) As "_gdImageLine@24"
  gdImageDashedLine(*im.gdImage, x1.l, y1.l, x2.l, y2.l, color.l) As "_gdImageDashedLine@24"
  gdImageBoundsSafe(*im.gdImage, x.l, y.l) As "_gdImageBoundsSafe@12"
  gdImageChar(*im.gdImage, *f.gdFont, x.l, y.l, c.l, color.l) As "_gdImageChar@24"
  gdImageCharUp(*im.gdImage, *f.gdFont, x.l, y.l, c.l, color.l) As "_gdImageCharUp@24"
  gdImageString(*im.gdImage, *f.gdFont, x.l, y.l, s.p-ascii, color.l) As "_gdImageString@24"
  gdImageStringUp(*im.gdImage, *f.gdFont, x.l, y.l, s.p-ascii, color.l) As "_gdImageStringUp@24"
  gdImageString16(*im.gdImage, *f.gdFont, x.l, y.l, *s, color.l) As "_gdImageString16@24"
  gdImageStringUp16(*im.gdImage, *f.gdFont, x.l, y.l, *s, color.l) As "_gdImageStringUp16@24"
  gdImageArc(*im.gdImage, cx.l, cy.l, w.l, h.l, s.l, e.l, color.l) As "_gdImageArc@32"
  gdImageFilledArc(*im.gdImage, cx.l, cy.l, w.l, h.l, s.l, e.l, color.l, style.l) As "_gdImageFilledArc@36"
  gdImageFilledPolygon(*im.gdImage, *p.gdPoint, n.l, c.l) As "_gdImageFilledPolygon@16"
  gdImageFilledEllipse(*im.gdImage, cx.l, cy.l, w.l, h.l, color.l) As "_gdImageFilledEllipse@24"
  gdImageFillToBorder(*im.gdImage, x.l, y.l, border.l, color.l) As "_gdImageFillToBorder@20"
  gdImageFill(*im.gdImage, x.l, y.l, color.l) As "_gdImageFill@16"
  gdImageRectangle(*im.gdImage, x1.l, y1.l, x2.l, y2.l, color.l) As "_gdImageRectangle@24"
  gdImageFilledRectangle(*im.gdImage, x1.l, y1.l, x2.l, y2.l, color.l) As "_gdImageFilledRectangle@24"
  gdImageCopy(*dst.gdImage, *src.gdImage, dstX.l, dstY.l, srcX.l, srcY.l, w.l, h.l) As "_gdImageCopy@32"
  gdImageCopyMerge(*dst.gdImage, *src.gdImage, dstX.l, dstY.l, srcX.l, srcY.l, w.l, h.l, pct.l) As "_gdImageCopyMerge@36"
  gdImageCopyMergeGray(*dst.gdImage, *src.gdImage, dstX.l, dstY.l, srcX.l, srcY.l, w.l, h.l, pct.l) As "_gdImageCopyMergeGray@36"
  gdImageCopyResized(*dst.gdImage, *src.gdImage, dstX.l, dstY.l, srcX.l, srcY.l, dstW.l, dstH.l, srcW.l, srcH.l) As "_gdImageCopyResized@40"
  gdImageCopyRotated(*dst.gdImage, *src.gdImage, dstX.l, dstY.l, srcX.l, srcY.l, srcWidth.l, srcHeight.l, angle.l) As "_gdImageCopyRotated@44"
  gdImageCopyResampled(*dst.gdImage, *src.gdImage, dstX.l, dstY.l, srcX.l, srcY.l, dstW.l, dstH.l, srcW.l, srcH.l) As "_gdImageCopyResampled@40"
  gdImageCreateFromXbm(in.l) As "_gdImageCreateFromXbm@4"
  gdImagePolygon(*im.gdImage, *p.gdPoint, n.l, c.l) As "_gdImagePolygon@16"
  gdImageOpenPolygon(*im.gdImage, *p.gdPoint, n.l, c.l) As "_gdImageOpenPolygon@16"
  gdImageSetStyle(*im.gdImage, style.l, noOfPixels.l) As "_gdImageSetStyle@12"
  gdImageSetThickness(*im.gdImage, thickness.l) As "_gdImageSetThickness@8"
  gdImageSetBrush(*im.gdImage, *brush.gdImage) As "_gdImageSetBrush@8"
  gdImageSetTile(*im.gdImage, *tile.gdImage) As "_gdImageSetTile@8"
  gdImageSetAntiAliased(*im.gdImage, c.l) As "_gdImageSetAntiAliased@8"
  gdImageSetAntiAliasedDontBlend(*im.gdImage, c.l, dont_blend.l) As "_gdImageSetAntiAliasedDontBlend@12"
  gdImageInterlace(*im.gdImage, interlaceArg.l) As "_gdImageInterlace@8"
  gdImageCompare(*im1.gdImage, *im2.gdImage) As "_gdImageCompare@8"
  gdImageAlphaBlending(*im.gdImage, alphaBlendingArg.l) As "_gdImageAlphaBlending@8"
  gdImageSaveAlpha(*im.gdImage, saveAlphaArg.l) As "_gdImageSaveAlpha@8"
  gdImageSetClip(*im.gdImage, x1.l, y1.l, x2.l, y2.l) As "_gdImageSetClip@20"
  gdImageGetClip(*im.gdImage, *x1P.l, *y1P.l, *x2P.l, *y2P.l) As "_gdImageGetClip@20"
  gdFontGetGiant() As "_gdFontGetGiant@0"
  gdFontGetLarge() As "_gdFontGetLarge@0"
  gdFontGetMediumBold() As "_gdFontGetMediumBold@0"
  gdFontGetSmall() As "_gdFontGetSmall@0"
  gdFontGetTiny() As "_gdFontGetTiny@0"
  gdImageStringTTF(*im.gdImage, brect.l, fg.l, fontlist.p-ascii, ptsize.d, angle.d, x.l, y.l, string.p-ascii) As "_gdImageStringTTF@44"
  gdImageStringFT(*im.gdImage, brect.l, fg.l, fontlist.p-ascii, ptsize.d, angle.d, x.l, y.l, string.p-ascii) As "_gdImageStringFT@44"
  gdFreeFontCache() As "_gdFreeFontCache@0"
  gdFontCacheShutdown() As "_gdFontCacheShutdown@0"
  gdImageStringFTEx(*im.gdImage, brect.l, fg.l, fontlist.p-ascii, ptsize.d, angle.d, x.l, y.l, string.p-ascii, *strex.gdFTStringExtra) As "_gdImageStringFTEx@48"
  gdFontCacheSetup() As "_gdFontCacheSetup@0"
  gdFTUseFontConfig(flag.l) As "_gdFTUseFontConfig@4"
  gdImageStringFTCircle(*im.gdImage, cx.l, cy.l, radius.d, textRadius.d, fillPortion.d, font.p-ascii, points.d, top.p-ascii, bottom.p-ascii, fgcolor.l) As "_gdImageStringFTCircle@60"
  gdImageSquareToCircle(*im.gdImage, radius.l) As "_gdImageSquareToCircle@8"
  gdImageSharpen(*im.gdImage, pct.l) As "_gdImageSharpen@8"
  gdImageCreateFromGd2(in.l) As "_gdImageCreateFromgd2@4"
  gdImageCreateFromGd2Ctx(*in.gdIOCtx) As "_gdImageCreateFromgd2Ctx@4"
  gdImageCreateFromGd2Ptr(size.l, data_.l) As "_gdImageCreateFromgd2Ptr@8"
  gdImageCreateFromGd2Part(in.l, srcx.l, srcy.l, w.l, h.l) As "_gdImageCreateFromGd2Part@20"
  gdImageCreateFromGd2PartCtx(*in.gdIOCtx, srcx.l, srcy.l, w.l, h.l) As "_gdImageCreateFromGd2PartCtx@20"
  gdImageCreateFromGd2PartPtr(size.l, data_.l, srcx.l, srcy.l, w.l, h.l) As "_gdImageCreateFromGd2PartPtr@24"
  gdImageGd2(*im.gdImage, out.l, cs.l, fmt.l) As "_gdImageGd2@16"
  gdImageGd2Ptr(*im.gdImage, cs.l, fmt.l, size.l) As "_gdImageGd2Ptr@16"
  gdImageCreateFromGd(in.l) As "_gdImageCreateFromGd@4"
  gdImageCreateFromGdCtx(*in.gdIOCtx) As "_gdImageCreateFromGdCtx@4"
  gdImageCreateFromGdPtr(size.l, data_.l) As "_gdImageCreateFromGdPtr@8"
  gdImageGd(*im.gdImage, out.l) As "_gdImageGd@8"
  gdImageGdPtr(*im.gdImage, size.l) As "_gdImageGdPtr@8"
  gdImageCreateFromGif(fd.l) As "_gdImageCreateFromGif@4"
  gdImageCreateFromGifCtx(*in.gdIOCtx) As "_gdImageCreateFromGifCtx@4"
  gdImageCreateFromGifPtr(size.l, data_.l) As "_gdImageCreateFromGifPtr@8"
  gdImageGifPtr(*im.gdImage, size.l) As "_gdImageGifPtr@8"
  gdImageGifCtx(*im.gdImage, *out.gdIOCtx) As "_gdImageGifCtx@8"
  gdImageGif(*im.gdImage, out.l) As "_gdImageGif@8"
  gdImageGifAnimBeginPtr(*im.gdImage, size.l, GlobalCM.l, Loops.l) As "_gdImageGifAnimBeginPtr@16"
  gdImageGifAnimBeginCtx(*im.gdImage, *out.gdIOCtx, GlobalCM.l, Loops.l) As "_gdImageGifAnimBeginCtx@16"
  gdImageGifAnimBegin(*im.gdImage, outFile.l, GlobalCM.l, Loops.l) As "_gdImageGifAnimBegin@16"
  gdImageGifAnimAddPtr(*im.gdImage, size.l, GlobalCM.l, LeftOfs.l, TopOfs.l, Delay.l, Disposal.l, *previm.gdImage) As "_gdImageGifAnimAddPtr@32"
  gdImageGifAnimAddCtx(*im.gdImage, *out.gdIOCtx, GlobalCM.l, LeftOfs.l, TopOfs.l, Delay.l, Disposal.l, *previm.gdImage) As "_gdImageGifAnimAddCtx@32"
  gdImageGifAnimAdd(*im.gdImage, outFile.l, GlobalCM.l, LeftOfs.l, TopOfs.l, Delay.l, Disposal.l, *previm.gdImage) As "_gdImageGifAnimAdd@32"
  gdImageGifAnimEnd(outFile.l) As "_gdImageGifAnimEnd@4"
  gdImageGifAnimEndPtr(size.l) As "_gdImageGifAnimEndPtr@4"
  gdImageGifAnimEndCtx(*out.gdIOCtx) As "_gdImageGifAnimEndCtx@4"
  gdFree(m.l) As "_gdFree@4"
  gdNewDynamicCtx(size.l, data_.l) As "_gdNewDynamicCtx@8"
  gdNewDynamicCtxEx(size.l, data_.l, freeFlag.l) As "_gdNewDynamicCtxEx@12"
  gdDPExtractData(*ctx.gdIOCtx, size.l) As "_gdDPExtractData@8"
  gdNewFileCtx(file.l) As "_gdNewFileCtx@4"
  gdNewSSCtx(*in.gdSource, *out.gdSink) As "_gdNewSSCtx@8"
  gdImageJpeg(*im.gdImage, out.l, quality.l) As "_gdImageJpeg@12"
  gdImageJpegCtx(*im.gdImage, *out.gdIOCtx, quality.l) As "_gdImageJpegCtx@12"
  gdImageJpegPtr(*im.gdImage, size.l, quality.l) As "_gdImageJpegPtr@12"
  gdImageCreateFromJpeg(inFile.l) As "_gdImageCreateFromJpeg@4"
  gdImageCreateFromJpegCtx(*infile.gdIOCtx) As "_gdImageCreateFromJpegCtx@4"
  gdImageCreateFromJpegPtr(size.l, data_.l) As "_gdImageCreateFromJpegPtr@8"
  gdImageCreateFromPng(fd.l) As "_gdImageCreateFromPng@4"
  gdImageCreateFromPngCtx(*in.gdIOCtx) As "_gdImageCreateFromPngCtx@4"
  gdImageCreateFromPngPtr(size.l, data_.l) As "_gdImageCreateFromPngPtr@8"
  gdImagePngEx(*im.gdImage, out.l, level.l) As "_gdImagePngEx@12"
  gdImagePngCtxEx(*im.gdImage, *out.gdIOCtx, level.l) As "_gdImagePngCtxEx@12"
  gdImagePng(*im.gdImage, out.l) As "_gdImagePng@8"
  gdImagePngPtr(*im.gdImage, size.l) As "_gdImagePngPtr@8"
  gdImagePngPtrEx(*im.gdImage, size.l, level.l) As "_gdImagePngPtrEx@12"
  gdImagePngCtx(*im.gdImage, *out.gdIOCtx) As "_gdImagePngCtx@8"
  gdImagePngToSink(*im.gdImage, *out.gdSink) As "_gdImagePngToSink@8"
  gdImageCreateFromPngSource(*in.gdSource) As "_gdImageCreateFromPngSource@4"
  gdImageCreatePaletteFromTrueColor(*im.gdImage, ditherFlag.l, colorsWanted.l) As "_gdImageCreatePaletteFromTrueColor@12"
  gdImageTrueColorToPalette(*im.gdImage, ditherFlag.l, colorsWanted.l) As "_gdImageTrueColorToPalette@12"
  gdImageWBMPCtx(*im.gdImage, fg.l ,*out.gdIOCtx) As "_gdImageWBMPCtx@12"
  gdImageCreateFromWBMPCtx(*inFile.gdIOCtx) As "_gdImageCreateFromWBMPCtx@4"
  gdImageCreateFromWBMP(inFile.l) As "_gdImageCreateFromWBMP@4"
  gdImageCreateFromWBMPPtr(size.l, data_.l) As "_gdImageCreateFromWBMPPtr@8"
  gdImageWBMP(*im.gdImage, fg.l, out.l) As "_gdImageWBMP@12"
  gdImageWBMPPtr(*im.gdImage, size.l, fg.l) As "_gdImageWBMPPtr@12"
  gdImageCreateFromXpm(filename.p-ascii) As "_gdImageCreateFromXpm@4"
EndImport
ImportC "bgd_a.lib"
  createwbmp(width.l, height.l, color.l) As "_createwbmp"
  freewbmp(*wbmp.WBmp) As "_freewbmp"
  getmbi(*getin, *in) As "_getmbi"
  printwbmp(*wbmp.WBmp) As "_printwbmp"
  putmbi(i.l, *putout, *out) As "_putmbi"
  readwbmp(*getin, *in, *wbmp.WBmp) As "_readwbmp"
  skipheader(*getin, *in) As "_skipheader"
  writewbmp(*wbmp.WBmp, *putout, *out) As "_writewbmp"
  overflow2(a.l, b.l) As "_overflow2"
  Putchar(c.l, *ctx.gdIOCtx) As "_Putchar"
  Putword(w.l, *ctx.gdIOCtx) As "_Putword"
  gdGetBuf(*buf, size.l, *ctx.gdIOCtx) As "_gdGetBuf"
  gdGetByte(result.l, *ctx.gdIOCtx) As "_gdGetByte"
  gdGetC(*ctx.gdIOCtx) As "_gdGetC"
  gdGetInt(result.l, *ctx.gdIOCtx) As "_gdGetInt"
  gdGetWord(result.l, *ctx.gdIOCtx) As "_gdGetWord"
  gdPutInt(w.l, *ctx.gdIOCtx) As "_gdPutInt"
  gdPutWord(w.l, *ctx.gdIOCtx) As "_gdPutWord"
  gdSeek(*ctx.gdIOCtx, offset.l) As "_gdSeek"
  gdTell(*ctx.gdIOCtx) As "_gdTell"
  gdCalloc(nmemb.l, size.l) As "_gdCalloc"
  gdMalloc(size.l) As "_gdMalloc"
  gdRealloc(*ptr, size.l) As "_gdRealloc"
  gd_strtok_r(s.p-ascii, sep.p-ascii, *state.p-ascii) As "_gd_strtok_r"
  gdCacheCreate(size.l, *gdCacheTest, *gdCacheFetch, *gdCacheRelease) As "_gdCacheCreate"
  gdCacheDelete(*head) As "_gdCacheDelete"
  gdCacheGet(*head, *keydata) As "_gdCacheGet"
EndImport



; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 67
; FirstLine = 64
; Folding = -