;================================================================
; Project   LibXML
; Title     Sample_4
; Author    Progi1984
; Date      18/02/2008
; Notes     Code for Add Attribute Example
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

Procedure ParseDoc(*docname, *uri)
  Protected *doc.xmlDoc
  Protected *cur.xmlNode
  Protected *newnode.xmlNode
  Protected *newattr.xmlAttr

	*doc = xmlParseFile(*docname)
	If *doc = #Null
		Debug "ERROR > Document not parsed successfully."
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
	
	*newnode = xmlNewTextChild(*cur, #Null, @"reference", #Null)
	*newattr = xmlNewProp (*newnode, @"uri", *uri)
	ProcedureReturn *doc
EndProcedure

	Define docname.s, uri.s
	Define *doc.xmlDoc

	docname = "Samples\Sample1.xml"
	uri     = "URI_SAMPLE"
	*doc    = ParseDoc(@docname, @uri)
	If *doc <> #Null
		xmlSaveFormatFile (@"Samples\Sample4.xml", *doc, 1)
		xmlFreeDoc(*doc)
	EndIf

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = g