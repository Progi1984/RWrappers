;{ Constantes }
  #XSLT_DEFAULT_VERSION     = "1.0"
  #XSLT_DEFAULT_VENDOR      = "libxslt"
  #XSLT_DEFAULT_URL         = "http://xmlsoft.org/XSLT/"
  #XSLT_NAMESPACE           = "http://www.w3.org/1999/XSL/Transform"

  #LIBXSLT_DOTTED_VERSION   = "1.1.22"
  #LIBXSLT_VERSION          = 10122
  #LIBXSLT_VERSION_STRING   = "10122"
  #LIBXSLT_VERSION_EXTRA    = ""
;}
;{ Enumeration }
  ; documents;  Interface For the document handling
  Enumeration ; xsltLoadType
    #XSLT_LOAD_START = 0      ; loading For a top stylesheet
    #XSLT_LOAD_STYLESHEET = 1 ; loading For a stylesheet include/Import
    #XSLT_LOAD_DOCUMENT = 2   ; loading document at transformation time
  EndEnumeration
  ; security;  Interface For the libxslt security framework
  Enumeration ; xsltSecurityOption
    #XSLT_SECPREF_READ_FILE = 1
    #XSLT_SECPREF_WRITE_FILE = 2
    #XSLT_SECPREF_CREATE_DIRECTORY = 3
    #XSLT_SECPREF_READ_NETWORK = 4
    #XSLT_SECPREF_WRITE_NETWORK = 5
  EndEnumeration
  ; xsltInternals;  internal Data structures, constants And functions
  Enumeration ; xsltErrorSeverityType
    #XSLT_ERROR_SEVERITY_ERROR = 0
    #XSLT_ERROR_SEVERITY_WARNING = 1
  EndEnumeration
  Enumeration ; xsltOutputType
    #XSLT_OUTPUT_XML = 0
    #XSLT_OUTPUT_HTML = 1
    #XSLT_OUTPUT_TEXT = 2
  EndEnumeration
  Enumeration ; xsltStyleType
    #XSLT_FUNC_COPY = 1
    #XSLT_FUNC_SORT = 2
    #XSLT_FUNC_TEXT = 3
    #XSLT_FUNC_ELEMENT = 4
    #XSLT_FUNC_ATTRIBUTE = 5
    #XSLT_FUNC_COMMENT = 6
    #XSLT_FUNC_PI = 7
    #XSLT_FUNC_COPYOF = 8
    #XSLT_FUNC_VALUEOF = 9
    #XSLT_FUNC_NUMBER = 10
    #XSLT_FUNC_APPLYIMPORTS = 11
    #XSLT_FUNC_CALLTEMPLATE = 12
    #XSLT_FUNC_APPLYTEMPLATES = 13
    #XSLT_FUNC_CHOOSE = 14
    #XSLT_FUNC_IF = 15
    #XSLT_FUNC_FOREACH = 16
    #XSLT_FUNC_DOCUMENT = 17
    #XSLT_FUNC_WITHPARAM = 18
    #XSLT_FUNC_PARAM = 19
    #XSLT_FUNC_VARIABLE = 20
    #XSLT_FUNC_WHEN = 21
    #XSLT_FUNC_EXTENSION = 22
    #XSLT_FUNC_OTHERWISE = 23
    #XSLT_FUNC_FALLBACK = 24
    #XSLT_FUNC_MESSAGE = 25
    #XSLT_FUNC_INCLUDE = 26
    #XSLT_FUNC_ATTRSET = 27
    #XSLT_FUNC_LITERAL_RESULT_ELEMENT = 28
    #XSLT_FUNC_UNKOWN_FORWARDS_COMPAT = 29
  EndEnumeration
  Enumeration ; xsltTransformState
    #XSLT_STATE_OK = 0
    #XSLT_STATE_ERROR = 1
    #XSLT_STATE_STOPPED = 2
  EndEnumeration
  ; xsltutils;  set of utilities For the XSLT engine
  Enumeration ; xsltDebugStatusCodes
    #XSLT_DEBUG_NONE = 0 ; no debugging allowed
    #XSLT_DEBUG_INIT = 1
    #XSLT_DEBUG_STEP = 2
    #XSLT_DEBUG_STEPOUT = 3
    #XSLT_DEBUG_NEXT = 4
    #XSLT_DEBUG_STOP = 5
    #XSLT_DEBUG_CONT = 6
    #XSLT_DEBUG_RUN = 7
    #XSLT_DEBUG_RUN_RESTART = 8
    #XSLT_DEBUG_QUIT = 9
  EndEnumeration
  Enumeration ; xsltDebugTraceCodes
    #XSLT_TRACE_ALL = -1
    #XSLT_TRACE_NONE = 0
    #XSLT_TRACE_COPY_TEXT = 1
    #XSLT_TRACE_PROCESS_NODE = 2
    #XSLT_TRACE_APPLY_TEMPLATE = 4
    #XSLT_TRACE_COPY = 8
    #XSLT_TRACE_COMMENT = 16
    #XSLT_TRACE_PI = 32
    #XSLT_TRACE_COPY_OF = 64
    #XSLT_TRACE_VALUE_OF = 128
    #XSLT_TRACE_CALL_TEMPLATE = 256
    #XSLT_TRACE_APPLY_TEMPLATES = 512
    #XSLT_TRACE_CHOOSE = 1024
    #XSLT_TRACE_IF = 2048
    #XSLT_TRACE_FOR_EACH = 4096
    #XSLT_TRACE_STRIP_SPACES = 8192
    #XSLT_TRACE_TEMPLATES = 16384
    #XSLT_TRACE_KEYS = 32768
    #XSLT_TRACE_VARIABLES = 65536
  EndEnumeration
;}
;{ Structures }
  ; numbersInternals;  Implementation of the XSLT number functions
  Structure xsltFormatNumberInfo
    integer_hash.l	;  Number of '#' in integer part
    integer_digits.l	;  Number of '0' in integer part
    frac_digits.l	;  Number of '0' in fractional part
    frac_hash.l	;  Number of '#' in fractional part
    group.l	;  Number of chars per display 'group'
    multiplier.l	;  Scaling For percent Or permille
    add_decimal.b	;  Flag For whether decimal point appears
    is_multiplier_set.b	;  Flag To catch multiple occurences of pe
    is_negative_pattern.b	;  Flag For processing -ve prefix/suffix
  EndStructure
  Structure xsltNumberData
    level.s
    count.s
    from.s
    value.s
    format.s
    has_format.l
    digitsPerGroup.l
    groupingCharacter.l
    groupingCharacterLen.l
    *doc.xmlDoc
    *node.xmlNode ;  * accelerators *
  EndStructure
  ; pattern;  Interface For the pattern matching used in template matches.
  Structure xsltCompMatch
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; security;  Interface For the libxslt security framework
  Structure xsltSecurityPrefs
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xsltInternals;  internal Data structures, constants And functions
  Structure xsltCompilerCtxt
    errorCtxt.l	; * used For error/warning reports; e.g. X
    errSeverity.l ; ENUM xsltErrorSeverityType
    warnings.l	; TODO; number of warnings found at compi
    errors.l	; TODO; number of errors found at compila
    *dict.xmlDict
    *style.xsltStylesheet
    simplified.l	; whether this is a simplified stylesheet
    depth.l	; Current depth of processing
    *inode.xsltCompilerNodeInfo
    *inodeList.xsltCompilerNodeInfo
    *inodeLast.xsltCompilerNodeInfo
    *tmpList.xsltPointerList	; * The XSLT version As specified by the s
    isInclude.l
    hasForwardsCompat.l	; whether forwards-compatible mode was us
    maxNodeInfos.l	; TEMP TODO; just For the interest
    maxLREs.l	; * In order To keep the old behaviour, ap
    strict.l
    *psData.xsltPrincipalStylesheetData
    *xpathCtxt.xmlXPathContext
    *unknownItem.xsltStyleItemUknown
    hasNsAliases.l	; Indicator If there was an xsl;namespace
    *nsAliases.xsltNsAlias
    *ivars.xsltVarInfo	; Storage of local in-scope variables/par
    *ivar.xsltVarInfo	; topmost local variable/param.
  EndStructure
  Structure xsltCompilerNodeInfo
    *Next.xsltCompilerNodeInfo
    *prev.xsltCompilerNodeInfo
    *node.xmlNode
    depth.l
    *templ.xsltTemplate	; The owning template
    category.l	; XSLT element, LR-element Or extension e
    type.l ; ENUM xsltStyleType
    *item.xsltElemPreComp	; The compiled information The current in
    *inScopeNs.xsltNsListContainer	; The current excluded result namespaces
    *exclResultNs.xsltPointerList	; The current extension instruction names
    *extElemNs.xsltPointerList	; The current info For literal result ele
    *litResElemInfo.xsltStyleItemLRElementInfo	; * Set To 1 If in-scope namespaces change
    nsChanged.l
    preserveWhitespace.l
    stripWhitespace.l
    isRoot.l	; whether this is the stylesheet's root n
    forwardsCompat.l	; whether forwards-compatible mode is ena
    extContentHandled.l	; the type of the current child
    curChildType.l ; ENUM xsltStyleType
  EndStructure
  Structure xsltDecimalFormat
    *Next.xsltDecimalFormat	; chained list
    name.s	; Used For interpretation of pattern
    digit.s
    patternSeparator.s	; May appear in result
    minusSign.s
    infinity.s
    noNumber.s	; Not-a-number Used For interpretation of
    decimalPoint.s
    grouping.s
    percent.s
    permille.s
    zeroDigit.s
  EndStructure
  Structure xsltDocument
    *Next.xsltDocument	; documents are kept in a chained list
    main.l	; is this the main document
    *doc.xmlDoc	; the parsed document
    keys.l	; key tables storage
    *includes.xsltDocument	; subsidiary includes
    preproc.l	; pre-processing already done
    nbKeysComputed.l
  EndStructure
  Structure xsltEffectiveNs
    *nextInStore.xsltEffectiveNs	; storage Next
    *Next.xsltEffectiveNs	; Next item in the list
    prefix.s
    nsName.s	; * Indicates If eclared on the literal re
    holdByElem.l
  EndStructure
  Structure xsltElemPreComp
    *Next.xsltElemPreComp	; Next item in the Global chained list ho
    type.l	; ENUM xsltStyleType type of the element
    *func	; handling function
    *inst.xmlNode	; the node in the stylesheet's tree corre
    *free	; xsltElemPreCompDeallocator the deallocator
  EndStructure
  Structure xsltKeyDef
    *Next.xsltKeyDef
    *inst.xmlNode
    name.s
    nameURI.s
    match.s
    use.s
    *comp.xmlXPathCompExpr
    *usecomp.xmlXPathCompExpr
    *nsList.xmlNs	; the namespaces in scope
    nsNr.l	; the number of namespaces in scope
  EndStructure
  Structure xsltKeyTable
    *Next.xsltKeyTable
    name.s
    nameURI.s
    *keys.xmlHashTable
  EndStructure
  Structure xsltNsAlias
    *Next.xsltNsAlias	; Next in the list
    *literalNs.xmlNs
    *targetNs.xmlNs
    *docOfTargetNs.xmlDoc
  EndStructure
  Structure xsltNsList
    *Next.xsltNsList	; Next in the list
    *ns.xmlNs
  EndStructure
  Structure xsltNsListContainer
    *list.xmlNs
    totalNumber.l
    xpathNumber.l
  EndStructure
  Structure xsltNsMap
    *Next.xsltNsMap	; Next in the list
    *doc.xmlDoc
    *elem.xmlNode	; the element holding the ns-decl
    *ns.xmlNs	; the xmlNs Structure holding the XML nam
    origNsName.s	; the original XML namespace name
    newNsName.s	; the mapped XML namespace name
  EndStructure
  Structure xsltPointerList
    *items
    number.l
    size.l
  EndStructure
  Structure xsltPrincipalStylesheetData
    *namespaceDict.xmlDict	; * Global list of in-scope namespaces. *
    *inScopeNamespaces.xsltPointerList	; * Global list of information For [xsl;]e
    *exclResultNamespaces.xsltPointerList	; * Global list of information For [xsl;]e
    *extElemNamespaces.xsltPointerList  
    *effectiveNs.xsltEffectiveNs	; * Namespace name map To get rid of strin
    *nsMap.xsltNsMap
  EndStructure
  Structure xsltRuntimeExtra
    *info	; pointer To the extra Data
    *deallocate	; pointer To the deallocation routine (xmlFreeFunc	)
  EndStructure
  Structure xsltStackElem
    *Next.xsltStackElem	; chained list
    *comp.xsltStylePreComp	; the compiled form
    computed.l	; was the evaluation done
    name.s	; the local part of the name QName
    nameURI.s	; the URI part of the name QName
    select_.s	; the eval string
    *tree.xmlNode	; the sequence constructor If no eval str
    *value.xmlXPathObject	; The value If computed
    *fragment.xmlDoc	; The Result Tree Fragments (needed For X
    level.l	; the depth in the tree; -1 if persistent
    *context.xsltTransformContext	; The transformation context; needed to c
    flags.l
  EndStructure
  Structure xsltStyleBasicEmptyItem
    ;The content of this Structure is Not made public by the API.
  EndStructure
  Structure xsltStyleBasicExpressionItem
    select_.s	; TODO; Change this To "expression".
    *comp.xmlXPathCompExpr	; TODO; Change this To compExpr.
  EndStructure
  Structure xsltStyleBasicItemVariable
    select_.s
    *comp.xmlXPathCompExpr
    name.s
    has_name.l
    ns.s
    has_ns.l
  EndStructure
  Structure xsltStyleItemApplyTemplates 
    mode.s	; apply-templates
    modeURI.s	; apply-templates
    select_.s	; sort, copy-of, value-of, apply-template
    *comp.xmlXPathCompExpr	; a precompiled XPath expression TODO; wi
  EndStructure
  Structure xsltStyleItemAttribute
    name.s
    has_name.l
    ns.s
    nsPrefix.s
    has_ns.l
  EndStructure
  Structure xsltStyleItemCallTemplate
    *templ.xsltTemplate	; call-template
    name.s	; element, attribute, pi
    has_name.l	; element, attribute, pi
    ns.s	; element
    has_ns.l	; element TODO; With-params
  EndStructure
  Structure xsltStyleItemCopy
    use.s	; copy, element
    has_use.l	; copy, element
  EndStructure
  Structure xsltStyleItemDocument
    ver11.l	; assigned; in xsltDocumentComp; read; no
    filename.s	; document URL
    has_filename.l
  EndStructure
  Structure xsltStyleItemElement
    use.s
    has_use.l
    name.s
    has_name.l
    ns.s
    nsPrefix.s
    has_ns.l
  EndStructure
  Structure xsltStyleItemExtElement
    *item.xsltElemPreComp
  EndStructure
  Structure xsltStyleItemIf
    test.s	; If
    *comp.xmlXPathCompExpr	; a precompiled XPath expression
  EndStructure
  Structure xsltStyleItemInclude
    *include.xsltDocument
  EndStructure
  Structure xsltStyleItemLRElementInfo
    *effectiveNs.xsltEffectiveNs
  EndStructure
  Structure xsltStyleItemMessage
    terminate.l
  EndStructure
  Structure xsltStyleItemNumber
    numdata.l	; xsltNumberData number
  EndStructure
  Structure xsltStyleItemOtherwise
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xsltStyleItemPI
    name.s
    has_name.l
  EndStructure
  Structure xsltStyleItemParam
    select_.s
    *comp.xmlXPathCompExpr
    name.s
    has_name.l
    ns.s
    has_ns.l
  EndStructure
  Structure xsltStyleItemSort
    stype.s	; sort
    has_stype.l	; sort
    number.l	; sort
    order.s	; sort
    has_order.l	; sort
    descending.l	; sort
    lang.s	; sort
    has_lang.l	; sort
    case_order.s	; sort
    lower_first.l	; sort
    use.s
    has_use.l
    select_.s	; sort, copy-of, value-of, apply-template
    *comp.xmlXPathCompExpr	; a precompiled XPath expression
  EndStructure
  Structure xsltStyleItemText
    noescape.l	; text
  EndStructure
  Structure xsltStyleItemUknown
    ;The content of this Structure is Not made public by the API.
  EndStructure
  Structure xsltStyleItemValueOf
    select_.s
    *comp.xmlXPathCompExpr	; a precompiled XPath expression
    noescape.l
  EndStructure
  Structure xsltStyleItemWhen
    test.s
    *comp.xmlXPathCompExpr
  EndStructure
  Structure xsltStylePreComp
    *Next.xsltElemPreComp	; chained list
    type.l	; ENUM xsltStyleType	type of the element
    *func	; FUNC xsltTransformFunction handling function 
    *inst.xmlNode	; * Pre computed values. *
    stype.s	; sort
    has_stype.l	; sort
    number.l	; sort
    order.s	; sort
    has_order.l	; sort
    descending.l	; sort
    lang.s	; sort
    has_lang.l	; sort
    case_order.s	; sort
    lower_first.l	; sort
    use.s	; copy, element
    has_use.l	; copy, element
    noescape.l	; text
    name.s	; element, attribute, pi
    has_name.l	; element, attribute, pi
    ns.s	; element
    has_ns.l	; element
    mode.s	; apply-templates
    modeURI.s	; apply-templates
    test.s	; If
    *templ.xsltTemplate	; call-template
    select_.s	; sort, copy-of, value-of, apply-template
    ver11.l	; document
    filename.s	; document URL
    has_filename.l	; document
    numdata.l	; xsltNumberData number
    *comp.xmlXPathCompExpr	; a precompiled XPath expression
    *nsList.xmlNs	; the namespaces in scope
    nsNr.l	; the number of namespaces in scope
  EndStructure
  Structure xsltStylesheet
    *parent.xsltStylesheet
    *Next.xsltStylesheet
    *imports.xsltStylesheet
    *docList.xsltDocument	; * General Data on the style sheet docume
    *doc.xmlDoc	; the parsed XML stylesheet
    *stripSpaces.xmlHashTable	; the hash table of the strip-space And p
    stripAll.l	; strip-space * (1) preserve-space * (-1)
    *cdataSection.xmlHashTable	; * Global variable Or parameters. *
    *variables.xsltStackElem	; * Template descriptions. *
    *templates.xsltTemplate	; the ordered list of templates
    *templatesHash	; hash table Or wherever compiled templat
    *rootMatch	; template based on /
    *keyMatch	; template based on key()
    *elemMatch	; template based on *
    *attrMatch	; template based on @*
    *parentMatch	; template based on ..
    *textMatch	; template based on text()
    *piMatch	; template based on processing-instructio
    *commentMatch	; * Namespace aliases. * NOTE; Not used in
    *nsAliases.xmlHashTable	; * Attribute sets. *
    *attributeSets.xmlHashTable	; * Namespaces. * TODO; Eliminate this. *
    *nsHash.xmlHashTable	; the set of namespaces in use; ATTENTION
    *nsDefs	; * Key definitions. *
    *keys	; * Output related stuff. *
    method.s	; the output method
    methodURI.s	; associated namespace If any
    version.s	; version string
    encoding.s	; encoding string
    omitXmlDeclaration.l	; * Number formatting. *
    *decimalFormat.xsltDecimalFormat
    standalone.l	; standalone = "yes" | "no"
    doctypePublic.s	; doctype-public string
    doctypeSystem.s	; doctype-system string
    indent.l	; should output being indented
    mediaType.s	; * Precomputed blocks. *
    *preComps.xsltElemPreComp	; list of precomputed blocks
    warnings.l	; number of warnings found at compilation
    errors.l	; number of errors found at compilation
    exclPrefix.s	; last excluded prefixes
    *exclPrefixTab.s	; array of excluded prefixes
    exclPrefixNr.l	; number of excluded prefixes in scope
    exclPrefixMax.l	; size of the array
    _private.l	; * Extensions. *
    *extInfos.xmlHashTable	; the extension Data
    extrasNr.l	; * For keeping track of nested includes *
    *includes.xsltDocument	; * dictionary; Shared between stylesheet,
    *dict.xmlDict	; * precompiled attribute value templates.
    *attVTs	; * If namespace-alias has an alias For th
    defaultAlias.s	; * bypass pre-processing (already done) (
    nopreproc.l	; * all document text strings were interna
    internalized.l	; * Literal Result Element As Stylesheet c
    literal_result.l	; * The principal stylesheet *
    *principal.xsltStylesheet	; * Compilation context used during compil
    *compCtxt.xsltCompilerCtxt	; TODO; Change this To (void *).
    *principalData.xsltPrincipalStylesheetData
  EndStructure
  Structure xsltTemplate
    *Next.xsltTemplate 	; chained list sorted by priority
    *style.xsltStylesheet	; the containing stylesheet
    match.s	; the matching string
    priority.f	; As given from the stylesheet, Not compu
    name.s	; the local part of the name QName
    nameURI.s	; the URI part of the name QName
    mode.s	; the local part of the mode QName
    modeURI.s	; the URI part of the mode QName
    *content.xmlNode	; the template replacement value
    *elem.xmlNode	; * TODO; @inheritedNsNr And @inheritedNs
    inheritedNsNr.l	; number of inherited namespaces
    *inheritedNs.xmlNs	; inherited non-excluded namespaces Profi
    nbCalls.l	; the number of time the template was cal
    time.l	; the time spent in this template
    *params	; xsl;param instructions
  EndStructure
  Structure xsltTransformCache
    *RVT.xmlDoc
    nbRVT.l
    *stackItems.xsltStackElem
    nbStackItems.l
    dbgCachedRVTs.l
    dbgReusedRVTs.l
    dbgCachedVars.l
    dbgReusedVars.l
  EndStructure
  Structure xsltTransformContext
    *style.xsltStylesheet	; the stylesheet used
    type.l	; ENUM xsltOutputType the type of output
    *templ.xsltTemplate	; the current template
    templNr.l	; Nb of templates in the stack
    templMax.l	; Size of the templtes stack
    *templTab.xsltTemplate	; the template stack
    *vars.xsltStackElem	; the current variable list
    varsNr.l	; Nb of variable list in the stack
    varsMax.l	; Size of the variable list stack
    *varsTab.xsltStackElem	; the variable list stack
    varsBase.l	; * Extensions *
    *extFunctions.xmlHashTable	; the extension functions
    *extElements.xmlHashTable	; the extension elements
    *extInfos.xmlHashTable	; the extension Data
    mode.s	; the current mode
    modeURI.s	; the current mode URI
    *docList.xsltDocument	; the document list
    *document.xsltDocument	; the current source document; can be NUL
    *node.xmlNode	; the current node being processed
    *nodeList.xmlNodeSet	; the current node list xmlNodePtr curren
    *output.xmlDoc	; the resulting document
    *insert.xmlNode	; the insertion node
    *xpathCtxt.xmlXPathContext	; the XPath context
    state.l 	; ENUM xsltTransformState * Global variables *
    *globalVars.xmlHashTable	; the Global variables And params
    *inst.xmlNode	; the instruction in the stylesheet
    xinclude.l	; should XInclude be processed
    outputFile.s	; the output URI If known
    profile.l	; is this run profiled
    prof.l	; the current profiled value
    profNr.l	; Nb of templates in the stack
    profMax.l	; Size of the templtaes stack
    profTab.l	; the profile template stack
    _private.l	; user defined Data
    extrasNr.l	; the number of extras used
    extrasMax.l	; the number of extras allocated
    *extras.xsltRuntimeExtra	; extra per runtime informations
    *styleList.xsltDocument	; the stylesheet docs list
    sec.l	; the security preferences If any
    *error	; FUNC xmlGenericErrorFunc a specific error handler
    errctx.l	; context For the error handler
    *sortfunc	; FUNC xsltSortFunc * handling of temporary Result Value Tre
    *tmpRVT.xmlDoc	; list of RVT without persistance
    *persistRVT.xmlDoc	; list of persistant RVTs
    ctxtflags.l	; * Speed optimization when coalescing tex
    lasttext.s	; last text node content
    lasttsize.l	; last text node size
    lasttuse.l	; * Per Context Debugging *
    debugStatus.l	; the context level Debug status
    traceCode.l	; pointer To the variable holding the mas
    parserOptions.l	; * dictionnary; Shared between stylesheet
    *dict.xmlDict
    *tmpDoc.xmlDoc	; * all document text strings are internal
    internalized.l
    nbKeys.l
    hasTemplKeyPatterns.l
    *currentTemplateRule.xsltTemplate	; the Current Template Rule
    *initialContextNode.xmlNode
    *initialContextDoc.xmlDoc
    *cache.xsltTransformCache
    contextVariable.l	; the current variable item
    *localRVT.xmlDoc	; list of local tree fragments; will be f
    *localRVTBase.xmlDoc
  EndStructure
  Structure xsltVarInfo
    *Next.xsltVarInfo	; Next in the list
    *prev.xsltVarInfo
    depth.l	; the depth in the tree
    name.s
    nsName.s
  EndStructure
;}

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 6
; Folding = AAAAAAAAAA-