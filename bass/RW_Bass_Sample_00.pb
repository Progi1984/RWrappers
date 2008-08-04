;================================================================
; Project   Bass
; Title     Sample_00
; Author    Progi1984
; Date      20/03/08
; Notes     Listing tags of a MP3 file
;================================================================

XIncludeFile "RW_Bass_Inc.pb"
EnableExplicit
  If OpenWindow(0,100,150,450,200,"Test",#PB_Window_SystemMenu|#PB_Window_Invisible) 
  EndIf
  
  Global *info.BASS_INFO
  
  BASS_Init(-1,#WAVE_FORMAT_4S16,0,WindowID(0),#Null) 

  Debug "BASS Option > "
  Debug BASS_GetConfig(#BASS_CONFIG_BUFFER)
  Debug BASS_GetConfig(#BASS_CONFIG_UPDATEPERIOD)
  Debug BASS_GetConfig(#BASS_CONFIG_MAXVOL)
  Debug BASS_GetConfig(#BASS_CONFIG_GVOL_SAMPLE)
  Debug BASS_GetConfig(#BASS_CONFIG_GVOL_STREAM)
  Debug BASS_GetConfig(#BASS_CONFIG_GVOL_MUSIC)
  Debug BASS_GetConfig(#BASS_CONFIG_CURVE_VOL	)
  Debug BASS_GetConfig(#BASS_CONFIG_CURVE_PAN)
  Debug BASS_GetConfig(#BASS_CONFIG_FLOATDSP)
  Debug BASS_GetConfig(#BASS_CONFIG_3DALGORITHM)
  Debug BASS_GetConfig(#BASS_CONFIG_NET_TIMEOUT)
  Debug BASS_GetConfig(#BASS_CONFIG_NET_BUFFER)
  Debug BASS_GetConfig(#BASS_CONFIG_PAUSE_NOPLAY)
  Debug BASS_GetConfig(#BASS_CONFIG_NET_PREBUF)
  Debug BASS_GetConfig(#BASS_CONFIG_NET_PASSIVE	)
  Debug BASS_GetConfig(#BASS_CONFIG_REC_BUFFER)
  Debug BASS_GetConfig(#BASS_CONFIG_NET_PLAYLIST)
  Debug BASS_GetConfig(#BASS_CONFIG_MUSIC_VIRTUAL	)

  Debug "BASS Version > "+Hex(BASS_GetVersion())
  Debug "BASS Device > "+Str(BASS_GetDevice())

  Debug "BASS CPU usage >"+Str(BASS_GetCPU())
  Debug "BASS Volume >"+Str(BASS_GetVolume())
; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 7
; Folding = -