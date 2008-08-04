;================================================================
; Project   LibXML
; Title     Sample_8
; Author    Progi1984
; Date      18/02/2008
; Notes     Count the number of nodes via XPath
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

  Define *doc.xmlDoc
  Define *ctxt.xmlXPathContext
  Define *xpathRes.xmlXPathObject
  
  *doc = xmlParseFile(@"Samples\Sample8.xml")

  ; Initialisation of XPath Environment
  xmlXPathInit()
  ; Création of context
  *ctxt = xmlXPathNewContext(*doc)
  If *ctxt = #Null
    Debug "ERROR > Error when it creates the XPath context"
    End
  EndIf

  ; Evaluation of XPath Expression
  *xpathRes = xmlXPathEvalExpression(@"count(//produit)", *ctxt)
  If *xpathRes = #Null
    Debug "ERROR > Error on the XPath expression"
    End
  EndIf

  ; Manipulation of the result
  If *xpathRes\type = #XPATH_NUMBER
    Debug "Number of products in the book : " + Str(xmlXPathCastToNumber(*xpathRes))
  EndIf
  
  ; Free memory
  xmlXPathFreeObject(*xpathRes)
  xmlXPathFreeContext(*ctxt)
; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = 5