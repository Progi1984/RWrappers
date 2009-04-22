XIncludeFile "RW_DevIL_Inc.pb"

ilInit()
iluInit()

ilEnable(#IL_FILE_OVERWRITE)

ilLoadImage("Data\logo_DevIL.png")
ilSave(#IL_BMP, "Samples\Sample_03.bmp")
ilSave(#IL_CHEAD, "Samples\Sample_03.h")
ilSave(#IL_DDS, "Samples\Sample_03.dds")
ilSave(#IL_JPG, "Samples\Sample_03.jpg")
ilSave(#IL_PNM, "Samples\Sample_03.pnm")
ilSave(#IL_PCX, "Samples\Sample_03.pcx")
ilSave(#IL_RAW, "Samples\Sample_03.raw")
ilSave(#IL_SGI, "Samples\Sample_03.sgi")
ilSave(#IL_TGA, "Samples\Sample_03.tga")
ilSave(#IL_TIF, "Samples\Sample_03.tif")
ilSave(#IL_EXR, "Samples\Sample_03.exr")
ilSave(#IL_HDR, "Samples\Sample_03.hdr")
ilSave(#IL_JP2, "Samples\Sample_03.jp2")
ilSave(#IL_PSD, "Samples\Sample_03.psd")
ilSave(#IL_VTF, "Samples\Sample_03.vtf")