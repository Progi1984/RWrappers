XIncludeFile "RW_gs_Inc.pb"

Global NewList ListSamples.s()
  AddElement(ListSamples()) : ListSamples() = "alphabet"
  AddElement(ListSamples()) : ListSamples() = "chess"
  AddElement(ListSamples()) : ListSamples() = "colorcir"
  AddElement(ListSamples()) : ListSamples() = "doretree"
  AddElement(ListSamples()) : ListSamples() = "escher"
  AddElement(ListSamples()) : ListSamples() = "grayalph"
  AddElement(ListSamples()) : ListSamples() = "snowflak"
  AddElement(ListSamples()) : ListSamples() = "vasarely"
  AddElement(ListSamples()) : ListSamples() = "waterfal"
   
Procedure ps2pdf(FileName.s)
  Protected gsargc = 10
  Protected code.l, code1.l
  Protected Dim  gsargv.s(gsargc)
    gsargv(0) = "ps2pdf"
    gsargv(1) = "-dNOPAUSE"
    gsargv(2) = "-dBATCH"
    gsargv(3) = "-dSAFER"
    gsargv(4) = "-sDEVICE=pdfwrite"
    gsargv(5) = "-sOutputFile=Samples\"+FileName+".pdf"
    gsargv(6) = "-c"
    gsargv(7) = ".setpdfwrite"
    gsargv(8) = "-f"
    gsargv(9) = "Samples\"+FileName+".ps"
  code = gsapi_new_instance(@minst, #Null)
  If code < 0
    Debug "Error : gsapi_new_instance > Error instanciation"
    ProcedureReturn #False
  EndIf
  
  code = gsapi_init_with_args(minst, gsargc, @gsargv())
  code1 = gsapi_exit(minst)
  If code = 0 And code = #e_Quit
    code = code1
  EndIf

  gsapi_delete_instance(minst)

  If code = 0 And code = #e_Quit
    ProcedureReturn #False
  Else
    ProcedureReturn #True
  EndIf
EndProcedure
Procedure PSGetInfos()
  Protected r.gsapi_revision_t
  If gsapi_revision(@r, SizeOf(r)) = 0
    Debug "Product : "      + PeekS(r\product,-1,#PB_Ascii)
    Debug "Copyright : "    + PeekS(r\copyright,-1,#PB_Ascii)
    Debug "Revision : "     + Str(r\revision)
    Debug "RevisionDate : " + Str(r\revisiondate)
    If (r\revision < 650)
      Debug ""
      Debug "Warning : Need at least Ghostscript 6.50"
      Debug ""
    EndIf
  Else
    Debug ""
    Debug "Warning : Revision structure size is incorrect"
    Debug ""
  EndIf
EndProcedure
  
  PSGetInfos()
  Debug "-----------------"
  ForEach ListSamples()
    RetValue = ps2pdf(ListSamples())
    Debug "State : "+ Str(RetValue) + " - Name : "+ListSamples()
  Next
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 2
; Folding = u-