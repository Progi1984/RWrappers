;================================================================
; Project   LibBZip2
; Title     Sample_01
; Author    Progi1984
; Date      20/03/08
; Notes     Compress & Decompress a file
;================================================================
XIncludeFile "RW_LibBZip2_Inc.pb"

Debug "LibVersion >"+PeekS(BZ2_bzlibVersion())

  file_bz2.s  = "Samples\Sample_1.txt.bz2"
  file_in.s   = "RW_LibBZip2_Inc.pb"
  file_out.s   = "RW_LibBZip2_Inc.pb.txt"

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
  bz = BZ2_bzopen(file_bz2, "r")
  size = 128
  sizetotal = 0
  MemBuf = AllocateMemory(size)
  Repeat
    ; MemBuf    > Memory containing extraction of BZ2 File
    ; MemTmp    > Temporary memory containing old MemTotal
    ; MemTotal  > Memory containing extracted file
    size = BZ2_bzread(bz, MemBuf, size)
    If sizetotal > 0
      MemTmp = AllocateMemory(sizetotal)
      CopyMemory(MemTotal, MemTmp, sizetotal)
    EndIf
    sizetotal + size
    If MemTotal > 0
      FreeMemory(MemTotal)
    EndIf
    MemTotal = AllocateMemory(sizetotal)
    If MemTmp > 0
      CopyMemory(MemTmp, MemTotal, sizetotal - size)
      FreeMemory(MemTmp)
    EndIf
    CopyMemory(MemBuf, MemTotal + sizetotal - size, size)
  Until size = 0  
  
  ; Write Data in file
  file = OpenFile(#PB_Any, file_out)
  WriteData(file, MemTotal, MemorySize(MemTotal))
  CloseFile(file)
  BZ2_bzclose(bz);

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 45
; FirstLine = 6
; Folding = -