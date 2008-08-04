;================================================================
; Project   LibXML
; Title     Sample_6
; Author    Progi1984
; Date      18/02/2008
; Notes     Opens a XML File and Extracts the name of root element
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit
  
  Define *doc.xmlDoc
  Define *racine.xmlNode
  
  *doc = xmlParseFile(@"Samples\sample7.xml");
  If *doc = #Null
    Debug "ERROR > Document not parsed successfully"
    End
  EndIf
  
  *racine = xmlDocGetRootElement(*doc)
  If *racine = #Null
    Debug "ERROR > Empty Document"
    xmlFreeDoc(*doc)
    End
  EndIf
  Debug "Root Element > "+ *racine\name
  xmlFreeDoc(*doc)

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = 9