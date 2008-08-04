;================================================================
; Project   LibXML
; Title     Sample_7
; Author    Progi1984
; Date      18/02/2008
; Notes     Parsing XML Document with prefixing or postfixing
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

Procedure DrawNode(*node.xmlNode)
  Protected *path.xmlNode, *content.xmlNode
  If *node\type = #XML_ELEMENT_NODE
    *path = xmlGetNodePath(*node)
    If *node\children <> #Null And *node\children\type = #XML_TEXT_NODE
      *content = xmlNodeGetContent(*node)
      Debug PeekS(*path)+ " -> "+PeekS(*content)
      xmlFree(*content)
    Else
      Debug PeekS(*path)
    EndIf
    xmlFree(*path)
  EndIf
EndProcedure
Procedure Parse_Prefixe(*node.xmlNode)
  Protected *n.xmlNode
  *n = *node
  Repeat
    DrawNode(*n)
    If (*n\type = #XML_ELEMENT_NODE) And (*n\children <> #Null)
      Parse_Prefixe(*n\children)
    EndIf
    *n = *n\Next
  Until *n=#Null
EndProcedure
Procedure Parse_Postfixe(*node.xmlNode)
  Protected *n.xmlNode
  *n = *node
  Repeat
    If (*n\type = #XML_ELEMENT_NODE) And (*n\children <> #Null)
      Parse_Postfixe(*n\children)
    EndIf
    DrawNode(*n)
    *n = *n\Next
  Until *n=#Null
EndProcedure

  Define *doc.xmlDoc
  Define *racine.xmlNode
 
  xmlKeepBlanksDefault(0)
  *doc = xmlParseFile(@"Samples\Sample8.xml")
  If *doc = #Null
    Debug "ERROR > Document XML not parsed successfully"
    End
  EndIf
  
  *racine = xmlDocGetRootElement(*doc)
  If *racine = #Null
    Debug "ERROR > Empty Document"
    xmlFreeDoc(*doc)
    End
  EndIf

  Debug "Prefixed path :"
  Parse_Prefixe(*racine)
  
  Debug(""):Debug("")
  
  Debug("Postfixed path :")
  Parse_Postfixe(*racine)
  xmlFreeDoc(*doc)

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = W0