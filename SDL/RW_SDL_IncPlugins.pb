;- SDL_Image
;{
; Documentation : http://jcatki.no-ip.org/SDL_image/SDL_image_frame.html
ProcedureDLL.l SDL_IMG_InvertAlpha(on.l)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_InvertAlpha", on.l)
EndProcedure
ProcedureDLL.l SDL_IMG_Linked_Version()
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_Linked_Version")
EndProcedure
ProcedureDLL.l SDL_IMG_Load(file.s)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_Load",file.s)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadBMP_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadBMP_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadGIF_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadGIF_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadJPG_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadJPG_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadLBM_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadLBM_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadPCX_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadPCX_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadPNG_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadPNG_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadPNM_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadPNM_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadTGA_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadTGA_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadTIF_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadTIF_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadTyped_RW(*src.SDL_RWops, freesrc.l, type.s)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadTyped_RW", *src.SDL_RWops, freesrc.l, type.s)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadXCF_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadXCF_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadXPM_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadXPM_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_LoadXV_RW(*src.SDL_RWops)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_LoadXV_RW", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_Load_RW(*src.SDL_RWops, freesrc.l)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_Load_RW", *src.SDL_RWops, freesrc.l)
EndProcedure
ProcedureDLL.l SDL_IMG_ReadXPMFromArray(*xpm.s)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_ReadXPMFromArray", *xpm.s)
EndProcedure
ProcedureDLL.l SDL_IMG_isBMP(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isBMP", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isGIF(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isGIF", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isJPG(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isJPG", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isLBM(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isLBM", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isPCX(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isPCX", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isPNG(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isPNG", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isPNM(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isPNM", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isTIF(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isTIF", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isXCF(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isXCF", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isXPM(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isXPM", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_IMG_isXV(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDL_ImageLib, "IMG_isXV", *src.SDL_RWops)
EndProcedure

;}
;- SDL_TTF
;{
; Documentation : http://jcatki.no-ip.org/SDL_ttf/SDL_SDL_TTF_frame.html
  ;{ Structures 
     ;Structure SDL_TTF_Font  Long 
  ;}
  ;{ Constantes
    #UNICODE_BOM_NATIVE  = $FEFF
    #UNICODE_BOM_SWAPPED = $FFFE
    
    #SDL_TTF_STYLE_NORMAL    = $00
    #SDL_TTF_STYLE_BOLD      = $01
    #SDL_TTF_STYLE_ITALIC    = $02
    #SDL_TTF_STYLE_UNDERLINE = $04
  ;}
ProcedureDLL.l SDL_TTF_ByteSwappedUNICODE(swapped.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_ByteSwappedUNICODE", swapped.l)
EndProcedure
ProcedureDLL.l SDL_TTF_CloseFont(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_CloseFont", font.l)
EndProcedure
ProcedureDLL.l SDL_TTF_FontAscent(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_FontAscent", font.l)
EndProcedure
ProcedureDLL.l SDL_TTF_FontDescent(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_FontDescent", font.l)
EndProcedure
ProcedureDLL.s SDL_TTF_FontFaceFamilyName(font.l)
  ProcedureReturn PeekS(CallCFunction(SDL_TTF, "SDL_TTF_FontFaceFamilyName", font.l))
EndProcedure
ProcedureDLL.l SDL_TTF_FontFaceIsFixedWidth(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_FontFaceIsFixedWidth", font.l)
EndProcedure
ProcedureDLL.s SDL_TTF_FontFaceStyleName(font.l)
  ProcedureReturn PeekS(CallCFunction(SDL_TTF, "SDL_TTF_FontFaceStyleName", font.l))
EndProcedure
ProcedureDLL.l SDL_TTF_FontFaces(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_FontFaces", font.l)
EndProcedure
ProcedureDLL.l SDL_TTF_FontHeight(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_FontHeight", font.l)
EndProcedure
ProcedureDLL.l SDL_TTF_FontLineSkip(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_FontLineSkip", font.l)
EndProcedure
ProcedureDLL.l SDL_TTF_GetFontStyle(font.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_GetFontStyle", font.l)
EndProcedure
ProcedureDLL.l SDL_TTF_GlyphMetrics(font.l, ch.l, minx.l, maxx.l, miny.l, maxy.l, advance.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_GlyphMetrics", font.l, ch.l, minx.l, maxx.l, miny.l, maxy.l, advance.l)
EndProcedure
ProcedureDLL.l SDL_TTF_Init()
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_Init")
EndProcedure
ProcedureDLL.l SDL_TTF_Linked_Version(compile_version.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_Linked_Version", compile_version.l)
EndProcedure
ProcedureDLL.l SDL_TTF_OpenFont(file.s, ptsize.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_OpenFont", file.s, ptsize.l)
EndProcedure
ProcedureDLL.l SDL_TTF_OpenFontIndex(file.s, ptsize.l, index.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_OpenFontIndex", file.s, ptsize.l, index.l)
EndProcedure
ProcedureDLL.l SDL_TTF_OpenFontIndexRW(*src.SDL_RWops, freesrc.l, ptsize.l, index.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_OpenFontIndexRW", *src.SDL_RWops, freesrc.l, ptsize.l, index.l)
EndProcedure
ProcedureDLL.l SDL_TTF_OpenFontRW(*src.SDL_RWops, freesrc.l, ptsize.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_OpenFontRW", *src.SDL_RWops, freesrc.l, ptsize.l)
EndProcedure
ProcedureDLL.l SDL_TTF_Quit()
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_Quit")
EndProcedure
ProcedureDLL.l SDL_TTF_RenderGlyph_Blended(font.l, ch.l, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderGlyph_Blended", font.l, ch.l, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderGlyph_Shaded(font.l, ch.l, *fg.SDL_Color, *bg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderGlyph_Shaded", font.l, ch.l, *fg.SDL_Color, *bg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderGlyph_Solid(font.l, ch.l, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderGlyph_Solid", font.l, ch.l, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderText_Blended(font.l, text.s, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderText_Blended", font.l, text.s, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderText_Shaded(font.l, text.s, *fg.SDL_Color, *bg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderText_Shaded", font.l, text.s, *fg.SDL_Color, *bg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderText_Solid(font.l, text.s, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderText_Solid", font.l, text.s, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderUNICODE_Blended(font.l, text.s, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderUNICODE_Blended", font.l, text.s, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderUNICODE_Shaded(font.l, text.s, *fg.SDL_Color, *bg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderUNICODE_Shaded", font.l, text.s, *fg.SDL_Color, *bg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderUNICODE_Solid(font.l, text.s, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderUNICODE_Solid", font.l, text.s, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderUTF8_Blended(font.l, text.s, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderUTF8_Blended", font.l, text.s, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderUTF8_Shaded(font.l, text.s, *fg.SDL_Color, *bg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderUTF8_Shaded", font.l, text.s, *fg.SDL_Color, *bg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_RenderUTF8_Solid(font.l, text.s, *fg.SDL_Color)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_RenderUTF8_Solid", font.l, text.s, *fg.SDL_Color)
EndProcedure
ProcedureDLL.l SDL_TTF_SetFontStyle(font.l, style.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_SetFontStyle", font.l, style.l)
EndProcedure
ProcedureDLL.l SDL_TTF_SizeText(font.l, text.s, w.l, h.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_SizeText", font.l, text.s, w.l, h.l)
EndProcedure
ProcedureDLL.l SDL_TTF_SizeUNICODE(font.l, text.s, w.l, h.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_SizeUNICODE", font.l, text.s, w.l, h.l)
EndProcedure
ProcedureDLL.l SDL_TTF_SizeUTF8(font.l, text.s, w.l, h.l)
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_SizeUTF8", font.l, text.s, w.l, h.l)
EndProcedure
ProcedureDLL.l SDL_TTF_WasInit()
  ProcedureReturn CallCFunction(SDL_TTF, "SDL_TTF_WasInit")
EndProcedure

ProcedureDLL.l SDL_TTF_SetError(message.s)
  ProcedureReturn SDL_SetError(message.s)
EndProcedure
ProcedureDLL.s SDL_TTF_GetError()
  ProcedureReturn SDL_GetError()
EndProcedure
;}


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 239
; Folding = AAAAAAAAAAAg
; EnableCompileCount = 0
; EnableBuildCount = 0