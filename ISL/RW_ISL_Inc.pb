  XIncludeFile "RW_ISL_Res.pb"

  Import "ISL.lib"
    ISL_Initialize() As "_ISL_Initialize@0"
  
    ISL_LoadScriptFromFile(*filename.s) As "_ISL_LoadScriptFromFile@4"
    ISL_LoadScriptFromMemory(mem.l) As "_ISL_LoadScriptFromMemory@4"
  
    ISL_ReadScriptHeaderFromFile(*filename.s, *header.ISL_ScriptHeader) As "_ISL_ReadScriptHeaderFromFile@8"
    ISL_ReadScriptHeaderFromMemory(mem.l, *header.ISL_ScriptHeader) As "_ISL_ReadScriptHeaderFromMemory@8"
  
  
    ISL_AddEffect(eff_id.l, seamless.l) As "_ISL_AddEffect@8"
    ISL_GetEffectValue(nb_eff.l, nb_value.l) As "_ISL_GetEffectValue@8"
    ISL_SetEffectValue(nb_eff.l, nb_value.l, value.l) As "_ISL_SetEffectValue@12"
  
    ISL_ExecuteScript(mem.l) As "_ISL_ExecuteScript@4"
    ISL_ExecuteScriptOnImage(mem.l, width.l, height.l) As "_ISL_ExecuteScriptOnImage@12"
  
    ISL_InitBuffers() As "_ISL_InitBuffers@0"
    ISL_InitBuffers_WH(width.l, height.l) As "_ISL_InitBuffers_WH@8"
  
    ISL_Finish() As "_ISL_Finish@0"
  
    ISL_GetJPGImageDimensions(*filename.s, width.l, height.l) As "_ISL_GetJPGImageDimensions@12"
    ISL_LoadJPGImage(*filename.s, mem.l) As "_ISL_LoadJPGImage@8"
    ISL_SaveBMPImage(*filename.s, mem.l, width.l, height.l) As "_ISL_SaveBMPImage@16"
    ISL_SaveJPGImage(*filename.s, mem.l, width.l, height.l) As "_ISL_SaveJPGImage@16"
  
    ISL_GetVersion() As "_ISL_GetVersion@0"
  EndImport
  ProcedureDLL.s  ISL_GetVersion_S()
    Protected value.l
    Protected string.s
    
    value   = ISL_GetVersion()
    value   = value & 16711680
    value   = (value >> 16)-48
    string  = Str(value) + "."
    value   = ISL_GetVersion() & 255
    value   = value - 48
    string  = string + Str(value)
    ProcedureReturn  string
  EndProcedure
  
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 44
; Folding = 9