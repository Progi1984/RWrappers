;================================================================
; Project   LibXML
; Title     Sample_12
; Author    Progi1984
; Date      18/02/2008
; Notes     XSD Schema Validation
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

Enumeration  -1
  #ERROR_OCCURED ; Error during the validation
  #NOT_VALID     ; The document is not valid
  #VALID         ; The document is valid
EndEnumeration
 
  ; Procedure for validating a DOM Tree with a XML Schema
  Procedure ValidateSchema(*doc.xmlDoc, *xml_schema)
    Protected ret.l
    Protected *schema.xmlSchema
    Protected *vctxt.xmlSchemaValidCtxt
    Protected *pctxt.xmlSchemaParserCtxt
    
    ; Open the XML Schema File
    *pctxt = xmlSchemaNewParserCtxt(*xml_schema)
    If *pctxt = #Null
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Loading content
    *schema = xmlSchemaParse(*pctxt)
    xmlSchemaFreeParserCtxt(*pctxt)
    If *schema = #Null
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Creation of the validation context
    *vctxt = xmlSchemaNewValidCtxt(*schema)
    If *vctxt = #Null
      xmlSchemaFree(*schema)
      ProcedureReturn #ERROR_OCCURED
    EndIf
    
    ; Validation
    If xmlSchemaValidateDoc(*vctxt, *doc) = 0
      ret = #VALID
    Else
      ret = #NOT_VALID
    EndIf
    ; Free Memory
    xmlSchemaFree(*schema)
    xmlSchemaFreeValidCtxt(*vctxt)
    
    ProcedureReturn ret
  EndProcedure

  Define *doc.xmlDoc

  xmlKeepBlanksDefault(0)
  ; Open the XML File
  *doc = xmlParseFile(@"Samples\Sample8.xml")
  If *doc = #Null
    Debug "ERROR > Invalid XML Document"
    End
  EndIf
  
  ; Validation
  If ValidateSchema(*doc, @"Samples\Sample8.xsd") = #VALID
    Debug "The document is valid"
  Else
    Debug "ERROR > The document is not valid or an error during the validation"
  EndIf
  ; Free Memory
  xmlFreeDoc(*doc)



; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = A+