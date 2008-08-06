;{ Structures
  Structure AspellMutableContainer
  EndStructure
  Structure AspellKeyInfo
    ; the name of the key
    name.s
    ; the key type
    type.l  ; ENUM AspellKeyInfoType
    ; the Default value of the key
    def.s
    ; a brief description of the key Or null If internal value 
    desc.s
    flags.l
    other_data.l
  EndStructure
  Structure AspellKeyInfoEnumeration 
  EndStructure
  Structure AspellConfig
  EndStructure
  Structure AspellError
    mesg.s
    *err.AspellErrorInfo
  EndStructure
  Structure AspellErrorInfo
    *isa.AspellErrorInfo
    mesg.s
    num_parms.l
    parms.s{3}
  EndStructure
  Structure AspellCanHaveError
  EndStructure
  Structure AspellSpeller
  EndStructure
  Structure AspellFilter
  EndStructure
  Structure AspellToken
    offset.l
    len.l
  EndStructure
  Structure AspellDocumentChecker
  EndStructure
  Structure AspellWordList
  EndStructure
  Structure AspellStringEnumeration
  EndStructure
  Structure AspellModuleInfo
    name.s
    order_num.d
    lib_dir.s
    *dict_dirs.AspellStringList
    *dict_exts.AspellStringList
  EndStructure
  Structure AspellDictInfo
    ; name To identify the dictionary by
    name.s
    code.s
    jargon.s
    size.l
    size_str.l
    *module.AspellModuleInfo
  EndStructure
  Structure AspellModuleInfoList
  EndStructure
  Structure AspellDictInfoList
  EndStructure
  Structure AspellModuleInfoEnumeration
  EndStructure
  Structure AspellDictInfoEnumeration
  EndStructure
  Structure AspellStringList
  EndStructure
  Structure AspellStringMap
  EndStructure
  Structure AspellStringPair
    first.s
    second.s
  EndStructure
  Structure AspellStringPairEnumeration
  EndStructure
;}
;{ Enumerations
  Enumeration ; AspellKeyInfoType
    #AspellKeyInfoString
    #AspellKeyInfoInt
    #AspellKeyInfoBool
    #AspellKeyInfoList
  EndEnumeration  
;}


; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 89
; Folding = AAAA9