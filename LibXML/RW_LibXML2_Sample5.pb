;================================================================
; Project   LibXML
; Title     Sample_5
; Author    Progi1984
; Date      18/02/2008
; Notes     Code for Retrieving Attribute Value Example
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

Procedure GetReference(*doc.xmlDoc, *cur.xmlNode)
  Protected *uri
	*cur = *cur\Children
	While *cur <> #Null
    If Not xmlStrcmp(@*cur\name, @"reference")
	    *uri = xmlGetProp(*cur, @"uri")
	    Debug "URI > " + PeekS(*uri)
	    xmlFree(*uri)
    EndIf
    *cur = *cur\Next
	Wend
EndProcedure
Procedure ParseDoc(*docname)
  Protected *doc.xmlDoc
	Protected *cur.xmlNode

	*doc = xmlParseFile(*docname)
	If *doc = #Null
		Debug "ERROR > Document not parsed successfully"
		ProcedureReturn #Null
	EndIf
	
	*cur = xmlDocGetRootElement(*doc)
	If *cur = #Null
		Debug "ERROR > Empty document"
		xmlFreeDoc(*doc)
		ProcedureReturn #Null
	EndIf
	
	If xmlStrcmp(@*cur\name, @"story")
		Debug "ERROR > Document of the wrong type, root node != story"
		xmlFreeDoc(*doc)
		ProcedureReturn #Null
	EndIf
	
	GetReference(*doc, *cur)
	xmlFreeDoc(*doc)
EndProcedure

	Define docname.s
	docname = "Samples\Sample4.xml"
	ParseDoc(@docname)

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = A-