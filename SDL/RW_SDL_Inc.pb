; Doc
; http://www.siteduzero.com/tuto-3-5300-1-creation-d-une-fenetre-et-de-surfaces.html#ss_part_2
; file:///C:/Perso/Divers/PB_SDL/SDL-1.2.11_Src/docs/html/sdlwaitevent.html
; http://docs.mandragor.org/files/Common_libs_documentation/SDL/SDL_Documentation_project_en/sdlsetvideomode.html

XIncludeFile "RW_SDL_Res.pb"

ProcedureDLL SDLW_Init()
  Global SDLLib.l, SDL_ImageLib.l, SDL_TTF.l
  ;{ SDL Main
  SDLLib = OpenLibrary(#PB_Any, "SDL.dll")
  If SDLLib = 0
    MessageRequester("SDL", "Erreur SDL.dll")
    End
  EndIf
  ;}
  ;{ SDL_Image
  SDL_ImageLib = OpenLibrary(#PB_Any, "SDL_Image.dll")
  If SDL_ImageLib = 0
    MessageRequester("SDL", "Erreur SDL_Image.dll")
    End
  EndIf
  ;}
  ;{ SDL_TTF 
  SDL_TTF = OpenLibrary(#PB_Any, "SDL_ttf.dll")
  If SDL_TTF = 0
    MessageRequester("SDL", "Erreur SDL_ttf.dll")
    End
  EndIf
  ;}
EndProcedure

ProcedureDLL SDLW_End()
  CloseLibrary(SDLLib)
  CloseLibrary(SDL_ImageLib)
  CloseLibrary(SDL_TTF)
EndProcedure

ProcedureDLL.l SDL_AddTimer(interval.l, callback.l, param.l)
  ; Returns : SDL_TimerID
  ProcedureReturn CallCFunction(SDLLib, "SDL_AddTimer", interval.l, callback.l, param.l)
EndProcedure
ProcedureDLL.l SDL_AllocRW()
  ProcedureReturn CallCFunction(SDLLib, "SDL_AllocRW")
EndProcedure
ProcedureDLL.s SDL_AudioDriverName(namebuf.s, maxlen.l)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_AudioDriverName", @namebuf.s, maxlen.l))
EndProcedure
ProcedureDLL.l SDL_AudioInit(driver_name.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_AudioInit", @driver_name.s)
EndProcedure
ProcedureDLL.l SDL_AudioQuit()
  ProcedureReturn CallCFunction(SDLLib, "SDL_AudioQuit")
EndProcedure
ProcedureDLL.l SDL_BuildAudioCVT(*cvt.SDL_AudioCVT, src_format.l, src_channels.l, src_rate.l, dst_format.l, dst_channels.l, dst_rate.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_BuildAudioCVT", *cvt.SDL_AudioCVT, src_format.l, src_channels.l, src_rate.l, dst_format.l, dst_channels.l, dst_rate.l)
EndProcedure
ProcedureDLL.l SDL_CDClose(*cdrom.SDL_CD)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDClose", *cdrom.SDL_CD)
EndProcedure
ProcedureDLL.l SDL_CDEject(*cdrom.SDL_CD)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDEject", *cdrom.SDL_CD)
EndProcedure
ProcedureDLL.l SDL_CDName(*cdrom.SDL_CD)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDName", *cdrom.SDL_CD)
EndProcedure
ProcedureDLL.l SDL_CDNumDrives()
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDNumDrives")
EndProcedure
ProcedureDLL.l SDL_CDOpen(drive.l)
  ; Returns SDL_CD
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDOpen", drive.l)
EndProcedure
ProcedureDLL.l SDL_CDPause(*cdrom.SDL_CD)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDPause", *cdrom.SDL_CD)
EndProcedure
ProcedureDLL.l SDL_CDPlay(*cdrom.SDL_CD, start.l, length.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDPlay", *cdrom.SDL_CD, start.l, length.l)
EndProcedure
ProcedureDLL.l SDL_CDPlayTracks(*cdrom.SDL_CD, start_track.l, start_frame.l, ntracks.l, nframes.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDPlayTracks", *cdrom.SDL_CD, start_track.l, start_frame.l, ntracks.l, nframes.l)
EndProcedure
ProcedureDLL.l SDL_CDResume(*cdrom.SDL_CD)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDResume", *cdrom.SDL_CD)
EndProcedure
ProcedureDLL.l SDL_CDStatus(*cdrom.SDL_CD)
  ; Returs Enum CDstatus
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDStatus", *cdrom.SDL_CD)
EndProcedure
ProcedureDLL.l SDL_CDStop(*cdrom.SDL_CD)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CDStop", *cdrom.SDL_CD)
EndProcedure
ProcedureDLL.l SDL_ClearError()
  ProcedureReturn CallCFunction(SDLLib, "SDL_ClearError")
EndProcedure
ProcedureDLL.l SDL_CloseAudio()
  ProcedureReturn CallCFunction(SDLLib, "SDL_CloseAudio")
EndProcedure
ProcedureDLL.l SDL_CondBroadcast(*cond.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CondBroadcast", *cond.l)
EndProcedure
ProcedureDLL.l SDL_CondSignal(*cond.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CondSignal", *cond.l)
EndProcedure
ProcedureDLL.l SDL_CondWait(*cond.l, *mut.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CondWait", *cond.l, *mut.l)
EndProcedure
ProcedureDLL.l SDL_CondWaitTimeout(*cond.l, *mut.l, ms.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CondWaitTimeout", *cond.l, *mut.l, ms.l)
EndProcedure
ProcedureDLL.l SDL_ConvertAudio(*cvt.SDL_AudioCVT)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ConvertAudio", *cvt.SDL_AudioCVT)
EndProcedure
ProcedureDLL.l SDL_ConvertSurface(*src.SDL_Surface, *fmt.SDL_PixelFormat, flags.l)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDLLib, "SDL_ConvertSurface", *src.SDL_Surface, *fmt.SDL_PixelFormat, flags.l)
EndProcedure
ProcedureDLL.l SDL_CreateCond()
  ; Returns SDL_cond
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateCond")
EndProcedure
ProcedureDLL.l SDL_CreateCursor(*data_.l, *mask.l, w.l, h.l, hot_x.l, hot_w.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateCursor", *data_.l, *mask.l, w.l, h.l, hot_x.l, hot_w.l)
EndProcedure
ProcedureDLL.l SDL_CreateMutex()
  ; Returns SDL_mutex
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateMutex")
EndProcedure
ProcedureDLL.l SDL_CreateRGBSurface(Flags.l, Width.l, Height.l, Depth.l, RMask.l, GMask.l, BMask.l, AMask.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateRGBSurface", Flags.l, Width.l, Height.l, Depth.l, RMask.l, GMask.l, BMask.l, AMask.l)
EndProcedure
ProcedureDLL.l SDL_CreateRGBSurfaceFrom(pixels.l, width.l, height.l, depth.l, pitch.l, Rmask.l, Gmask.l, Bmask.l, Amask.l)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateRGBSurfaceFrom", pixels.l, width.l, height.l, depth.l, pitch.l, Rmask.l, Gmask.l, Bmask.l, Amask.l)
EndProcedure
ProcedureDLL.l SDL_CreateSemaphore(initial_value.l)
  ; Returns SDL_sem
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateSemaphore", initial_value.l)
EndProcedure
ProcedureDLL.l SDL_CreateThread(fn.l, Data_.l)
  ; Returns SDL_Thread
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateThread", fn.l, Data_.l)
EndProcedure
ProcedureDLL.l SDL_CreateYUVOverlay(width.l, height.l, format.l, *display.SDL_Surface)
  ; Returns SDL_Overlay
  ProcedureReturn CallCFunction(SDLLib, "SDL_CreateYUVOverlay", width.l, height.l, format.l, *display.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_Delay(ms.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_Delay", ms.l)
EndProcedure
ProcedureDLL.l SDL_DestroyCond(*cond.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_DestroyCond", *cond.l)
EndProcedure
ProcedureDLL.l SDL_DestroyMutex(*mutex.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_DestroyMutex", *mutex.l)
EndProcedure
ProcedureDLL.l SDL_DestroySemaphore(*sem.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_DestroySemaphore", *sem.l)
EndProcedure
ProcedureDLL.l SDL_DisplayFormat(*surface.SDL_Surface)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDLLib, "SDL_DisplayFormat", *surface.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_DisplayFormatAlpha(*surface.SDL_Surface)
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDLLib, "SDL_DisplayFormatAlpha", *surface.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_DisplayYUVOverlay(*overlay.SDL_Overlay, *dstrect.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_DisplayYUVOverlay", *overlay.SDL_Overlay, *dstrect.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_EnableKeyRepeat(delay.l, interval.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_EnableKeyRepeat", delay.l, interval.l)
EndProcedure
ProcedureDLL.l SDL_EnableUNICODE(enable.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_EnableUNICODE", enable.l)
EndProcedure
ProcedureDLL.l SDL_Error(code.l) 
  ; code : Enum SDL_errorcode
  ProcedureReturn CallCFunction(SDLLib, "SDL_Error", code.l)
EndProcedure
ProcedureDLL.l SDL_EventState(type.l, state.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_EventState", type.l, state.l)
EndProcedure
ProcedureDLL.l SDL_FillRect(*Dst.SDL_Surface, *DstRect.SDL_Rect, Color.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_FillRect", *Dst.SDL_Surface, *DstRect.SDL_Rect, Color.l)
EndProcedure
ProcedureDLL.l SDL_Flip(*Screen.SDL_Surface)
  ProcedureReturn CallCFunction(SDLLib, "SDL_Flip", *Screen.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_FreeCursor(cursor.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_FreeCursor", cursor.l)
EndProcedure
ProcedureDLL.l SDL_FreeRW(context.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_FreeRW", context.l)
EndProcedure
ProcedureDLL.l SDL_FreeSurface(*Surface.SDL_Surface)
  ProcedureReturn CallCFunction(SDLLib, "SDL_FreeSurface", *Surface.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_FreeWAV(audio_buf.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_FreeWAV", audio_buf.l)
EndProcedure
ProcedureDLL.l SDL_FreeYUVOverlay(*overlay.SDL_Overlay)
  ProcedureReturn CallCFunction(SDLLib, "SDL_FreeYUVOverlay", *overlay.SDL_Overlay)
EndProcedure
ProcedureDLL.s SDL_GetError()
   ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_GetError"))
EndProcedure
ProcedureDLL.l SDL_GL_GetAttribute(attr.l, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_GetAttribute", attr.l, value.l)
EndProcedure
ProcedureDLL.l SDL_GL_GetProcAddress(proc.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_GetProcAddress", @proc.s)
EndProcedure
ProcedureDLL.l SDL_GL_LoadLibrary(path.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_LoadLibrary", @path.s)
EndProcedure
ProcedureDLL.l SDL_GL_Lock()
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_Lock")
EndProcedure
ProcedureDLL.l SDL_GL_SetAttribute(attr.l, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_SetAttribute", attr.l, value.l)
EndProcedure
ProcedureDLL.l SDL_GL_SwapBuffers()
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_SwapBuffers")
EndProcedure
ProcedureDLL.l SDL_GL_Unlock()
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_Unlock")
EndProcedure
ProcedureDLL.l SDL_GL_UpdateRects(numrects.l, *rects.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GL_UpdateRects", numrects.l, *rects.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_GetAppState()
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetAppState")
EndProcedure
ProcedureDLL.l SDL_GetAudioStatus()
  ; Returns Enum SDL_audiostatus
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetAudioStatus")
EndProcedure
ProcedureDLL.l SDL_GetClipRect(*surface.SDL_Surface, *rect.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetClipRect", *surface.SDL_Surface, *rect.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_GetCursor()
  ; Returns SDL_Cursor
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetCursor")
EndProcedure
ProcedureDLL.l SDL_GetEventFilter()
  ; Returns Ptr SDL_EventFilter
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetEventFilter")
EndProcedure
ProcedureDLL.l SDL_GetGammaRamp(redtable.l, greentable.l, bluetable.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetGammaRamp", redtable.l, greentable.l, bluetable.l)
EndProcedure
ProcedureDLL.s SDL_GetKeyName(key.l)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_GetKeyName", key.l))
EndProcedure
ProcedureDLL.l SDL_GetKeyRepeat(rate.l, delay.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetKeyRepeat", rate.l, delay.l)
EndProcedure
ProcedureDLL.l SDL_GetKeyState(numkeys.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetKeyState", numkeys.l)
EndProcedure
ProcedureDLL.l SDL_GetModState()
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetModState")
EndProcedure
ProcedureDLL.l SDL_GetMouseState(x.l, y.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetMouseState", x.l, y.l)
EndProcedure
ProcedureDLL.l SDL_GetRGB(pixel.l, *fmt.SDL_PixelFormat, *r.l, *g.l, *b.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetRGB", pixel.l, *fmt.SDL_PixelFormat, *r.l, *g.l, *b.l)
EndProcedure
ProcedureDLL.l SDL_GetRGBA(pixel.l, *fmt.SDL_PixelFormat, *r.l, *g.l, *b.l, *a.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetRGBA", pixel.l, *fmt.SDL_PixelFormat, *r.l, *g.l, *b.l, *a.l)
EndProcedure
ProcedureDLL.l SDL_GetRelativeMouseState(*x.l, *y.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetRelativeMouseState", *x.l, *y.l)
EndProcedure
ProcedureDLL.l SDL_GetThreadID(*thread.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetThreadID", *thread.l)
EndProcedure
ProcedureDLL.l SDL_GetTicks()
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetTicks")
EndProcedure
ProcedureDLL.l SDL_GetVideoInfo()
  ; Returns SDL_VideoInfo
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetVideoInfo")
EndProcedure
ProcedureDLL.l SDL_GetVideoSurface()
  ; Returns SDL_Surface
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetVideoSurface")
EndProcedure
ProcedureDLL.l SDL_GetWMInfo(*info.SDL_SysWMinfo)
  ProcedureReturn CallCFunction(SDLLib, "SDL_GetWMInfo", *info.SDL_SysWMinfo)
EndProcedure
ProcedureDLL.l SDL_Has3DNow()
  ProcedureReturn CallCFunction(SDLLib, "SDL_Has3DNow")
EndProcedure
ProcedureDLL.l SDL_Has3DNowExt()
  ProcedureReturn CallCFunction(SDLLib, "SDL_Has3DNowExt")
EndProcedure
ProcedureDLL.l SDL_HasAltiVec()
  ProcedureReturn CallCFunction(SDLLib, "SDL_HasAltiVec")
EndProcedure
ProcedureDLL.l SDL_HasMMX()
  ProcedureReturn CallCFunction(SDLLib, "SDL_HasMMX")
EndProcedure
ProcedureDLL.l SDL_HasMMXExt()
  ProcedureReturn CallCFunction(SDLLib, "SDL_HasMMXExt")
EndProcedure
ProcedureDLL.l SDL_HasRDTSC()
  ProcedureReturn CallCFunction(SDLLib, "SDL_HasRDTSC")
EndProcedure
ProcedureDLL.l SDL_HasSSE()
  ProcedureReturn CallCFunction(SDLLib, "SDL_HasSSE")
EndProcedure
ProcedureDLL.l SDL_HasSSE2()
  ProcedureReturn CallCFunction(SDLLib, "SDL_HasSSE2")
EndProcedure
ProcedureDLL.l SDL_Init(flags.l = 0)
  ProcedureReturn CallCFunction(SDLLib, "SDL_Init", flags.l)
EndProcedure
ProcedureDLL.l SDL_InitSubSystem(flags.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_InitSubSystem", flags.l)
EndProcedure
ProcedureDLL.l SDL_JoystickClose(*joystick.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickClose", *joystick.l)
EndProcedure
ProcedureDLL.l SDL_JoystickEventState(state.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickEventState", state.l)
EndProcedure
ProcedureDLL.l SDL_JoystickGetAxis(*joystick.l, axis.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickGetAxis", *joystick.l, axis.l)
EndProcedure
ProcedureDLL.l SDL_JoystickGetBall(*joystick.l, ball.l, *dx.l, *dy.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickGetBall", *joystick.l, ball.l, *dx.l, *dy.l)
EndProcedure
ProcedureDLL.l SDL_JoystickGetButton(*joystick.l, button.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickGetButton", *joystick.l, button.l)
EndProcedure
ProcedureDLL.l SDL_JoystickGetHat(*joystick.l, hat.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickGetHat", *joystick.l, hat.l)
EndProcedure
ProcedureDLL.l SDL_JoystickIndex(*joystick.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickIndex", *joystick.l)
EndProcedure
ProcedureDLL.s SDL_JoystickName(index.l)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_JoystickName", index.l))
EndProcedure
ProcedureDLL.l SDL_JoystickNumAxes(*joystick.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickNumAxes", *joystick.l)
EndProcedure
ProcedureDLL.l SDL_JoystickNumBalls(*joystick.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickNumBalls", *joystick.l)
EndProcedure
ProcedureDLL.l SDL_JoystickNumButtons(*joystick.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickNumButtons", *joystick.l)
EndProcedure
ProcedureDLL.l SDL_JoystickNumHats(*joystick.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickNumHats", *joystick.l)
EndProcedure
ProcedureDLL.l SDL_JoystickOpen(index.l)
  ; Returns SDL_Joystick
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickOpen", index.l)
EndProcedure
ProcedureDLL.l SDL_JoystickOpened(index.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickOpened", index.l)
EndProcedure
ProcedureDLL.l SDL_JoystickUpdate()
  ProcedureReturn CallCFunction(SDLLib, "SDL_JoystickUpdate")
EndProcedure
ProcedureDLL.l SDL_KillThread(*thread.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_KillThread", *thread.l)
EndProcedure
ProcedureDLL.l SDL_Linked_Version()
  ProcedureReturn CallCFunction(SDLLib, "SDL_Linked_Version")
EndProcedure
ProcedureDLL.l SDL_ListModes(*format.SDL_PixelFormat, flags.l)
  ; Returns SDL_Rect
  ProcedureReturn CallCFunction(SDLLib, "SDL_ListModes", *format.SDL_PixelFormat, flags.l)
EndProcedure
ProcedureDLL.l SDL_LoadBMP_RW(*src.SDL_RWops, freesrc.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_LoadBMP_RW", *src.SDL_RWops, freesrc.l)
EndProcedure
ProcedureDLL.l SDL_LoadFunction(handle.l, name.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_LoadFunction", handle.l, @name.s)
EndProcedure
ProcedureDLL.l SDL_LoadObject(sofile.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_LoadObject", @sofile.s)
EndProcedure
ProcedureDLL.l SDL_LoadWAV_RW(src.l, freesrc.l, spec.l, audio_buf.l, audio_len.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_LoadWAV_RW", src.l, freesrc.l, spec.l, audio_buf.l, audio_len.l)
EndProcedure
ProcedureDLL.l SDL_LockAudio()
  ProcedureReturn CallCFunction(SDLLib, "SDL_LockAudio")
EndProcedure
ProcedureDLL.l SDL_LockSurface(*surface.SDL_Surface)
  ProcedureReturn CallCFunction(SDLLib, "SDL_LockSurface", *surface.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_LockYUVOverlay(*overlay.SDL_Overlay)
  ProcedureReturn CallCFunction(SDLLib, "SDL_LockYUVOverlay", *overlay.SDL_Overlay)
EndProcedure
ProcedureDLL.l SDL_LowerBlit(*src.SDL_Surface, *srcrect.SDL_Rect, *dst.SDL_Surface, *dstrect.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_LowerBlit", *src.SDL_Surface, *srcrect.SDL_Rect, *dst.SDL_Surface, *dstrect.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_MapRGB(*fmt.SDL_PixelFormat, r.l, g.l, b.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_MapRGB", *fmt.SDL_PixelFormat, r.l, g.l, b.l)
EndProcedure
ProcedureDLL.l SDL_MapRGBA(*fmt.SDL_PixelFormat, r.l, g.l, b.l, a.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_MapRGBA", *fmt.SDL_PixelFormat, r.l, g.l, b.l, a.l)
EndProcedure
ProcedureDLL.l SDL_MixAudio(*dst.l, *src.l, len.l, volume.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_MixAudio", *dst.l, *src.l, len.l, volume.l)
EndProcedure
ProcedureDLL.l SDL_NumJoysticks()
  ProcedureReturn CallCFunction(SDLLib, "SDL_NumJoysticks")
EndProcedure
ProcedureDLL.l SDL_OpenAudio(*desired.SDL_AudioSpec, *obtained.SDL_AudioSpec)
  ProcedureReturn CallCFunction(SDLLib, "SDL_OpenAudio", *desired.SDL_AudioSpec, *obtained.SDL_AudioSpec)
EndProcedure
ProcedureDLL.l SDL_PauseAudio(pause_on.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_PauseAudio", pause_on.l)
EndProcedure
ProcedureDLL.l SDL_PeepEvents(*events.SDL_Event, numevents.l, action.l, mask.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_PeepEvents", *events.SDL_Event, numevents.l, action.l, mask.l)
EndProcedure
ProcedureDLL.l SDL_PollEvent(*Event.SDL_Event)
  ProcedureReturn CallCFunction(SDLLib, "SDL_PollEvent", *Event.SDL_Event)
EndProcedure
ProcedureDLL.l SDL_PumpEvents()
  ProcedureReturn CallCFunction(SDLLib, "SDL_PumpEvents")
EndProcedure
ProcedureDLL.l SDL_PushEvent(*event.SDL_Event)
  ProcedureReturn CallCFunction(SDLLib, "SDL_PushEvent", *event.SDL_Event)
EndProcedure
ProcedureDLL.l SDL_Quit()
  ProcedureReturn CallCFunction(SDLLib, "SDL_Quit")
EndProcedure
ProcedureDLL.l SDL_QuitSubSystem(flags.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_QuitSubSystem", flags.l)
EndProcedure
ProcedureDLL.l SDL_RWFromConstMem(mem.l, int.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_RWFromConstMem", mem.l, int.l)
EndProcedure
ProcedureDLL.l SDL_RWFromFile(file.s, mode.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_RWFromFile",@file.s, @mode.s)
EndProcedure
ProcedureDLL.l SDL_RWFromFP(fp.l, autoclose.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_RWFromFP",fp.l, autoclose.l)
EndProcedure
ProcedureDLL.l SDL_RWFromMem(mem.l, int.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_RWFromMem", mem.l, int.l)
EndProcedure
ProcedureDLL.l SDL_ReadBE16(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ReadBE16", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_ReadBE32(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ReadBE32", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_ReadBE64(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ReadBE64", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_ReadLE16(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ReadLE16", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_ReadLE32(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ReadLE32", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_ReadLE64(*src.SDL_RWops)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ReadLE64", *src.SDL_RWops)
EndProcedure
ProcedureDLL.l SDL_RegisterApp(name.s, style.l, hInst.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_RegisterApp", @name.s, style.l, hInst.l)
EndProcedure
ProcedureDLL.l SDL_RemoveTimer(id.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_RemoveTimer", id.l)
EndProcedure
ProcedureDLL.l SDL_SaveBMP_RW(*saveme.SDL_Surface, *dst.SDL_RWops, freedst.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SaveBMP_RW", *saveme.SDL_Surface, *dst.SDL_RWops, freedst.l)
EndProcedure
ProcedureDLL.l SDL_SemPost(*sem.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SemPost", *sem.l)
EndProcedure
ProcedureDLL.l SDL_SemTryWait(*sem.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SemTryWait", *sem.l)
EndProcedure
ProcedureDLL.l SDL_SemValue(*sem.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SemValue", *sem.l)
EndProcedure
ProcedureDLL.l SDL_SemWait(*sem.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SemWait", *sem.l)
EndProcedure
ProcedureDLL.l SDL_SemWaitTimeout(*sem.l, timeout.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SemWaitTimeout", *sem.l, timeout.l)
EndProcedure
ProcedureDLL.l SDL_SetAlpha(*surface.SDL_Surface, flag.l, alpha.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetAlpha", *surface.SDL_Surface, flag.l, alpha.l)
EndProcedure
ProcedureDLL.l SDL_SetClipRect(*surface.SDL_Surface, *rect.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetClipRect", *surface.SDL_Surface, *rect.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_SetColorKey(*surface.SDL_Surface, flag.l, key.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetColorKey", *surface.SDL_Surface, flag.l, key.l)
EndProcedure
ProcedureDLL.l SDL_SetColors(*surface.SDL_Surface, *colors.SDL_Color, firstcolor.l, nColors.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetColors", *surface.SDL_Surface, *colors.SDL_Color, firstcolor.l, nColors.l)
EndProcedure
ProcedureDLL.l SDL_SetCursor(cursor.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetCursor", cursor.l)
EndProcedure
ProcedureDLL.l SDL_SetError(message.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetError", @message.s)
EndProcedure
ProcedureDLL.l SDL_SetEventFilter(filter.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetEventFilter", filter.l)
EndProcedure
ProcedureDLL.l SDL_SetGamma(redgamma.f, greengamma.f, bluegamma.f)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetGamma", redgamma.f, greengamma.f, bluegamma.f)
EndProcedure
ProcedureDLL.l SDL_SetGammaRamp(*redtable.l, *greentable.l, *bluetable.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetGammaRamp", *redtable.l, *greentable.l, *bluetable.l)
EndProcedure
ProcedureDLL.l SDL_SetModState(modstate.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetModState", modstate.l)
EndProcedure
ProcedureDLL.l SDL_SetModuleHandle(handle.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetModuleHandle", handle.l)
EndProcedure
ProcedureDLL.l SDL_SetPalette(*surface.SDL_Surface, flags.l, *colors.SDL_Color, firstcolor.l, ncolors.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetPalette", *surface.SDL_Surface, flags.l, *colors.SDL_Color, firstcolor.l, ncolors.l)
EndProcedure
ProcedureDLL.l SDL_SetTimer(interval.l, callback.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetTimer", interval.l, callback.l)
EndProcedure
ProcedureDLL.l SDL_SetVideoMode(width.l, height.l, bpp.l, flags.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SetVideoMode", width.l, height.l, bpp.l, flags.l)
EndProcedure
ProcedureDLL.l SDL_ShowCursor(toggle.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_ShowCursor", toggle.l)
EndProcedure
ProcedureDLL.l SDL_SoftStretch(*src.SDL_Surface, *srcrect.SDL_Rect, *dst.SDL_Surface, *dstrect.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_SoftStretch", *src.SDL_Surface, *srcrect.SDL_Rect, *dst.SDL_Surface, *dstrect.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_ThreadID()
  ProcedureReturn CallCFunction(SDLLib, "SDL_ThreadID")
EndProcedure
ProcedureDLL.l SDL_UnloadObject(handle.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_UnloadObject", handle.l)
EndProcedure
ProcedureDLL.l SDL_UnlockAudio()
  ProcedureReturn CallCFunction(SDLLib, "SDL_UnlockAudio")
EndProcedure
ProcedureDLL.l SDL_UnlockSurface(*surface.SDL_Surface)
  ProcedureReturn CallCFunction(SDLLib, "SDL_UnlockSurface", *surface.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_UnlockYUVOverlay(*overlay.SDL_Overlay)
  ProcedureReturn CallCFunction(SDLLib, "SDL_UnlockYUVOverlay", *overlay.SDL_Overlay)
EndProcedure
ProcedureDLL.l SDL_UnregisterApp()
  ProcedureReturn CallCFunction(SDLLib, "SDL_UnregisterApp")
EndProcedure
ProcedureDLL.l SDL_UpdateRect(*screen.SDL_Surface, x.l, y.l, w.l, h.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_UpdateRect", *screen.SDL_Surface, x.l, y.l, w.l, h.l)
EndProcedure
ProcedureDLL.l SDL_UpdateRects(*screen.SDL_Surface, numrects.l, *rects.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_UpdateRects", *screen.SDL_Surface, numrects.l, *rects.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_UpperBlit(*src.SDL_Surface, *srcrect.SDL_Rect, *dst.SDL_Surface, *dstrect.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_UpperBlit", *src.SDL_Surface, *srcrect.SDL_Rect, *dst.SDL_Surface, *dstrect.SDL_Rect)
EndProcedure
ProcedureDLL.s SDL_VideoDriverName(*namebuf, maxlen.l)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_VideoDriverName", *namebuf, maxlen.l))
EndProcedure
ProcedureDLL.l SDL_VideoInit(driver_name.s, flags.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_VideoInit", @driver_name.s, flags.l)
EndProcedure
ProcedureDLL.l SDL_VideoModeOK(width.l, height.l, bpp.l, flags.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_VideoModeOK", width.l, height.l, bpp.l, flags.l)
EndProcedure
ProcedureDLL.l SDL_VideoQuit()
  ProcedureReturn CallCFunction(SDLLib, "SDL_VideoQuit")
EndProcedure
ProcedureDLL.l SDL_WaitEvent(event.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WaitEvent", event)
EndProcedure
ProcedureDLL.l SDL_WM_GetCaption(*title, *icon)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WM_GetCaption", *title, *icon)
EndProcedure
ProcedureDLL.l SDL_WM_GrabInput(mode.l)
  ; mode Enum SDL_GrabMode
  ProcedureReturn CallCFunction(SDLLib, "SDL_WM_GrabInput", mode.l)
EndProcedure
ProcedureDLL.l SDL_WM_IconifyWindow()
  ProcedureReturn CallCFunction(SDLLib, "SDL_WM_IconifyWindow")
EndProcedure
ProcedureDLL.l SDL_WM_SetCaption(title.s , icon.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WM_SetCaption", @title.s, @icon.s)
EndProcedure
ProcedureDLL.l SDL_WM_SetIcon(*icon.SDL_Surface, mask.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WM_SetIcon", *icon.SDL_Surface, mask.l)
EndProcedure
ProcedureDLL.l SDL_WM_ToggleFullScreen(*surface.SDL_Surface)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WM_ToggleFullScreen", *surface.SDL_Surface)
EndProcedure
ProcedureDLL.l SDL_WaitThread(*thread.l, *status.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WaitThread", *thread.l, *status.l)
EndProcedure
ProcedureDLL.l SDL_WarpMouse(x.l, y.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WarpMouse", x.l, y.l)
EndProcedure
ProcedureDLL.l SDL_WasInit(flags.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WasInit", flags.l)
EndProcedure
ProcedureDLL.l SDL_WriteBE16(*dst.SDL_RWops, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WriteBE16", *dst.SDL_RWops, value.l)
EndProcedure
ProcedureDLL.l SDL_WriteBE32(*dst.SDL_RWops, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WriteBE32", *dst.SDL_RWops, value.l)
EndProcedure
ProcedureDLL.l SDL_WriteBE64(*dst.SDL_RWops, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WriteBE64", *dst.SDL_RWops, value.l)
EndProcedure
ProcedureDLL.l SDL_WriteLE16(*dst.SDL_RWops, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WriteLE16", *dst.SDL_RWops, value.l)
EndProcedure
ProcedureDLL.l SDL_WriteLE32(*dst.SDL_RWops, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WriteLE32", *dst.SDL_RWops, value.l)
EndProcedure
ProcedureDLL.l SDL_WriteLE64(*dst.SDL_RWops, value.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_WriteLE64", *dst.SDL_RWops, value.l)
EndProcedure
ProcedureDLL.s SDL_getenv(name.s)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_getenv", @name.s))
EndProcedure
ProcedureDLL.l SDL_iconv(*cd.SDL_iconv_t, *inbuf, inbytesleft.l, *outbuf, outbytesleft.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_iconv", *cd.SDL_iconv_t, *inbuf, inbytesleft.l, *outbuf, outbytesleft.l)
EndProcedure
ProcedureDLL.l SDL_iconv_close(*cd.SDL_iconv_t)
  ProcedureReturn CallCFunction(SDLLib, "SDL_iconv_close", *cd.SDL_iconv_t)
EndProcedure
ProcedureDLL.l SDL_iconv_open(tocode.s, fromcode.s)
  ; Returns SDL_iconv_t
  ProcedureReturn CallCFunction(SDLLib, "SDL_iconv_open", @tocode.s, @fromcode.s)
EndProcedure
ProcedureDLL.s SDL_iconv_string(tocode.s, fromcode.s, inbuf.s, inbytesleft.l)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_iconv_string", @tocode.s, @fromcode.s, @inbuf.s, inbytesleft.l))
EndProcedure
ProcedureDLL.s SDL_lltoa(value.l, string.s, radix.l)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_lltoa", value.l, @string.s, radix.l))
EndProcedure
ProcedureDLL.l SDL_mutexP(mutex.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_mutexP", mutex.l)
EndProcedure
ProcedureDLL.l SDL_mutexV(mutex.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_mutexV", mutex.l)
EndProcedure
ProcedureDLL.l SDL_putenv(variable.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_putenv", @variable.s)
EndProcedure
ProcedureDLL.l SDL_revcpy(dst.l, src.l, len.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_revcpy", dst.l, src.l, len.l)
EndProcedure
ProcedureDLL.l SDL_snprintf(text.s, maxlen.l, fmt.s)
  ProcedureReturn CallCFunction(SDLLib, "SDL_snprintf", @text.s, maxlen.l, @fmt.s)
EndProcedure
ProcedureDLL.s SDL_strdup(string.s)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_strdup", @string.s))
EndProcedure
ProcedureDLL.l SDL_strlcat(dst.l, src.l, maxlen.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_strlcat", dst.l, src.l, maxlen.l)
EndProcedure
ProcedureDLL.l SDL_strlcpy(dst.l, src.l, maxlen.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_strlcpy", dst.l, src.l, maxlen.l)
EndProcedure
ProcedureDLL.l SDL_strtoull(string.s, *endp, base.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_strtoull", @string.s, *endp, base.l)
EndProcedure
ProcedureDLL.s SDL_ulltoa(value.l, string.s, radix.l)
  ProcedureReturn PeekS(CallCFunction(SDLLib, "SDL_ulltoa", value.l, @string.s, radix.l))
EndProcedure
ProcedureDLL.l SDL_vsnprintf(text.s, maxlen.l, fmt.s, ap.l)
  ProcedureReturn CallCFunction(SDLLib, "SDL_vsnprintf", @text.s, maxlen.l, @fmt.s, ap.l)
EndProcedure

;-Macros
ProcedureDLL.l SDL_BlitSurface(*src.SDL_Surface,*srcrect.SDL_Rect,*dst.SDL_Surface,*dstrect.SDL_Rect)
  ProcedureReturn CallCFunction(SDLLib, "SDL_UpperBlit", *src.SDL_Surface,*srcrect.SDL_Rect,*dst.SDL_Surface,*dstrect.SDL_Rect)
EndProcedure
ProcedureDLL.l SDL_LoadBMP(file.s)
  Protected *ReturnRW.SDL_RWops
  *ReturnRW = SDL_RWFromFile(file, "rb")
  ProcedureReturn SDL_LoadBMP_RW(*ReturnRW, 1)	
EndProcedure

;-Plugins
XIncludeFile "RW_SDL_IncPlugins.pb"
