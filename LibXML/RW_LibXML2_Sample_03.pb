;================================================================
; Project   LibXML
; Title     Sample_3
; Author    Progi1984
; Date      18/02/2008
; Notes     Code for Add Keyword Example
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

Procedure ParseStory(*doc.xmlDoc, *cur.xmlNode, *keyword)
	xmlNewTextChild(*cur, #Null, @"keyword", *keyword)
EndProcedure
Procedure ParseDoc(*docname, *keyword)
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
	
	*cur = *cur\Children
	While *cur <> #Null
		If Not xmlStrcmp(@*cur\name, @"storyinfo")
			ParseStory(*doc, *cur, *keyword);
		EndIf
  	*cur = *cur\Next
	Wend
	ProcedureReturn *doc
EndProcedure

  Define docname.s, keyword.s
  Define *doc.xmlDoc

	docname = "Samples\Sample1.xml"
	keyword = "newkeyword"
	*doc = ParseDoc (@docname, @keyword);
	If *doc <> #Null 
		xmlSaveFormatFile(@"Samples\Sample3.xml", *doc, 1)
		xmlFreeDoc(*doc)
	EndIf

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = A+