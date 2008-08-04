;================================================================
; Project   LibXML
; Title     Sample_13
; Author    Progi1984
; Date      18/02/2008
; Notes     Relax NG Validation
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

Enumeration -1
  #ERROR_OCCURED  ; Error during the validation
  #NOT_VALID      ; The document is not valid
  #VALID          ; The document is valid
EndEnumeration
 
; Procedure for validating a DOM Tree with a Relax NG Grammar
  Procedure ValidateRelaxNG(*doc.xmlDoc, *fichier_rng)
    Protected ret.l
    Protected *rng.xmlRelaxNG
    Protected *pctxt.xmlRelaxNGParserCtxt
    Protected *vctxt.xmlRelaxNGValidCtxt
    
    ; Opens the file Relax NG
    *pctxt = xmlRelaxNGNewParserCtxt(*fichier_rng)
    If *pctxt = #Null
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Loading of content
    *rng = xmlRelaxNGParse(*pctxt)
    xmlRelaxNGFreeParserCtxt(*pctxt)
    If *rng = #Null
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Creation of the validation context
    *vctxt = xmlRelaxNGNewValidCtxt(*rng)
    If *vctxt = #Null
      xmlRelaxNGFree(*rng)
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Validation
    If xmlRelaxNGValidateDoc(*vctxt, *doc) = 0
      ret = #VALID
    Else
      ret = #NOT_VALID
    EndIf
    ; Free memory
    xmlRelaxNGFreeValidCtxt(*vctxt)
    xmlRelaxNGFree(*rng)
    
    ProcedureReturn ret
  EndProcedure


  Define *doc.xmlDoc

  xmlKeepBlanksDefault(0)
  
  ; Open XML File
  *doc = xmlParseFile(@"Samples\Sample8.xml")
  If *doc = #Null
    Debug "ERROR > The document is not valid"
    End
  EndIf
  ; Validation
  If ValidateRelaxNG(*doc, @"Samples\Sample8.rng") = #VALID
    Debug "The document is valid"
  Else
    Debug "ERROR > The document is not valid or an error during the validation"
  EndIf
  ; Free memroy
  xmlFreeDoc(*doc)


; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = e+