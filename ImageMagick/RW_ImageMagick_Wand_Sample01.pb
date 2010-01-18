XIncludeFile "RW_ImageMagick_Wand_Inc.pb"

  Define.MagickWand mw  
  Define.l width,height
  
  ProcedureC MagicWand_GetError(mwand.MagickWand)
    description = MagickGetException(mwand, @severity)
    Debug "Erreur #"+Str(severity)+">"+PeekS(description)
    MagickRelinquishMemory(description)
  EndProcedure
  
  MagickWandGenesis()
  Debug "Create a wand"
  mw = NewMagickWand()
  
  Debug "Read the input image"
  status = MagickReadImage(mw,"Data\logo.png")
  If status = #MagickFalse
    MagicWand_GetError(mw)
    End
  EndIf

  Debug "Get the image's width and height"
	width = MagickGetImageWidth(mw)
	height = MagickGetImageHeight(mw)

  width = width / 2
  If width < 1
    width = 1
  EndIf
  Debug "Width > "+Str(width)
  height = height / 2
  If height < 1
    height = 1
  EndIf
  Debug "Height > "+Str(height)
  
  Debug "Resize the image using the Lanczos filter"
  status = MagickResizeImage(mw, width, height, #LanczosFilter, 0.5)
  If status = #MagickFalse
    MagicWand_GetError(mw)
    End
  EndIf
  Debug "Set the compression quality To 95 (high quality = low compression)"
	MagickSetImageCompressionQuality(mw ,95)
  Debug "Write it"
  status = MagickWriteImage(mw,"Samples\Sample_01.jpg")
  If status = #MagickFalse
    MagicWand_GetError(mw)
    End
  EndIf
  
  Debug "Tidy up" 
  If mw
    mw = DestroyMagickWand(mw)
  EndIf
  MagickWandTerminus()
