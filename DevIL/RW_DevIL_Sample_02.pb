XIncludeFile "RW_DevIL_Inc.pb"

ilInit()
iluInit()

ilEnable(#IL_FILE_OVERWRITE)

ilLoadImage("Data\logo_DevIL.png")
Debug "Width > "  + Str(ilGetInteger(#IL_IMAGE_WIDTH))
Debug "Height > " + Str(ilGetInteger(#IL_IMAGE_HEIGHT))
Debug "Depth > "  + Str(ilGetInteger(#IL_IMAGE_DEPTH))
Debug "Size > "   + Str(ilGetInteger(#IL_IMAGE_SIZE_OF_DATA))
Debug "BPP > "    + Str(ilGetInteger(#IL_IMAGE_BPP))
Debug "OPP > "    + Str(ilGetInteger(#IL_IMAGE_BITS_PER_PIXEL))

Debug "--------------------------------------------------------Palette"
Debug "Type > "   + Str(ilGetInteger(#IL_PALETTE_TYPE))
Debug "Size > "   + Str(ilGetInteger(#IL_PALETTE_SIZE))
Debug "BPP > "    + Str(ilGetInteger(#IL_PALETTE_BPP))
Debug "NumCols > "+ Str(ilGetInteger(#IL_PALETTE_NUM_COLS))
Debug "BaseType > "+Str(ilGetInteger(#IL_PALETTE_BASE_TYPE))
