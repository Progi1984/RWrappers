; Documentation
  ; http://xmlsoft.org/XSLT/EXSLT/html/libexslt-lib.html
XIncludeFile "RW_LibEXSLT_Res.pb"

;{ Imports }
  ImportC "libexslt.lib"
    exsltCommonRegister() As "_exsltCommonRegister"
    exsltCryptoRegister() As "_exsltCryptoRegister"
    exsltDateRegister() As "_exsltDateRegister"
    exsltDynRegister() As "_exsltDynRegister"
    exsltFuncRegister() As "_exsltFuncRegister"
    exsltMathRegister() As "_exsltMathRegister"
    exsltRegisterAll() As "_exsltRegisterAll"
    exsltSaxonRegister() As "_exsltSaxonRegister"
    exsltSetsRegister() As "_exsltSetsRegister"
    exsltStrRegister() As "_exsltStrRegister"
  EndImport
;}

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 18
; Folding = +