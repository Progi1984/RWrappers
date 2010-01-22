XIncludeFile "RW_DevIL_Inc.pb"

; Sample03 in Unicode mode

ilInit()
iluInit()

ilEnable(#IL_FILE_OVERWRITE)

ilLoadImage("Data\logo_DevIL.png")
ilSave(#IL_BMP, "Samples\Sample_04.bmp")
ilSave(#IL_CHEAD, "Samples\Sample_04.h")
ilSave(#IL_DDS, "Samples\Sample_04.dds")
ilSave(#IL_JPG, "Samples\Sample_04.jpg")
ilSave(#IL_PNM, "Samples\Sample_04.pnm")
ilSave(#IL_PCX, "Samples\Sample_04.pcx")
ilSave(#IL_RAW, "Samples\Sample_04.raw")
ilSave(#IL_SGI, "Samples\Sample_04.sgi")
ilSave(#IL_TGA, "Samples\Sample_04.tga")
ilSave(#IL_TIF, "Samples\Sample_04.tif")
ilSave(#IL_EXR, "Samples\Sample_04.exr")
ilSave(#IL_HDR, "Samples\Sample_04.hdr")
ilSave(#IL_JP2, "Samples\Sample_04.jp2")
ilSave(#IL_PSD, "Samples\Sample_04.psd")
ilSave(#IL_VTF, "Samples\Sample_04.vtf")