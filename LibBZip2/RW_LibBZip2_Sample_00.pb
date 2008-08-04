;================================================================
; Project   LibBZip2
; Title     Sample_00
; Author    Progi1984
; Date      20/03/08
; Notes     Read Content of the bz2 File
;================================================================
XIncludeFile "RW_LibBZip2_Inc.pb"

Debug "LibVersion >"+PeekS(BZ2_bzlibVersion())

filename.s  = "Samples\Sample_0.txt.bz2";
str.s       = "Ceci est une chaîne de test."

  ; Open file for writing
  bz = BZ2_bzopen(filename, "w")

  ; Write a string in the file
  BZ2_bzwrite(bz, @str, Len(str))

  ; Close the file
  BZ2_bzclose(bz);

  ; Open file for reading
  bz = BZ2_bzopen(filename, "r");
  
  ; Read 10 characters
  MemStr = AllocateMemory(10)
  BZ2_bzread(bz, MemStr, 10)
  str_ret.s  = PeekS(MemStr)
  Debug "10 >" + str_ret
  
  ; Read 30 following characters
  MemStr = AllocateMemory(30)
  BZ2_bzread(bz, MemStr, 30)
  str_ret.s  = PeekS(MemStr)
  Debug "30 >" + str_ret
  
  ; Close the file
  BZ2_bzclose(bz)

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 4
; Folding = -