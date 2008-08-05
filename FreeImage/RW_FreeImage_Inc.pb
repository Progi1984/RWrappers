XIncludeFile "RW_FreeImage_Res.pb"

;- Imports
Import "FreeImage.lib"
  ; Init / error routines
  FreeImage_Initialise(load_local_plugins_only.l = #False) As "_FreeImage_Initialise@4"
  FreeImage_DeInitialise() As "_FreeImage_DeInitialise@0"
  ; Version routines
  RWFreeImage_GetVersion() As "_FreeImage_GetVersion@0"
  RWFreeImage_GetCopyrightMessage() As "_FreeImage_GetCopyrightMessage@0"
  ; message output functions 
  FreeImage_OutputMessageProc() As "_FreeImage_OutputMessageProc"
  FreeImage_SetOutputMessage(omf.l) As "_FreeImage_SetOutputMessage@4" ;omf.l = pointeur de callback : FreeImage_OutputMessageFunction(fif.l, msg.l) ; fif = FREE_IMAGE_FORMAT ; msg = @String
  ; Allocate / Clone / Unload routines
  FreeImage_Allocate(width.l,height.l,bpp.l,red_mask.l = 0,green_mask.l=0,blue_mask.l=0) As "_FreeImage_Allocate@24"
  FreeImage_AllocateT(type.l,width.l,height.l,bpp.l=8,red_mask.l = 0,green_mask.l=0,blue_mask.l=0) As "_FreeImage_AllocateT@28"
  FreeImage_Clone(dib.l) As "_FreeImage_Clone@4" ; dib = *ptr.FIBITMAP
  FreeImage_Unload(dib.l) As "_FreeImage_Unload@4" ; dib = *ptr.FIBITMAP
  ; Load / Save routines
  CompilerIf #PB_Compiler_Unicode = #False
    FreeImage_Load(fif.l,filename.p-ascii,flags.l=0) As "_FreeImage_Load@12" ; filename = @ptr.s
  CompilerElse
    FreeImage_Load(fif.l,filename.p-unicode,flags.l=0) As "_FreeImage_LoadU@12" ; filename = @ptr.s ; 
  CompilerEndIf
  FreeImage_LoadFromHandle(fif.l,IO.l,Handle.l, flags.l = 0) As "_FreeImage_LoadFromHandle@12" ; IO = @ptr.FreeImageIO ; Handle = @ptr.fi_handle
  CompilerIf #PB_Compiler_Unicode = #False
    FreeImage_Save(fif.l,dib.l,filename.p-ascii,flags.l=0) As "_FreeImage_Save@16" ; dib = *ptr.FIBITMAP ; filename = @ptr.s
  CompilerElse
    FreeImage_Save(fif.l,dib.l,filename.p-ascii,flags.l=0) As "_FreeImage_SaveU@16" ; dib = *ptr.FIBITMAP ; filename = @ptrUnicode.s
  CompilerEndIf
  FreeImage_SaveToHandle(fif.l,dib.l,IO.l,Handle.l,flags.l=0) As "_FreeImage_SaveToHandle@20" ; IO = @ptr.FreeImageIO ; Handle = @ptr.fi_handle
  ; memory i/O stream routines
  FreeImage_OpenMemory(data_.l=0,size_in_bytes.l=0) As "_FreeImage_OpenMemory@8"
  FreeImage_CloseMemory(stream.l) As "_FreeImage_CloseMemory@4" ; stream = @ptr.FIMEMORY
  FreeImage_LoadFromMemory(fif.l,stream.l,flags.l=0) As "_FreeImage_LoadFromMemory@12" ; stream = @ptr.FIMEMORY
  FreeImage_SaveToMemory(fif.l,dib.l,stream.l,flags.l=0) As "_FreeImage_SaveToMemory@16"; dib = *ptr.FIBITMAP  ; stream = @ptr.FIMEMORY
  FreeImage_TellMemory(stream.l) As "_FreeImage_TellMemory@4" ; stream = @ptr.FIMEMORY
  FreeImage_SeekMemory(stream.l,offset.l,origin.l) As "_FreeImage_SeekMemory@12" ; stream = @ptr.FIMEMORY
  FreeImage_AcquireMemory(stream.l,data_.l,size_in_bytes.l) As "_FreeImage_AcquireMemory@12" ; stream = @ptr.FIMEMORY
  FreeImage_ReadMemory(Buffer.l,Size.l,count.l,stream.l) As "_FreeImage_ReadMemory@16" ; stream = @ptr.FIMEMORY
  FreeImage_WriteMemory(Buffer.l,Size.l,count.l,stream.l) As "_FreeImage_WriteMemory@16" ; stream = @ptr.FIMEMORY
  FreeImage_LoadMultiBitmapFromMemory(fif.l,stream.l,flags.l=0) As "_FreeImage_LoadMultiBitmapFromMemory@12" ; stream = @ptr.FIMEMORY
  ; Plugin Interface
  FreeImage_RegisterLocalPlugin(proc_address.l,format.l=0,description.l=0,extension.l=0,regexpr.l=0) As "_FreeImage_RegisterLocalPlugin@20" ; proc_address = FI_InitProc ; description = @ptr.s ; extension = @ptr.s ; regexpr = @ptr.s
  FreeImage_RegisterExternalPlugin(Path.l,format.l = 0,description.l=0,extension.l=0,regexpr.l=0) As "_FreeImage_RegisterExternalPlugin@20" ; path = @ptr.s ; format = @ptr.s ; description = @ptr.s ; extension = @ptr.s ; regexpr = @ptr.s
  FreeImage_GetFIFCount() As "_FreeImage_GetFIFCount@0"
  FreeImage_SetPluginEnabled(fif.l,enable.l) As "_FreeImage_SetPluginEnabled@8"
  FreeImage_IsPluginEnabled(fif.l) As "_FreeImage_IsPluginEnabled@4"
  FreeImage_GetFIFFromFormat(format.l) As "_FreeImage_GetFIFFromFormat@4" ; format = @ptr.s
  FreeImage_GetFIFFromMime(mime.l) As "_FreeImage_GetFIFFromMime@4" ; mime = @ptr.s
  RWFreeImage_GetFormatFromFIF(fif.l) As "_FreeImage_GetFormatFromFIF@4"
  RWFreeImage_GetFIFExtensionList(fif.l) As "_FreeImage_GetFIFExtensionList@4"
  RWFreeImage_GetFIFDescription(fif.l) As "_FreeImage_GetFIFDescription@4"
  RWFreeImage_GetFIFRegExpr(fif.l) As "_FreeImage_GetFIFRegExpr@4"
  FreeImage_GetFIFMimeType(fif.l) As "_FreeImage_GetFIFMimeType@4"
  CompilerIf #PB_Compiler_Unicode = #False
    FreeImage_GetFIFFromFilename(filename.p-ascii) As "_FreeImage_GetFIFFromFilename@4" ; filename = @ptr.s
  CompilerElse
    FreeImage_GetFIFFromFilename(filename.p-ascii) As "_FreeImage_GetFIFFromFilenameU@4" ; filename = @ptrUnicode.s
  CompilerEndIf
  FreeImage_FIFSupportsReading(fif.l) As "_FreeImage_FIFSupportsReading@4"
  FreeImage_FIFSupportsWriting(fif.l) As "_FreeImage_FIFSupportsWriting@4"
  FreeImage_FIFSupportsExportBPP(fif.l,bpp.l) As "_FreeImage_FIFSupportsExportBPP@8"
  FreeImage_FIFSupportsExportType(fif.l,type.l) As "_FreeImage_FIFSupportsExportType@8"
  FreeImage_FIFSupportsICCProfiles(fif.l) As "_FreeImage_FIFSupportsICCProfiles@4"
  ; Multipaging Interface
  FreeImage_OpenMultiBitmap(fif.l,filename.p-ascii,create_new.l,read_only.l,keep_cache_in_memory.l = #False,flags.l=0) As "_FreeImage_OpenMultiBitmap@24" ; filename = @ptr.s
  FreeImage_CloseMultiBitmap(Bitmap.l,flags.l=0) As "_FreeImage_CloseMultiBitmap@8" ; Bitmap = @ptr.FIMULTIBITMAP
  FreeImage_GetPageCount(Bitmap.l) As "_FreeImage_GetPageCount@4"; Bitmap = @ptr.FIMULTIBITMAP
  FreeImage_AppendPage(Bitmap.l,data_.l) As "_FreeImage_AppendPage@8"; Bitmap = @ptr.FIMULTIBITMAP ; Data_ = @ptr.FIBITMAP
  FreeImage_InsertPage(Bitmap.l,page.l,data_.l) As "_FreeImage_InsertPage@12"; Bitmap = @ptr.FIMULTIBITMAP ; Data_ = @ptr.FIBITMAP
  FreeImage_DeletePage(Bitmap.l,page.l) As "_FreeImage_DeletePage@8"; Bitmap = @ptr.FIMULTIBITMAP
  FreeImage_LockPage(Bitmap.l,page.l) As "_FreeImage_LockPage@8"; Bitmap = @ptr.FIMULTIBITMAP
  FreeImage_UnlockPage(Bitmap.l,data_.l,changed.l) As "_FreeImage_UnlockPage@12"; Bitmap = @ptr.FIMULTIBITMAP ; Data_ = @ptr.FIBITMAP
  FreeImage_MovePage(Bitmap.l,target.l,source.l) As "_FreeImage_MovePage@12"; Bitmap = @ptr.FIMULTIBITMAP
  FreeImage_GetLockedPageNumbers(Bitmap.l,pages.l,count.l) As "_FreeImage_GetLockedPageNumbers@12"; Bitmap = @ptr.FIMULTIBITMAP
  ; Filetype request routines 
  CompilerIf #PB_Compiler_Unicode = #False
    FreeImage_GetFileType(filename.p-ascii,Size.l=0) As "_FreeImage_GetFileType@8" ; filename = @ptr.s
  CompilerElse
    FreeImage_GetFileType(filename.p-ascii,Size.l=0) As "_FreeImage_GetFileTypeU@8" ; filename = @ptrUnicode.s
  CompilerEndIf
  FreeImage_GetFileTypeFromHandle(IO.l,Handle.l,Size.l=0) As "_FreeImage_GetFileTypeFromHandle@12" ; IO = @ptr.FreeImageIO ; Handle = @ptr.fi_handle
  FreeImage_GetFileTypeFromMemory(stream.l,Size.l=0) As "_FreeImage_GetFileTypeFromMemory@8" ; stream = @ptr.FIMEMORY
  ; image type request routine
  FreeImage_GetImageType(dib.l) As "_FreeImage_GetImageType@4" ; dib = *ptr.FIBITMAP 
  ; FreeImage helper routines 
  FreeImage_IsLittleEndian() As "_FreeImage_IsLittleEndian@0"
  FreeImage_LookupX11Color(szColor.l,nRed.l,nGreen.l,nBlue.l) As "_FreeImage_LookupX11Color@16" ; szColor = @ptr.s
  FreeImage_LookupSVGColor(szColor.l,nRed.l,nGreen.l,nBlue.l) As "_FreeImage_LookupSVGColor@16"; szColor = @ptr.s
  ; Pixel access routines
  FreeImage_GetBits(dib.l) As "_FreeImage_GetBits@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetScanLine(dib.l,scanline.l) As "_FreeImage_GetScanLine@8"; dib = *ptr.FIBITMAP 
  FreeImage_GetPixelIndex(dib.l,x.l,y.l,Value.l) As "_FreeImage_GetPixelIndex@16"; dib = *ptr.FIBITMAP 
  FreeImage_GetPixelColor(dib.l,x.l,y.l,Value.l) As "_FreeImage_GetPixelColor@16"; dib = *ptr.FIBITMAP ; Value = @ptr.RGBQUAD
  FreeImage_SetPixelIndex(dib.l,x.l,y.l,Value.l) As "_FreeImage_SetPixelIndex@16"; dib = *ptr.FIBITMAP 
  FreeImage_SetPixelColor(dib.l,x.l,y.l,Value.l) As "_FreeImage_SetPixelColor@16"; dib = *ptr.FIBITMAP ; Value = @ptr.RGBQUAD
  ; dib info routines 
  FreeImage_GetColorsUsed(dib.l) As "_FreeImage_GetColorsUsed@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetBPP(dib.l) As "_FreeImage_GetBPP@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetWidth(dib.l) As "_FreeImage_GetWidth@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetHeight(dib.l) As "_FreeImage_GetHeight@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetLine(dib.l) As "_FreeImage_GetLine@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetPitch(dib.l) As "_FreeImage_GetPitch@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetDIBSize(dib.l) As "_FreeImage_GetDIBSize@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetPalette(dib.l) As "_FreeImage_GetPalette@4"; dib = *ptr.FIBITMAP 
  
  FreeImage_GetDotsPerMeterX(dib.l) As "_FreeImage_GetDotsPerMeterX@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetDotsPerMeterY(dib.l) As "_FreeImage_GetDotsPerMeterY@4"; dib = *ptr.FIBITMAP 
  FreeImage_SetDotsPerMeterX(dib.l,res.l) As "_FreeImage_SetDotsPerMeterX@8"; dib = *ptr.FIBITMAP 
  FreeImage_SetDotsPerMeterY(dib.l,res.l) As "_FreeImage_SetDotsPerMeterY@8"; dib = *ptr.FIBITMAP 
  
  FreeImage_GetInfoHeader(dib.l) As "_FreeImage_GetInfoHeader@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetInfo(dib.l) As "_FreeImage_GetInfo@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetColorType(dib.l) As "_FreeImage_GetColorType@4"; dib = *ptr.FIBITMAP 
  
  FreeImage_GetRedMask(dib.l) As "_FreeImage_GetRedMask@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetGreenMask(dib.l) As "_FreeImage_GetGreenMask@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetBlueMask(dib.l) As "_FreeImage_GetBlueMask@4"; dib = *ptr.FIBITMAP 
  
  FreeImage_GetTransparencyCount(dib.l) As "_FreeImage_GetTransparencyCount@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetTransparencyTable(dib.l) As "_FreeImage_GetTransparencyTable@4"; dib = *ptr.FIBITMAP 
  FreeImage_SetTransparent(dib.l,enabled.l) As "_FreeImage_SetTransparent@8"; dib = *ptr.FIBITMAP 
  FreeImage_SetTransparencyTable(dib.l,table.l,count.l) As "_FreeImage_SetTransparencyTable@12"; dib = *ptr.FIBITMAP 
  FreeImage_IsTransparent(dib.l) As "_FreeImage_IsTransparent@4"; dib = *ptr.FIBITMAP 
  FreeImage_SetTransparentIndex(dib.l, index.l) As "_FreeImage_SetTransparentIndex@8"
  FreeImage_GetTransparentIndex(dib.l) As "_FreeImage_GetTransparentIndex@4"

  FreeImage_HasBackgroundColor(dib.l) As "_FreeImage_HasBackgroundColor@4"; dib = *ptr.FIBITMAP 
  FreeImage_GetBackgroundColor(dib.l,bkcolor.l) As "_FreeImage_GetBackgroundColor@8"; dib = *ptr.FIBITMAP ; bkcolor = *ptr.RGBQUAD
  FreeImage_SetBackgroundColor(dib.l,bkcolor.l) As "_FreeImage_SetBackgroundColor@8"; dib = *ptr.FIBITMAP ; bkcolor = *ptr.RGBQUAD
  
  ; ICC Profile routines 
  FreeImage_GetICCProfile(dib.l) As "_FreeImage_GetICCProfile@4"; dib = *ptr.FIBITMAP 
  FreeImage_CreateICCProfile(dib.l,data_.l,Size.l) As "_FreeImage_CreateICCProfile@12"; dib = *ptr.FIBITMAP 
  FreeImage_DestroyICCProfile(dib.l) As "_FreeImage_DestroyICCProfile@4"; dib = *ptr.FIBITMAP 
  
  ; Line conversion routines 
  FreeImage_ConvertLine1To4(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine1To4@12"
  FreeImage_ConvertLine8To4(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine8To4@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine16To4_555(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To4_555@12"
  FreeImage_ConvertLine16To4_565(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To4_565@12"
  FreeImage_ConvertLine24To4(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine24To4@12"
  FreeImage_ConvertLine32To4(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine32To4@12"
  FreeImage_ConvertLine1To8(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine1To8@12"
  FreeImage_ConvertLine4To8(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine4To8@12"
  FreeImage_ConvertLine16To8_555(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To8_555@12"
  FreeImage_ConvertLine16To8_565(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To8_565@12"
  FreeImage_ConvertLine24To8(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine24To8@12"
  FreeImage_ConvertLine32To8(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine32To8@12"
  FreeImage_ConvertLine1To16_555(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine1To16_555@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine4To16_555(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine4To16_555@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine8To16_555(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine8To16_555@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine16_555_To16_565(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16_555_To16_565@12"
  FreeImage_ConvertLine24To16_555(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine24To16_555@12"
  FreeImage_ConvertLine32To16_555(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine32To16_555@12"
  FreeImage_ConvertLine1To16_565(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine1To16_565@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine4To16_565(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine4To16_565@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine8To16_565(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine8To16_565@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine16_565_To16_555(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16_565_To16_555@12"
  FreeImage_ConvertLine24To16_565(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine24To16_565@12"
  FreeImage_ConvertLine32To16_565(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine32To16_565@12"
  FreeImage_ConvertLine1To24(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine1To24@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine4To24(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine4To24@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine8To24(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine8To24@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine16To24_555(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To24_555@12"
  FreeImage_ConvertLine16To24_565(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To24_565@12"
  FreeImage_ConvertLine32To24(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine32To24@12"
  FreeImage_ConvertLine1To32(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine1To32@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine4To32(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine4To32@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine8To32(target.l,source.l,width_in_pixels.l,palette.l) As "_FreeImage_ConvertLine8To32@16" ; palette.l = *ptr.RGBQUAD
  FreeImage_ConvertLine16To32_555(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To32_555@12"
  FreeImage_ConvertLine16To32_565(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine16To32_565@12"
  FreeImage_ConvertLine24To32(target.l,source.l,width_in_pixels.l) As "_FreeImage_ConvertLine24To32@12"
  
  ; Smart conversion routines 
  FreeImage_ConvertTo4Bits(dib.l) As "_FreeImage_ConvertTo4Bits@4"; dib = *ptr.FIBITMAP 
  FreeImage_ConvertTo8Bits(dib.l) As "_FreeImage_ConvertTo8Bits@4"; dib = *ptr.FIBITMAP 
  FreeImage_ConvertToGreyscale(dib.l) As "_FreeImage_ConvertToGreyscale@4"; dib = *ptr.FIBITMAP 
  FreeImage_ConvertTo16Bits555(dib.l) As "_FreeImage_ConvertTo16Bits555@4"; dib = *ptr.FIBITMAP 
  FreeImage_ConvertTo16Bits565(dib.l) As "_FreeImage_ConvertTo16Bits565@4"; dib = *ptr.FIBITMAP 
  FreeImage_ConvertTo24Bits(dib.l) As "_FreeImage_ConvertTo24Bits@4"; dib = *ptr.FIBITMAP 
  FreeImage_ConvertTo32Bits(dib.l) As "_FreeImage_ConvertTo32Bits@4"; dib = *ptr.FIBITMAP 
  FreeImage_ColorQuantize(dib.l,quantize.l) As "_FreeImage_ColorQuantize@8"; dib = *ptr.FIBITMAP ; quantize.l = *ptr.FREE_IMAGE_QUANTIZE
  FreeImage_ColorQuantizeEx(dib.l,quantize.l=#FIQ_WUQUANT,PaletteSize.l=256,ReserveSize.l=0,ReservePalette.l=#Null) As "_FreeImage_ColorQuantizeEx@20"; dib = *ptr.FIBITMAP ; quantize.l = *ptr.FREE_IMAGE_QUANTIZE
  FreeImage_Threshold(dib.l,T.l) As "_FreeImage_Threshold@8"; dib = *ptr.FIBITMAP 
  FreeImage_Dither(dib.l,algorithm.l) As "_FreeImage_Dither@8" ; dib = *ptr.FIBITMAP ; algorithm = *ptr.FREE_IMAGE_DITHER
  
  FreeImage_ConvertFromRawBits(Bits.l,width.l,height.l,pitch.l,bpp.l,red_mask.l,green_mask.l,blue_mask.l,topdown.l= #False) As "_FreeImage_ConvertFromRawBits@36"
  FreeImage_ConvertToRawBits(Bits.l,dib.l,pitch.l,bpp.l,red_mask.l,green_mask.l,blue_mask.l,topdown.l=#False) As "_FreeImage_ConvertToRawBits@32" ; dib = *ptr.FIBITMAP 
  
  FreeImage_ConvertToRGBF(dib.l) As "_FreeImage_ConvertToRGBF@4"; dib = *ptr.FIBITMAP 
  
  FreeImage_ConvertToStandardType(src.l,scale_linear.l=#True) As "_FreeImage_ConvertToStandardType@8"; src = *ptr.FIBITMAP 
  FreeImage_ConvertToType(src.l,dst_type.l,scale_linear.l=#True) As "_FreeImage_ConvertToType@12"; src = *ptr.FIBITMAP ; dst_type = *ptr.FREE_IMAGE_TYPE
  
  ; Tone mapping operators
  FreeImage_ToneMapping(dib.l,tmo.l,first_param.l=0,second_param.l=0) As "_FreeImage_ToneMapping@24"; dib = *ptr.FIBITMAP ; tmo = *ptr.FREE_IMAGE_TMO
  FreeImage_TmoDrago03(src.l,gamma.d = 2.2,exposure.d=0) As "_FreeImage_TmoDrago03@20"; src = *ptr.FIBITMAP 
  FreeImage_TmoReinhard05(src.l,intensity.d=0,contrast.d=0) As "_FreeImage_TmoReinhard05@20"; src = *ptr.FIBITMAP 
  FreeImage_TmoFattal02(src.l, color_saturation.d = 0.5, attenuation.d = 0.85) As "_FreeImage_TmoFattal02@20" ; src = *ptr.FIBITMAP 

  ; ZLIB Interface 
  FreeImage_ZLibCompress(target.l,target_size.l,source.l,source_size.l) As "_FreeImage_ZLibCompress@16"
  FreeImage_ZLibUncompress(target.l,target_size.l,source.l,source_size.l) As "_FreeImage_ZLibUncompress@16"
  FreeImage_ZLibGZip(target.l,target_size.l,source.l,source_size.l) As "_FreeImage_ZLibGZip@16"
  FreeImage_ZLibGUnzip(target.l,target_size.l,source.l,source_size.l) As "_FreeImage_ZLibGUnzip@16"
  FreeImage_ZLibCRC32(crc.l,source.l,source_size.l) As "_FreeImage_ZLibCRC32@12"
  
  ; Metadata routines
  ; Tag creation / destruction
  FreeImage_CreateTag() As "_FreeImage_CreateTag@0"
  FreeImage_DeleteTag(Tag.l) As "_FreeImage_DeleteTag@4" ; Tag = *ptr.FITAG
  FreeImage_CloneTag(Tag.l) As "_FreeImage_CloneTag@4" ; Tag = *ptr.FITAG
  
  ; Tag getters And setters
  FreeImage_GetTagKey(Tag.l) As "_FreeImage_GetTagKey@4" ; Tag = *ptr.FITAG
  FreeImage_GetTagDescription(Tag.l) As "_FreeImage_GetTagDescription@4" ; Tag = *ptr.FITAG
  FreeImage_GetTagID(Tag.l) As "_FreeImage_GetTagID@4" ; Tag = *ptr.FITAG
  FreeImage_GetTagType(Tag.l) As "_FreeImage_GetTagType@4" ; Tag = *ptr.FITAG
  FreeImage_GetTagCount(Tag.l) As "_FreeImage_GetTagCount@4" ; Tag = *ptr.FITAG
  FreeImage_GetTagLength(Tag.l) As "_FreeImage_GetTagLength@4" ; Tag = *ptr.FITAG
  FreeImage_GetTagValue(Tag.l) As "_FreeImage_GetTagValue@4" ; Tag = *ptr.FITAG
  
  FreeImage_SetTagKey(Tag.l,key.l) As "_FreeImage_SetTagKey@8" ; Tag = *ptr.FITAG ; key = *ptr.s
  FreeImage_SetTagDescription(Tag.l,description.l) As "_FreeImage_SetTagDescription@8" ; Tag = *ptr.FITAG ; description = *ptr.s
  FreeImage_SetTagID(Tag.l,id.l) As "_FreeImage_SetTagID@8" ; Tag = *ptr.FITAG
  FreeImage_SetTagType(Tag.l,type.l) As "_FreeImage_SetTagType@8" ; Tag = *ptr.FITAG ; type = *ptr.FREE_IMAGE_MDTYPE
  FreeImage_SetTagCount(Tag.l,count.l) As "_FreeImage_SetTagCount@8" ; Tag = *ptr.FITAG
  FreeImage_SetTagLength(Tag.l,length.l) As "_FreeImage_SetTagLength@8" ; Tag = *ptr.FITAG
  FreeImage_SetTagValue(Tag.l,Value.l) As "_FreeImage_SetTagValue@8" ; Tag = *ptr.FITAG
  
  ; iterator
  FreeImage_FindFirstMetadata(model.l,dib.l,Tag.l) As "_FreeImage_FindFirstMetadata@12" ; model = *ptr.FREE_IMAGE_MDMODEL ; dib = *ptr.FIBITMAP ; Tag = *ptr.FITAG
  FreeImage_FindNextMetadata(mdhandle.l,Tag.l) As "_FreeImage_FindNextMetadata@8" ; mdhandle = *ptr.FIMETADATA ; Tag = *ptr.FITAG
  FreeImage_FindCloseMetadata(mdhandle.l) As "_FreeImage_FindCloseMetadata@4" ; mdhandle = *ptr.FIMETADATA
  
  ; Metadata setter And getter
  FreeImage_SetMetadata(model.l,dib.l,key.l,Tag.l) As "_FreeImage_SetMetadata@16" ; model = *ptr.FREE_IMAGE_MDMODEL ; dib = *ptr.FIBITMAP ; key = *ptr.s ; Tag = *ptr.FITAG
  FreeImage_GetMetadata(model.l,dib.l,key.l,Tag.l) As "_FreeImage_GetMetadata@16" ; model = *ptr.FREE_IMAGE_MDMODEL ; dib = *ptr.FIBITMAP ; key = *ptr.s ; Tag = *ptr.FITAG
  
  ; helpers
  FreeImage_GetMetadataCount(model.l,dib.l) As "_FreeImage_GetMetadataCount@8" ; model = *ptr.FREE_IMAGE_MDMODEL ; dib = *ptr.FIBITMAP
  
  ; Tag To c string conversion
  FreeImage_TagToString(model.l,Tag.l,make.l = #Null) As "_FreeImage_TagToString@12" ; model = *ptr.FREE_IMAGE_MDMODEL ; Tag = *ptr.FITAG ; make = *ptr.s
  
  ; image manipulation toolkit 
  ; rotation And flipping
  FreeImage_RotateClassic(dib.l,angle.d) As "_FreeImage_RotateClassic@12" ; dib = *ptr.FIBITMAP
  FreeImage_RotateEx(dib.l,angle.d, x_shift.d, y_shift.d, x_origin.d, y_origin.d, use_mask.l) As "_FreeImage_RotateEx@48" ; dib = *ptr.FIBITMAP
  FreeImage_FlipHorizontal(dib.l) As "_FreeImage_FlipHorizontal@4" ; dib = *ptr.FIBITMAP
  FreeImage_FlipVertical(dib.l) As "_FreeImage_FlipVertical@4" ; dib = *ptr.FIBITMAP
  FreeImage_JPEGTransform(src_file.p-ascii,dst_file.p-ascii,operation.l,perfect.l=#False) As "_FreeImage_JPEGTransform@16" ; src_file = dst_file = *ptr.s ; operation = *ptr.FREE_IMAGE_JPEG_OPERATION
  
  ; Upsampling / downsampling
  FreeImage_Rescale(dib.l,dst_width.l,dst_height.l,filter.l) As "_FreeImage_Rescale@16"; dib = *ptr.FIBITMAP
  FreeImage_MakeThumbnail(dib.l,max_pixel_size.l,convert.l=#True) As "_FreeImage_MakeThumbnail@12"; dib = *ptr.FIBITMAP
  
  ; color manipulation routines (point operations)
  FreeImage_AdjustCurve(dib.l,LUT.l,channel.l) As "_FreeImage_AdjustCurve@12" ; dib = *ptr.FIBITMAP
  FreeImage_AdjustGamma(dib.l,gamma.d) As "_FreeImage_AdjustGamma@12"; dib = *ptr.FIBITMAP
  FreeImage_AdjustBrightness(dib.l,percentage.d) As "_FreeImage_AdjustBrightness@12"; dib = *ptr.FIBITMAP
  FreeImage_AdjustContrast(dib.l,percentage.d) As "_FreeImage_AdjustContrast@12"; dib = *ptr.FIBITMAP
  FreeImage_Invert(dib.l) As "_FreeImage_Invert@4"; dib = *ptr.FIBITMAP
  FreeImage_GetHistogram(dib.l,histo.l,channel.l = #FICC_BLACK) As "_FreeImage_GetHistogram@12"; dib = *ptr.FIBITMAP
  FreeImage_GetAdjustColorsLookupTable(lut.l, brightness.d, contrast.d, gamma.d, invert.l) As "_FreeImage_GetAdjustColorsLookupTable@32"
  FreeImage_AdjustColors(dib.l, brightness.d, contrast.d, gamma.d, invert.l = #False) As "_FreeImage_AdjustColors@32"
  FreeImage_ApplyColorMapping(dib.l, srccolors.l, dstcolors.l, count.l, ignore_alpha.l, swap_.l) As "_FreeImage_ApplyColorMapping@24"
  FreeImage_SwapColors(dib.l, color_a.l, color_b.l, ignore_alpha.l) As "_FreeImage_SwapColors@16"
  FreeImage_ApplyPaletteIndexMapping(dib.l, srcindices.l,	dstindices.l, count.l, swap_.l) As "_FreeImage_ApplyPaletteIndexMapping@20"
  FreeImage_SwapPaletteIndices(dib.l, index_a.l, index_b.l) As "_FreeImage_SwapPaletteIndices@12"
  
  ; channel processing routines
  FreeImage_GetChannel(dib.l,channel.l) As "_FreeImage_GetChannel@8"; dib = *ptr.FIBITMAP
  FreeImage_SetChannel(dib.l,dib8.l,channel.l) As "_FreeImage_SetChannel@12"; dib = dib8 = *ptr.FIBITMAP
  FreeImage_GetComplexChannel(dib.l,channel.l) As "_FreeImage_GetComplexChannel@8"; dib = *ptr.FIBITMAP
  FreeImage_SetComplexChannel(dib.l,src.l,channel.l) As "_FreeImage_SetComplexChannel@12"; dib = src = *ptr.FIBITMAP
  
  ; copy / paste / composite routines
  FreeImage_Copy(dib.l,left.l,top.l,right.l,bottom.l) As "_FreeImage_Copy@20" ; dib = *ptr.FIBITMAP
  FreeImage_Paste(dib.l,src.l,left.l,top.l,Alpha.l) As "_FreeImage_Paste@20" ; dib = src = *ptr.FIBITMAP
  FreeImage_Composite(fg.l,useFileBkg.l = #False,appBkColor.l = #Null, bg.l = #Null) As "_FreeImage_Composite@16"; fg = bg = *ptr.FIBITMAP ; appBkColor = *ptr.RGBQUAD
  FreeImage_JPEGCrop(src_file.p-ascii,dst_file.p-ascii,left.l,top.l,right.l,bottom.l) As "_FreeImage_JPEGCrop@24" ; src_file = dst_file = *ptr.s
  FreeImage_PreMultiplyWithAlpha(dib.l) As "_FreeImage_PreMultiplyWithAlpha@4"
  
  ; miscellaneous algorithms
  FreeImage_MultigridPoissonSolver(Laplacian.l, ncycle.l = 3) As "_FreeImage_MultigridPoissonSolver@8"
EndImport

ProcedureDLL.s FreeImage_GetVersion()
  ProcedureReturn PeekS(RWFreeImage_GetVersion(), -1, #PB_Ascii)
EndProcedure
ProcedureDLL.s FreeImage_GetCopyrightMessage()
  ProcedureReturn PeekS(RWFreeImage_GetCopyrightMessage(), -1, #PB_Ascii)
EndProcedure
ProcedureDLL.s FreeImage_GetFormatFromFIF(fif.l)
  ProcedureReturn PeekS(RWFreeImage_GetFormatFromFIF(fif.l), -1, #PB_Ascii)
EndProcedure
ProcedureDLL.s FreeImage_GetFIFExtensionList(fif.l)
  ProcedureReturn PeekS(RWFreeImage_GetFIFExtensionList(fif.l), -1, #PB_Ascii)
EndProcedure
ProcedureDLL.s FreeImage_GetFIFDescription(fif.l)
  ProcedureReturn PeekS(RWFreeImage_GetFIFDescription(fif.l), -1, #PB_Ascii)
EndProcedure
ProcedureDLL.s FreeImage_GetFIFRegExpr(fif.l)
  ProcedureReturn PeekS(RWFreeImage_GetFIFRegExpr(fif.l), -1, #PB_Ascii)
EndProcedure

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 308
; Folding = A+
; EnableUnicode