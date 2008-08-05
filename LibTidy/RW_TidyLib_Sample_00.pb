XIncludeFile "RW_TidyLib_Inc.pb"
EnableExplicit

Global inputHTML.s = "<title>Foo</title><p>Foo!"
Global output.TidyBuffer
Global errbuf.TidyBuffer
Global rc.l = -1
Global ok.l
Global *tdoc.TidyDoc
  *tdoc = tidyCreate()
  Debug "Tidying:"+inputHTML
  ok = tidyOptSetBool(*tdoc, #TidyXhtmlOut, #True)
  Debug "Convert To XHTML >"+Str(ok)
  If ok
    rc = tidySetErrorBuffer(*tdoc, errbuf)
    Debug "Capture diagnostics> " + Str(rc)
  EndIf
  If rc >= 0
    rc = tidyParseString(*tdoc, inputHTML)
    Debug "Parse the input > "+Str(rc)
  EndIf
  If rc >= 0
    rc = tidyCleanAndRepair(*tdoc)
    Debug "Tidy it up! > "+Str(rc)
  EndIf
  If rc >= 0
    rc = tidyRunDiagnostics(*tdoc)
    Debug "Kvetch > "+Str(rc)
  EndIf
  If rc > 1
    rc = tidyOptSetBool(*tdoc, #TidyForceOutput, #True)
    Debug "If error, force output. > "+Str(rc)
  EndIf
  If rc >= 0
    rc = tidySaveBuffer(*tdoc, output)
    Debug "Pretty Print > "+Str(rc)
  EndIf
  If rc >= 0
    rc = tidySaveFile(*tdoc, "Samples\sample1.html")
    Debug "Save valid > "+Str(rc)
  EndIf
  If rc >= 0
    If rc > 0
      Debug "Diagnostics:"+ PeekS(errbuf\bp,-1,#PB_Ascii)
      Debug "And here is the result:" + PeekS(output\bp,-1,#PB_Ascii)
    EndIf
  Else
    Debug "A severe error ("+Str(rc)+") occurred."
  EndIf
  If output
    tidyBufFree(output)
  EndIf
  If errbuf
    tidyBufFree(errbuf)
  EndIf
  If *tdoc
    tidyRelease(*tdoc)
  EndIf 

; IDE Options = PureBasic 4.10 (Windows - x86)
; Folding = AA-
; EnableThread