;================================================================
; Project   LibXML
; Title     Sample_0
; Author    Progi1984
; Date      18/02/2008
; Notes     Main Example of LibXML Package
;================================================================

XIncludeFile "RW_LibXML2_Inc.pb"
EnableExplicit

  ;{ Structures
    Structure person ; A person record
      name.s
      email.s
      company.s
      organisation.s
      smail.s
      webPage.s
      phone.s
    EndStructure
    Structure job
      projectID.s
      application.s
      category.s
      contact.person
      nbDevelopers.l
      developers.person[100]  ; using dynamic alloc is left as an exercise
    EndStructure
    Structure gJob
      projectID.s
      application.s
      category.s
      *contact.person
      nbDevelopers.l
      nbJobs.l
      jobs.job[500] ; using dynamic alloc is left as an exercise
    EndStructure
  ;}

  ; And the code needed To parse it
  Procedure ParsePerson(*doc.xmlDoc, *ns.xmlNs, *cur.xmlNode)
    Protected *ret.person = #Null
    Debug "ParsePerson"
    
    ;allocate the struct
    *ret = AllocateMemory(SizeOf(person))
    If *ret = #Null
      Debug "ERROR > Out of memory"
  	  ProcedureReturn #Null
    EndIf
    
    ; We don't care what the top level element name is
    ; COMPAT xmlChildrenNode is a Macro unifying libxml1 And libxml2 names
    *cur = *cur\children
    While *cur <> #Null
      If (Not xmlStrcmp(@*cur\name, @"Person")) And (*cur\ns = *ns)
        *ret\name = PeekS(xmlNodeListGetString(*doc, *cur\children, 1))
      EndIf
      If (Not xmlStrcmp(@*cur\name, @"Email")) And (*cur\ns = *ns)
  	    *ret\email = PeekS(xmlNodeListGetString(*doc, *cur\children, 1))
  	  EndIf
  	  *cur = *cur\Next;
    Wend
    ProcedureReturn *ret
  EndProcedure
  ; And To print it
  Procedure PrintPerson(*cur.person)
    If (*cur = #Null) 
      ProcedureReturn;
    EndIf
    Debug "------ Person"
    If *cur\name 
      Debug(">name: "+ *cur\name)
    EndIf
    If *cur\email 
      Debug(">email: "+ *cur\email)
    EndIf
    If *cur\company 
      Debug(">company: "+ *cur\company)
    EndIf
    If *cur\organisation 
      Debug(">organisation: "+*cur\organisation)
    EndIf
    If *cur\smail 
      Debug(">smail: "+ *cur\smail)
    EndIf
    If *cur\webPage 
      Debug(">Web: "+ *cur\webPage)
    EndIf
    If *cur\phone 
      Debug(">phone: "+ *cur\phone)
    EndIf
    Debug("------");
  EndProcedure
  ; And the code needed To parse it
  Procedure ParseJob(*doc.xmlDoc, *ns.xmlNs, *cur.xmlNode)
    Protected *ret.job = #Null
    Protected *retcontact.person
    
    
    Debug("ParseJob");
    ; allocate the struct
    *ret = AllocateMemory(SizeOf(job))
    If *ret = #Null
      Debug "ERROR > Out of memory"
  	  ProcedureReturn #Null
    EndIf
  
    ; We don't care what the top level element name is
    *cur = *cur\Children
    While *cur <> #Null
      If (Not xmlStrcmp(@*cur\name, @"Project") And (*cur\ns = *ns))
  	    *ret\projectID = PeekS(xmlGetProp(*cur, @"ID"))
    	  If *ret\projectID =""
    		  Debug "ERROR > Project has no ID"
    	  EndIf
  	  EndIf
      If (Not xmlStrcmp(@*cur\name, @"Application") And (*cur\ns = *ns)) 
  	    *ret\application = PeekS(xmlNodeListGetString(*doc, *cur\children, 1))
  	  EndIf
      If (Not xmlStrcmp(@*cur\name, @"Category") And (*cur\ns = *ns))
  	    *ret\category = PeekS(xmlNodeListGetString(*doc, *cur\children, 1))
  	  EndIf
      If (Not xmlStrcmp(@*cur\name, @"Contact") And (*cur\ns = *ns))
  	    *retcontact = ParsePerson(*doc, *ns, *cur)
  	    *ret\contact\name.s = *retcontact\name
        *ret\contact\email.s = *retcontact\email
        *ret\contact\company.s = *retcontact\company
        *ret\contact\organisation.s = *retcontact\organisation
        *ret\contact\smail.s = *retcontact\smail
        *ret\contact\webPage.s = *retcontact\webPage
        *ret\contact\phone.s = *retcontact\phone
  	  EndIf
      *cur = *cur\Next;
    Wend
  
    ProcedureReturn *ret
  EndProcedure
  ; And To print it
  Procedure PrintJob(*cur.job)
    Protected i.l
    If *cur = #Null
      ProcedureReturn
    EndIf
    Debug "=======  Job"
    If *cur\projectID <> ""
      Debug "projectID: " + *cur\projectID
    EndIf
    If *cur\application <> ""
      Debug "application: " + *cur\application
    EndIf
    If *cur\category <> ""
      Debug "category: " + *cur\category
    EndIf
    If *cur\contact <> #Null
      PrintPerson(*cur\contact)
    EndIf
    Debug Str(*cur\nbDevelopers)+" developers"
    For i = 0 To *cur\nbDevelopers-1
      PrintPerson(*cur\developers[i])
      Debug ("=======")
    Next
  EndProcedure
  Procedure.l ParseGjobFile(filename.s)
    Protected *doc.xmlDoc
    Protected *ret.gJob
    Protected *curjob.job
    Protected *ns.xmlNs
    Protected *cur.xmlNode
    Protected Inc.l
    *doc = xmlParseFile(@filename);
    If *doc = #Null
      ProcedureReturn #Null
    EndIf
    ; Check the document is of the right kind
    *cur = xmlDocGetRootElement(*doc)
    If *cur = #Null
      Debug "ERROR > Empty document"
  	  xmlFreeDoc(*doc)
  	  ProcedureReturn #Null
    EndIf
    *ns = xmlSearchNsByHref(*doc, *cur,@"http://www.gnome.org/some-location")
    If *ns = #Null
      Debug "ERROR > Document of the wrong type, GJob Namespace not found"
  	  xmlFreeDoc(*doc);
  	  ProcedureReturn #Null
    EndIf
    If xmlStrcmp(@*cur\name, @"Helping")
      Debug "ERROR > Document of the wrong type, root node != Helping"
  	  xmlFreeDoc(*doc)
  	  ProcedureReturn #Null
    EndIf
  
    ; Allocate the Structure To be returned.
    *ret = AllocateMemory(SizeOf(gJob))
    If *ret = #Null
      Debug "ERROR > Out of memory"
  	  xmlFreeDoc(*doc);
  	  ProcedureReturn #Null
    EndIf
    ; Now, walk the tree.
    ; First level we expect just Jobs
    *cur = *cur\children
    While *cur And  xmlIsBlankNode(*cur)
  	  *cur = *cur\Next
    Wend
    If *cur = 0
  	  xmlFreeDoc(*doc)
  	  FreeMemory(*ret)
  	  ProcedureReturn #Null;
    EndIf
  
    If ((xmlStrcmp(@*cur\name, @"Jobs")) And (*cur\ns <> *ns))
      Debug "ERROR > Document of the wrong type, was '"+*cur\name+"', Jobs expected"
  	  xmlFreeDoc(*doc);
  	  FreeMemory(*ret);
  	  ProcedureReturn #Null
    EndIf
  
    ; Second level is a list of Job, but be laxist
    *cur = *cur\children
    While *cur <> #Null
      If (Not xmlStrcmp(@*cur\name, @"Job")) And (*cur\ns = *ns)
      	*curjob = ParseJob(*doc, *ns, *cur)
  	    If *curjob <> #Null
  	      *ret\jobs[*ret\nbJobs]\projectID = *curjob\projectID
  	      *ret\jobs[*ret\nbJobs]\application = *curjob\application
  	      *ret\jobs[*ret\nbJobs]\category = *curjob\category
  	      *ret\jobs[*ret\nbJobs]\contact\name = *curjob\contact\name
  	      *ret\jobs[*ret\nbJobs]\contact\email = *curjob\contact\email
  	      *ret\jobs[*ret\nbJobs]\contact\company = *curjob\contact\company
  	      *ret\jobs[*ret\nbJobs]\contact\organisation = *curjob\contact\organisation
  	      *ret\jobs[*ret\nbJobs]\contact\smail = *curjob\contact\smail
  	      *ret\jobs[*ret\nbJobs]\contact\webPage = *curjob\contact\webPage
  	      *ret\jobs[*ret\nbJobs]\contact\phone = *curjob\contact\phone
  	      *ret\jobs[*ret\nbJobs]\nbDevelopers = *curjob\nbDevelopers
  	      For Inc = 0 To 99
  	        *ret\jobs[*ret\nbJobs]\developers[Inc]\name = *curjob\developers[Inc]\name
  	        *ret\jobs[*ret\nbJobs]\developers[Inc]\email = *curjob\developers[Inc]\email
  	        *ret\jobs[*ret\nbJobs]\developers[Inc]\company = *curjob\developers[Inc]\company
  	        *ret\jobs[*ret\nbJobs]\developers[Inc]\organisation = *curjob\developers[Inc]\organisation
  	        *ret\jobs[*ret\nbJobs]\developers[Inc]\smail = *curjob\developers[Inc]\smail
  	        *ret\jobs[*ret\nbJobs]\developers[Inc]\webPage = *curjob\developers[Inc]\webPage
  	        *ret\jobs[*ret\nbJobs]\developers[Inc]\phone = *curjob\developers[Inc]\phone
  	      Next
  	      *ret\nbJobs + 1
          If *ret\nbJobs >= 500 
            Break
          EndIf
        EndIf
  	  EndIf
  	  *cur = *cur\Next;
    Wend
  
    ProcedureReturn *ret
  EndProcedure
  Procedure HandleGjob(*cur.gJob)
    Protected i.l
    ; Do whatever you want And free the Structure.
    Debug Str(*cur\nbJobs)+" Jobs registered"
    For i = 0 To *cur\nbJobs-1
      PrintJob(*cur\jobs[i])
    Next
  EndProcedure

  Define *cur.gJob
  Define *filename.s = "Samples\Sample0.xml"
  xmlKeepBlanksDefault(0)
  
  *cur = ParseGjobFile(*filename)
  If *cur
    HandleGjob(*cur);
  Else
	  Debug "ERROR > parsing file > "+*filename
  EndIf
  ;  Clean up everything Else before quitting.
  xmlCleanupParser()

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 9
; Folding = AAAAAAAw