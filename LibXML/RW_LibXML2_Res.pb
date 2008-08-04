;{ Structures
  ; HTMLparser; Interface For an HTML 4.0 non-verifying parser
  Structure htmlElemDesc
    *name	        ; The tag name
    startTag.s	  ; Whether the start tag can be implied
    endTag.s	    ; Whether the End tag can be implied
    saveEndTag.s	; Whether the End tag should be saved
    empty.s	      ; Is this an empty element ?
    depr.s	      ; Is this a deprecated element ?
    dtd.l	          ; 1; only in Loose DTD, 2; only Frameset
    isinline.l	    ; is this a block 0 Or inline 1 element
    *desc	        ; the description NRK Jan.2003 * New fiel
    *subelts	    ; allowed sub-elements of this element
    *defaultsubelt; subelement For suggested auto-repair If
    *attrs_opt	  ; Optional Attributes
    *attrs_depr	  ; Additional deprecated attributes
    *attrs_req	  ; Required attributes
  EndStructure
  Structure htmlEntityDesc
    value.l	  ; the UNICODE value For the character
    *name     ; The entity name
    *desc     ; the description
  EndStructure
  ; catalog: interfaces To the Catalog handling system
  Structure xmlCatalog
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; chvalid: Unicode character range checking
  Structure xmlChLRange
    low.l
    high.l
  EndStructure
  Structure xmlChRangeGroup
    nbShortRange.l
    nbLongRange.l
    *shortRange.xmlChSRange	; points To an array of ranges
    *longRange.xmlChLRange
  EndStructure
  Structure xmlChSRange
    low.w
    high.w
  EndStructure
  ; debugXML: Tree debugging APIs
  Structure xmlShellCtxt
    *filename.w
    *doc.xmlDoc
    *node.xmlNode
    *pctxt.xmlXPathContext
    loaded.l
    output.l
    input.l ; xmlShellReadlineFunc
  EndStructure
  ; dict: string dictionnary
  Structure xmlDict
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; encoding: Interface For the encoding conversion functions
  Structure xmlCharEncodingHandler
    name.s
    input.l   ; xmlCharEncodingInputFunc	
    output.l  ; xmlCharEncodingOutputFunc	
    iconv_in.l
    iconv_out.l
  EndStructure
  ; globals: Interface For all Global variables of the library
  Structure xmlGlobalState
    xmlParserVersion.s
    *xmlDefaultSAXLocator.xmlSAXLocator
    *xmlDefaultSAXHandler.xmlSAXHandlerV1
    *docbDefaultSAXHandler.xmlSAXHandlerV1
    *htmlDefaultSAXHandler.xmlSAXHandlerV1
    xmlFree.l             ; xmlFreeFunc
    xmlMalloc.l           ; xmlMallocFunc
    xmlMemStrdup.l        ; xmlStrdupFunc
    xmlRealloc.l          ; xmlReallocFunc
    xmlGenericError.l     ; xmlGenericErrorFunc
    xmlStructuredError.l  ; xmlStructuredErrorFunc
    xmlGenericErrorContext.l
    oldXMLWDcompatibility.l
    *xmlBufferAllocScheme.xmlBufferAllocationScheme
    xmlDefaultBufferSize.l
    xmlSubstituteEntitiesDefaultValue.l
    xmlDoValidityCheckingDefaultValue.l
    xmlGetWarningsDefaultValue.l
    xmlKeepBlanksDefaultValue.l
    xmlLineNumbersDefaultValue.l
    xmlLoadExtDtdDefaultValue.l
    xmlParserDebugEntities.l
    xmlPedanticParserDefaultValue.l
    xmlSaveNoEmptyTags.l
    xmlIndentTreeOutput.l
    xmlTreeIndentString.s
    xmlRegisterNodeDefaultValue.l   ; xmlRegisterNodeFunc
    xmlDeregisterNodeDefaultValue.l ; xmlDeregisterNodeFunc
    xmlMallocAtomic.l ; xmlMallocFunc
    *xmlLastError.xmlError
    xmlParserInputBufferCreateFilenameValue.l ; xmlParserInputBufferCreateFilenameFunc
    xmlOutputBufferCreateFilenameValue.l      ; xmlOutputBufferCreateFilenameFunc
  EndStructure
  ; hash: Chained hash tables
  Structure xmlHashTable
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; list: lists interfaces
  Structure xmlLink
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlList
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; parser: the core parser module
  Structure xmlParserNodeInfo
    *node.xmlNode ; Position & line # that text that create
    begin_pos.l
    begin_line.l
    end_pos.l
    end_line.l
  EndStructure
  Structure xmlParserNodeInfoSeq
    maximum.l
    length.l
    *buffer.xmlParserNodeInfo
  EndStructure
  Structure xmlSAXHandlerV1
  	internalSubset.l ; internalSubsetSAXFunc
  	isStandalone.l ; isStandaloneSAXFunc
  	hasInternalSubset.l ; hasInternalSubsetSAXFunc
  	hasExternalSubset.l ; hasExternalSubsetSAXFunc
  	resolveEntity.l ; resolveEntitySAXFunc
  	getEntity.l ; getEntitySAXFunc
  	entityDecl.l ; entityDeclSAXFunc
  	notationDecl.l ; notationDeclSAXFunc
  	attributeDecl.l ; attributeDeclSAXFunc
  	elementDecl.l ; elementDeclSAXFunc
  	unparsedEntityDecl.l ; unparsedEntityDeclSAXFunc
  	setDocumentLocator.l ; setDocumentLocatorSAXFunc
  	startDocument.l ; startDocumentSAXFunc
  	endDocument.l ; endDocumentSAXFunc
  	startElement.l ; startElementSAXFunc
  	endElement.l ; endElementSAXFunc
  	reference.l ; referenceSAXFunc
  	characters.l ; charactersSAXFunc
  	ignorableWhitespace.l ; ignorableWhitespaceSAXFunc
  	processingInstruction.l ; processingInstructionSAXFunc
  	comment.l ; commentSAXFunc
  	warning.l ; warningSAXFunc
  	error.l ; errorSAXFunc
  	fatalError.l ; 	; fatalErrorSAXFunc unused error() get all the errors
  	getParameterEntity.l ; getParameterEntitySAXFunc
  	cdataBlock.l ; cdataBlockSAXFunc
  	externalSubset.l ; externalSubsetSAXFunc
    initialized.l ; 
  EndStructure
  ; pattern; pattern expression handling
  Structure xmlPattern
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlStreamCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; relaxng; implementation of the Relax-NG validation
  Structure xmlRelaxNG
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlRelaxNGParserCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlRelaxNGValidCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; schemasInternals; internal interfaces For XML Schemas
  Structure xmlSchemaAnnot
    *Next.xmlSchemaAnnot
    *content.xmlNode	; the annotation
  EndStructure
  Structure xmlSchemaAttribute
    *type.xmlSchemaTypeType
    *Next.xmlSchemaAttribute	; the Next attribute (Not used?)
    name.s	; the name of the declaration
    id.s	; Deprecated; not used
    ref.s	; Deprecated; not used
    refNs.s	; Deprecated; not used
    typeName.s	; the local name of the type definition
    typeNs.s	; the ns URI of the type definition
    *annotxmlSchemaAnnot
    *base.xmlSchemaType	; Deprecated; not used
    occurs.l	; Deprecated; not used
    defValue.s	; The initial value of the value constrai
    *subtypes.xmlSchemaType	; the type definition
    *node.xmlNode
    targetNamespace.s
    flags.l
    refPrefix.s	; Deprecated; not used
    *defVal.xmlSchemaVal	; The compiled value constraint
    *refDecl.xmlSchemaAttribute	; Deprecated; not used
  EndStructure
  Structure xmlSchemaAttributeGroup
    type.l  ;xmlSchemaTypeType	; The kind of type
    *Next.xmlSchemaAttribute	; the Next attribute If in a group ...
    name.s
    id.s
    ref.s	; Deprecated; not used
    refNs.s	; Deprecated; not used
    *annot.xmlSchemaAnnot
    *attributes.xmlSchemaAttribute	; Deprecated; not used
    *node.xmlNode
    flags.l
    *attributeWildcard.xmlSchemaWildcard
    refPrefix.s	; Deprecated; not used
    *refItem.xmlSchemaAttributeGroup	; Deprecated; not used
    targetNamespace.s
    attrUses.l
  EndStructure
  Structure xmlSchemaAttributeLink
     Next_.l ;xmlSchemaAttributeLink	; the Next attribute link ...
     attr.l ; xmlSchemaAttribute	; the linked attribute
  EndStructure
  Structure xmlSchemaElement
    type.l ; xmlSchemaTypeType		; The kind of type
    Next_.l  ; xmlSchemaType	; Not used?
    name.s
    id.s	; Deprecated; not used
    ref.s	; Deprecated; not used
    refNs.s	; Deprecated; not used
    *annot.xmlSchemaAnnot
    *subtypes.xmlSchemaType	; the type definition
    *attributes.xmlSchemaAttribute
    *node.xmlNode
    minOccurs.l	; Deprecated; not used
    maxOccurs.l	; Deprecated; not used
    flags.l
    targetNamespace.s
    namedType.s
    namedTypeNs.s
    substGroup.s
    substGroupNs.s
    scope.s
    value.s	; The original value of the value constra
    refDecl.l ; xmlSchemaElement	; This will now be used For the substitut
    *contModel.xmlRegexp	; Obsolete For WXS, maybe used For RelaxN
    contentType.l ; xmlSchemaContentType
    refPrefix.s	; Deprecated; not used
    *defVal.xmlSchemaVal	; The compiled value contraint.
    idcs.l	; The identity-constraint defs
  EndStructure
  Structure xmlSchemaFacet
    type.l ; xmlSchemaTypeType	; The kind of type
    Next_.l ; xmlSchemaFacet	; the Next type If in a sequence ...
    value.s	; The original value
    id.s	; Obsolete
    *annot.xmlSchemaAnnot
    *node.xmlNode
    fixed.l	; XML_SCHEMAS_FACET_PRESERVE, etc.
    whitespace.l
    *val.xmlSchemaVal	; The compiled value
    *regexp.xmlRegexp	; The regex For patterns
  EndStructure
  Structure xmlSchemaFacetLink
    Next_.l ; xmlSchemaFacetLink	; the Next facet link ...
    *facet.xmlSchemaFacet	; the linked facet
  EndStructure
  Structure xmlSchemaNotation
    type.l ; xmlSchemaTypeType	; The kind of type
    name.s
    *annot.xmlSchemaAnnot
    identifier.s
    targetNamespace.s
  EndStructure
  Structure xmlSchemaType
    type.l ; xmlSchemaTypeType		; The kind of type
    Next_.l ; xmlSchemaType	; the Next type If in a sequence ...
    name.s
    id.s	; Deprecated; not used
    ref.s	; Deprecated; not used
    refNs.s	; Deprecated; not used
    *annot.xmlSchemaAnnot
    *subtypes.xmlSchemaType
    *attributes.xmlSchemaAttribute	; Deprecated; not used
    *node.xmlNode
    minOccurs.l	; Deprecated; not used
    maxOccurs.l	; Deprecated; not used
    flags.l
    contentType.l ; xmlSchemaContentType	
    base.s	; Base type's local name
    baseNs.s	; Base type's target namespace
    *baseType.xmlSchemaType	; The base type component
    *facets.xmlSchemaFacet	; Local facets
    redef.l ; xmlSchemaType	; Deprecated; not used
    recurse.l	; Obsolete
    *attributeUses.xmlSchemaAttributeLink	; Deprecated; not used
    *attributeWildcard.xmlSchemaWildcard
    builtInType.l	; Type of built-in types.
    *memberTypes.xmlSchemaTypeLink	; member-types If a union type.
    *facetSet.xmlSchemaFacetLink	; All facets (incl. inherited)
    refPrefix.s	; Deprecated; not used
    *contentTypeDef.xmlSchemaType	; Used For the simple content of complex
    *contModel.xmlRegexp	; Holds the automaton of the content mode
    targetNamespace.s
    attrUses.l
  EndStructure
  Structure xmlSchemaTypeLink
    Next_.l	; xmlSchemaTypeLink  the Next type link ...
    *type.xmlSchemaType	; the linked type
  EndStructure
  Structure xmlSchemaVal
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlSchemaWildcard
    type.l ; xmlSchemaTypeType		; The kind of type
    id.s	; Deprecated; not used
    *annot.xmlSchemaAnnot
    *node.xmlNode
    minOccurs.l	; Deprecated; not used
    maxOccurs.l	; Deprecated; not used
    processContents.l
    any.l	; Indicates If the ns constraint is of ##
    *nsSet.xmlSchemaWildcardNs	; The list of allowed namespaces
    *negNsSet.xmlSchemaWildcardNs	; The negated namespace
    flags.l
  EndStructure
  Structure xmlSchemaWildcardNs
    Next_.l ; xmlSchemaWildcardNs	; the Next constraint link ...
    value.s	; the value
  EndStructure
  ; schematron; XML Schemastron implementation
  Structure xmlSchematron
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlSchematronParserCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlSchematronValidCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; threads; interfaces For thread handling
  Structure xmlMutex
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlRMutex
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; tree; interfaces For tree manipulation
  Structure xmlNode
      *private	          ; application Data
      type.l	            ; xmlElementType > type number, must be second !
      name.s	            ; the name of the node, Or the entity
      *children.xmlNode	  ; parent->childs link
      *last.xmlNode	      ; last child link
      *parent.xmlNode	    ; child->parent link
      *Next.xmlNode	      ; Next sibling link
      *prev.xmlNode	      ; previous sibling link
      *doc.xmlDoc	        ; the containing document End of common p
      *ns.xmlNs	          ; pointer To the associated namespace
      content.s	          ; the content
      *properties.xmlAttr	; properties list
      *nsDef.xmlNs	      ; namespace definitions on this node
      *psvi 	            ; For type/PSVI informations
      line.l	            ; line number
      extra.l	            ; extra Data For XPath/XSLT
    EndStructure
  Structure xmlAttr
    *_private	; application Data
    type.l	; XML_ATTRIBUTE_NODE, must be second !
    name.s	; the name of the property
    *children.xmlNode	; the value of the property
    *last.xmlNode	; NULL
    *parent.xmlNode	; child->parent link
    *Next.xmlNode	; Next sibling link
    *prev.xmlAttr	; previous sibling link
    *doc.xmlDoc	; the containing document
    ns.l	; pointer To the associated namespace
    atype.l	; the attribute type If validating
    *psvi	; For type/PSVI informations
  EndStructure
  Structure xmlAttribute
    _private.l	; application Data
    type.l  ;xmlElementType	; XML_ATTRIBUTE_DECL, must be second !
    name.s	; Attribute name
    *children.xmlNode 	; NULL
    *last.xmlNode 	; NULL
    *parent.xmlDtd	; -> DTD
    *Next_.xmlNode	; Next sibling link
    *prev.xmlNode	; previous sibling link
    *doc.xmlDoc	; the containing document
    *nexth.xmlAttribute	; Next in hash table
    atype.l ; xmlAttributeType	; The attribute type
    def.l ;xmlAttributeDefault	; the Default
    defaultValue.s	; Or the Default value
    *tree.xmlEnumeration	; Or the Enumeration tree If any
    prefix.s	; the namespace prefix If any
    elem.s	; Element holding the attribute
  EndStructure
  Structure xmlBuffer
    content.s	; The buffer content UTF8
    use.l	    ; The buffer size used
    size.l	  ; The buffer size
    alloc.l     ; xmlBufferAllocationScheme	; The realloc method
  EndStructure
  Structure xmlDOMWrapCtxt
    _private.l	        ; * The type of this context, just in Case
    type.l	            ; * Internal namespace map used For variou
    namespaceMap.l	    ; * Use this one To acquire an xmlNsPtr in
    *getNsForNodeFunc   ;xmlDOMWrapAcquireNsFunction
  EndStructure
  Structure xmlDtd
    private.l           ; application Data
    type.l              ; xmlElementType > XML_DTD_NODE, must be second !
    name.s              ; Name of the DTD
    *children.xmlNode   ; the value of the property link
    *last.xmlNode       ; last child link
    *parent.xmlDoc      ; child->parent link
    *Next.xmlNode       ; Next sibling link
    *prev.xmlNode       ; previous sibling link
    *doc.xmlDoc         ; the containing document End of common p
    notations.l         ; Hash table For notations If any
    elements.l          ; Hash table For elements If any
    attributes.l        ; Hash table For attributes If any
    entities.l          ; Hash table For entities If any
    ExternalID.s        ; External identifier For PUBLIC DTD
    SystemID.s          ; URI For a SYSTEM Or PUBLIC DTD
    pentities.l         ; Hash table For param entities If any
  EndStructure
  Structure xmlNs
    *Next.xmlNs	        ; Next Ns link For this node
    type.l        		  ; xmlNsType > Global Or local
    href.s	            ; URL For the namespace
    prefix.s	          ; prefix For the namespace
    private.l	          ; application Data
    *context.xmlDoc	    ; normally an xmlDoc
  EndStructure
  Structure xmlDoc
    _private.l	        ; application Data
    type.l              ; xmlElementType >  XML_DOCUMENT_NODE, must be second !
    name.s              ; name/filename/URI of the document
    children.xmlNode    ; the document tree
    *last.xmlNode       ; last child link
    *parent.xmlNode     ; child->parent link
    *Next.xmlNode       ; Next sibling link
    *prev.xmlNode       ; previous sibling link
    *doc.xmlDoc         ; autoreference To itself End of common p
    compression.l       ; level of zlib compression
    standalone.l        ; standalone document (no external refs)
    intSubset.xmlDtd    ; the document internal subset
    extSubset.xmlDtd    ; the document external subset
    oldNs.xmlNs         ; Global namespace, the old way
    version.s           ; the XML version string
    encoding.s          ; external initial encoding, If any
    ids.l               ; Hash table For ID attributes If any
    refs.l              ; Hash table For IDREFs attributes If any
    URL.s               ; The URI For that document
    charset.l           ; encoding of the in-memory content actua
    dict.xmlDict        ; dict used To allocate names Or NULL
    psvi.l              ; For type/PSVI informations
  EndStructure
  Structure xmlElement
    _private.l	; application Data
    type.l          ; xmlElementType	; XML_ELEMENT_DECL, must be second !
    name.s	; Element name
    *children.xmlNode	; NULL
    *last.xmlNode	; NULL
    *parent.xmlDtd	; -> DTD
    *Next_.xmlNode	; Next sibling link
    *prev.xmlNode	; previous sibling link
    *doc.xmlDoc	; the containing document
    etype.l ; xmlElementTypeVal	; The type
    *content.xmlElementContent	; the allowed element content
    *attributes.xmlAttribute	; List of the declared attributes
    prefix.s	; the namespace prefix If any
    *contModel.xmlRegexp	; the validating regexp
    contModelL.l
  EndStructure
  Structure xmlElementContent
    type.l ; xmlElementContentType		; PCDATA, ELEMENT, SEQ Or Or
    ocur.l  ; xmlElementContentOccur	; ONCE, OPT, MULT Or PLUS
    name.s	; Element name
    *c1.xmlElementContent	; first child
    *c2.xmlElementContent	; second child
    *parent.xmlElementContent	; parent
    prefix.s	; Namespace prefix
  EndStructure
  Structure xmlEntity
    _private.l	; application Data
    type.l  ;xmlElementType	; XML_ENTITY_DECL, must be second !
    name.s	; Entity name
    *children.xmlNode	; First child link
    *last.xmlNode	; Last child link
    *parent.xmlDtd	; -> DTD
    *Next_.xmlNode	; Next sibling link
    *prev.xmlNode; previous sibling link
    *doc.xmlDoc	; the containing document
    orig.s	; content without ref substitution
    content.s	; content Or ndata If unparsed
    length.l	; the content length
    etype.l ; xmlEntityType	; The entity type
    ExternalID.s	; External identifier For PUBLIC
    SystemID.s	; URI For a SYSTEM Or PUBLIC Entity
    *nexte.xmlEntity	; unused
    URI.s	; the full URI As computed
    owner.l	; does the entity own the childrens
    checked.l         ; was the entity content checked
  EndStructure
  Structure xmlEnumeration
    *Next_.xmlEnumeration	; Next one
    name.s	              ; Enumeration name
  EndStructure
  Structure xmlID
    *Next_.xmlID 	; Next ID
    value.s	; The ID name
    *attr.xmlAttr	; The attribute holding it
    name.s	; The attribute If attr is Not available
    lineno.l	; The line number If attr is Not availabl
    *doc.xmlDoc 	; The document holding the ID
  EndStructure
  Structure xmlNotation
    name.s	; Notation name
    PublicID.s	; Public identifier, If any
    SystemID.s	; System identifier, If any
  EndStructure
  Structure xmlOutputBuffer
    context.l
    *writecallback ; xmlOutputWriteCallback
    *closecallback ;xmlOutputCloseCallback
    *encoder.xmlCharEncodingHandler	; I18N conversions To UTF-8
    *buffer.xmlBuffer	; Local buffer encoded in UTF-8 Or ISOLat
    *conv.xmlBuffer	; If encoder != NULL buffer For output
    written.l	; total number of byte written
    error.l
  EndStructure
  Structure xmlParserCtxt
    *sax.xmlSAXHandler	; The SAX handler
    userData.l	; For SAX Interface only, used by DOM bui
    *myDoc.xmlDoc	; the document being built
    wellFormed.l	; is the document well formed
    replaceEntities.l	; shall we replace entities ?
    version.s	; the XML version string
    encoding.s	; the declared encoding, If any
    standalone.l	; standalone document
    html.l	; an HTML(1)/Docbook(2) document Input st
    *input.xmlParserInput	; Current input stream
    inputNr.l	; Number of current input streams
    inputMax.l	; Max number of input streams
    *inputTab.xmlParserInput	; stack of inputs Node analysis stack onl
    *node.xmlNode	; Current parsed Node
    nodeNr.l	; Depth of the parsing stack
    nodeMax.l	; Max depth of the parsing stack
    *nodeTab.xmlNode	; array of nodes
    record_info.l	; Whether node info should be kept
    node_seq.l	; xmlParserNodeInfoSeq ; info about each node parsed
    errNo.l	; error code
    hasExternalSubset.l	; reference And external subset
    hasPErefs.l	; the internal subset has PE refs
    external.l	; are we parsing an external entity
    valid.l	; is the document valid
    validate.l	; shall we try To validate ?
    *vctxt.xmlValidCtxt	; The validity context
    *instate.xmlParserInputState	; current type of input
    token.l	; Next char look-ahead
    directory.s	; the Data directory Node name stack
    name.s	; Current parsed Node
    nameNr.l	; Depth of the parsing stack
    nameMax.l	; Max depth of the parsing stack
    *nameTab.s	; array of nodes
    nbChars.l	; number of xmlChar processed
    checkIndex.l	; used by progressive parsing lookup
    keepBlanks.l	; ugly but ...
    disableSAX.l	; SAX callbacks are disabled
    inSubset.l	; Parsing is in int 1/ext 2 subset
    intSubName.s	; name of subset
    extSubURI.s	; URI of external subset
    extSubSystem.s	; SYSTEM ID of external subset xml;space
    space.l	; Should the parser preserve spaces
    spaceNr.l	; Depth of the parsing stack
    spaceMax.l	; Max depth of the parsing stack
    spaceTab.l	; array of space infos
    depth.l	; To prevent entity substitution loops
    *entity.xmlParserInput	; used To check entities boundaries
    charset.l	; encoding of the in-memory content actua
    nodelen.l	; Those two fields are there To
    nodemem.l	; Speed up large node parsing
    pedantic.l	; signal pedantic warnings
    _private.l	; For user Data, libxml won't touch it
    loadsubset.l	; should the external subset be loaded
    linenumbers.l	; set line number in element content
    catalogs.l	; document's own catalog
    recovery.l	; run in recovery mode
    progressive.l	; is this a progressive parsing
    *dict.xmlDict	; dictionnary For the parser
    atts.s	; array For the attributes callbacks
    maxatts.l	; the size of the array
    docdict.l	; * pre-interned strings *
    str_xml.s
    str_xmlns.s
    str_xml_ns.s	; * Everything below is used only by the n
    sax2.l	; operating in the new SAX mode
    nsNr.l	; the number of inherited namespaces
    nsMax.l	; the size of the arrays
    *nsTab	; the array of prefix/namespace name
    attallocs.l	; which attribute were allocated
    pushTab.l	; array of Data For push
    *attsDefault.xmlHashTable	; defaulted attributes If any
    *attsSpecial.xmlHashTable	; non-CDATA attributes If any
    nsWellFormed.l	; is the document XML Nanespace okay
    options.l	; * Those fields are needed only For tream
    dictNames.l	; Use dictionary names For the tree
    freeElemsNr.l	; number of freed element nodes
    *freeElems.xmlNode	; List of freed element nodes
    freeAttrsNr.l	; number of freed attributes nodes
    *freeAttrs.xmlAttr	; * the complete error informations For th
    *lastError.xmlError
    *parseMode.xmlParserMode	; the parser mode
  EndStructure
  Structure xmlParserInput
    *buf.xmlParserInputBuffer	; UTF-8 encoded buffer
    filename.s	; The file analyzed, If any
    directory.s	; the directory/base of the file
    base.s	; Base of the array To parse
    cur.s	; Current char being parsed
    End_.s	; End of the array To parse
    length.l	; length If known
    line.l	; Current line
    col.l	; * NOTE; consumed is only tested For equa
    consumed.l	; How many xmlChars already consumed
    *free	; xmlParserInputDeallocate; function To deallocate the base
    encoding.s	; the encoding string For entity
    version.s	; the version string For entity
    standalone.l	; Was that entity marked standalone
    id.l	; an unique identifier For the entity
  EndStructure
  Structure xmlParserInputBuffer
    context.l
    *readcallback  ; xmlInputReadCallback
    *closecallback ;xmlInputCloseCallback
    *encoder.xmlCharEncodingHandler	; I18N conversions To UTF-8
    *buffer.xmlBuffer	; Local buffer encoded in UTF-8
    *raw.xmlBuffer	; If encoder != NULL buffer For raw input
    compressed.l	; -1=unknown, 0=Not compressed, 1=compres
    error.l
    rawconsumed.l	; amount consumed from raw
  EndStructure
  Structure xmlRef
    *Next_.xmlRef	; Next Ref
    value.s	; The Ref name
    *attr.xmlAttr	; The attribute holding it
    name.s	; The attribute If attr is Not available
    lineno.l	; The line number If attr is Not availabl
  EndStructure
  Structure xmlSAXHandler
    *internalSubset
    *isStandalone
    *hasInternalSubset
    *hasExternalSubset
    *resolveEntity
    *getEntity
    *entityDecl
    *notationDecl
    *attributeDecl
    *elementDecl
    *unparsedEntityDecl
    *setDocumentLocator
    *startDocument
    *endDocument
    *startElement
    *endElement
    *reference
    *characters
    *ignorableWhitespace
    *processingInstruction
    *comment
    *warning
    *error
    *fatalError	; unused error() get all the errors
    *getParameterEntity
    *cdataBlock
    *externalSubset
    initialized.l	; The following fields are extensions ava
    *_private
    *startElementNs
    *endElementNs
    *serror
  EndStructure
  Structure xmlSAXLocator
    *getPublicId
    *getSystemId
    *getLineNumber
    *getColumnNumber
  EndStructure
  ; uri; library of generic URI related routines
  Structure xmlURI
    scheme.s	; the URI scheme
    opaque.s	; opaque part
    authority.s	; the authority part
    server.s	; the server part
    user.s	; the user part
    port.l	; the port number
    path.s	; the path string
    query.s	; the query string (deprecated - use With
    fragment.s	; the fragment identifier
    cleanup.l	; parsing potentially unclean URI
    query_raw.s	; the query string (As it appears in the
  EndStructure
  ; valid; The DTD validation
  Structure xmlAttributeTable
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlElementTable
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlIDTable
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlNotationTable
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlRefTable
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlValidCtxt
    *userData	; user specific Data block
    *error	; the callback in Case of errors
    *warning	; the callback in Case of warning Node an
    *node.xmlNode	; Current parsed Node
    nodeNr.l	; Depth of the parsing stack
    nodeMax.l	; Max depth of the parsing stack
    *nodeTab.xmlNode	; array of nodes
    finishDtd.l	; finished validating the Dtd ?
    *doc.xmlDoc	; the document
    valid.l	; temporary validity check result state s
    *vstate.xmlValidState	; current state
    vstateNr.l	; Depth of the validation stack
    vstateMax.l; Max depth of the validation stack
    *vstateTab.xmlValidState	; array of validation states
    *am.xmlAutomata	; the automata
    *state.xmlAutomataStatePtr	; used To build the automata
    *am_
    *state_
  EndStructure
  Structure xmlValidState
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xinclude; implementation of XInclude
  Structure xmlXIncludeCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xlink; unfinished XLink detection module
  Structure xlinkHandler
    *simple   ; xlinkSimpleLinkFunk
    *extended ; xlinkExtendedLinkFunk	
    *set      ; xlinkExtendedLinkSetFunk
  EndStructure
  ; xmlautomata; API To build regexp automata
  Structure xmlAutomata
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlAutomataState
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xmlerror; error handling
  Structure xmlError
    domain.l	; What part of the library raised this er
    code.l	; The error code, e.g. an xmlParserError
    *message.s	; human-readable informative error messag
    level.l	; how consequent is the error
    *file.s	; the filename
    line.l	; the line number If available
    *str1.s	; extra string information
    *str2.s	; extra string information
    *str3.s	; extra string information
    int1.l	; extra number information
    int2.l	; column number of the error Or 0 If N/A
    ctxt.l	; the parser context If available
    node.l	; the node in the tree
  EndStructure
  ; xmlmodule; dynamic module loading
  Structure xmlModule
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xmlreader; the XMLReader implementation
  Structure xmlTextReader
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xmlregexp; regular expressions handling
  Structure xmlExpCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlExpNode
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xmlsave; the XML document serializer
  Structure xmlSaveCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xmlschemas; incomplete XML Schemas Structure implementation
  Structure xmlSchema
    name.s	; schema name
    targetNamespace.s	; the target namespace
    version.s
    id.s	; Obsolete
    *doc.xmlDoc
    *annot.xmlSchemaAnnotPtr
    flags.l
    *typeDecl
    *attrDecl.xmlHashTable
    *attrgrpDecl.xmlHashTable
    *elemDecl.xmlHashTable
    *notaDecl.xmlHashTable
    *schemasImports.xmlHashTable
    *_private	; unused by the library For users Or bind
    *groupDecl.xmlHashTable
    *dict.xmlDict
    *includes	; the includes, this is opaque For now
    preserve.l	; whether To free the document
    counter.l	; used To give ononymous components uniqu
    *idcDef.xmlHashTable	; All identity-constraint defs.
    *volatiles	; Obsolete
  EndStructure
  Structure xmlSchemaParserCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlSchemaSAXPlug
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlSchemaValidCtxt
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xmlwriter; text writing API For XML
  Structure xmlTextWriter
    ; The content of this Structure is Not made public by the API.
  EndStructure
  ; xpath; XML Path Language implementation
  Structure xmlNodeSet
    nodeNr.l	; number of nodes in the set
    nodeMax.l	; size of the array As allocated
    *nodeTab.xmlNode	; array of nodes in no particular order @
  EndStructure
  Structure xmlXPathAxis
    name.s	; the axis name
    func.l	; the search function
  EndStructure
  Structure xmlXPathCompExpr
    ; The content of this Structure is Not made public by the API.
  EndStructure
  Structure xmlXPathContext
    *doc.xmlDoc	; The current document
    *node.xmlNode	; The current node
    nb_variables_unused.l	; unused (hash table)
    max_variables_unused.l	; unused (hash table)
    *varHash.xmlHashTable	; Hash table of defined variables
    nb_types.l	; number of defined types
    max_types.l	; max number of types
    *types.xmlXPathType	; Array of defined types
    nb_funcs_unused.l	; unused (hash table)
    max_funcs_unused.l	; unused (hash table)
    *funcHash.xmlHashTable	; Hash table of defined funcs
    nb_axis.l	; number of defined axis
    max_axis.l	; max number of axis
    *axis.xmlXPathAxis	; Array of defined axis the namespace nod
    *namespaces.xmlNs	; Array of namespaces
    nsNr.l	; number of namespace in scope
    *user	; function To free extra variables
    contextSize.l	; the context size
    proximityPosition.l	; the proximity position extra stuff For
    xptr.l	; is this an XPointer context?
    *here.xmlNode	; For here()
    *origin.xmlNode	; For origin() the set of namespace decla
    *nsHash.xmlHashTable	; The namespaces hash table
    *varLookupFunc.xmlXPathVariableLookupFunc	; variable lookup func
    *varLookupData	; variable lookup Data Possibility To lin
    *extra	; needed For XSLT The function name And U
    *function.s
    *functionURI.s	; function lookup function And Data
    *funcLookupFunc.xmlXPathFuncLookupFunc	; function lookup func
    *funcLookupData	; function lookup Data temporary namespac
    *tmpNsList.xmlNs	; Array of namespaces
    tmpNsNr.l	; number of namespaces in scope error rep
    *userData	; user specific Data block
    error.l	; the callback in Case of errors
    *lastError.xmlError	; the last error
    *debugNode.xmlNode	; the source node XSLT dictionary
    *dict.xmlDict	; dictionary If any
    flags.l	; flags To control compilation Cache For
    *cache
  EndStructure
  Structure xmlXPathType
    *name.s	; the type name
    func.l  ; the conversion function
  EndStructure
  Structure xmlXPathObject
    type.l
    *nodesetval.xmlNodeSet
    boolval.l
    floatval.d
    stringval.s
    *user
    index.l
    *user2
    index2.l
  EndStructure
  ; xpointer; API To handle XML Pointers
  Structure xmlLocationSet
    locNr.l	; number of locations in the set
    locMax.l	; size of the array As allocated
    *locTab.xmlXPathObject	; array of locations
  EndStructure
;}

;{ Enumerations
  ;{ xmlElementType, xmlNsType
    #XML_ELEMENT_NODE = 1
    #XML_ATTRIBUTE_NODE = 2
    #XML_TEXT_NODE = 3
    #XML_CDATA_SECTION_NODE = 4
    #XML_ENTITY_REF_NODE = 5
    #XML_ENTITY_NODE = 6
    #XML_PI_NODE = 7
    #XML_COMMENT_NODE = 8
    #XML_DOCUMENT_NODE = 9
    #XML_DOCUMENT_TYPE_NODE = 10
    #XML_DOCUMENT_FRAG_NODE = 11
    #XML_NOTATION_NODE = 12
    #XML_HTML_DOCUMENT_NODE = 13
    #XML_DTD_NODE = 14
    #XML_ELEMENT_DECL = 15
    #XML_ATTRIBUTE_DECL = 16
    #XML_ENTITY_DECL = 17
    #XML_NAMESPACE_DECL = 18
    #XML_XINCLUDE_START = 19
    #XML_XINCLUDE_END = 20
    #XML_DOCB_DOCUMENT_NODE = 21
  ;}
  ;{ xmlErrorLevel
    #XML_ERR_NONE = 0
    #XML_ERR_WARNING = 1 ; A simple warning
    #XML_ERR_ERROR = 2 ; A recoverable error
    #XML_ERR_FATAL = 3 ; A fatal error
  ;}
  ;{ xmlXPathObjectType
    #XPATH_UNDEFINED = 0
    #XPATH_NODESET = 1
    #XPATH_BOOLEAN = 2
    #XPATH_NUMBER = 3
    #XPATH_STRING = 4
    #XPATH_POINT = 5
    #XPATH_RANGE = 6
    #XPATH_LOCATIONSET = 7
    #XPATH_USERS = 8
    #XPATH_XSLT_TREE = 9 ; An XSLT value tree, non modifiable
  ;}
  ; HTMLparser; Interface For an HTML 4.0 non-verifying parser
  Enumeration ; htmlParserOption 
    #HTML_PARSE_RECOVER = 1 ; Relaxed parsing
    #HTML_PARSE_NOERROR = 32 ; suppress error reports
    #HTML_PARSE_NOWARNING = 64 ; suppress warning reports
    #HTML_PARSE_PEDANTIC = 128 ; pedantic error reporting
    #HTML_PARSE_NOBLANKS = 256 ; remove blank nodes
    #HTML_PARSE_NONET = 2048 ; Forbid network access
    #HTML_PARSE_COMPACT = 65536 ; compact small text nodes
  EndEnumeration
  Enumeration ; htmlStatus 
    #HTML_NA = 0 ; something we don't check at all
    #HTML_INVALID = 1
    #HTML_DEPRECATED = 2
    #HTML_VALID = 4
    #HTML_REQUIRED = 12 ; VALID bit set so ( & #HTML_VALID ) is TRUE
  EndEnumeration
  ; catalog; interfaces To the Catalog handling system
  Enumeration ; xmlCatalogAllow 
    #XML_CATA_ALLOW_NONE = 0
    #XML_CATA_ALLOW_GLOBAL = 1
    #XML_CATA_ALLOW_DOCUMENT = 2
    #XML_CATA_ALLOW_ALL = 3
  EndEnumeration
  Enumeration ; xmlCatalogPrefer 
    #XML_CATA_PREFER_NONE = 0
    #XML_CATA_PREFER_PUBLIC = 1
    #XML_CATA_PREFER_SYSTEM = 2
  EndEnumeration
  ; encoding; Interface For the encoding conversion functions
  Enumeration ; xmlCharEncoding 
    #XML_CHAR_ENCODING_ERROR = -1 ; No char encoding detected
    #XML_CHAR_ENCODING_NONE = 0 ; No char encoding detected
    #XML_CHAR_ENCODING_UTF8 = 1 ; UTF-8
    #XML_CHAR_ENCODING_UTF16LE = 2 ; UTF-16 little endian
    #XML_CHAR_ENCODING_UTF16BE = 3 ; UTF-16 big endian
    #XML_CHAR_ENCODING_UCS4LE = 4 ; UCS-4 little endian
    #XML_CHAR_ENCODING_UCS4BE = 5 ; UCS-4 big endian
    #XML_CHAR_ENCODING_EBCDIC = 6 ; EBCDIC uh!
    #XML_CHAR_ENCODING_UCS4_2143 = 7 ; UCS-4 unusual ordering
    #XML_CHAR_ENCODING_UCS4_3412 = 8 ; UCS-4 unusual ordering
    #XML_CHAR_ENCODING_UCS2 = 9 ; UCS-2
    #XML_CHAR_ENCODING_8859_1 = 10 ; ISO-8859-1 ISO Latin 1
    #XML_CHAR_ENCODING_8859_2 = 11 ; ISO-8859-2 ISO Latin 2
    #XML_CHAR_ENCODING_8859_3 = 12 ; ISO-8859-3
    #XML_CHAR_ENCODING_8859_4 = 13 ; ISO-8859-4
    #XML_CHAR_ENCODING_8859_5 = 14 ; ISO-8859-5
    #XML_CHAR_ENCODING_8859_6 = 15 ; ISO-8859-6
    #XML_CHAR_ENCODING_8859_7 = 16 ; ISO-8859-7
    #XML_CHAR_ENCODING_8859_8 = 17 ; ISO-8859-8
    #XML_CHAR_ENCODING_8859_9 = 18 ; ISO-8859-9
    #XML_CHAR_ENCODING_2022_JP = 19 ; ISO-2022-JP
    #XML_CHAR_ENCODING_SHIFT_JIS = 20 ; Shift_JIS
    #XML_CHAR_ENCODING_EUC_JP = 21 ; EUC-JP
    #XML_CHAR_ENCODING_ASCII = 22 ; pure ASCII
  EndEnumeration
  ; entities; Interface For the XML entities handling
  Enumeration ; xmlEntityType 
    #XML_INTERNAL_GENERAL_ENTITY = 1
    #XML_EXTERNAL_GENERAL_PARSED_ENTITY = 2
    #XML_EXTERNAL_GENERAL_UNPARSED_ENTITY = 3
    #XML_INTERNAL_PARAMETER_ENTITY = 4
    #XML_EXTERNAL_PARAMETER_ENTITY = 5
    #XML_INTERNAL_PREDEFINED_ENTITY = 6
  EndEnumeration
  ; parser; the core parser module
  Enumeration ; xmlFeature 
    #XML_WITH_THREAD = 1
    #XML_WITH_TREE = 2
    #XML_WITH_OUTPUT = 3
    #XML_WITH_PUSH = 4
    #XML_WITH_READER = 5
    #XML_WITH_PATTERN = 6
    #XML_WITH_WRITER = 7
    #XML_WITH_SAX1 = 8
    #XML_WITH_FTP = 9
    #XML_WITH_HTTP = 10
    #XML_WITH_VALID = 11
    #XML_WITH_HTML = 12
    #XML_WITH_LEGACY = 13
    #XML_WITH_C14N = 14
    #XML_WITH_CATALOG = 15
    #XML_WITH_XPATH = 16
    #XML_WITH_XPTR = 17
    #XML_WITH_XINCLUDE = 18
    #XML_WITH_ICONV = 19
    #XML_WITH_ISO8859X = 20
    #XML_WITH_UNICODE = 21
    #XML_WITH_REGEXP = 22
    #XML_WITH_AUTOMATA = 23
    #XML_WITH_EXPR = 24
    #XML_WITH_SCHEMAS = 25
    #XML_WITH_SCHEMATRON = 26
    #XML_WITH_MODULES = 27
    #XML_WITH_DEBUG = 28
    #XML_WITH_DEBUG_MEM = 29
    #XML_WITH_DEBUG_RUN = 30
    #XML_WITH_ZLIB = 31
    #XML_WITH_NONE = 99999 ; just To be sure of allocation size
  EndEnumeration
  Enumeration ; xmlParserInputState 
    #XML_PARSER_EOF = -1 ; nothing is To be parsed
    #XML_PARSER_START = 0 ; nothing has been parsed
    #XML_PARSER_MISC = 1 ; Misc* before int subset
    #XML_PARSER_PI = 2 ; Within a processing instruction
    #XML_PARSER_DTD = 3 ; within some DTD content
    #XML_PARSER_PROLOG = 4 ; Misc* after internal subset
    #XML_PARSER_COMMENT = 5 ; within a comment
    #XML_PARSER_START_TAG = 6 ; within a start tag
    #XML_PARSER_CONTENT = 7 ; within the content
    #XML_PARSER_CDATA_SECTION = 8 ; within a CDATA section
    #XML_PARSER_END_TAG = 9 ; within a closing tag
    #XML_PARSER_ENTITY_DECL = 10 ; within an entity declaration
    #XML_PARSER_ENTITY_VALUE = 11 ; within an entity value in a decl
    #XML_PARSER_ATTRIBUTE_VALUE = 12 ; within an attribute value
    #XML_PARSER_SYSTEM_LITERAL = 13 ; within a SYSTEM value
    #XML_PARSER_EPILOG = 14 ; the Misc* after the last End tag
    #XML_PARSER_IGNORE = 15 ; within an IGNORED section
    #XML_PARSER_PUBLIC_LITERAL = 16 ; within a PUBLIC value
  EndEnumeration
  Enumeration ; xmlParserMode 
    #XML_PARSE_UNKNOWN = 0
    #XML_PARSE_DOM = 1
    #XML_PARSE_SAX = 2
    #XML_PARSE_PUSH_DOM = 3
    #XML_PARSE_PUSH_SAX = 4
    #XML_PARSE_READER = 5
  EndEnumeration
  ; pattern; pattern expression handling
  Enumeration ; xmlPatternFlags 
    #XML_PATTERN_DEFAULT = 0 ; simple pattern match
    #XML_PATTERN_XPATH = 1 ; standard XPath pattern
    #XML_PATTERN_XSSEL = 2 ; XPath subset For schema selector
    #XML_PATTERN_XSFIELD = 4 ; XPath subset For schema field
  EndEnumeration
  ; relaxng; implementation of the Relax-NG validation
  Enumeration ; xmlRelaxNGParserFlag 
    #XML_RELAXNGP_NONE = 0
    #XML_RELAXNGP_FREE_DOC = 1
    #XML_RELAXNGP_CRNG = 2
  EndEnumeration
  Enumeration ; xmlRelaxNGValidErr 
    #XML_RELAXNG_OK = 0
    #XML_RELAXNG_ERR_MEMORY = 1
    #XML_RELAXNG_ERR_TYPE = 2
    #XML_RELAXNG_ERR_TYPEVAL = 3
    #XML_RELAXNG_ERR_DUPID = 4
    #XML_RELAXNG_ERR_TYPECMP = 5
    #XML_RELAXNG_ERR_NOSTATE = 6
    #XML_RELAXNG_ERR_NODEFINE = 7
    #XML_RELAXNG_ERR_LISTEXTRA = 8
    #XML_RELAXNG_ERR_LISTEMPTY = 9
    #XML_RELAXNG_ERR_INTERNODATA = 10
    #XML_RELAXNG_ERR_INTERSEQ = 11
    #XML_RELAXNG_ERR_INTEREXTRA = 12
    #XML_RELAXNG_ERR_ELEMNAME = 13
    #XML_RELAXNG_ERR_ATTRNAME = 14
    #XML_RELAXNG_ERR_ELEMNONS = 15
    #XML_RELAXNG_ERR_ATTRNONS = 16
    #XML_RELAXNG_ERR_ELEMWRONGNS = 17
    #XML_RELAXNG_ERR_ATTRWRONGNS = 18
    #XML_RELAXNG_ERR_ELEMEXTRANS = 19
    #XML_RELAXNG_ERR_ATTREXTRANS = 20
    #XML_RELAXNG_ERR_ELEMNOTEMPTY = 21
    #XML_RELAXNG_ERR_NOELEM = 22
    #XML_RELAXNG_ERR_NOTELEM = 23
    #XML_RELAXNG_ERR_ATTRVALID = 24
    #XML_RELAXNG_ERR_CONTENTVALID = 25
    #XML_RELAXNG_ERR_EXTRACONTENT = 26
    #XML_RELAXNG_ERR_INVALIDATTR = 27
    #XML_RELAXNG_ERR_DATAELEM = 28
    #XML_RELAXNG_ERR_VALELEM = 29
    #XML_RELAXNG_ERR_LISTELEM = 30
    #XML_RELAXNG_ERR_DATATYPE = 31
    #XML_RELAXNG_ERR_VALUE = 32
    #XML_RELAXNG_ERR_LIST = 33
    #XML_RELAXNG_ERR_NOGRAMMAR = 34
    #XML_RELAXNG_ERR_EXTRADATA = 35
    #XML_RELAXNG_ERR_LACKDATA = 36
    #XML_RELAXNG_ERR_INTERNAL = 37
    #XML_RELAXNG_ERR_ELEMWRONG = 38
    #XML_RELAXNG_ERR_TEXTWRONG = 39
  EndEnumeration
  ; schemasInternals; internal interfaces For XML Schemas
  Enumeration ; xmlSchemaContentType 
    #XML_SCHEMA_CONTENT_UNKNOWN = 0
    #XML_SCHEMA_CONTENT_EMPTY = 1
    #XML_SCHEMA_CONTENT_ELEMENTS = 2
    #XML_SCHEMA_CONTENT_MIXED = 3
    #XML_SCHEMA_CONTENT_SIMPLE = 4
    #XML_SCHEMA_CONTENT_MIXED_OR_ELEMENTS = 5 ; Obsolete
    #XML_SCHEMA_CONTENT_BASIC = 6
    #XML_SCHEMA_CONTENT_ANY = 7
  EndEnumeration
  Enumeration ; xmlSchemaTypeType 
    #XML_SCHEMA_TYPE_BASIC = 1 ; A built-in datatype
    #XML_SCHEMA_TYPE_ANY = 2
    #XML_SCHEMA_TYPE_FACET = 3
    #XML_SCHEMA_TYPE_SIMPLE = 4
    #XML_SCHEMA_TYPE_COMPLEX = 5
    #XML_SCHEMA_TYPE_SEQUENCE = 6
    #XML_SCHEMA_TYPE_CHOICE = 7
    #XML_SCHEMA_TYPE_ALL = 8
    #XML_SCHEMA_TYPE_SIMPLE_CONTENT = 9
    #XML_SCHEMA_TYPE_COMPLEX_CONTENT = 10
    #XML_SCHEMA_TYPE_UR = 11
    #XML_SCHEMA_TYPE_RESTRICTION = 12
    #XML_SCHEMA_TYPE_EXTENSION = 13
    #XML_SCHEMA_TYPE_ELEMENT = 14
    #XML_SCHEMA_TYPE_ATTRIBUTE = 15
    #XML_SCHEMA_TYPE_ATTRIBUTEGROUP = 16
    #XML_SCHEMA_TYPE_GROUP = 17
    #XML_SCHEMA_TYPE_NOTATION = 18
    #XML_SCHEMA_TYPE_LIST = 19
    #XML_SCHEMA_TYPE_UNION = 20
    #XML_SCHEMA_TYPE_ANY_ATTRIBUTE = 21
    #XML_SCHEMA_TYPE_IDC_UNIQUE = 22
    #XML_SCHEMA_TYPE_IDC_KEY = 23
    #XML_SCHEMA_TYPE_IDC_KEYREF = 24
    #XML_SCHEMA_TYPE_PARTICLE = 25
    #XML_SCHEMA_TYPE_ATTRIBUTE_USE = 26
    #XML_SCHEMA_FACET_MININCLUSIVE = 1000
    #XML_SCHEMA_FACET_MINEXCLUSIVE = 1001
    #XML_SCHEMA_FACET_MAXINCLUSIVE = 1002
    #XML_SCHEMA_FACET_MAXEXCLUSIVE = 1003
    #XML_SCHEMA_FACET_TOTALDIGITS = 1004
    #XML_SCHEMA_FACET_FRACTIONDIGITS = 1005
    #XML_SCHEMA_FACET_PATTERN = 1006
    #XML_SCHEMA_FACET_Enumeration ; = 1007
    #XML_SCHEMA_FACET_WHITESPACE = 1008
    #XML_SCHEMA_FACET_LENGTH = 1009
    #XML_SCHEMA_FACET_MAXLENGTH = 1010
    #XML_SCHEMA_FACET_MINLENGTH = 1011
    #XML_SCHEMA_EXTRA_QNAMEREF = 2000
    #XML_SCHEMA_EXTRA_ATTR_USE_PROHIB = 2001
  EndEnumeration
  Enumeration ; xmlSchemaValType 
    #XML_SCHEMAS_UNKNOWN = 0
    #XML_SCHEMAS_STRING = 1
    #XML_SCHEMAS_NORMSTRING = 2
    #XML_SCHEMAS_DECIMAL = 3
    #XML_SCHEMAS_TIME = 4
    #XML_SCHEMAS_GDAY = 5
    #XML_SCHEMAS_GMONTH = 6
    #XML_SCHEMAS_GMONTHDAY = 7
    #XML_SCHEMAS_GYEAR = 8
    #XML_SCHEMAS_GYEARMONTH = 9
    #XML_SCHEMAS_DATE = 10
    #XML_SCHEMAS_DATETIME = 11
    #XML_SCHEMAS_DURATION = 12
    #XML_SCHEMAS_FLOAT = 13
    #XML_SCHEMAS_DOUBLE = 14
    #XML_SCHEMAS_BOOLEAN = 15
    #XML_SCHEMAS_TOKEN = 16
    #XML_SCHEMAS_LANGUAGE = 17
    #XML_SCHEMAS_NMTOKEN = 18
    #XML_SCHEMAS_NMTOKENS = 19
    #XML_SCHEMAS_NAME = 20
    #XML_SCHEMAS_QNAME = 21
    #XML_SCHEMAS_NCNAME = 22
    #XML_SCHEMAS_ID = 23
    #XML_SCHEMAS_IDREF = 24
    #XML_SCHEMAS_IDREFS = 25
    #XML_SCHEMAS_ENTITY = 26
    #XML_SCHEMAS_ENTITIES = 27
    #XML_SCHEMAS_NOTATION = 28
    #XML_SCHEMAS_ANYURI = 29
    #XML_SCHEMAS_INTEGER = 30
    #XML_SCHEMAS_NPINTEGER = 31
    #XML_SCHEMAS_NINTEGER = 32
    #XML_SCHEMAS_NNINTEGER = 33
    #XML_SCHEMAS_PINTEGER = 34
    #XML_SCHEMAS_INT = 35
    #XML_SCHEMAS_UINT = 36
    #XML_SCHEMAS_LONG = 37
    #XML_SCHEMAS_ULONG = 38
    #XML_SCHEMAS_SHORT = 39
    #XML_SCHEMAS_USHORT = 40
    #XML_SCHEMAS_BYTE = 41
    #XML_SCHEMAS_UBYTE = 42
    #XML_SCHEMAS_HEXBINARY = 43
    #XML_SCHEMAS_BASE64BINARY = 44
    #XML_SCHEMAS_ANYTYPE = 45
    #XML_SCHEMAS_ANYSIMPLETYPE = 46
  EndEnumeration
  ; schematron; XML Schemastron implementation
  Enumeration ; xmlSchematronValidOptions 
    #XML_SCHEMATRON_OUT_QUIET = 1 ; quiet no report
    #XML_SCHEMATRON_OUT_TEXT = 2 ; build a textual report
    #XML_SCHEMATRON_OUT_XML = 4 ; output SVRL
    #XML_SCHEMATRON_OUT_FILE = 256 ; output To a file descriptor
    #XML_SCHEMATRON_OUT_BUFFER = 512 ; output To a buffer
    #XML_SCHEMATRON_OUT_IO = 1024 ; output To I/O mechanism
  EndEnumeration
  ; threads; interfaces For thread handling
  ; tree; interfaces For tree manipulation
  Enumeration ; xmlAttributeDefault 
    #XML_ATTRIBUTE_NONE = 1
    #XML_ATTRIBUTE_REQUIRED = 2
    #XML_ATTRIBUTE_IMPLIED = 3
    #XML_ATTRIBUTE_FIXED = 4
  EndEnumeration
  Enumeration ; xmlAttributeType 
    #XML_ATTRIBUTE_CDATA = 1
    #XML_ATTRIBUTE_ID = 2
    #XML_ATTRIBUTE_IDREF = 3
    #XML_ATTRIBUTE_IDREFS = 4
    #XML_ATTRIBUTE_ENTITY = 5
    #XML_ATTRIBUTE_ENTITIES = 6
    #XML_ATTRIBUTE_NMTOKEN = 7
    #XML_ATTRIBUTE_NMTOKENS = 8
    #XML_ATTRIBUTE_Enumeration ; = 9
    #XML_ATTRIBUTE_NOTATION = 10
  EndEnumeration
  Enumeration ; xmlElementContentOccur 
    #XML_ELEMENT_CONTENT_ONCE = 1
    #XML_ELEMENT_CONTENT_OPT = 2
    #XML_ELEMENT_CONTENT_MULT = 3
    #XML_ELEMENT_CONTENT_PLUS = 4
  EndEnumeration
  Enumeration ; xmlElementContentType 
    #XML_ELEMENT_CONTENT_PCDATA = 1
    #XML_ELEMENT_CONTENT_ELEMENT = 2
    #XML_ELEMENT_CONTENT_SEQ = 3
    #XML_ELEMENT_CONTENT_OR = 4
  EndEnumeration
  Enumeration ; xmlElementType 
    #XML_ELEMENT_NODE = 1
    #XML_ATTRIBUTE_NODE = 2
    #XML_TEXT_NODE = 3
    #XML_CDATA_SECTION_NODE = 4
    #XML_ENTITY_REF_NODE = 5
    #XML_ENTITY_NODE = 6
    #XML_PI_NODE = 7
    #XML_COMMENT_NODE = 8
    #XML_DOCUMENT_NODE = 9
    #XML_DOCUMENT_TYPE_NODE = 10
    #XML_DOCUMENT_FRAG_NODE = 11
    #XML_NOTATION_NODE = 12
    #XML_HTML_DOCUMENT_NODE = 13
    #XML_DTD_NODE = 14
    #XML_ELEMENT_DECL = 15
    #XML_ATTRIBUTE_DECL = 16
    #XML_ENTITY_DECL = 17
    #XML_NAMESPACE_DECL = 18
    #XML_XINCLUDE_START = 19
    #XML_XINCLUDE_END = 20
    #XML_DOCB_DOCUMENT_NODE = 21
  EndEnumeration
  Enumeration ; xmlElementTypeVal 
    #XML_ELEMENT_TYPE_UNDEFINED = 0
    #XML_ELEMENT_TYPE_EMPTY = 1
    #XML_ELEMENT_TYPE_ANY = 2
    #XML_ELEMENT_TYPE_MIXED = 3
    #XML_ELEMENT_TYPE_ELEMENT = 4
  EndEnumeration
  ; xlink; unfinished #XLINK detection module
  Enumeration ; xlinkActuate 
    #XLINK_ACTUATE_NONE = 0
    #XLINK_ACTUATE_AUTO = 1
    #XLINK_ACTUATE_ONREQUEST = 2
  EndEnumeration
  Enumeration ; xlinkShow 
    #XLINK_SHOW_NONE = 0
    #XLINK_SHOW_NEW = 1
    #XLINK_SHOW_EMBED = 2
    #XLINK_SHOW_REPLACE = 3
  EndEnumeration
  Enumeration ; xlinkType 
    #XLINK_TYPE_NONE = 0
    #XLINK_TYPE_SIMPLE = 1
    #XLINK_TYPE_EXTENDED = 2
    #XLINK_TYPE_EXTENDED_SET = 3
  EndEnumeration
  ; xmlerror; error handling
  Enumeration ; xmlErrorDomain 
    #XML_FROM_NONE = 0
    #XML_FROM_PARSER = 1 ; The XML parser
    #XML_FROM_TREE = 2 ; The tree module
    #XML_FROM_NAMESPACE = 3 ; The XML Namespace module
    #XML_FROM_DTD = 4 ; The XML DTD validation With parser contex
    #XML_FROM_HTML = 5 ; The HTML parser
    #XML_FROM_MEMORY = 6 ; The memory allocator
    #XML_FROM_OUTPUT = 7 ; The serialization code
    #XML_FROM_IO = 8 ; The Input/Output stack
    #XML_FROM_FTP = 9 ; The FTP module
    #XML_FROM_HTTP = 10 ; The HTTP module
    #XML_FROM_XINCLUDE = 11 ; The XInclude processing
    #XML_FROM_XPATH = 12 ; The XPath module
    #XML_FROM_XPOINTER = 13 ; The XPointer module
    #XML_FROM_REGEXP = 14 ; The regular expressions module
    #XML_FROM_DATATYPE = 15 ; The W3C XML Schemas Datatype module
    #XML_FROM_SCHEMASP = 16 ; The W3C XML Schemas parser module
    #XML_FROM_SCHEMASV = 17 ; The W3C XML Schemas validation module
    #XML_FROM_RELAXNGP = 18 ; The Relax-NG parser module
    #XML_FROM_RELAXNGV = 19 ; The Relax-NG validator module
    #XML_FROM_CATALOG = 20 ; The Catalog module
    #XML_FROM_C14N = 21 ; The Canonicalization module
    #XML_FROM_XSLT = 22 ; The XSLT engine from libxslt
    #XML_FROM_VALID = 23 ; The XML DTD validation With valid context
    #XML_FROM_CHECK = 24 ; The error checking module
    #XML_FROM_WRITER = 25 ; The xmlwriter module
    #XML_FROM_MODULE = 26 ; The dynamically loaded module modul
    #XML_FROM_I18N = 27 ; The module handling character conversion
  EndEnumeration
  Enumeration ; xmlErrorLevel 
    #XML_ERR_NONE = 0
    #XML_ERR_WARNING = 1 ; A simple warning
    #XML_ERR_ERROR = 2 ; A recoverable error
    #XML_ERR_FATAL = 3 ; A fatal error
  EndEnumeration
  Enumeration ; xmlParserErrors 
    #XML_ERR_OK = 0
    #XML_ERR_INTERNAL_ERROR = 1 ; 1
    #XML_ERR_NO_MEMORY = 2 ; 2
    #XML_ERR_DOCUMENT_START = 3 ; 3
    #XML_ERR_DOCUMENT_EMPTY = 4 ; 4
    #XML_ERR_DOCUMENT_END = 5 ; 5
    #XML_ERR_INVALID_HEX_CHARREF = 6 ; 6
    #XML_ERR_INVALID_DEC_CHARREF = 7 ; 7
    #XML_ERR_INVALID_CHARREF = 8 ; 8
    #XML_ERR_INVALID_CHAR = 9 ; 9
    #XML_ERR_CHARREF_AT_EOF = 10 ; 10
    #XML_ERR_CHARREF_IN_PROLOG = 11 ; 11
    #XML_ERR_CHARREF_IN_EPILOG = 12 ; 12
    #XML_ERR_CHARREF_IN_DTD = 13 ; 13
    #XML_ERR_ENTITYREF_AT_EOF = 14 ; 14
    #XML_ERR_ENTITYREF_IN_PROLOG = 15 ; 15
    #XML_ERR_ENTITYREF_IN_EPILOG = 16 ; 16
    #XML_ERR_ENTITYREF_IN_DTD = 17 ; 17
    #XML_ERR_PEREF_AT_EOF = 18 ; 18
    #XML_ERR_PEREF_IN_PROLOG = 19 ; 19
    #XML_ERR_PEREF_IN_EPILOG = 20 ; 20
    #XML_ERR_PEREF_IN_INT_SUBSET = 21 ; 21
    #XML_ERR_ENTITYREF_NO_NAME = 22 ; 22
    #XML_ERR_ENTITYREF_SEMICOL_MISSING = 23 ; 23
    #XML_ERR_PEREF_NO_NAME = 24 ; 24
    #XML_ERR_PEREF_SEMICOL_MISSING = 25 ; 25
    #XML_ERR_UNDECLARED_ENTITY = 26 ; 26
    #XML_WAR_UNDECLARED_ENTITY = 27 ; 27
    #XML_ERR_UNPARSED_ENTITY = 28 ; 28
    #XML_ERR_ENTITY_IS_EXTERNAL = 29 ; 29
    #XML_ERR_ENTITY_IS_PARAMETER = 30 ; 30
    #XML_ERR_UNKNOWN_ENCODING = 31 ; 31
    #XML_ERR_UNSUPPORTED_ENCODING = 32 ; 32
    #XML_ERR_STRING_NOT_STARTED = 33 ; 33
    #XML_ERR_STRING_NOT_CLOSED = 34 ; 34
    #XML_ERR_NS_DECL_ERROR = 35 ; 35
    #XML_ERR_ENTITY_NOT_STARTED = 36 ; 36
    #XML_ERR_ENTITY_NOT_FINISHED = 37 ; 37
    #XML_ERR_LT_IN_ATTRIBUTE = 38 ; 38
    #XML_ERR_ATTRIBUTE_NOT_STARTED = 39 ; 39
    #XML_ERR_ATTRIBUTE_NOT_FINISHED = 40 ; 40
    #XML_ERR_ATTRIBUTE_WITHOUT_VALUE = 41 ; 41
    #XML_ERR_ATTRIBUTE_REDEFINED = 42 ; 42
    #XML_ERR_LITERAL_NOT_STARTED = 43 ; 43
    #XML_ERR_LITERAL_NOT_FINISHED = 44 ; 44
    #XML_ERR_COMMENT_NOT_FINISHED = 45 ; 45
    #XML_ERR_PI_NOT_STARTED = 46 ; 46
    #XML_ERR_PI_NOT_FINISHED = 47 ; 47
    #XML_ERR_NOTATION_NOT_STARTED = 48 ; 48
    #XML_ERR_NOTATION_NOT_FINISHED = 49 ; 49
    #XML_ERR_ATTLIST_NOT_STARTED = 50 ; 50
    #XML_ERR_ATTLIST_NOT_FINISHED = 51 ; 51
    #XML_ERR_MIXED_NOT_STARTED = 52 ; 52
    #XML_ERR_MIXED_NOT_FINISHED = 53 ; 53
    #XML_ERR_ELEMCONTENT_NOT_STARTED = 54 ; 54
    #XML_ERR_ELEMCONTENT_NOT_FINISHED = 55 ; 55
    #XML_ERR_XMLDECL_NOT_STARTED = 56 ; 56
    #XML_ERR_XMLDECL_NOT_FINISHED = 57 ; 57
    #XML_ERR_CONDSEC_NOT_STARTED = 58 ; 58
    #XML_ERR_CONDSEC_NOT_FINISHED = 59 ; 59
    #XML_ERR_EXT_SUBSET_NOT_FINISHED = 60 ; 60
    #XML_ERR_DOCTYPE_NOT_FINISHED = 61 ; 61
    #XML_ERR_MISPLACED_CDATA_END = 62 ; 62
    #XML_ERR_CDATA_NOT_FINISHED = 63 ; 63
    #XML_ERR_RESERVED_XML_NAME = 64 ; 64
    #XML_ERR_SPACE_REQUIRED = 65 ; 65
    #XML_ERR_SEPARATOR_REQUIRED = 66 ; 66
    #XML_ERR_NMTOKEN_REQUIRED = 67 ; 67
    #XML_ERR_NAME_REQUIRED = 68 ; 68
    #XML_ERR_PCDATA_REQUIRED = 69 ; 69
    #XML_ERR_URI_REQUIRED = 70 ; 70
    #XML_ERR_PUBID_REQUIRED = 71 ; 71
    #XML_ERR_LT_REQUIRED = 72 ; 72
    #XML_ERR_GT_REQUIRED = 73 ; 73
    #XML_ERR_LTSLASH_REQUIRED = 74 ; 74
    #XML_ERR_EQUAL_REQUIRED = 75 ; 75
    #XML_ERR_TAG_NAME_MISMATCH = 76 ; 76
    #XML_ERR_TAG_NOT_FINISHED = 77 ; 77
    #XML_ERR_STANDALONE_VALUE = 78 ; 78
    #XML_ERR_ENCODING_NAME = 79 ; 79
    #XML_ERR_HYPHEN_IN_COMMENT = 80 ; 80
    #XML_ERR_INVALID_ENCODING = 81 ; 81
    #XML_ERR_EXT_ENTITY_STANDALONE = 82 ; 82
    #XML_ERR_CONDSEC_INVALID = 83 ; 83
    #XML_ERR_VALUE_REQUIRED = 84 ; 84
    #XML_ERR_NOT_WELL_BALANCED = 85 ; 85
    #XML_ERR_EXTRA_CONTENT = 86 ; 86
    #XML_ERR_ENTITY_CHAR_ERROR = 87 ; 87
    #XML_ERR_ENTITY_PE_INTERNAL = 88 ; 88
    #XML_ERR_ENTITY_LOOP = 89 ; 89
    #XML_ERR_ENTITY_BOUNDARY = 90 ; 90
    #XML_ERR_INVALID_URI = 91 ; 91
    #XML_ERR_URI_FRAGMENT = 92 ; 92
    #XML_WAR_CATALOG_PI = 93 ; 93
    #XML_ERR_NO_DTD = 94 ; 94
    #XML_ERR_CONDSEC_INVALID_KEYWORD = 95 ; 95
    #XML_ERR_VERSION_MISSING = 96 ; 96
    #XML_WAR_UNKNOWN_VERSION = 97 ; 97
    #XML_WAR_LANG_VALUE = 98 ; 98
    #XML_WAR_NS_URI = 99 ; 99
    #XML_WAR_NS_URI_RELATIVE = 100 ; 100
    #XML_ERR_MISSING_ENCODING = 101 ; 101
    #XML_WAR_SPACE_VALUE = 102 ; 102
    #XML_ERR_NOT_STANDALONE = 103 ; 103
    #XML_ERR_ENTITY_PROCESSING = 104 ; 104
    #XML_ERR_NOTATION_PROCESSING = 105 ; 105
    #XML_WAR_NS_COLUMN = 106 ; 106
    #XML_WAR_ENTITY_REDEFINED = 107 ; 107
    #XML_NS_ERR_XML_NAMESPACE = 200
    #XML_NS_ERR_UNDEFINED_NAMESPACE = 201 ; 201
    #XML_NS_ERR_QNAME = 202 ; 202
    #XML_NS_ERR_ATTRIBUTE_REDEFINED = 203 ; 203
    #XML_NS_ERR_EMPTY = 204 ; 204
    #XML_DTD_ATTRIBUTE_DEFAULT = 500
    #XML_DTD_ATTRIBUTE_REDEFINED = 501 ; 501
    #XML_DTD_ATTRIBUTE_VALUE = 502 ; 502
    #XML_DTD_CONTENT_ERROR = 503 ; 503
    #XML_DTD_CONTENT_MODEL = 504 ; 504
    #XML_DTD_CONTENT_NOT_DETERMINIST = 505 ; 505
    #XML_DTD_DIFFERENT_PREFIX = 506 ; 506
    #XML_DTD_ELEM_DEFAULT_NAMESPACE = 507 ; 507
    #XML_DTD_ELEM_NAMESPACE = 508 ; 508
    #XML_DTD_ELEM_REDEFINED = 509 ; 509
    #XML_DTD_EMPTY_NOTATION = 510 ; 510
    #XML_DTD_ENTITY_TYPE = 511 ; 511
    #XML_DTD_ID_FIXED = 512 ; 512
    #XML_DTD_ID_REDEFINED = 513 ; 513
    #XML_DTD_ID_SUBSET = 514 ; 514
    #XML_DTD_INVALID_CHILD = 515 ; 515
    #XML_DTD_INVALID_DEFAULT = 516 ; 516
    #XML_DTD_LOAD_ERROR = 517 ; 517
    #XML_DTD_MISSING_ATTRIBUTE = 518 ; 518
    #XML_DTD_MIXED_CORRUPT = 519 ; 519
    #XML_DTD_MULTIPLE_ID = 520 ; 520
    #XML_DTD_NO_DOC = 521 ; 521
    #XML_DTD_NO_DTD = 522 ; 522
    #XML_DTD_NO_ELEM_NAME = 523 ; 523
    #XML_DTD_NO_PREFIX = 524 ; 524
    #XML_DTD_NO_ROOT = 525 ; 525
    #XML_DTD_NOTATION_REDEFINED = 526 ; 526
    #XML_DTD_NOTATION_VALUE = 527 ; 527
    #XML_DTD_NOT_EMPTY = 528 ; 528
    #XML_DTD_NOT_PCDATA = 529 ; 529
    #XML_DTD_NOT_STANDALONE = 530 ; 530
    #XML_DTD_ROOT_NAME = 531 ; 531
    #XML_DTD_STANDALONE_WHITE_SPACE = 532 ; 532
    #XML_DTD_UNKNOWN_ATTRIBUTE = 533 ; 533
    #XML_DTD_UNKNOWN_ELEM = 534 ; 534
    #XML_DTD_UNKNOWN_ENTITY = 535 ; 535
    #XML_DTD_UNKNOWN_ID = 536 ; 536
    #XML_DTD_UNKNOWN_NOTATION = 537 ; 537
    #XML_DTD_STANDALONE_DEFAULTED = 538 ; 538
    #XML_DTD_XMLID_VALUE = 539 ; 539
    #XML_DTD_XMLID_TYPE = 540 ; 540
    #XML_HTML_STRUCURE_ERROR = 800
    #XML_HTML_UNKNOWN_TAG = 801 ; 801
    #XML_RNGP_ANYNAME_ATTR_ANCESTOR = 1000
    #XML_RNGP_ATTR_CONFLICT = 1001 ; 1001
    #XML_RNGP_ATTRIBUTE_CHILDREN = 1002 ; 1002
    #XML_RNGP_ATTRIBUTE_CONTENT = 1003 ; 1003
    #XML_RNGP_ATTRIBUTE_EMPTY = 1004 ; 1004
    #XML_RNGP_ATTRIBUTE_NOOP = 1005 ; 1005
    #XML_RNGP_CHOICE_CONTENT = 1006 ; 1006
    #XML_RNGP_CHOICE_EMPTY = 1007 ; 1007
    #XML_RNGP_CREATE_FAILURE = 1008 ; 1008
    #XML_RNGP_DATA_CONTENT = 1009 ; 1009
    #XML_RNGP_DEF_CHOICE_AND_INTERLEAVE = 1010 ; 1010
    #XML_RNGP_DEFINE_CREATE_FAILED = 1011 ; 1011
    #XML_RNGP_DEFINE_EMPTY = 1012 ; 1012
    #XML_RNGP_DEFINE_MISSING = 1013 ; 1013
    #XML_RNGP_DEFINE_NAME_MISSING = 1014 ; 1014
    #XML_RNGP_ELEM_CONTENT_EMPTY = 1015 ; 1015
    #XML_RNGP_ELEM_CONTENT_ERROR = 1016 ; 1016
    #XML_RNGP_ELEMENT_EMPTY = 1017 ; 1017
    #XML_RNGP_ELEMENT_CONTENT = 1018 ; 1018
    #XML_RNGP_ELEMENT_NAME = 1019 ; 1019
    #XML_RNGP_ELEMENT_NO_CONTENT = 1020 ; 1020
    #XML_RNGP_ELEM_TEXT_CONFLICT = 1021 ; 1021
    #XML_RNGP_EMPTY = 1022 ; 1022
    #XML_RNGP_EMPTY_CONSTRUCT = 1023 ; 1023
    #XML_RNGP_EMPTY_CONTENT = 1024 ; 1024
    #XML_RNGP_EMPTY_NOT_EMPTY = 1025 ; 1025
    #XML_RNGP_ERROR_TYPE_LIB = 1026 ; 1026
    #XML_RNGP_EXCEPT_EMPTY = 1027 ; 1027
    #XML_RNGP_EXCEPT_MISSING = 1028 ; 1028
    #XML_RNGP_EXCEPT_MULTIPLE = 1029 ; 1029
    #XML_RNGP_EXCEPT_NO_CONTENT = 1030 ; 1030
    #XML_RNGP_EXTERNALREF_EMTPY = 1031 ; 1031
    #XML_RNGP_EXTERNAL_REF_FAILURE = 1032 ; 1032
    #XML_RNGP_EXTERNALREF_RECURSE = 1033 ; 1033
    #XML_RNGP_FORBIDDEN_ATTRIBUTE = 1034 ; 1034
    #XML_RNGP_FOREIGN_ELEMENT = 1035 ; 1035
    #XML_RNGP_GRAMMAR_CONTENT = 1036 ; 1036
    #XML_RNGP_GRAMMAR_EMPTY = 1037 ; 1037
    #XML_RNGP_GRAMMAR_MISSING = 1038 ; 1038
    #XML_RNGP_GRAMMAR_NO_START = 1039 ; 1039
    #XML_RNGP_GROUP_ATTR_CONFLICT = 1040 ; 1040
    #XML_RNGP_HREF_ERROR = 1041 ; 1041
    #XML_RNGP_INCLUDE_EMPTY = 1042 ; 1042
    #XML_RNGP_INCLUDE_FAILURE = 1043 ; 1043
    #XML_RNGP_INCLUDE_RECURSE = 1044 ; 1044
    #XML_RNGP_INTERLEAVE_ADD = 1045 ; 1045
    #XML_RNGP_INTERLEAVE_CREATE_FAILED = 1046 ; 1046
    #XML_RNGP_INTERLEAVE_EMPTY = 1047 ; 1047
    #XML_RNGP_INTERLEAVE_NO_CONTENT = 1048 ; 1048
    #XML_RNGP_INVALID_DEFINE_NAME = 1049 ; 1049
    #XML_RNGP_INVALID_URI = 1050 ; 1050
    #XML_RNGP_INVALID_VALUE = 1051 ; 1051
    #XML_RNGP_MISSING_HREF = 1052 ; 1052
    #XML_RNGP_NAME_MISSING = 1053 ; 1053
    #XML_RNGP_NEED_COMBINE = 1054 ; 1054
    #XML_RNGP_NOTALLOWED_NOT_EMPTY = 1055 ; 1055
    #XML_RNGP_NSNAME_ATTR_ANCESTOR = 1056 ; 1056
    #XML_RNGP_NSNAME_NO_NS = 1057 ; 1057
    #XML_RNGP_PARAM_FORBIDDEN = 1058 ; 1058
    #XML_RNGP_PARAM_NAME_MISSING = 1059 ; 1059
    #XML_RNGP_PARENTREF_CREATE_FAILED = 1060 ; 1060
    #XML_RNGP_PARENTREF_NAME_INVALID = 1061 ; 1061
    #XML_RNGP_PARENTREF_NO_NAME = 1062 ; 1062
    #XML_RNGP_PARENTREF_NO_PARENT = 1063 ; 1063
    #XML_RNGP_PARENTREF_NOT_EMPTY = 1064 ; 1064
    #XML_RNGP_PARSE_ERROR = 1065 ; 1065
    #XML_RNGP_PAT_ANYNAME_EXCEPT_ANYNAME = 1066 ; 1066
    #XML_RNGP_PAT_ATTR_ATTR = 1067 ; 1067
    #XML_RNGP_PAT_ATTR_ELEM = 1068 ; 1068
    #XML_RNGP_PAT_DATA_EXCEPT_ATTR = 1069 ; 1069
    #XML_RNGP_PAT_DATA_EXCEPT_ELEM = 1070 ; 1070
    #XML_RNGP_PAT_DATA_EXCEPT_EMPTY = 1071 ; 1071
    #XML_RNGP_PAT_DATA_EXCEPT_GROUP = 1072 ; 1072
    #XML_RNGP_PAT_DATA_EXCEPT_INTERLEAVE = 1073 ; 1073
    #XML_RNGP_PAT_DATA_EXCEPT_LIST = 1074 ; 1074
    #XML_RNGP_PAT_DATA_EXCEPT_ONEMORE = 1075 ; 1075
    #XML_RNGP_PAT_DATA_EXCEPT_REF = 1076 ; 1076
    #XML_RNGP_PAT_DATA_EXCEPT_TEXT = 1077 ; 1077
    #XML_RNGP_PAT_LIST_ATTR = 1078 ; 1078
    #XML_RNGP_PAT_LIST_ELEM = 1079 ; 1079
    #XML_RNGP_PAT_LIST_INTERLEAVE = 1080 ; 1080
    #XML_RNGP_PAT_LIST_LIST = 1081 ; 1081
    #XML_RNGP_PAT_LIST_REF = 1082 ; 1082
    #XML_RNGP_PAT_LIST_TEXT = 1083 ; 1083
    #XML_RNGP_PAT_NSNAME_EXCEPT_ANYNAME = 1084 ; 1084
    #XML_RNGP_PAT_NSNAME_EXCEPT_NSNAME = 1085 ; 1085
    #XML_RNGP_PAT_ONEMORE_GROUP_ATTR = 1086 ; 1086
    #XML_RNGP_PAT_ONEMORE_INTERLEAVE_ATTR = 1087 ; 1087
    #XML_RNGP_PAT_START_ATTR = 1088 ; 1088
    #XML_RNGP_PAT_START_DATA = 1089 ; 1089
    #XML_RNGP_PAT_START_EMPTY = 1090 ; 1090
    #XML_RNGP_PAT_START_GROUP = 1091 ; 1091
    #XML_RNGP_PAT_START_INTERLEAVE = 1092 ; 1092
    #XML_RNGP_PAT_START_LIST = 1093 ; 1093
    #XML_RNGP_PAT_START_ONEMORE = 1094 ; 1094
    #XML_RNGP_PAT_START_TEXT = 1095 ; 1095
    #XML_RNGP_PAT_START_VALUE = 1096 ; 1096
    #XML_RNGP_PREFIX_UNDEFINED = 1097 ; 1097
    #XML_RNGP_REF_CREATE_FAILED = 1098 ; 1098
    #XML_RNGP_REF_CYCLE = 1099 ; 1099
    #XML_RNGP_REF_NAME_INVALID = 1100 ; 1100
    #XML_RNGP_REF_NO_DEF = 1101 ; 1101
    #XML_RNGP_REF_NO_NAME = 1102 ; 1102
    #XML_RNGP_REF_NOT_EMPTY = 1103 ; 1103
    #XML_RNGP_START_CHOICE_AND_INTERLEAVE = 1104 ; 1104
    #XML_RNGP_START_CONTENT = 1105 ; 1105
    #XML_RNGP_START_EMPTY = 1106 ; 1106
    #XML_RNGP_START_MISSING = 1107 ; 1107
    #XML_RNGP_TEXT_EXPECTED = 1108 ; 1108
    #XML_RNGP_TEXT_HAS_CHILD = 1109 ; 1109
    #XML_RNGP_TYPE_MISSING = 1110 ; 1110
    #XML_RNGP_TYPE_NOT_FOUND = 1111 ; 1111
    #XML_RNGP_TYPE_VALUE = 1112 ; 1112
    #XML_RNGP_UNKNOWN_ATTRIBUTE = 1113 ; 1113
    #XML_RNGP_UNKNOWN_COMBINE = 1114 ; 1114
    #XML_RNGP_UNKNOWN_CONSTRUCT = 1115 ; 1115
    #XML_RNGP_UNKNOWN_TYPE_LIB = 1116 ; 1116
    #XML_RNGP_URI_FRAGMENT = 1117 ; 1117
    #XML_RNGP_URI_NOT_ABSOLUTE = 1118 ; 1118
    #XML_RNGP_VALUE_EMPTY = 1119 ; 1119
    #XML_RNGP_VALUE_NO_CONTENT = 1120 ; 1120
    #XML_RNGP_XMLNS_NAME = 1121 ; 1121
    #XML_RNGP_XML_NS = 1122 ; 1122
    #XML_XPATH_EXPRESSION_OK = 1200
    #XML_XPATH_NUMBER_ERROR = 1201 ; 1201
    #XML_XPATH_UNFINISHED_LITERAL_ERROR = 1202 ; 1202
    #XML_XPATH_START_LITERAL_ERROR = 1203 ; 1203
    #XML_XPATH_VARIABLE_REF_ERROR = 1204 ; 1204
    #XML_XPATH_UNDEF_VARIABLE_ERROR = 1205 ; 1205
    #XML_XPATH_INVALID_PREDICATE_ERROR = 1206 ; 1206
    #XML_XPATH_EXPR_ERROR = 1207 ; 1207
    #XML_XPATH_UNCLOSED_ERROR = 1208 ; 1208
    #XML_XPATH_UNKNOWN_FUNC_ERROR = 1209 ; 1209
    #XML_XPATH_INVALID_OPERAND = 1210 ; 1210
    #XML_XPATH_INVALID_TYPE = 1211 ; 1211
    #XML_XPATH_INVALID_ARITY = 1212 ; 1212
    #XML_XPATH_INVALID_CTXT_SIZE = 1213 ; 1213
    #XML_XPATH_INVALID_CTXT_POSITION = 1214 ; 1214
    #XML_XPATH_MEMORY_ERROR = 1215 ; 1215
    #XML_XPTR_SYNTAX_ERROR = 1216 ; 1216
    #XML_XPTR_RESOURCE_ERROR = 1217 ; 1217
    #XML_XPTR_SUB_RESOURCE_ERROR = 1218 ; 1218
    #XML_XPATH_UNDEF_PREFIX_ERROR = 1219 ; 1219
    #XML_XPATH_ENCODING_ERROR = 1220 ; 1220
    #XML_XPATH_INVALID_CHAR_ERROR = 1221 ; 1221
    #XML_TREE_INVALID_HEX = 1300
    #XML_TREE_INVALID_DEC = 1301 ; 1301
    #XML_TREE_UNTERMINATED_ENTITY = 1302 ; 1302
    #XML_SAVE_NOT_UTF8 = 1400
    #XML_SAVE_CHAR_INVALID = 1401 ; 1401
    #XML_SAVE_NO_DOCTYPE = 1402 ; 1402
    #XML_SAVE_UNKNOWN_ENCODING = 1403 ; 1403
    #XML_REGEXP_COMPILE_ERROR = 1450
    #XML_IO_UNKNOWN = 1500
    #XML_IO_EACCES = 1501 ; 1501
    #XML_IO_EAGAIN = 1502 ; 1502
    #XML_IO_EBADF = 1503 ; 1503
    #XML_IO_EBADMSG = 1504 ; 1504
    #XML_IO_EBUSY = 1505 ; 1505
    #XML_IO_ECANCELED = 1506 ; 1506
    #XML_IO_ECHILD = 1507 ; 1507
    #XML_IO_EDEADLK = 1508 ; 1508
    #XML_IO_EDOM = 1509 ; 1509
    #XML_IO_EEXIST = 1510 ; 1510
    #XML_IO_EFAULT = 1511 ; 1511
    #XML_IO_EFBIG = 1512 ; 1512
    #XML_IO_EINPROGRESS = 1513 ; 1513
    #XML_IO_EINTR = 1514 ; 1514
    #XML_IO_EINVAL = 1515 ; 1515
    #XML_IO_EIO = 1516 ; 1516
    #XML_IO_EISDIR = 1517 ; 1517
    #XML_IO_EMFILE = 1518 ; 1518
    #XML_IO_EMLINK = 1519 ; 1519
    #XML_IO_EMSGSIZE = 1520 ; 1520
    #XML_IO_ENAMETOOLONG = 1521 ; 1521
    #XML_IO_ENFILE = 1522 ; 1522
    #XML_IO_ENODEV = 1523 ; 1523
    #XML_IO_ENOENT = 1524 ; 1524
    #XML_IO_ENOEXEC = 1525 ; 1525
    #XML_IO_ENOLCK = 1526 ; 1526
    #XML_IO_ENOMEM = 1527 ; 1527
    #XML_IO_ENOSPC = 1528 ; 1528
    #XML_IO_ENOSYS = 1529 ; 1529
    #XML_IO_ENOTDIR = 1530 ; 1530
    #XML_IO_ENOTEMPTY = 1531 ; 1531
    #XML_IO_ENOTSUP = 1532 ; 1532
    #XML_IO_ENOTTY = 1533 ; 1533
    #XML_IO_ENXIO = 1534 ; 1534
    #XML_IO_EPERM = 1535 ; 1535
    #XML_IO_EPIPE = 1536 ; 1536
    #XML_IO_ERANGE = 1537 ; 1537
    #XML_IO_EROFS = 1538 ; 1538
    #XML_IO_ESPIPE = 1539 ; 1539
    #XML_IO_ESRCH = 1540 ; 1540
    #XML_IO_ETIMEDOUT = 1541 ; 1541
    #XML_IO_EXDEV = 1542 ; 1542
    #XML_IO_NETWORK_ATTEMPT = 1543 ; 1543
    #XML_IO_ENCODER = 1544 ; 1544
    #XML_IO_FLUSH = 1545 ; 1545
    #XML_IO_WRITE = 1546 ; 1546
    #XML_IO_NO_INPUT = 1547 ; 1547
    #XML_IO_BUFFER_FULL = 1548 ; 1548
    #XML_IO_LOAD_ERROR = 1549 ; 1549
    #XML_IO_ENOTSOCK = 1550 ; 1550
    #XML_IO_EISCONN = 1551 ; 1551
    #XML_IO_ECONNREFUSED = 1552 ; 1552
    #XML_IO_ENETUNREACH = 1553 ; 1553
    #XML_IO_EADDRINUSE = 1554 ; 1554
    #XML_IO_EALREADY = 1555 ; 1555
    #XML_IO_EAFNOSUPPORT = 1556 ; 1556
    #XML_XINCLUDE_RECURSION = 1600
    #XML_XINCLUDE_PARSE_VALUE = 1601 ; 1601
    #XML_XINCLUDE_ENTITY_DEF_MISMATCH = 1602 ; 1602
    #XML_XINCLUDE_NO_HREF = 1603 ; 1603
    #XML_XINCLUDE_NO_FALLBACK = 1604 ; 1604
    #XML_XINCLUDE_HREF_URI = 1605 ; 1605
    #XML_XINCLUDE_TEXT_FRAGMENT = 1606 ; 1606
    #XML_XINCLUDE_TEXT_DOCUMENT = 1607 ; 1607
    #XML_XINCLUDE_INVALID_CHAR = 1608 ; 1608
    #XML_XINCLUDE_BUILD_FAILED = 1609 ; 1609
    #XML_XINCLUDE_UNKNOWN_ENCODING = 1610 ; 1610
    #XML_XINCLUDE_MULTIPLE_ROOT = 1611 ; 1611
    #XML_XINCLUDE_XPTR_FAILED = 1612 ; 1612
    #XML_XINCLUDE_XPTR_RESULT = 1613 ; 1613
    #XML_XINCLUDE_INCLUDE_IN_INCLUDE = 1614 ; 1614
    #XML_XINCLUDE_FALLBACKS_IN_INCLUDE = 1615 ; 1615
    #XML_XINCLUDE_FALLBACK_NOT_IN_INCLUDE = 1616 ; 1616
    #XML_XINCLUDE_DEPRECATED_NS = 1617 ; 1617
    #XML_XINCLUDE_FRAGMENT_ID = 1618 ; 1618
    #XML_CATALOG_MISSING_ATTR = 1650
    #XML_CATALOG_ENTRY_BROKEN = 1651 ; 1651
    #XML_CATALOG_PREFER_VALUE = 1652 ; 1652
    #XML_CATALOG_NOT_CATALOG = 1653 ; 1653
    #XML_CATALOG_RECURSION = 1654 ; 1654
    #XML_SCHEMAP_PREFIX_UNDEFINED = 1700
    #XML_SCHEMAP_ATTRFORMDEFAULT_VALUE = 1701 ; 1701
    #XML_SCHEMAP_ATTRGRP_NONAME_NOREF = 1702 ; 1702
    #XML_SCHEMAP_ATTR_NONAME_NOREF = 1703 ; 1703
    #XML_SCHEMAP_COMPLEXTYPE_NONAME_NOREF = 1704 ; 1704
    #XML_SCHEMAP_ELEMFORMDEFAULT_VALUE = 1705 ; 1705
    #XML_SCHEMAP_ELEM_NONAME_NOREF = 1706 ; 1706
    #XML_SCHEMAP_EXTENSION_NO_BASE = 1707 ; 1707
    #XML_SCHEMAP_FACET_NO_VALUE = 1708 ; 1708
    #XML_SCHEMAP_FAILED_BUILD_IMPORT = 1709 ; 1709
    #XML_SCHEMAP_GROUP_NONAME_NOREF = 1710 ; 1710
    #XML_SCHEMAP_IMPORT_NAMESPACE_NOT_URI = 1711 ; 1711
    #XML_SCHEMAP_IMPORT_REDEFINE_NSNAME = 1712 ; 1712
    #XML_SCHEMAP_IMPORT_SCHEMA_NOT_URI = 1713 ; 1713
    #XML_SCHEMAP_INVALID_BOOLEAN = 1714 ; 1714
    #XML_SCHEMAP_INVALID_Enumeration ; = 1715 ; 1715
    #XML_SCHEMAP_INVALID_FACET = 1716 ; 1716
    #XML_SCHEMAP_INVALID_FACET_VALUE = 1717 ; 1717
    #XML_SCHEMAP_INVALID_MAXOCCURS = 1718 ; 1718
    #XML_SCHEMAP_INVALID_MINOCCURS = 1719 ; 1719
    #XML_SCHEMAP_INVALID_REF_AND_SUBTYPE = 1720 ; 1720
    #XML_SCHEMAP_INVALID_WHITE_SPACE = 1721 ; 1721
    #XML_SCHEMAP_NOATTR_NOREF = 1722 ; 1722
    #XML_SCHEMAP_NOTATION_NO_NAME = 1723 ; 1723
    #XML_SCHEMAP_NOTYPE_NOREF = 1724 ; 1724
    #XML_SCHEMAP_REF_AND_SUBTYPE = 1725 ; 1725
    #XML_SCHEMAP_RESTRICTION_NONAME_NOREF = 1726 ; 1726
    #XML_SCHEMAP_SIMPLETYPE_NONAME = 1727 ; 1727
    #XML_SCHEMAP_TYPE_AND_SUBTYPE = 1728 ; 1728
    #XML_SCHEMAP_UNKNOWN_ALL_CHILD = 1729 ; 1729
    #XML_SCHEMAP_UNKNOWN_ANYATTRIBUTE_CHILD = 1730 ; 1730
    #XML_SCHEMAP_UNKNOWN_ATTR_CHILD = 1731 ; 1731
    #XML_SCHEMAP_UNKNOWN_ATTRGRP_CHILD = 1732 ; 1732
    #XML_SCHEMAP_UNKNOWN_ATTRIBUTE_GROUP = 1733 ; 1733
    #XML_SCHEMAP_UNKNOWN_BASE_TYPE = 1734 ; 1734
    #XML_SCHEMAP_UNKNOWN_CHOICE_CHILD = 1735 ; 1735
    #XML_SCHEMAP_UNKNOWN_COMPLEXCONTENT_CHILD = 1736 ; 1736
    #XML_SCHEMAP_UNKNOWN_COMPLEXTYPE_CHILD = 1737 ; 1737
    #XML_SCHEMAP_UNKNOWN_ELEM_CHILD = 1738 ; 1738
    #XML_SCHEMAP_UNKNOWN_EXTENSION_CHILD = 1739 ; 1739
    #XML_SCHEMAP_UNKNOWN_FACET_CHILD = 1740 ; 1740
    #XML_SCHEMAP_UNKNOWN_FACET_TYPE = 1741 ; 1741
    #XML_SCHEMAP_UNKNOWN_GROUP_CHILD = 1742 ; 1742
    #XML_SCHEMAP_UNKNOWN_IMPORT_CHILD = 1743 ; 1743
    #XML_SCHEMAP_UNKNOWN_LIST_CHILD = 1744 ; 1744
    #XML_SCHEMAP_UNKNOWN_NOTATION_CHILD = 1745 ; 1745
    #XML_SCHEMAP_UNKNOWN_PROCESSCONTENT_CHILD = 1746 ; 1746
    #XML_SCHEMAP_UNKNOWN_REF = 1747 ; 1747
    #XML_SCHEMAP_UNKNOWN_RESTRICTION_CHILD = 1748 ; 1748
    #XML_SCHEMAP_UNKNOWN_SCHEMAS_CHILD = 1749 ; 1749
    #XML_SCHEMAP_UNKNOWN_SEQUENCE_CHILD = 1750 ; 1750
    #XML_SCHEMAP_UNKNOWN_SIMPLECONTENT_CHILD = 1751 ; 1751
    #XML_SCHEMAP_UNKNOWN_SIMPLETYPE_CHILD = 1752 ; 1752
    #XML_SCHEMAP_UNKNOWN_TYPE = 1753 ; 1753
    #XML_SCHEMAP_UNKNOWN_UNION_CHILD = 1754 ; 1754
    #XML_SCHEMAP_ELEM_DEFAULT_FIXED = 1755 ; 1755
    #XML_SCHEMAP_REGEXP_INVALID = 1756 ; 1756
    #XML_SCHEMAP_FAILED_LOAD = 1757 ; 1757
    #XML_SCHEMAP_NOTHING_TO_PARSE = 1758 ; 1758
    #XML_SCHEMAP_NOROOT = 1759 ; 1759
    #XML_SCHEMAP_REDEFINED_GROUP = 1760 ; 1760
    #XML_SCHEMAP_REDEFINED_TYPE = 1761 ; 1761
    #XML_SCHEMAP_REDEFINED_ELEMENT = 1762 ; 1762
    #XML_SCHEMAP_REDEFINED_ATTRGROUP = 1763 ; 1763
    #XML_SCHEMAP_REDEFINED_ATTR = 1764 ; 1764
    #XML_SCHEMAP_REDEFINED_NOTATION = 1765 ; 1765
    #XML_SCHEMAP_FAILED_PARSE = 1766 ; 1766
    #XML_SCHEMAP_UNKNOWN_PREFIX = 1767 ; 1767
    #XML_SCHEMAP_DEF_AND_PREFIX = 1768 ; 1768
    #XML_SCHEMAP_UNKNOWN_INCLUDE_CHILD = 1769 ; 1769
    #XML_SCHEMAP_INCLUDE_SCHEMA_NOT_URI = 1770 ; 1770
    #XML_SCHEMAP_INCLUDE_SCHEMA_NO_URI = 1771 ; 1771
    #XML_SCHEMAP_NOT_SCHEMA = 1772 ; 1772
    #XML_SCHEMAP_UNKNOWN_MEMBER_TYPE = 1773 ; 1773
    #XML_SCHEMAP_INVALID_ATTR_USE = 1774 ; 1774
    #XML_SCHEMAP_RECURSIVE = 1775 ; 1775
    #XML_SCHEMAP_SUPERNUMEROUS_LIST_ITEM_TYPE = 1776 ; 1776
    #XML_SCHEMAP_INVALID_ATTR_COMBINATION = 1777 ; 1777
    #XML_SCHEMAP_INVALID_ATTR_INLINE_COMBINATION = 1778 ; 1778
    #XML_SCHEMAP_MISSING_SIMPLETYPE_CHILD = 1779 ; 1779
    #XML_SCHEMAP_INVALID_ATTR_NAME = 1780 ; 1780
    #XML_SCHEMAP_REF_AND_CONTENT = 1781 ; 1781
    #XML_SCHEMAP_CT_PROPS_CORRECT_1 = 1782 ; 1782
    #XML_SCHEMAP_CT_PROPS_CORRECT_2 = 1783 ; 1783
    #XML_SCHEMAP_CT_PROPS_CORRECT_3 = 1784 ; 1784
    #XML_SCHEMAP_CT_PROPS_CORRECT_4 = 1785 ; 1785
    #XML_SCHEMAP_CT_PROPS_CORRECT_5 = 1786 ; 1786
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_1 = 1787 ; 1787
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_1 = 1788 ; 1788
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_2 = 1789 ; 1789
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_2 = 1790 ; 1790
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_3 = 1791 ; 1791
    #XML_SCHEMAP_WILDCARD_INVALID_NS_MEMBER = 1792 ; 1792
    #XML_SCHEMAP_INTERSECTION_NOT_EXPRESSIBLE = 1793 ; 1793
    #XML_SCHEMAP_UNION_NOT_EXPRESSIBLE = 1794 ; 1794
    #XML_SCHEMAP_SRC_IMPORT_3_1 = 1795 ; 1795
    #XML_SCHEMAP_SRC_IMPORT_3_2 = 1796 ; 1796
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_1 = 1797 ; 1797
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_2 = 1798 ; 1798
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_3 = 1799 ; 1799
    #XML_SCHEMAP_COS_CT_EXTENDS_1_3 = 1800 ; 1800
    #XML_SCHEMAV_NOROOT = 1801
    #XML_SCHEMAV_UNDECLAREDELEM = 1802 ; 1802
    #XML_SCHEMAV_NOTTOPLEVEL = 1803 ; 1803
    #XML_SCHEMAV_MISSING = 1804 ; 1804
    #XML_SCHEMAV_WRONGELEM = 1805 ; 1805
    #XML_SCHEMAV_NOTYPE = 1806 ; 1806
    #XML_SCHEMAV_NOROLLBACK = 1807 ; 1807
    #XML_SCHEMAV_ISABSTRACT = 1808 ; 1808
    #XML_SCHEMAV_NOTEMPTY = 1809 ; 1809
    #XML_SCHEMAV_ELEMCONT = 1810 ; 1810
    #XML_SCHEMAV_HAVEDEFAULT = 1811 ; 1811
    #XML_SCHEMAV_NOTNILLABLE = 1812 ; 1812
    #XML_SCHEMAV_EXTRACONTENT = 1813 ; 1813
    #XML_SCHEMAV_INVALIDATTR = 1814 ; 1814
    #XML_SCHEMAV_INVALIDELEM = 1815 ; 1815
    #XML_SCHEMAV_NOTDETERMINIST = 1816 ; 1816
    #XML_SCHEMAV_CONSTRUCT = 1817 ; 1817
    #XML_SCHEMAV_INTERNAL = 1818 ; 1818
    #XML_SCHEMAV_NOTSIMPLE = 1819 ; 1819
    #XML_SCHEMAV_ATTRUNKNOWN = 1820 ; 1820
    #XML_SCHEMAV_ATTRINVALID = 1821 ; 1821
    #XML_SCHEMAV_VALUE = 1822 ; 1822
    #XML_SCHEMAV_FACET = 1823 ; 1823
    #XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_1 = 1824 ; 1824
    #XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_2 = 1825 ; 1825
    #XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_3 = 1826 ; 1826
    #XML_SCHEMAV_CVC_TYPE_3_1_1 = 1827 ; 1827
    #XML_SCHEMAV_CVC_TYPE_3_1_2 = 1828 ; 1828
    #XML_SCHEMAV_CVC_FACET_VALID = 1829 ; 1829
    #XML_SCHEMAV_CVC_LENGTH_VALID = 1830 ; 1830
    #XML_SCHEMAV_CVC_MINLENGTH_VALID = 1831 ; 1831
    #XML_SCHEMAV_CVC_MAXLENGTH_VALID = 1832 ; 1832
    #XML_SCHEMAV_CVC_MININCLUSIVE_VALID = 1833 ; 1833
    #XML_SCHEMAV_CVC_MAXINCLUSIVE_VALID = 1834 ; 1834
    #XML_SCHEMAV_CVC_MINEXCLUSIVE_VALID = 1835 ; 1835
    #XML_SCHEMAV_CVC_MAXEXCLUSIVE_VALID = 1836 ; 1836
    #XML_SCHEMAV_CVC_TOTALDIGITS_VALID = 1837 ; 1837
    #XML_SCHEMAV_CVC_FRACTIONDIGITS_VALID = 1838 ; 1838
    #XML_SCHEMAV_CVC_PATTERN_VALID = 1839 ; 1839
    #XML_SCHEMAV_CVC_ENUMERATION_VALID = 1840 ; 1840
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_2_1 = 1841 ; 1841
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_2_2 = 1842 ; 1842
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_2_3 = 1843 ; 1843
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_2_4 = 1844 ; 1844
    #XML_SCHEMAV_CVC_ELT_1 = 1845 ; 1845
    #XML_SCHEMAV_CVC_ELT_2 = 1846 ; 1846
    #XML_SCHEMAV_CVC_ELT_3_1 = 1847 ; 1847
    #XML_SCHEMAV_CVC_ELT_3_2_1 = 1848 ; 1848
    #XML_SCHEMAV_CVC_ELT_3_2_2 = 1849 ; 1849
    #XML_SCHEMAV_CVC_ELT_4_1 = 1850 ; 1850
    #XML_SCHEMAV_CVC_ELT_4_2 = 1851 ; 1851
    #XML_SCHEMAV_CVC_ELT_4_3 = 1852 ; 1852
    #XML_SCHEMAV_CVC_ELT_5_1_1 = 1853 ; 1853
    #XML_SCHEMAV_CVC_ELT_5_1_2 = 1854 ; 1854
    #XML_SCHEMAV_CVC_ELT_5_2_1 = 1855 ; 1855
    #XML_SCHEMAV_CVC_ELT_5_2_2_1 = 1856 ; 1856
    #XML_SCHEMAV_CVC_ELT_5_2_2_2_1 = 1857 ; 1857
    #XML_SCHEMAV_CVC_ELT_5_2_2_2_2 = 1858 ; 1858
    #XML_SCHEMAV_CVC_ELT_6 = 1859 ; 1859
    #XML_SCHEMAV_CVC_ELT_7 = 1860 ; 1860
    #XML_SCHEMAV_CVC_ATTRIBUTE_1 = 1861 ; 1861
    #XML_SCHEMAV_CVC_ATTRIBUTE_2 = 1862 ; 1862
    #XML_SCHEMAV_CVC_ATTRIBUTE_3 = 1863 ; 1863
    #XML_SCHEMAV_CVC_ATTRIBUTE_4 = 1864 ; 1864
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_3_1 = 1865 ; 1865
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_1 = 1866 ; 1866
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_2 = 1867 ; 1867
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_4 = 1868 ; 1868
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_5_1 = 1869 ; 1869
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_5_2 = 1870 ; 1870
    #XML_SCHEMAV_ELEMENT_CONTENT = 1871 ; 1871
    #XML_SCHEMAV_DOCUMENT_ELEMENT_MISSING = 1872 ; 1872
    #XML_SCHEMAV_CVC_COMPLEX_TYPE_1 = 1873 ; 1873
    #XML_SCHEMAV_CVC_AU = 1874 ; 1874
    #XML_SCHEMAV_CVC_TYPE_1 = 1875 ; 1875
    #XML_SCHEMAV_CVC_TYPE_2 = 1876 ; 1876
    #XML_SCHEMAV_CVC_IDC = 1877 ; 1877
    #XML_SCHEMAV_CVC_WILDCARD = 1878 ; 1878
    #XML_SCHEMAV_MISC = 1879 ; 1879
    #XML_XPTR_UNKNOWN_SCHEME = 1900
    #XML_XPTR_CHILDSEQ_START = 1901 ; 1901
    #XML_XPTR_EVAL_FAILED = 1902 ; 1902
    #XML_XPTR_EXTRA_OBJECTS = 1903 ; 1903
    #XML_C14N_CREATE_CTXT = 1950
    #XML_C14N_REQUIRES_UTF8 = 1951 ; 1951
    #XML_C14N_CREATE_STACK = 1952 ; 1952
    #XML_C14N_INVALID_NODE = 1953 ; 1953
    #XML_C14N_UNKNOW_NODE = 1954 ; 1954
    #XML_C14N_RELATIVE_NAMESPACE = 1955 ; 1955
    #XML_FTP_PASV_ANSWER = 2000
    #XML_FTP_EPSV_ANSWER = 2001 ; 2001
    #XML_FTP_ACCNT = 2002 ; 2002
    #XML_FTP_URL_SYNTAX = 2003 ; 2003
    #XML_HTTP_URL_SYNTAX = 2020
    #XML_HTTP_USE_IP = 2021 ; 2021
    #XML_HTTP_UNKNOWN_HOST = 2022 ; 2022
    #XML_SCHEMAP_SRC_SIMPLE_TYPE_1 = 3000
    #XML_SCHEMAP_SRC_SIMPLE_TYPE_2 = 3001 ; 3001
    #XML_SCHEMAP_SRC_SIMPLE_TYPE_3 = 3002 ; 3002
    #XML_SCHEMAP_SRC_SIMPLE_TYPE_4 = 3003 ; 3003
    #XML_SCHEMAP_SRC_RESOLVE = 3004 ; 3004
    #XML_SCHEMAP_SRC_RESTRICTION_BASE_OR_SIMPLETYPE = 3005 ; 3005
    #XML_SCHEMAP_SRC_LIST_ITEMTYPE_OR_SIMPLETYPE = 3006 ; 3006
    #XML_SCHEMAP_SRC_UNION_MEMBERTYPES_OR_SIMPLETYPES = 3007 ; 3007
    #XML_SCHEMAP_ST_PROPS_CORRECT_1 = 3008 ; 3008
    #XML_SCHEMAP_ST_PROPS_CORRECT_2 = 3009 ; 3009
    #XML_SCHEMAP_ST_PROPS_CORRECT_3 = 3010 ; 3010
    #XML_SCHEMAP_COS_ST_RESTRICTS_1_1 = 3011 ; 3011
    #XML_SCHEMAP_COS_ST_RESTRICTS_1_2 = 3012 ; 3012
    #XML_SCHEMAP_COS_ST_RESTRICTS_1_3_1 = 3013 ; 3013
    #XML_SCHEMAP_COS_ST_RESTRICTS_1_3_2 = 3014 ; 3014
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_1 = 3015 ; 3015
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_1 = 3016 ; 3016
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_2 = 3017 ; 3017
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_1 = 3018 ; 3018
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_2 = 3019 ; 3019
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_3 = 3020 ; 3020
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_4 = 3021 ; 3021
    #XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_5 = 3022 ; 3022
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_1 = 3023 ; 3023
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1 = 3024 ; 3024
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1_2 = 3025 ; 3025
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_2 = 3026 ; 3026
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_1 = 3027 ; 3027
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_3 = 3028 ; 3028
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_4 = 3029 ; 3029
    #XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_5 = 3030 ; 3030
    #XML_SCHEMAP_COS_ST_DERIVED_OK_2_1 = 3031 ; 3031
    #XML_SCHEMAP_COS_ST_DERIVED_OK_2_2 = 3032 ; 3032
    #XML_SCHEMAP_S4S_ELEM_NOT_ALLOWED = 3033 ; 3033
    #XML_SCHEMAP_S4S_ELEM_MISSING = 3034 ; 3034
    #XML_SCHEMAP_S4S_ATTR_NOT_ALLOWED = 3035 ; 3035
    #XML_SCHEMAP_S4S_ATTR_MISSING = 3036 ; 3036
    #XML_SCHEMAP_S4S_ATTR_INVALID_VALUE = 3037 ; 3037
    #XML_SCHEMAP_SRC_ELEMENT_1 = 3038 ; 3038
    #XML_SCHEMAP_SRC_ELEMENT_2_1 = 3039 ; 3039
    #XML_SCHEMAP_SRC_ELEMENT_2_2 = 3040 ; 3040
    #XML_SCHEMAP_SRC_ELEMENT_3 = 3041 ; 3041
    #XML_SCHEMAP_P_PROPS_CORRECT_1 = 3042 ; 3042
    #XML_SCHEMAP_P_PROPS_CORRECT_2_1 = 3043 ; 3043
    #XML_SCHEMAP_P_PROPS_CORRECT_2_2 = 3044 ; 3044
    #XML_SCHEMAP_E_PROPS_CORRECT_2 = 3045 ; 3045
    #XML_SCHEMAP_E_PROPS_CORRECT_3 = 3046 ; 3046
    #XML_SCHEMAP_E_PROPS_CORRECT_4 = 3047 ; 3047
    #XML_SCHEMAP_E_PROPS_CORRECT_5 = 3048 ; 3048
    #XML_SCHEMAP_E_PROPS_CORRECT_6 = 3049 ; 3049
    #XML_SCHEMAP_SRC_INCLUDE = 3050 ; 3050
    #XML_SCHEMAP_SRC_ATTRIBUTE_1 = 3051 ; 3051
    #XML_SCHEMAP_SRC_ATTRIBUTE_2 = 3052 ; 3052
    #XML_SCHEMAP_SRC_ATTRIBUTE_3_1 = 3053 ; 3053
    #XML_SCHEMAP_SRC_ATTRIBUTE_3_2 = 3054 ; 3054
    #XML_SCHEMAP_SRC_ATTRIBUTE_4 = 3055 ; 3055
    #XML_SCHEMAP_NO_XMLNS = 3056 ; 3056
    #XML_SCHEMAP_NO_XSI = 3057 ; 3057
    #XML_SCHEMAP_COS_VALID_DEFAULT_1 = 3058 ; 3058
    #XML_SCHEMAP_COS_VALID_DEFAULT_2_1 = 3059 ; 3059
    #XML_SCHEMAP_COS_VALID_DEFAULT_2_2_1 = 3060 ; 3060
    #XML_SCHEMAP_COS_VALID_DEFAULT_2_2_2 = 3061 ; 3061
    #XML_SCHEMAP_CVC_SIMPLE_TYPE = 3062 ; 3062
    #XML_SCHEMAP_COS_CT_EXTENDS_1_1 = 3063 ; 3063
    #XML_SCHEMAP_SRC_IMPORT_1_1 = 3064 ; 3064
    #XML_SCHEMAP_SRC_IMPORT_1_2 = 3065 ; 3065
    #XML_SCHEMAP_SRC_IMPORT_2 = 3066 ; 3066
    #XML_SCHEMAP_SRC_IMPORT_2_1 = 3067 ; 3067
    #XML_SCHEMAP_SRC_IMPORT_2_2 = 3068 ; 3068
    #XML_SCHEMAP_INTERNAL = 3069 ; 3069 non-W3C
    #XML_SCHEMAP_NOT_DETERMINISTIC = 3070 ; 3070 non-W3C
    #XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_1 = 3071 ; 3071
    #XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_2 = 3072 ; 3072
    #XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_3 = 3073 ; 3073
    #XML_SCHEMAP_MG_PROPS_CORRECT_1 = 3074 ; 3074
    #XML_SCHEMAP_MG_PROPS_CORRECT_2 = 3075 ; 3075
    #XML_SCHEMAP_SRC_CT_1 = 3076 ; 3076
    #XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_3 = 3077 ; 3077
    #XML_SCHEMAP_AU_PROPS_CORRECT_2 = 3078 ; 3078
    #XML_SCHEMAP_A_PROPS_CORRECT_2 = 3079 ; 3079
    #XML_SCHEMAP_C_PROPS_CORRECT = 3080 ; 3080
    #XML_SCHEMAP_SRC_REDEFINE = 3081 ; 3081
    #XML_SCHEMAP_SRC_IMPORT = 3082 ; 3082
    #XML_SCHEMAP_WARN_SKIP_SCHEMA = 3083 ; 3083
    #XML_SCHEMAP_WARN_UNLOCATED_SCHEMA = 3084 ; 3084
    #XML_SCHEMAP_WARN_ATTR_REDECL_PROH = 3085 ; 3085
    #XML_SCHEMAP_WARN_ATTR_POINTLESS_PROH = 3086 ; 3085
    #XML_SCHEMAP_AG_PROPS_CORRECT = 3087 ; 3086
    #XML_SCHEMAP_COS_CT_EXTENDS_1_2 = 3088 ; 3087
    #XML_SCHEMAP_AU_PROPS_CORRECT = 3089 ; 3088
    #XML_SCHEMAP_A_PROPS_CORRECT_3 = 3090 ; 3089
    #XML_SCHEMAP_COS_ALL_LIMITED = 3091 ; 3090
    #XML_MODULE_OPEN = 4900 ; 4900
    #XML_MODULE_CLOSE = 4901 ; 4901
    #XML_CHECK_FOUND_ELEMENT = 5000
    #XML_CHECK_FOUND_ATTRIBUTE = 5001 ; 5001
    #XML_CHECK_FOUND_TEXT = 5002 ; 5002
    #XML_CHECK_FOUND_CDATA = 5003 ; 5003
    #XML_CHECK_FOUND_ENTITYREF = 5004 ; 5004
    #XML_CHECK_FOUND_ENTITY = 5005 ; 5005
    #XML_CHECK_FOUND_PI = 5006 ; 5006
    #XML_CHECK_FOUND_COMMENT = 5007 ; 5007
    #XML_CHECK_FOUND_DOCTYPE = 5008 ; 5008
    #XML_CHECK_FOUND_FRAGMENT = 5009 ; 5009
    #XML_CHECK_FOUND_NOTATION = 5010 ; 5010
    #XML_CHECK_UNKNOWN_NODE = 5011 ; 5011
    #XML_CHECK_ENTITY_TYPE = 5012 ; 5012
    #XML_CHECK_NO_PARENT = 5013 ; 5013
    #XML_CHECK_NO_DOC = 5014 ; 5014
    #XML_CHECK_NO_NAME = 5015 ; 5015
    #XML_CHECK_NO_ELEM = 5016 ; 5016
    #XML_CHECK_WRONG_DOC = 5017 ; 5017
    #XML_CHECK_NO_PREV = 5018 ; 5018
    #XML_CHECK_WRONG_PREV = 5019 ; 5019
    #XML_CHECK_NO_NEXT = 5020 ; 5020
    #XML_CHECK_WRONG_NEXT = 5021 ; 5021
    #XML_CHECK_NOT_DTD = 5022 ; 5022
    #XML_CHECK_NOT_ATTR = 5023 ; 5023
    #XML_CHECK_NOT_ATTR_DECL = 5024 ; 5024
    #XML_CHECK_NOT_ELEM_DECL = 5025 ; 5025
    #XML_CHECK_NOT_ENTITY_DECL = 5026 ; 5026
    #XML_CHECK_NOT_NS_DECL = 5027 ; 5027
    #XML_CHECK_NO_HREF = 5028 ; 5028
    #XML_CHECK_WRONG_PARENT = 5029 ; 5029
    #XML_CHECK_NS_SCOPE = 5030 ; 5030
    #XML_CHECK_NS_ANCESTOR = 5031 ; 5031
    #XML_CHECK_NOT_UTF8 = 5032 ; 5032
    #XML_CHECK_NO_DICT = 5033 ; 5033
    #XML_CHECK_NOT_NCNAME = 5034 ; 5034
    #XML_CHECK_OUTSIDE_DICT = 5035 ; 5035
    #XML_CHECK_WRONG_NAME = 5036 ; 5036
    #XML_CHECK_NAME_NOT_NULL = 5037 ; 5037
    #XML_I18N_NO_NAME = 6000
    #XML_I18N_NO_HANDLER = 6001 ; 6001
    #XML_I18N_EXCESS_HANDLER = 6002 ; 6002
    #XML_I18N_CONV_FAILED = 6003 ; 6003
    #XML_I18N_NO_OUTPUT = 6004 ; 6004
    #XML_CHECK_ = 6005 ; 5033
    #XML_CHECK_X = 6006 ; 503
  EndEnumeration
  ; xmlmodule; dynamic module loading
  Enumeration ; xmlModuleOption 
    #XML_MODULE_LAZY = 1 ; lazy binding
    #XML_MODULE_LOCAL = 2 ; local binding
  EndEnumeration
  ; xmlreader; the XMLReader implementation
  Enumeration ; xmlParserProperties 
    #XML_PARSER_LOADDTD = 1
    #XML_PARSER_DEFAULTATTRS = 2
    #XML_PARSER_VALIDATE = 3
    #XML_PARSER_SUBST_ENTITIES = 4
  EndEnumeration
  Enumeration ; xmlParserSeverities 
    #XML_PARSER_SEVERITY_VALIDITY_WARNING = 1
    #XML_PARSER_SEVERITY_VALIDITY_ERROR = 2
    #XML_PARSER_SEVERITY_WARNING = 3
    #XML_PARSER_SEVERITY_ERROR = 4
  EndEnumeration
  Enumeration ; xmlReaderTypes 
    #XML_READER_TYPE_NONE = 0
    #XML_READER_TYPE_ELEMENT = 1
    #XML_READER_TYPE_ATTRIBUTE = 2
    #XML_READER_TYPE_TEXT = 3
    #XML_READER_TYPE_CDATA = 4
    #XML_READER_TYPE_ENTITY_REFERENCE = 5
    #XML_READER_TYPE_ENTITY = 6
    #XML_READER_TYPE_PROCESSING_INSTRUCTION = 7
    #XML_READER_TYPE_COMMENT = 8
    #XML_READER_TYPE_DOCUMENT = 9
    #XML_READER_TYPE_DOCUMENT_TYPE = 10
    #XML_READER_TYPE_DOCUMENT_FRAGMENT = 11
    #XML_READER_TYPE_NOTATION = 12
    #XML_READER_TYPE_WHITESPACE = 13
    #XML_READER_TYPE_SIGNIFICANT_WHITESPACE = 14
    #XML_READER_TYPE_END_ELEMENT = 15
    #XML_READER_TYPE_END_ENTITY = 16
    #XML_READER_TYPE_XML_DECLARATION = 17
  EndEnumeration
  Enumeration ; xmlTextReaderMode 
    #XML_TEXTREADER_MODE_INITIAL = 0
    #XML_TEXTREADER_MODE_INTERACTIVE = 1
    #XML_TEXTREADER_MODE_ERROR = 2
    #XML_TEXTREADER_MODE_EOF = 3
    #XML_TEXTREADER_MODE_CLOSED = 4
    #XML_TEXTREADER_MODE_READING = 5
  EndEnumeration
  ; xmlregexp; regular expressions handling
  Enumeration ; xmlExpNodeType 
    #XML_EXP_EMPTY = 0
    #XML_EXP_FORBID = 1
    #XML_EXP_ATOM = 2
    #XML_EXP_SEQ = 3
    #XML_EXP_OR = 4
    #XML_EXP_COUNT = 5
  EndEnumeration
  ; xmlsave; the XML document serializer
  Enumeration ; xmlSaveOption 
    #XML_SAVE_FORMAT = 1 ; format save output
    #XML_SAVE_NO_DECL = 2 ; drop the xml declaration
    #XML_SAVE_NO_EMPTY = 4 ; no empty tags
    #XML_SAVE_NO_XHTML = 8 ; disable XHTML1 specific rules
  EndEnumeration
  ; xmlschemas; incomplete XML Schemas Structure implementation
  Enumeration ; xmlSchemaValidError 
    #XML_SCHEMAS_ERR_OK = 0
    #XML_SCHEMAS_ERR_NOROOT = 1
    #XML_SCHEMAS_ERR_UNDECLAREDELEM = 2
    #XML_SCHEMAS_ERR_NOTTOPLEVEL = 3
    #XML_SCHEMAS_ERR_MISSING = 4
    #XML_SCHEMAS_ERR_WRONGELEM = 5
    #XML_SCHEMAS_ERR_NOTYPE = 6
    #XML_SCHEMAS_ERR_NOROLLBACK = 7
    #XML_SCHEMAS_ERR_ISABSTRACT = 8
    #XML_SCHEMAS_ERR_NOTEMPTY = 9
    #XML_SCHEMAS_ERR_ELEMCONT = 10
    #XML_SCHEMAS_ERR_HAVEDEFAULT = 11
    #XML_SCHEMAS_ERR_NOTNILLABLE = 12
    #XML_SCHEMAS_ERR_EXTRACONTENT = 13
    #XML_SCHEMAS_ERR_INVALIDATTR = 14
    #XML_SCHEMAS_ERR_INVALIDELEM = 15
    #XML_SCHEMAS_ERR_NOTDETERMINIST = 16
    #XML_SCHEMAS_ERR_CONSTRUCT = 17
    #XML_SCHEMAS_ERR_INTERNAL = 18
    #XML_SCHEMAS_ERR_NOTSIMPLE = 19
    #XML_SCHEMAS_ERR_ATTRUNKNOWN = 20
    #XML_SCHEMAS_ERR_ATTRINVALID = 21
    #XML_SCHEMAS_ERR_VALUE = 22
    #XML_SCHEMAS_ERR_FACET = 23
    #XML_SCHEMAS_ERR_ = 24
    #XML_SCHEMAS_ERR_XXX = 25
  EndEnumeration
  Enumeration ; xmlSchemaValidOption 
    #XML_SCHEMA_VAL_VC_I_CREATE = 1 ; Default/fixed; create an attribute node * Or an element's text node on the instance. *
  EndEnumeration
  ; xmlschemastypes; implementation of XML Schema Datatypes
  Enumeration ; xmlSchemaWhitespaceValueType 
    #XML_SCHEMA_WHITESPACE_UNKNOWN = 0
    #XML_SCHEMA_WHITESPACE_PRESERVE = 1
    #XML_SCHEMA_WHITESPACE_REPLACE = 2
    #XML_SCHEMA_WHITESPACE_COLLAPSE = 3
  EndEnumeration
  ; xpath; XML Path Language implementation
  Enumeration ; xmlXPathError 
    #XPATH_EXPRESSION_OK = 0
    #XPATH_NUMBER_ERROR = 1
    #XPATH_UNFINISHED_LITERAL_ERROR = 2
    #XPATH_START_LITERAL_ERROR = 3
    #XPATH_VARIABLE_REF_ERROR = 4
    #XPATH_UNDEF_VARIABLE_ERROR = 5
    #XPATH_INVALID_PREDICATE_ERROR = 6
    #XPATH_EXPR_ERROR = 7
    #XPATH_UNCLOSED_ERROR = 8
    #XPATH_UNKNOWN_FUNC_ERROR = 9
    #XPATH_INVALID_OPERAND = 10
    #XPATH_INVALID_TYPE = 11
    #XPATH_INVALID_ARITY = 12
    #XPATH_INVALID_CTXT_SIZE = 13
    #XPATH_INVALID_CTXT_POSITION = 14
    #XPATH_MEMORY_ERROR = 15
    #XPTR_SYNTAX_ERROR = 16
    #XPTR_RESOURCE_ERROR = 17
    #XPTR_SUB_RESOURCE_ERROR = 18
    #XPATH_UNDEF_PREFIX_ERROR = 19
    #XPATH_ENCODING_ERROR = 20
    #XPATH_INVALID_CHAR_ERROR = 21
    #XPATH_INVALID_CTXT = 22
  EndEnumeration
  Enumeration ; xmlXPathObjectType 
    #XPATH_UNDEFINED = 0
    #XPATH_NODESET = 1
    #XPATH_BOOLEAN = 2
    #XPATH_NUMBER = 3
    #XPATH_STRING = 4
    #XPATH_POINT = 5
    #XPATH_RANGE = 6
    #XPATH_LOCATIONSET = 7
    #XPATH_USERS = 8
    #XPATH_XSLT_TREE = 9 ; An XSLT value tree, non modifiable
  EndEnumeration
;}

;{ Macros EndStructure
Macro xmlFree
  xmlMemFree
EndMacro
; xmlMalloc = (xmlMallocFunc) xmlMemMalloc;
; - xmlReallocFunc xmlRealloc = (xmlReallocFunc) xmlMemRealloc;
; - xmlStrdupFunc xmlMemStrdup = (xmlStrdupFunc) xmlMemoryStrdup;
Macro xmlXPathNodeSetIsEmpty(ns)
  ((ns = #Null) Or (ns\nodeNr = 0) Or (ns\nodeTab = #Null))
EndMacro
;}

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 195
; Folding = AAAAAAAAAAAAAAAAAAAAAAA-