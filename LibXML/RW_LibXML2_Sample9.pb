;================================================================
; Project   LibXML
; Title     Sample_9
; Author    Progi1984
; Date      18/02/2008
; Notes     Working on a XML configuration file
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit
 
  ;{ Structures
    Structure xmlConfig
      *fichier
      *doc.xmlDoc
      *racine.xmlNode
      *ctxt.xmlXPathContext
    EndStructure
  ;}

  ; Free memory used by xmlConfig
  Procedure FreeConfig(*conf.xmlConfig)
    xmlXPathFreeContext(*conf\ctxt)
    xmlFreeDoc(*conf\doc)
    FreeMemory(*conf)
  EndProcedure
  ; Initialisation and loading of XML File in memory
  Procedure LoadConfig(*fichier)
    Protected *conf.xmlConfig
    Protected *nullmem.xmlConfig
    
    *conf = AllocateMemory(SizeOf(xmlConfig)) 
    If *conf = #Null 
      Debug "ERROR > Error in memory allocation"
      ProcedureReturn #Null
    EndIf
    *conf\fichier = *fichier
    If *conf\fichier = #Null
      FreeConfig(*conf)
      Debug "ERROR > Error in name copy"
      ProcedureReturn #Null
    EndIf
    
    xmlKeepBlanksDefault(0)
    
    *conf\doc = xmlParseFile(*conf\fichier)
    If *conf\doc = #Null
      FreeConfig(*conf)
      Debug "ERROR > Error in XML parsing"
      ProcedureReturn #Null
    EndIf
    *conf\racine = xmlDocGetRootElement(*conf\doc)
    If *conf\racine <> #Null And xmlStrcasecmp(@*conf\racine\name, @"configuration")
      FreeConfig(*conf)
      Debug "ERROR > Error when getting root element" 
      ProcedureReturn #Null
    EndIf

    xmlXPathInit()
    
    *conf\ctxt = xmlXPathNewContext(*conf\doc)
    If *conf\ctxt = #Null
      FreeConfig(*conf)
      Debug "ERROR > Creation of context for XPath Request"
      ProcedureReturn #Null
    EndIf
    ProcedureReturn *conf
  EndProcedure
  ; Private Procedure returning the element <directive> with XPath in function of the attribute "nom"
  Procedure GetNodeByXpath(*conf.xmlConfig, *directive)
    Protected *xpathRes.xmlXPathObject
    Protected *n.xmlNode = #Null
    Protected *path, path_s.s
    path_s  = "/configuration/directive[@nom="+Chr(34)+PeekS(*directive)+Chr(34)+"]"
    *path   = @path_s
    ; Evaluation of the XPath expression
    *xpathRes = xmlXPathEvalExpression(@path_s, *conf\ctxt)
    If *xpathRes And *xpathRes\type = #XPATH_NODESET And *xpathRes\nodesetval\nodeNr = 1
      *n = PeekL(*xpathRes\nodesetval\nodeTab)
    EndIf
    xmlXPathFreeObject(*xpathRes)
  
    ProcedureReturn *n
  EndProcedure
  ; Returns the value of a directive
  Procedure GetConfig(*conf.xmlConfig, *directive)  
    Protected *n.xmlNode = GetNodeByXpath(*conf, *directive)
    If *n <> #Null
      ProcedureReturn xmlNodeGetContent(*n)
    EndIf
    ProcedureReturn #Null
  EndProcedure 
  ; Define the value of a directive if it is in the XML File else it's added
  Procedure SetConfig(*conf.xmlConfig, *directive, *valeur)
    Protected *n.xmlNode = GetNodeByXpath(*conf, *directive)
    Protected *new_dir.xmlNode
    If *n = #Null ; The directive doesn't exist : ADD
      *new_dir = xmlNewTextChild(*conf\racine, #Null, @"directive", *valeur)
      If *new_dir =#Null
        ProcedureReturn 0
      EndIf
      If xmlSetProp(*new_dir, @"nom", *directive) = #Null
        ProcedureReturn 0
      EndIf
    Else ; The directive exist : MODIFY
      xmlNodeSetContent(*n, *valeur)
    EndIf
    If xmlSaveFormatFile(*conf\fichier, *conf\doc, 1) > 0
      ProcedureReturn 1
    Else
      ProcedureReturn 0
    EndIf
  EndProcedure
  ; Print the value of a directive
  Procedure PrintConfig(*conf.xmlConfig, *directive)
    Protected *val = GetConfig(*conf, *directive)
    If *val = #Null
      Debug "Value of '"+PeekS(*directive)+"' : "+"(unknown directive)"
    Else
      Debug "Value of '"+PeekS(*directive)+"' : "+ PeekS(*val)
    EndIf
  EndProcedure
   
  Define *conf.xmlConfig
  Debug "====>Loading file and initialisation"
  *conf = LoadConfig(@"Samples\Sample10.xml")
  
  Debug "====>Get directives values"
  PrintConfig(*conf, @"verifier_version")
  PrintConfig(*conf, @"directive_inexistante")

  Debug "====>Add/Modify directives"
  SetConfig(*conf, @"verifier_version", @"Off")
  SetConfig(*conf, @"taille_police", @"12")

  Debug "====>Check modifications"
  PrintConfig(*conf, @"verifier_version")
  PrintConfig(*conf, @"taille_police")

  Debug "====>Free Memory"
  FreeConfig(*conf)


; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = CAF9