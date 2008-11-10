;{ Structures
  Structure AspellMutableContainer
  EndStructure
  Structure AspellKeyInfo
    ; the name of the key
    name.l  ; STR
    ; the key type
    type.l  ; ENUM AspellKeyInfoType
    ; the Default value of the key
    def.l  ; STR
    ; a brief description of the key Or null If internal value 
    desc.l  ; STR
    flags.l
    other_data.l
  EndStructure
  Structure AspellKeyInfoEnumeration 
  EndStructure
  Structure AspellConfig
  EndStructure
  Structure AspellError
    mesg.l  ; STR
    *err.AspellErrorInfo
  EndStructure
  Structure AspellErrorInfo
    *isa.AspellErrorInfo
    mesg.l   ; STR
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
    name.l  ; STR
    order_num.d
    lib_dir.l  ; STR
    *dict_dirs.AspellStringList
    *dict_exts.AspellStringList
  EndStructure
  Structure AspellDictInfo
    ; name To identify the dictionary by
    name.l  ; STR
    code.l  ; STR
    jargon.l  ; STR
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
    first.l  ; STR
    second.l  ; STR
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

; IDE Options = PureBasic 4.30 Beta 4 (Windows - x86)
; CursorPosition = 88
; Folding = 9