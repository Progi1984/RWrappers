;================================================================
; Project   LibXSLT
; Title     Sample_0
; Author    Progi1984
; Date      07/03/2008
; Notes     Convert an XML file into HTML
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
XIncludeFile "RW_LibXSLT_Inc.pb"
XIncludeFile "RW_LibEXSLT_Inc.pb"


Global xmlLoadExtDtdDefaultValue.l

Global Dim params.s(17)
Global *cur.xsltStylesheet = #Null
Global *doc.xmlDoc, *res.xmlDoc

; Define your StyleSheet & File & OutputFile
Global XSLFile.s = "Samples\test.xsl"
Global XMLFile.s = "Samples\test.xml"
Global OutFile.s = "Samples\test.html"

xmlSubstituteEntitiesDefault(1)
xmlLoadExtDtdDefaultValue = 1
*cur = xsltParseStylesheetFile(@XSLFile)
*doc = xmlParseFile(@XMLFile)
*res = xsltApplyStylesheet(*cur, *doc, @params)
xsltSaveResultToFilename(@OutFile, *res, *cur, 0)

xsltFreeStylesheet(*cur)
xmlFreeDoc(*res)
xmlFreeDoc(*doc)
xsltCleanupGlobals()
xmlCleanupParser()

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 8
; Folding = -