XIncludeFile "RW_ImageMagick_Wand_Inc.pb"

  Define.MagickWand mw  
  
  Procedure MagicWand_GetError(mwand.MagickWand)
    description = MagickGetException(mwand, @severity)
    Debug "Erreur #"+Str(severity)+">"+PeekS(description)
    MagickRelinquishMemory(description)
  EndProcedure
  
  MagickWandGenesis()
  ; Create a wand 
  mw = NewMagickWand()
  
  ; Read the input image 
  status = MagickReadImage(mw,"Data\logo.png")
  If status = #MagickFalse
    MagicWand_GetError(mw)
    End
  EndIf

  ; write it 
  status = MagickWriteImage(mw,"Samples\Sample_00.jpg")
  If status = #MagickFalse
    MagicWand_GetError(mw)
    End
  EndIf
  
  ; Tidy up 
  If mw
    mw = DestroyMagickWand(mw)
  EndIf
  MagickWandTerminus()
