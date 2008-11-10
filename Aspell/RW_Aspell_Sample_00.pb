XIncludeFile "RW_Aspell_Inc.pb"

  Global *config.AspellConfig
  Global *dlist.AspellDictInfoList
  Global *dels.AspellDictInfoEnumeration
  Global *entry.AspellDictInfo

  *config = new_aspell_config()
  aspell_config_replace(*config, "dict-dir", "dict_fr")
  ; the returned pointer should _not_ need To be deleted 
  *dlist = get_aspell_dict_info_list(*config)

  ; config is no longer needed 
  delete_aspell_config(*config)

  *dels = aspell_dict_info_list_elements(*dlist)
  *entry = aspell_dict_info_enumeration_next(*dels)
  While *entry <> 0
    Debug "NAME   "+ PeekS(*entry\name,-1,#PB_Ascii)
    Debug "CODE   "+ PeekS(*entry\code ,-1,#PB_Ascii)
    Debug "JARGON "+ PeekS(*entry\jargon ,-1,#PB_Ascii)
    Debug "SIZE   "+ Str(*entry\size_str)
    Debug "MODULE "+PeekS(*entry\module\name,-1,#PB_Ascii)
    Debug "-----------------------------"
	  *entry = aspell_dict_info_enumeration_next(*dels)
  Wend

  delete_aspell_dict_info_enumeration(*dels)

; IDE Options = PureBasic 4.30 Beta 4 (Windows - x86)
; CursorPosition = 10
; Folding = -