;================================================================
; Project   LibXML
; Title     Sample_10
; Author    Progi1984
; Date      18/02/2008
; Notes     SAX Parsing
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

  ;{ Constants
    #MAX_REF_LEN  = 6
    #PRIX_MAX     = 6
  ;}
  ;{ Enumerations
    Enumeration 
      #AUTRE
      #PRODUIT
      #INTITULE
      #PRIX
    EndEnumeration
  ;}
  ;{ Globals
    Global *Der_Ref
    Global *der_intitule
    Global elem_courant.l
  ;}

  ; Initialisation
  ProcedureC SAXDocStart(*user_data)
    *der_intitule = #Null
    elem_courant  = #AUTRE
    Debug  "Listing of products which have a price stricly inferior at "+Str(#PRIX_MAX)+" euros."
  EndProcedure
  ; Free Memory
  ProcedureC SAXDocEnd(*user_data)
  EndProcedure
  ; If the current element is 
  ; _ produit : we keep the reference
  ; _ intitule OR prix : we define the opening of the tag
  ProcedureC SAXElementStart(*user_data, *name, *attrs)
    Protected i.l, str.s
    If Not xmlStrcmp(*name, @"produit")
      If *attrs <> #Null
        i = 0
        Repeat
          str = PeekS(PeekL(*attrs+SizeOf(Long)*i))
          *Der_Ref = AllocateMemory(MemoryStringLength(@str))
          PokeS(*Der_Ref, Str)
          i+1
        Until PeekL(*attrs+SizeOf(Long)*i) = #Null
      EndIf
    ElseIf Not xmlStrcmp(*name, @"intitule")
      elem_courant = #INTITULE
    ElseIf Not xmlStrcmp(*name, @"prix")
      elem_courant = #PRIX
    EndIf
  EndProcedure
  ; Reinitialisation of marker which is used to know where we are in the XML Document
  ProcedureC SAXElementEnd(*user_data, *name)
    elem_courant = #AUTRE
  EndProcedure
  ; If the element where comes from the text is :
  ; _ intitule : we keep it
  ; _ prix : we debug
  ProcedureC SAXCharacters(*user_data, *ch, len.l)
    If elem_courant = #PRIX
      Protected prix.f
      prix = ValD(PeekS(*ch))
      If prix < #PRIX_MAX
        Debug "-> "+PeekS(*Der_Ref)+" : "+PeekS(*der_intitule)+" ("+StrF(prix)+" Euros)"
      EndIf
      FreeMemory(*der_intitule)
    ElseIf elem_courant = #INTITULE
      *der_intitule = AllocateMemory(len)
      CopyMemory(*ch,*der_intitule, len)
    EndIf
  EndProcedure

  Define *sh.xmlSAXHandler 
  *sh               = AllocateMemory(SizeOf(xmlSAXHandler))
  *sh\startDocument = @SAXDocStart()
  *sh\endDocument   = @SAXDocEnd()
  *sh\startElement  = @SAXElementStart()
  *sh\endElement    = @SAXElementEnd()
  *sh\characters    = @SAXCharacters()

  ; Parsing of XML Document
  If xmlSAXUserParseFile(*sh, #Null, @"Samples\Sample8.xml") <> 0
    Debug "ERROR > An error is arrived during the parsing"
  EndIf

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = AA+