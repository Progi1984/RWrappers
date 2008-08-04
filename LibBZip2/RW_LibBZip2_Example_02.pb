;================================================================
; Project   LibBZip2
; Title     Sample_02
; Author    Progi1984
; Date      20/03/08
; Notes     Compress & Decompress a file with a better way
;================================================================
XIncludeFile "RW_LibBZip2_Inc.pb"

Debug "LibVersion >"+PeekS(BZ2_bzlibVersion())

  file_bz2.s  = "Samples\Sample_1.txt.bz2"
  file_in.s   = "RW_LibBZip2_Inc.pb"
  file_out.s  = "Samples\RW_LibBZip2_Inc.pb.txt"

  ; Put in Memory the file to save
  file = OpenFile(#PB_Any, file_in)
  *data_out = AllocateMemory(FileSize(file_in))
  ReadData(file, *data_out, FileSize(file_in))
  CloseFile(file)
  
  ; Compress Data
  bz = BZ2_bzopen(file_bz2, "w")
  BZ2_bzwrite(bz, *data_out, FileSize(file_in))
  BZ2_bzclose(bz);
  
  ; DeCompress Data
  bz      = BZ2_bzopen(file_bz2, "r")
  size    = 128
  MemBuf  = AllocateMemory(size)
  file    = OpenFile(#PB_Any, file_out)
  Repeat
    size = BZ2_bzread(bz, MemBuf, size)
    WriteData(file, MemBuf, size)
    FreeMemory(MemBuf)
    If size > 0 : MemBuf = AllocateMemory(size) : EndIf
  Until size = 0  
  CloseFile(file)
  BZ2_bzclose(bz);

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 13
; Folding = -