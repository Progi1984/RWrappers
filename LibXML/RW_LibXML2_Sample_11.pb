;================================================================
; Project   LibXML
; Title     Sample_11
; Author    Progi1984
; Date      18/02/2008
; Notes     DTD Validation
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit
 
Enumeration  -1
  #ERROR_OCCURED ; Error during the validation
  #NOT_VALID     ; The document is not valid
  #VALID         ; The document is valid
EndEnumeration

  ; Procedure for validating a DOM Tree with a DTD
  Procedure ValidateDTD(*doc.xmlDoc, *fichier_dtd)
    Protected ret.l
    Protected *dtd.xmlDtd
    Protected *vctxt.xmlValidCtxt
    
    ; Parsing DTD
    *dtd = xmlParseDTD(#Null, *fichier_dtd)
    If *dtd = #Null
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Creation of the validation context
    *vctxt = xmlNewValidCtxt()
    If *vctxt = #Null
      xmlFreeDtd(*dtd)
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Validation
    ret = xmlValidateDtd(*vctxt, *doc, *dtd)
    
    ; Free Memory
    xmlFreeValidCtxt(*vctxt)
    xmlFreeDtd(*dtd)
    
    ProcedureReturn ret
  EndProcedure

  Define *doc.xmlDoc

  xmlKeepBlanksDefault(0)
  ; Open XML File
  *doc = xmlParseFile(@"Samples\Sample8.xml")
  If *doc = #Null
    Debug "ERROR > Invalid XML Document"
    End
  EndIf
  
  ; Validation
  If ValidateDTD(*doc, @"Samples\Sample8.dtd") = #VALID
    Debug "The document is valid"
  Else
    Debug "ERROR > The document is not valid or an error during the validation"
  EndIf
  ; Free memory
  xmlFreeDoc(*doc)

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = g-