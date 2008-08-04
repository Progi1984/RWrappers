;================================================================
; Project   LibXML
; Title     Sample_1
; Author    Progi1984
; Date      18/02/2008
; Notes     Debugging childrens of <storyinfo>
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"

  Procedure ParseStory(*doc.xmlDoc, *cur.xmlNode)
  	Protected *key
  	*cur = *cur\Children
  	While *cur <> #Null
  	  If *cur\name <> "text"
  	    Debug "Name > " + *cur\name
  		  *key = xmlNodeListGetString(*doc, *cur\Children, 1)
  		  If *key
  		    Debug "Keyword > "+ PeekS(*key)
  		    xmlFree(*key)
  		  EndIf
  		  Debug "----------------------------------------"
      EndIf
  	  *cur = *cur\Next
  	Wend
    ProcedureReturn
  EndProcedure
  Procedure ParseDoc(docname.s)
    Protected *doc.xmlDoc
  	Protected *cur.xmlNode
  
  	*doc = xmlParseFile(@docname);
  	If *doc = #Null
  	  Debug "ERROR > Document not parsed successfully."
  		ProcedureReturn 
  	EndIf
  	
  	*cur = xmlDocGetRootElement(*doc)
  	If *cur = #Null
  		Debug "ERROR > Empty document"
  		xmlFreeDoc(*doc)
  		ProcedureReturn
  	EndIf
  	
  	If xmlStrcmp(@*cur\name, @"story")
  		Debug "ERROR > Document of the wrong type, root node != story"
  		xmlFreeDoc(*doc)
  		ProcedureReturn
  	EndIf
  	*cur = *cur\Children
  	While *cur <> #Null
  		If Not xmlStrcmp(@*cur\name, @"storyinfo")
  			ParseStory (*doc, *cur)
  		EndIf
  	  *cur = *cur\Next
  	Wend
  	
  	xmlFreeDoc(*doc);
  	ProcedureReturn;
  EndProcedure
  
  ParseDoc("Samples\Sample1.xml")
; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 24
; Folding = B9