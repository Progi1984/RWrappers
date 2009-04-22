XIncludeFile "RW_DevIL_Inc.pb"

ilInit()
iluInit()

ilEnable(#IL_FILE_OVERWRITE)

ilLoadImage("Data\logo_DevIL.png")
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_00.png")

ilLoadImage("Data\logo_DevIL.png")
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)/2, ilGetInteger(#IL_IMAGE_HEIGHT)/2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_01.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_NEAREST)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_02.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_LINEAR)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_03.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_BILINEAR)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_04.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_SCALE_BOX)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_05.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_SCALE_TRIANGLE)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_06.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_SCALE_BELL)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_07.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_SCALE_BSPLINE)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_08.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_SCALE_LANCZOS3)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_09.png")

ilLoadImage("Data\logo_DevIL.png")
iluImageParameter(#ILU_FILTER, #ILU_SCALE_MITCHELL)
iluScale(ilGetInteger(#IL_IMAGE_WIDTH)*2, ilGetInteger(#IL_IMAGE_HEIGHT)*2, ilGetInteger(#IL_IMAGE_DEPTH))
ilSaveImage("Samples\Sample_01_10.png")

