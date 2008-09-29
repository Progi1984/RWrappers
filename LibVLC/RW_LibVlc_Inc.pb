﻿XIncludeFile "RW_LibVlc_Res.pb"

Import "libvlc.lib"
  VLC_AddIntf(object.l, psz_name.s, b_block.l, b_play.l) As "_VLC_AddIntf"
  VLC_AddTarget(object.l, psz_var.s, *ppsz_options, i_options.l, mode.l, pos.l) As "_VLC_AddTarget"
  VLC_CleanUp(object.l) As "_VLC_CleanUp"
  VLC_CompileBy() As "_VLC_CompileBy"
  VLC_CompileDomain() As "_VLC_CompileDomain"
  VLC_CompileHost() As "_VLC_CompileHost"
  VLC_Compiler() As "_VLC_Compiler"
  VLC_Create() As "_VLC_Create"
  VLC_Destroy(object.l) As "_VLC_Destroy"
  VLC_Die(object.l) As "_VLC_Die"
  VLC_Error(object.l) As "_VLC_Error"
  VLC_FullScreen(object.l) As "_VLC_FullScreen"
  VLC_Init(object.l, num_commands.l, *dim_commands) As "_VLC_Init"
  VLC_IsPlaying(object.l) As "_VLC_IsPlaying"
  VLC_LengthGet(object.l) As "_VLC_LengthGet"
  VLC_Pause(object.l) As "_VLC_Pause"
  VLC_Play(object.l) As "_VLC_Play"
  VLC_PlaylistClear(object.l) As "_VLC_PlaylistClear"
  VLC_PlaylistIndex(object.l) As "_VLC_PlaylistIndex"
  VLC_PlaylistNext(object.l) As "_VLC_PlaylistNext"
  VLC_PlaylistNumberOfItems(object.l) As "_VLC_PlaylistNumberOfItems"
  VLC_PlaylistPrev(object.l) As "_VLC_PlaylistPrev"
  VLC_PositionGet(object.l) As "_VLC_PositionGet"
  VLC_PositionSet(object.l, position.l) As "_VLC_PositionSet"
  VLC_SpeedFaster(object.l) As "_VLC_SpeedFaster"
  VLC_SpeedSlower(object.l) As "_VLC_SpeedSlower"
  VLC_Stop(object.l) As "_VLC_Stop"
  VLC_TimeGet(object.l) As "_VLC_TimeGet"
  VLC_TimeSet(object.l, seconds.l, relative.b) As "_VLC_TimeSet"
  VLC_VariableGet(object.l, psz_var.s, *value) As "_VLC_VariableGet"
  VLC_VariableSet(object.l, psz_var.s, *value) As "_VLC_VariableSet"
  VLC_VariableType(object.l, psz_var.s, *pi_type.l) As "_VLC_VariableType"
  VLC_Version() As "_VLC_Version"
  VLC_VolumeGet(object.l) As "_VLC_VolumeGet"
  VLC_VolumeMute(object.l) As "_VLC_VolumeMute"
  VLC_VolumeSet(object.l, volume.l) As "_VLC_VolumeSet"
EndImport

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 33
; Folding = +