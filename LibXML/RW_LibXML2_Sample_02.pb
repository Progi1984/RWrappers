;================================================================
; Project   LibXML
; Title     Sample_2
; Author    Progi1984
; Date      18/02/2008
; Notes     Code for XPath Example
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

Procedure GetDoc(*docname)
  Protected *doc.xmlDoc
	*doc = xmlParseFile(*docname)
	If *doc = #Null
		Debug "ERROR > Document not parsed successfully."
		ProcedureReturn #Null
	EndIf
  ProcedureReturn *doc
EndProcedure
Procedure GetNodeSet(*doc.xmlDoc, *xpath)
  Protected *context.xmlXPathContext
	Protected *result.xmlXPathObject
  Protected *ns.xmlNodeSet
	*context = xmlXPathNewContext(*doc)
	If *context = #Null
		Debug "ERROR > Error in xmlXPathNewContext"
		ProcedureReturn #Null
	EndIf
	
	*result = xmlXPathEvalExpression(*xpath, *context)
	xmlXPathFreeContext(*context)
	If *result = #Null
		Debug "ERROR > Error in xmlXPathEvalExpression"
		ProcedureReturn #Null
	EndIf
	
	*ns = *result\nodesetval
	If xmlXPathNodeSetIsEmpty(*ns)
		xmlXPathFreeObject(*result)
    Debug "ERROR > No result"
		ProcedureReturn #Null
	EndIf
	ProcedureReturn *result
EndProcedure

	Define docname.s
	Define *doc.xmlDoc
	Define *xpath = @"//keyword"
	Define *nodeset.xmlNodeSet
	Define *result.xmlXPathObject
	Define i.l
	Define *keyword
  Define *NodeTab.xmlNode
  
  docname = "Samples\Sample1.xml"
	*doc    = GetDoc(@docname);
	*result = GetNodeSet(*doc, *xpath)
	If *result
		*nodeset = *result\nodesetval
		For i = 0 To *nodeset\nodeNr - 1
		  *NodeTab = PeekL(*nodeset\nodeTab + i*SizeOf(Long))
			*keyword = xmlNodeListGetString(*doc, *NodeTab\children, 1)
		  If *keyword
		    Debug "keyword: " + PeekS(*keyword)
		    xmlFree(*keyword)
		  EndIf
		Next
		xmlXPathFreeObject(*result)
	EndIf
	xmlFreeDoc(*doc)
	xmlCleanupParser()

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 10
; Folding = A9