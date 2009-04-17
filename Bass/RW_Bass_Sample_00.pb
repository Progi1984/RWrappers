;================================================================
; Project   Bass
; Title     Sample_00
; Author    Progi1984
; Date      20/03/08
; Notes     Get configurations data
;================================================================

XIncludeFile "RW_Bass_Inc.pb"
EnableExplicit
  
  BASS_Init(-1,#WAVE_FORMAT_4S16,0,#Null,#Null) 

  Debug "BASS Option > #BASS_CONFIG_BUFFER > " + Str(BASS_GetConfig(#BASS_CONFIG_BUFFER))
  Debug "BASS Option > #BASS_CONFIG_UPDATEPERIOD > " + Str(BASS_GetConfig(#BASS_CONFIG_UPDATEPERIOD))
  Debug "BASS Option > #BASS_CONFIG_GVOL_SAMPLE > " + Str(BASS_GetConfig(#BASS_CONFIG_GVOL_SAMPLE))
  Debug "BASS Option > #BASS_CONFIG_GVOL_STREAM > " + Str(BASS_GetConfig(#BASS_CONFIG_GVOL_STREAM))
  Debug "BASS Option > #BASS_CONFIG_GVOL_MUSIC > " + Str(BASS_GetConfig(#BASS_CONFIG_GVOL_MUSIC))
  Debug "BASS Option > #BASS_CONFIG_CURVE_VOL > " + Str(BASS_GetConfig(#BASS_CONFIG_CURVE_VOL))
  Debug "BASS Option > #BASS_CONFIG_CURVE_PAN > " + Str(BASS_GetConfig(#BASS_CONFIG_CURVE_PAN))
  Debug "BASS Option > #BASS_CONFIG_FLOATDSP > " + Str(BASS_GetConfig(#BASS_CONFIG_FLOATDSP))
  Debug "BASS Option > #BASS_CONFIG_3DALGORITHM > " + Str(BASS_GetConfig(#BASS_CONFIG_3DALGORITHM))
  Debug "BASS Option > #BASS_CONFIG_NET_TIMEOUT > " + Str(BASS_GetConfig(#BASS_CONFIG_NET_TIMEOUT))
  Debug "BASS Option > #BASS_CONFIG_NET_BUFFER > " + Str(BASS_GetConfig(#BASS_CONFIG_NET_BUFFER))
  Debug "BASS Option > #BASS_CONFIG_PAUSE_NOPLAY > " + Str(BASS_GetConfig(#BASS_CONFIG_PAUSE_NOPLAY))
  Debug "BASS Option > #BASS_CONFIG_NET_PREBUF > " + Str(BASS_GetConfig(#BASS_CONFIG_NET_PREBUF))
  Debug "BASS Option > #BASS_CONFIG_NET_PASSIVE > " + Str(BASS_GetConfig(#BASS_CONFIG_NET_PASSIVE))
  Debug "BASS Option > #BASS_CONFIG_REC_BUFFER > " + Str(BASS_GetConfig(#BASS_CONFIG_REC_BUFFER))
  Debug "BASS Option > #BASS_CONFIG_NET_PLAYLIST > " + Str(BASS_GetConfig(#BASS_CONFIG_NET_PLAYLIST))
  Debug "BASS Option > #BASS_CONFIG_MUSIC_VIRTUAL > " + Str(BASS_GetConfig(#BASS_CONFIG_MUSIC_VIRTUAL))
  Debug "BASS Version > "+Hex(BASS_GetVersion())
  Debug "BASS Device > "+Str(BASS_GetDevice())

  Debug "BASS CPU usage >"+Str(BASS_GetCPU())
  Debug "BASS Volume >"+Str(BASS_GetVolume())
; IDE Options = PureBasic 4.30 Beta 4 (Windows - x86)
; CursorPosition = 18
; Folding = -
; EnableUnicode