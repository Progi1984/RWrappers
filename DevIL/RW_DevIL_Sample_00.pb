XIncludeFile "RW_DevIL_Inc.pb"

ilInit()
iluInit()

CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Linux : ilutRenderer(#ILUT_OPENGL)
  CompilerCase #PB_OS_Windows : ilutRenderer(#ILUT_WIN32)
CompilerEndSelect

ilEnable(#IL_FILE_OVERWRITE)

ilLoadImage("Data\logo_DevIL.png")
ilSaveImage("Samples\Sample_00_00.png")

iluAlienify()
ilSaveImage("Samples\Sample_00_01.png")

ilLoadImage("Data\logo_DevIL.png")
iluBlurAvg(5)
ilSaveImage("Samples\Sample_00_02.png")

ilLoadImage("Data\logo_DevIL.png")
iluBlurGaussian(5)
ilSaveImage("Samples\Sample_00_03.png")

ilLoadImage("Data\logo_DevIL.png")
iluEqualize()
ilSaveImage("Samples\Sample_00_04.png")

ilLoadImage("Data\logo_DevIL.png")
iluGammaCorrect(0.5)
ilSaveImage("Samples\Sample_00_05.png")

ilLoadImage("Data\logo_DevIL.png")
iluContrast(0.5)
ilSaveImage("Samples\Sample_00_06.png")

ilLoadImage("Data\logo_DevIL.png")
iluNegative()
ilSaveImage("Samples\Sample_00_07.png")

ilLoadImage("Data\logo_DevIL.png")
iluNoisify(0.5)
ilSaveImage("Samples\Sample_00_08.png")

ilLoadImage("Data\logo_DevIL.png")
iluPixelize(10)
ilSaveImage("Samples\Sample_00_09.png")

ilLoadImage("Data\logo_DevIL.png")
iluSharpen(1.5, 5)
ilSaveImage("Samples\Sample_00_10.png")
