;{ Macros
  Macro BOOL
    l
  EndMacro
  Macro LoByte(a)
    (a & $FF)
  EndMacro 
  Macro LOWORD(a)   
    a & $FFFF
  EndMacro
  Macro HIWORD(a) 
    (a>>16) & $FFFF
  EndMacro
  Macro MAKELONG(a,b) 
    (a & $ffff)|(b<<16)
  EndMacro
  Macro BASS_SPEAKER_N(n)
    (n<<24)	; n'th pair of speakers (max 15)
  EndMacro
  Macro MAKEMUSICPOS(order,row) 
    $80000000|MAKELONG(order,row)
  EndMacro
  
  Macro HMUSIC		; MOD music handle
    l
  EndMacro
  Macro HSAMPLE		; sample handle
    l
  EndMacro
  Macro HCHANNEL		; playing sample's channel handle
    l
  EndMacro
  Macro HSTREAM		; sample stream handle
    l
  EndMacro
  Macro HRECORD		; recording handle
    l
  EndMacro
  Macro HSYNC		; synchronizer handle
    l
  EndMacro
  Macro HDSP			; DSP handle
    l
  EndMacro
  Macro HFX			; DX8 effect handle
    l
  EndMacro
  Macro HPLUGIN		; Plugin handle
    l
  EndMacro
  ; EAX presets, usage: BASS_SetEAXParameters(EAX_PRESET_xxx)
  Macro EAX_PRESET_GENERIC
    #EAX_ENVIRONMENT_GENERIC,0.5,1.493,0.5
  EndMacro
  Macro EAX_PRESET_PADDEDCELL
    #EAX_ENVIRONMENT_PADDEDCELL,0.25,0.1,0.0
  EndMacro
  Macro EAX_PRESET_ROOM
    #EAX_ENVIRONMENT_ROOM,0.417,0.4,0.666
  EndMacro
  Macro EAX_PRESET_BATHROOM
    #EAX_ENVIRONMENT_BATHROOM,0.653,1.499,0.166
  EndMacro
  Macro EAX_PRESET_LIVINGROOM
    #EAX_ENVIRONMENT_LIVINGROOM,0.208,0.478,0.0
  EndMacro
  Macro EAX_PRESET_STONEROOM
    #EAX_ENVIRONMENT_STONEROOM,0.5,2.309,0.888
  EndMacro
  Macro EAX_PRESET_AUDITORIUM
    #EAX_ENVIRONMENT_AUDITORIUM,0.403,4.279,0.5
  EndMacro
  Macro EAX_PRESET_CONCERTHALL
    #EAX_ENVIRONMENT_CONCERTHALL,0.5,3.961,0.5
  EndMacro
  Macro EAX_PRESET_CAVE
    #EAX_ENVIRONMENT_CAVE,0.5,2.886,1.304
  EndMacro
  Macro EAX_PRESET_ARENA
    #EAX_ENVIRONMENT_ARENA,0.361,7.284,0.332
  EndMacro
  Macro EAX_PRESET_HANGAR
    #EAX_ENVIRONMENT_HANGAR,0.5,10.0,0.3
  EndMacro
  Macro EAX_PRESET_CARPETEDHALLWAY
    #EAX_ENVIRONMENT_CARPETEDHALLWAY,0.153,0.259,2.0
  EndMacro
  Macro EAX_PRESET_HALLWAY
    #EAX_ENVIRONMENT_HALLWAY,0.361,1.493,0.0
  EndMacro
  Macro EAX_PRESET_STONECORRIDOR
    #EAX_ENVIRONMENT_STONECORRIDOR,0.444,2.697,0.638
  EndMacro
  Macro EAX_PRESET_ALLEY
    #EAX_ENVIRONMENT_ALLEY,0.25,1.752,0.776
  EndMacro
  Macro EAX_PRESET_FOREST
    #EAX_ENVIRONMENT_OREST,0.111,3.145,0.472
  EndMacro
  Macro EAX_PRESET_CITY
    #EAX_ENVIRONMENT_CITY,0.111,2.767,0.224
  EndMacro
  Macro EAX_PRESET_MOUNTAINS
    #EAX_ENVIRONMENT_MOUNTAINS,0.194,7.841,0.472
  EndMacro
  Macro EAX_PRESET_QUARRY
    #EAX_ENVIRONMENT_QUARRY,1.0,1.499,0.5
  EndMacro
  Macro EAX_PRESET_PLAIN
    #EAX_ENVIRONMENT_PLAIN,0.097,2.767,0.224
  EndMacro
  Macro EAX_PRESET_PARKINGLOT
    #EAX_ENVIRONMENT_PARKINGLOT,0.208,1.652,1.5
  EndMacro
  Macro EAX_PRESET_SEWERPIPE
    #EAX_ENVIRONMENT_SEWERPIPE,0.652,2.886,0.25
  EndMacro
  Macro EAX_PRESET_UNDERWATER
    #EAX_ENVIRONMENT_UNDERWATER,1.0,1.499,0.0
  EndMacro
  Macro EAX_PRESET_DRUGGED
    #EAX_ENVIRONMENT_DRUGGED,0.875,8.392,1.388
  EndMacro
  Macro EAX_PRESET_DIZZY
    #EAX_ENVIRONMENT_DIZZY,0.139,17.234,0.666
  EndMacro
  Macro EAX_PRESET_PSYCHOTIC
    #EAX_ENVIRONMENT_PSYCHOTIC,0.486,7.563,0.806
  EndMacro

;}
;{ Constantes
  #BASSVERSION          = $203	; API version
  ; Error codes returned by BASS_ErrorGetCode
  #BASS_OK				      = 0	; all is OK
  #BASS_ERROR_MEM		    = 1	; memory error
  #BASS_ERROR_FILEOPEN	= 2	; can't open the file
  #BASS_ERROR_DRIVER	  = 3	; can't find a free/valid driver
  #BASS_ERROR_BUFLOST	  = 4	; the sample buffer was lost
  #BASS_ERROR_HANDLE	  = 5	; invalid handle
  #BASS_ERROR_FORMAT	  = 6	; unsupported sample format
  #BASS_ERROR_POSITION	= 7	; invalid playback position
  #BASS_ERROR_INIT		  = 8	; BASS_Init has Not been successfully called
  #BASS_ERROR_START	    = 9	; BASS_Start has Not been successfully called
  #BASS_ERROR_ALREADY	  = 14	; already initialized/paused/whatever
  #BASS_ERROR_NOPAUSE	  = 16	; Not paused
  #BASS_ERROR_NOCHAN	  = 18	; can't get a free channel
  #BASS_ERROR_ILLTYPE	  = 19	; an illegal type was specified
  #BASS_ERROR_ILLPARAM	= 20	; an illegal parameter was specified
  #BASS_ERROR_NO3D		  = 21	; no 3D support
  #BASS_ERROR_NOEAX	    = 22	; no EAX support
  #BASS_ERROR_DEVICE	  = 23	; illegal device number
  #BASS_ERROR_NOPLAY	  = 24	; Not playing
  #BASS_ERROR_FREQ		  = 25	; illegal sample rate
  #BASS_ERROR_NOTFILE	  = 27	; the stream is Not a file stream
  #BASS_ERROR_NOHW		  = 29	; no hardware voices available
  #BASS_ERROR_EMPTY	    = 31	; the MOD music has no sequence Data
  #BASS_ERROR_NONET	    = 32	; no internet connection could be opened
  #BASS_ERROR_CREATE	  = 33	; couldn't create the file
  #BASS_ERROR_NOFX		  = 34	; effects are Not available
  #BASS_ERROR_PLAYING	  = 35	; the channel is playing
  #BASS_ERROR_NOTAVAIL	= 37	; requested Data is Not available
  #BASS_ERROR_DECODE	  = 38	; the channel is a "decoding channel"
  #BASS_ERROR_DX		    = 39	; a sufficient DirectX version is Not installed
  #BASS_ERROR_TIMEOUT	  = 40	; connection timedout
  #BASS_ERROR_FILEFORM	= 41	; unsupported file format
  #BASS_ERROR_SPEAKER	  = 42	; unavailable speaker
  #BASS_ERROR_VERSION	  = 43	; invalid BASS version (used by add-ons)
  #BASS_ERROR_CODEC	    = 44  ; codec is Not available/supported
  #BASS_ERROR_UNKNOWN	  = -1	; some other mystery error
  
  ; Initialization flags
  #BASS_DEVICE_8BITS	  = 1	; use 8 bit resolution, Else 16 bit
  #BASS_DEVICE_MONO	    = 2	; use mono, Else stereo
  #BASS_DEVICE_3D		    = 4	; enable 3D functionality
  ; If the BASS_DEVICE_3D flag is Not specified when initilizing BASS,
  ; then the 3D flags (BASS_SAMPLE_3D And BASS_MUSIC_3D) are ignored when
  ; loading/creating a sample/stream/music. 
  #BASS_DEVICE_LATENCY	= 256	; calculate device latency (BASS_INFO struct)
  #BASS_DEVICE_SPEAKERS = 2048	; force enabling of speaker assignment
  #BASS_DEVICE_NOSPEAKER= 4096	; ignore speaker arrangement
  
  ; DirectSound interfaces (For use With BASS_GetDSoundObject)
  #BASS_OBJECT_DS		    = 1	; IDirectSound
  #BASS_OBJECT_DS3DL	  = 2	; IDirectSound3DListener


  ; BASS_INFO flags (from DSOUND.H)
  #DSCAPS_CONTINUOUSRATE	= $00000010
  ; supports all sample rates between min/maxrate 
  #DSCAPS_EMULDRIVER		  = $00000020
  ; device does Not have hardware DirectSound support 
  #DSCAPS_CERTIFIED		    = $00000040
  ; device driver has been certified by Microsoft 
  ; The following flags tell what type of samples are supported by HARDWARE
  ; mixing, all these formats are supported by SOFTWARE mixing 
  #DSCAPS_SECONDARYMONO	  = $00000100	; mono
  #DSCAPS_SECONDARYSTEREO	= $00000200	; stereo
  #DSCAPS_SECONDARY8BIT	  = $00000400	; 8 bit
  #DSCAPS_SECONDARY16BIT	= $00000800	; 16 bit
  
  
  ; BASS_RECORDINFO flags (from DSOUND.H)
  #DSCCAPS_EMULDRIVER	    = #DSCAPS_EMULDRIVER	; device does Not have hardware DirectSound recording support
  #DSCCAPS_CERTIFIED	    = #DSCAPS_CERTIFIED	; device driver has been certified by Microsoft
  
  ; defines For formats field of BASS_RECORDINFO (from MMSYSTEM.H)
  #WAVE_FORMAT_1M08       = $00000001       ; 11.025 kHz, Mono,   8-bit  
  #WAVE_FORMAT_1S08       = $00000002       ; 11.025 kHz, Stereo, 8-bit  
  #WAVE_FORMAT_1M16       = $00000004       ; 11.025 kHz, Mono,   16-bit 
  #WAVE_FORMAT_1S16       = $00000008       ; 11.025 kHz, Stereo, 16-bit 
  #WAVE_FORMAT_2M08       = $00000010       ; 22.05  kHz, Mono,   8-bit  
  #WAVE_FORMAT_2S08       = $00000020       ; 22.05  kHz, Stereo, 8-bit  
  #WAVE_FORMAT_2M16       = $00000040       ; 22.05  kHz, Mono,   16-bit 
  #WAVE_FORMAT_2S16       = $00000080       ; 22.05  kHz, Stereo, 16-bit 
  #WAVE_FORMAT_4M08       = $00000100       ; 44.1   kHz, Mono,   8-bit  
  #WAVE_FORMAT_4S08       = $00000200       ; 44.1   kHz, Stereo, 8-bit  
  #WAVE_FORMAT_4M16       = $00000400       ; 44.1   kHz, Mono,   16-bit 
  #WAVE_FORMAT_4S16       = $00000800       ; 44.1   kHz, Stereo, 16-bit 
  
  #BASS_SAMPLE_8BITS		  = 1	; 8 bit
  #BASS_SAMPLE_FLOAT		  = 256	; 32-bit floating-point
  #BASS_SAMPLE_MONO		    = 2	; mono
  #BASS_SAMPLE_LOOP		    = 4	; looped
  #BASS_SAMPLE_3D			    = 8	; 3D functionality enabled
  #BASS_SAMPLE_SOFTWARE	  = 16	; it's NOT using hardware mixing
  #BASS_SAMPLE_MUTEMAX		= 32	; muted at max distance (3D only)
  #BASS_SAMPLE_VAM			  = 64	; uses the DX7 voice allocation & management
  #BASS_SAMPLE_FX			    = 128	; old implementation of DX8 effects are enabled
  #BASS_SAMPLE_OVER_VOL	  = $10000	; override lowest volume
  #BASS_SAMPLE_OVER_POS	  = $20000	; override longest playing
  #BASS_SAMPLE_OVER_DIST	= $30000 ; override furthest from listener (3D only)
  
  #BASS_STREAM_PRESCAN		= $20000 ; enable pin-point seeking (MP3/MP2/MP1)
  #BASS_MP3_SETPOS			  = #BASS_STREAM_PRESCAN
  #BASS_STREAM_AUTOFREE	  = $40000	; automatically free the stream when it stop/ends
  #BASS_STREAM_RESTRATE	  = $80000	; restrict the download rate of internet file streams
  #BASS_STREAM_BLOCK		  = $100000; download/play internet file stream in small blocks
  #BASS_STREAM_DECODE		  = $200000; don't play the stream, only decode (BASS_ChannelGetData)
  #BASS_STREAM_STATUS		  = $800000; give server status info (HTTP/ICY tags) in DOWNLOADPROC
  
  #BASS_MUSIC_FLOAT		    = #BASS_SAMPLE_FLOAT ; 32-bit floating-point
  #BASS_MUSIC_MONO			  = #BASS_SAMPLE_MONO ; force mono mixing (less CPU usage)
  #BASS_MUSIC_LOOP			  = #BASS_SAMPLE_LOOP ; loop music
  #BASS_MUSIC_3D			    = #BASS_SAMPLE_3D ; enable 3D functionality
  #BASS_MUSIC_FX			    = #BASS_SAMPLE_FX ; enable old implementation of DX8 effects
  #BASS_MUSIC_AUTOFREE		= #BASS_STREAM_AUTOFREE ; automatically free the music when it stop/ends
  #BASS_MUSIC_DECODE		  = #BASS_STREAM_DECODE ; don't play the music, only decode (BASS_ChannelGetData)
  #BASS_MUSIC_PRESCAN		  = #BASS_STREAM_PRESCAN	; calculate playback length
  #BASS_MUSIC_CALCLEN		  = #BASS_MUSIC_PRESCAN
  #BASS_MUSIC_RAMP			  = $200	; normal ramping
  #BASS_MUSIC_RAMPS		    = $400	; sensitive ramping
  #BASS_MUSIC_SURROUND		= $800	; surround sound
  #BASS_MUSIC_SURROUND2	  = $1000	; surround sound (mode 2)
  #BASS_MUSIC_FT2MOD		  = $2000	; play .MOD As FastTracker 2 does
  #BASS_MUSIC_PT1MOD		  = $4000	; play .MOD As ProTracker 1 does
  #BASS_MUSIC_NONINTER		= $10000	; non-interpolated mixing
  #BASS_MUSIC_POSRESET		= $8000	; stop all notes when moving position
  #BASS_MUSIC_POSRESETEX	= $400000; stop all notes And reset bmp/etc when moving position
  #BASS_MUSIC_STOPBACK		= $80000	; stop the music on a backwards jump effect
  #BASS_MUSIC_NOSAMPLE		= $100000; don't load the samples
  
  ; Speaker assignment flags
  #BASS_SPEAKER_FRONT	    = $1000000	; front speakers
  #BASS_SPEAKER_REAR	    = $2000000	; rear/side speakers
  #BASS_SPEAKER_CENLFE	  = $3000000	; center & LFE speakers (5.1)
  #BASS_SPEAKER_REAR2	    = $4000000	; rear center speakers (7.1)
  
  #BASS_SPEAKER_LEFT	    = $10000000	; modifier: left
  #BASS_SPEAKER_RIGHT	    = $20000000	; modifier: right
  #BASS_SPEAKER_FRONTLEFT	= #BASS_SPEAKER_FRONT|#BASS_SPEAKER_LEFT
  #BASS_SPEAKER_FRONTRIGHT= #BASS_SPEAKER_FRONT|#BASS_SPEAKER_RIGHT
  #BASS_SPEAKER_REARLEFT	= #BASS_SPEAKER_REAR|#BASS_SPEAKER_LEFT
  #BASS_SPEAKER_REARRIGHT	= #BASS_SPEAKER_REAR|#BASS_SPEAKER_RIGHT
  #BASS_SPEAKER_CENTER		= #BASS_SPEAKER_CENLFE|#BASS_SPEAKER_LEFT
  #BASS_SPEAKER_LFE		    = #BASS_SPEAKER_CENLFE|#BASS_SPEAKER_RIGHT
  #BASS_SPEAKER_REAR2LEFT	= #BASS_SPEAKER_REAR2|#BASS_SPEAKER_LEFT
  #BASS_SPEAKER_REAR2RIGHT= #BASS_SPEAKER_REAR2|#BASS_SPEAKER_RIGHT
  
  #BASS_UNICODE			      = $80000000
  
  #BASS_RECORD_PAUSE		  = $8000	; start recording paused
  
  ; DX7 voice allocation flags
  #BASS_VAM_HARDWARE		  = 1
  ; Play the sample in hardware. If no hardware voices are available then
  ; the "play" call will fail 
  #BASS_VAM_SOFTWARE		  = 2
  ; Play the sample in software (ie. non-accelerated). No other VAM flags
  ; may be used together With this flag. 
  
  ; DX7 voice management flags
  ; These flags enable hardware resource stealing... If the hardware has no
  ; available voices, a currently playing buffer will be stopped To make room For
  ; the new buffer. NOTE: only samples loaded/created With the BASS_SAMPLE_VAM
  ; flag are considered For termination by the DX7 voice management. 
  #BASS_VAM_TERM_TIME		  = 4
  ; If there are no free hardware voices, the buffer To be terminated will be
  ; the one With the least time left To play. 
  #BASS_VAM_TERM_DIST		  = 8
  ; If there are no free hardware voices, the buffer To be terminated will be
  ; one that was loaded/created With the BASS_SAMPLE_MUTEMAX flag And is beyond
  ; it's max distance. If there are no buffers that match this criteria, then the
  ; "play" call will fail. 
  #BASS_VAM_TERM_PRIO		  = 16
  
  ; BASS_CHANNELINFO types
  #BASS_CTYPE_SAMPLE		  = 1
  #BASS_CTYPE_RECORD		  = 2
  #BASS_CTYPE_STREAM		  = $10000
  #BASS_CTYPE_STREAM_OGG	= $10002
  #BASS_CTYPE_STREAM_MP1	= $10003
  #BASS_CTYPE_STREAM_MP2	= $10004
  #BASS_CTYPE_STREAM_MP3	= $10005
  #BASS_CTYPE_STREAM_AIFF	= $10006
  #BASS_CTYPE_STREAM_WAV	= $40000 ; WAVE flag, LOWORD=codec
  #BASS_CTYPE_STREAM_WAV_PCM	= $50001
  #BASS_CTYPE_STREAM_WAV_FLOAT= $50003
  #BASS_CTYPE_STREAM_WAV_MP3	= $50055
  #BASS_CTYPE_MUSIC_MOD	  = $20000
  #BASS_CTYPE_MUSIC_MTM	  = $20001
  #BASS_CTYPE_MUSIC_S3M	  = $20002
  #BASS_CTYPE_MUSIC_XM		= $20003
  #BASS_CTYPE_MUSIC_IT		= $20004
  #BASS_CTYPE_MUSIC_MO3	  = $00100 ; MO3 flag
  
  ; 3D channel modes
  #BASS_3DMODE_NORMAL		  = 0
  ; normal 3D processing 
  #BASS_3DMODE_RELATIVE	  = 1
  ; The channel's 3D position (position/velocity/orientation) are relative to
  ; the listener. When the listener's position/velocity/orientation is changed
  ; With BASS_Set3DPosition, the channel's position relative to the listener does
  ; Not change. 
  #BASS_3DMODE_OFF			  = 2
  ; Turn off 3D processing on the channel, the sound will be played
  ; in the center. 
  
  ; software 3D mixing algorithm modes (used With BASS_Set3DAlgorithm)
  #BASS_3DALG_DEFAULT	    = 0
  ; Default algorithm (currently translates To BASS_3DALG_OFF) 
  #BASS_3DALG_OFF		      = 1
  ; ; Uses normal left And right panning. The vertical axis is ignored except For
  ; scaling of volume due To distance. Doppler shift And volume scaling are still
  ; applied, but the 3D filtering is Not performed. This is the most CPU efficient
  ; software implementation, but provides no virtual 3D audio effect. Head Related
  ; Transfer Function processing will Not be done. Since only normal stereo panning
  ; is used, a channel using this algorithm may be accelerated by a 2D hardware
  ; voice If no free 3D hardware voices are available. 
  #BASS_3DALG_FULL		    = 2
  ; This algorithm gives the highest quality 3D audio effect, but uses more CPU.
  ; Requires Windows 98 2nd Edition Or Windows 2000 that uses WDM drivers, If this
  ; mode is Not available then BASS_3DALG_OFF will be used instead. 
  #BASS_3DALG_LIGHT	      = 3
  ; This algorithm gives a good 3D audio effect, And uses less CPU than the FULL
  ; mode. Requires Windows 98 2nd Edition Or Windows 2000 that uses WDM drivers, If
  ; this mode is Not available then BASS_3DALG_OFF will be used instead. 
  ; User stream callback function. NOTE: A stream function should obviously be As quick
  ; As possible, other streams (And MOD musics) can't be mixed until it's finished.
  ; handle : The stream that needs writing
  ; buffer : Buffer To write the samples in
  ; length : Number of bytes To write
  ; user   : The 'user' parameter value given when calling BASS_StreamCreate
  ; Return : Number of bytes written. Set the BASS_STREAMPROC_END flag To End
           ; the stream. 
  
  #BASS_STREAMPROC_END		= $80000000	; End of user stream flag
  
  ; BASS_StreamGetFilePosition modes
  #BASS_FILEPOS_CURRENT	  = 0
  #BASS_FILEPOS_DECODE		= #BASS_FILEPOS_CURRENT
  #BASS_FILEPOS_DOWNLOAD	= 1
  #BASS_FILEPOS_END		    = 2
  #BASS_FILEPOS_START		  = 3
  #BASS_FILEPOS_CONNECTED	= 4
  
  ; STREAMFILEPROC actions
  #BASS_FILE_CLOSE		    = 0
  #BASS_FILE_READ			    = 1
  #BASS_FILE_LEN			    = 3
  #BASS_FILE_SEEK			    = 4
  
  ; Sync types (With BASS_ChannelSetSync "param" And SYNCPROC "data"
  ; definitions) & flags. 
  #BASS_SYNC_POS	  	    = 0
  ; Sync when a channel reaches a position.
  ; param: position in bytes
  ; Data : Not used 
  #BASS_SYNC_END		      = 2
  ; Sync when a channel reaches the End.
  ; param: Not used
  ; Data : 1 = the sync is triggered by a backward jump in a MOD music, otherwise Not used 
  #BASS_SYNC_META		      = 4
  ; Sync when metadata is received in a stream.
  ; param: Not used
  ; Data : pointer To the metadata 
  #BASS_SYNC_SLIDE		    = 5
  ; Sync when an attribute slide is completed.
  ; param: Not used
  ; Data : the type of slide completed (one of the BASS_SLIDE_xxx values) 
  #BASS_SYNC_STALL		    = 6
  ; Sync when playback has stalled.
  ; param: Not used
  ; Data : 0=stalled, 1=resumed 
  #BASS_SYNC_DOWNLOAD	    = 7
  ; Sync when downloading of an internet (Or "buffered" user file) stream has ended.
  ; param: Not used
  ; Data : Not used 
  #BASS_SYNC_FREE	        = 8
  ; Sync when a channel is freed.
  ; param: Not used
  ; Data : Not used 
  #BASS_SYNC_SETPOS	      = 11
  ; Sync when a channel's position is set.
  ; param: Not used
  ; Data : 0 = playback buffer Not flushed, 1 = playback buffer flushed 
  #BASS_SYNC_MUSICPOS		  = 10
  ; Sync when a MOD music reaches an order:row position.
  ; param: LOWORD=order (0=first, -1=all) HIWORD=row (0=first, -1=all)
  ; Data : LOWORD=order HIWORD=row 
  #BASS_SYNC_MUSICINST	  = 1
  ; Sync when an instrument (sample For the non-instrument based formats)
  ; is played in a MOD music (Not including retrigs).
  ; param: LOWORD=instrument (1=first) HIWORD=note (0=c0...119=b9, -1=all)
  ; Data : LOWORD=note HIWORD=volume (0-64) 
  #BASS_SYNC_MUSICFX	    = 3
  ; Sync when the "sync" effect (XM/MTM/MOD: E8x/Wxx, IT/S3M: S2x) is used.
  ; param: 0:Data=pos, 1:Data="x" value
  ; Data : param=0: LOWORD=order HIWORD=row, param=1: "x" value 
  #BASS_SYNC_MESSAGE	    = $20000000	; FLAG: post a Windows message (instead of callback)
  ; When using a window message "callback", the message To post is given in the "proc"
  ; parameter of BASS_ChannelSetSync, And is posted To the window specified in the BASS_Init
  ; call. The message parameters are: WPARAM = Data, LPARAM = user. 
  #BASS_SYNC_MIXTIME	    = $40000000	; FLAG: sync at mixtime, Else at playtime
  #BASS_SYNC_ONETIME	    = $80000000	; FLAG: sync only once, Else continuously
  
  
  ; BASS_ChannelGetData flags
  #BASS_DATA_AVAILABLE	  = 0			; query how much Data is buffered
  #BASS_DATA_FLOAT		    = $40000000	; flag: Return floating-point sample Data
  #BASS_DATA_FFT512	      = $80000000	; 512 sample FFT
  #BASS_DATA_FFT1024	    = $80000001	; 1024 FFT
  #BASS_DATA_FFT2048	    = $80000002	; 2048 FFT
  #BASS_DATA_FFT4096	    = $80000003	; 4096 FFT
  #BASS_DATA_FFT8192	    = $80000004	; 8192 FFT
  #BASS_DATA_FFT_INDIVIDUAL = $10	; FFT flag: FFT For each channel, Else all combined
  #BASS_DATA_FFT_NOWINDOW	= $20	; FFT flag: no Hanning window
  
  ; BASS_ChannelGetTags types : what's returned
  #BASS_TAG_ID3		        = 0	; ID3v1 tags : 128 byte block
  #BASS_TAG_ID3V2		      = 1	; ID3v2 tags : variable length block
  #BASS_TAG_OGG		        = 2	; OGG comments : array of null-terminated UTF-8 strings
  #BASS_TAG_HTTP		      = 3	; HTTP headers : array of null-terminated ANSI strings
  #BASS_TAG_ICY		        = 4	; ICY headers : array of null-terminated ANSI strings
  #BASS_TAG_META		      = 5	; ICY meta; Data : ANSI string
  #BASS_TAG_VENDOR		    = 9	; OGG encoder : UTF-8 string
  #BASS_TAG_LYRICS3	      = 10	; Lyric3v2 tag : ASCII string
  #BASS_TAG_RIFF_INFO	    = $100 ; RIFF/WAVE tags : array of null-terminated ANSI strings
  #BASS_TAG_MUSIC_NAME		= $10000	; MOD music name : ANSI string
  #BASS_TAG_MUSIC_MESSAGE	= $10001	; MOD message : ANSI string
  #BASS_TAG_MUSIC_INST		= $10100	; + instrument #, MOD instrument name : ANSI string
  #BASS_TAG_MUSIC_SAMPLE	= $10300	; + sample #, MOD sample name : ANSI string
  
  ; BASS_MusicSet/GetAttribute options
  #BASS_MUSIC_ATTRIB_AMPLIFY	= 0
  #BASS_MUSIC_ATTRIB_PANSEP	  = 1
  #BASS_MUSIC_ATTRIB_PSCALER	= 2
  #BASS_MUSIC_ATTRIB_BPM		  = 3
  #BASS_MUSIC_ATTRIB_SPEED		= 4
  #BASS_MUSIC_ATTRIB_VOL_GLOBAL = 5
  #BASS_MUSIC_ATTRIB_VOL_CHAN	= $100 ; + channel #
  #BASS_MUSIC_ATTRIB_VOL_INST	= $200 ; + instrument #
  
  #BASS_FX_PHASE_NEG_180      = 0
  #BASS_FX_PHASE_NEG_90       = 1
  #BASS_FX_PHASE_ZERO         = 2
  #BASS_FX_PHASE_90           = 3
  #BASS_FX_PHASE_180          = 4
  
  
  ; BASS_ChannelIsActive Return values
  #BASS_ACTIVE_STOPPED	      = 0
  #BASS_ACTIVE_PLAYING	      = 1
  #BASS_ACTIVE_STALLED	      = 2
  #BASS_ACTIVE_PAUSED	        = 3
  
  ; BASS_ChannelIsSliding Return flags
  #BASS_SLIDE_FREQ	          = 1
  #BASS_SLIDE_VOL	            = 2
  #BASS_SLIDE_PAN	            = 4
  
  ; BASS_RecordSetInput flags
  #BASS_INPUT_OFF		          = $10000
  #BASS_INPUT_ON		          = $20000
  #BASS_INPUT_LEVEL	          = $40000
  
  #BASS_INPUT_TYPE_MASK		    = $ff000000
  #BASS_INPUT_TYPE_UNDEF		  = $00000000
  #BASS_INPUT_TYPE_DIGITAL		= $01000000
  #BASS_INPUT_TYPE_LINE		    = $02000000
  #BASS_INPUT_TYPE_MIC	  		= $03000000
  #BASS_INPUT_TYPE_SYNTH	  	= $04000000
  #BASS_INPUT_TYPE_CD		    	= $05000000
  #BASS_INPUT_TYPE_PHONE	  	= $06000000
  #BASS_INPUT_TYPE_SPEAKER		= $07000000
  #BASS_INPUT_TYPE_WAVE		    = $08000000
  #BASS_INPUT_TYPE_AUX			  = $09000000
  #BASS_INPUT_TYPE_ANALOG	  	= $0a000000
  
  ; BASS_Set/GetConfig options
  #BASS_CONFIG_BUFFER			    = 0
  #BASS_CONFIG_UPDATEPERIOD	  = 1
  #BASS_CONFIG_MAXVOL			    = 3
  #BASS_CONFIG_GVOL_SAMPLE		= 4
  #BASS_CONFIG_GVOL_STREAM		= 5
  #BASS_CONFIG_GVOL_MUSIC		  = 6
  #BASS_CONFIG_CURVE_VOL		  = 7
  #BASS_CONFIG_CURVE_PAN		  = 8
  #BASS_CONFIG_FLOATDSP		    = 9
  #BASS_CONFIG_3DALGORITHM		= 10
  #BASS_CONFIG_NET_TIMEOUT		= 11
  #BASS_CONFIG_NET_BUFFER		  = 12
  #BASS_CONFIG_PAUSE_NOPLAY	  = 13
  #BASS_CONFIG_NET_PREBUF		  = 15
  #BASS_CONFIG_NET_AGENT		  = 16
  #BASS_CONFIG_NET_PROXY		  = 17
  #BASS_CONFIG_NET_PASSIVE		= 18
  #BASS_CONFIG_REC_BUFFER		  = 19
  #BASS_CONFIG_NET_PLAYLIST	  = 21
  #BASS_CONFIG_MUSIC_VIRTUAL	= 22
;}
;{ Enumerations
  ; DX8 effect types use With BASS_ChannelSetFX
  Enumeration 
    #BASS_FX_CHORUS			; GUID_DSFX_STANDARD_CHORUS
    #BASS_FX_COMPRESSOR		; GUID_DSFX_STANDARD_COMPRESSOR
    #BASS_FX_DISTORTION		; GUID_DSFX_STANDARD_DISTORTION
    #BASS_FX_ECHO			; GUID_DSFX_STANDARD_ECHO
    #BASS_FX_FLANGER		; GUID_DSFX_STANDARD_FLANGER
    #BASS_FX_GARGLE			; GUID_DSFX_STANDARD_GARGLE
    #BASS_FX_I3DL2REVERB	; GUID_DSFX_STANDARD_I3DL2REVERB
    #BASS_FX_PARAMEQ		; GUID_DSFX_STANDARD_PARAMEQ
    #BASS_FX_REVERB			; GUID_DSFX_WAVES_REVERB
  EndEnumeration   
  ; EAX environments use With BASS_SetEAXParameters
  Enumeration 
    #EAX_ENVIRONMENT_GENERIC
    #EAX_ENVIRONMENT_PADDEDCELL
    #EAX_ENVIRONMENT_ROOM
    #EAX_ENVIRONMENT_BATHROOM
    #EAX_ENVIRONMENT_LIVINGROOM
    #EAX_ENVIRONMENT_STONEROOM
    #EAX_ENVIRONMENT_AUDITORIUM
    #EAX_ENVIRONMENT_CONCERTHALL
    #EAX_ENVIRONMENT_CAVE
    #EAX_ENVIRONMENT_ARENA
    #EAX_ENVIRONMENT_HANGAR
    #EAX_ENVIRONMENT_CARPETEDHALLWAY
    #EAX_ENVIRONMENT_HALLWAY
    #EAX_ENVIRONMENT_STONECORRIDOR
    #EAX_ENVIRONMENT_ALLEY
    #EAX_ENVIRONMENT_FOREST
    #EAX_ENVIRONMENT_CITY
    #EAX_ENVIRONMENT_MOUNTAINS
    #EAX_ENVIRONMENT_QUARRY
    #EAX_ENVIRONMENT_PLAIN
    #EAX_ENVIRONMENT_PARKINGLOT
    #EAX_ENVIRONMENT_SEWERPIPE
    #EAX_ENVIRONMENT_UNDERWATER
    #EAX_ENVIRONMENT_DRUGGED
    #EAX_ENVIRONMENT_DIZZY
    #EAX_ENVIRONMENT_PSYCHOTIC
  
    #EAX_ENVIRONMENT_COUNT			; total number of environments
  EndEnumeration 
;}
;{ Structures
  Structure BASS_INFO
  	flags.l	    ; device capabilities (DSCAPS_xxx flags)
  	hwsize.l	  ; size of total device hardware memory
  	hwfree.l	  ; size of free device hardware memory
  	freesam.l	  ; number of free sample slots in the hardware
  	free3d.l	  ; number of free 3D sample slots in the hardware
  	minrate.l 	; min sample rate supported by the hardware
  	maxrate.l	  ; max sample rate supported by the hardware
  	eax.l		    ; device supports EAX? (always FALSE If BASS_DEVICE_3D was Not used)
  	minbuf.l	  ; recommended minimum buffer length in ms (requires BASS_DEVICE_LATENCY)
  	dsver.l	    ; DirectSound version
  	latency.l	  ; Delay (in ms) before start of playback (requires BASS_DEVICE_LATENCY)
  	initflags.l ; "flags" parameter of BASS_Init call
  	speakers.l  ; number of speakers available
  	driver.s	  ; driver
  	freq.l		  ; current output rate (OSX only)
  EndStructure 
  Structure BASS_RECORDINFO
  	flags.l	    ; device capabilities (DSCCAPS_xxx flags)
  	formats.l	  ; supported standard formats (WAVE_FORMAT_xxx flags)
  	inputs.l	  ; number of inputs
  	singlein.l	; TRUE = only 1 input can be set at a time
  	driver.s	  ; driver
  	freq.l		  ; current input rate (OSX only)
  EndStructure 
  ; Sample info Structure & flags
  Structure BASS_SAMPLE
  	freq.l		; Default playback rate
  	volume.l	; Default volume (0-100)
  	pan.l		  ; Default pan (-100=left 0=middle 100=right)
  	flags.l	  ; BASS_SAMPLE_xxx flags
  	length.l	; length (in bytes)
  	max.l		  ; maximum simultaneous playbacks
  	origres.l	; original resolution bits
  	chans.l	  ; number of channels
  	mingap.l	; minimum gap (ms) between creating channels
    ; The following are the sample's default 3D attributes (if the sample
    ; is 3D BASS_SAMPLE_3D is in flags) see BASS_ChannelSet3DAttributes 
  	mode3d.l	; BASS_3DMODE_xxx mode
  	mindist.f	; minimum distance
  	maxdist.f	; maximum distance
  	iangle.l	; angle of inside projection cone
  	oangle.l	; angle of outside projection cone
  	outvol.l	; delta-volume outside the projection cone
    ; The following are the defaults used If the sample uses the DirectX 7
    ; voice allocation/management features. 
  	vam.l		  ; voice allocation/management flags (BASS_VAM_xxx)
  	priority.l; priority (0=lowest 0xffffffff=highest)
  EndStructure 
  ; If there are no free hardware voices the buffer To be terminated will be
  ; the one With the lowest priority. 
  Structure BASS_CHANNELINFO
  	freq.l		      ; Default playback rate
  	chans.l	        ; channels
  	flags.l	        ; BASS_SAMPLE/STREAM/MUSIC/SPEAKER flags
  	ctype.l	        ; type of channel
  	origres.l	      ; original resolution
  	plugin.HPLUGIN  ; plugin
  EndStructure
  Structure BASS_PLUGINFORM
  	ctype.l		; channel type
  	name.s	  ; format description
  	exts.s	  ; file extension filter (*.ext1*.ext2etc...)
  EndStructure 
  Structure BASS_PLUGININFO
  	version.l					        ; version (same form As BASS_GetVersion)
  	formatc.l					        ; number of formats
  	*formats.BASS_PLUGINFORM	; the array of formats
  EndStructure 
  ; 3D vector (For 3D positions/velocities/orientations)
  Structure BASS_3DVECTOR
  	x.f	; +=right -=left
  	y.f	; +=up -=down
  	z.f	; +=front -=behind
  EndStructure
  Structure BASS_FXCHORUS		; DSFXChorus
    fWetDryMix.f
    fDepth.f
    fFeedback.f
    fFrequency.f
    lWaveform.l	; 0=triangle 1=sine
    fDelay.f
    lPhase.l		; BASS_FX_PHASE_xxx
  EndStructure
  Structure BASS_FXCOMPRESSOR	; DSFXCompressor
    fGain.f
    fAttack.f
    fRelease.f
    fThreshold.f
    fRatio.f
    fPredelay.f
  EndStructure
  Structure BASS_FXDISTORTION	; DSFXDistortion
    fGain.f
    fEdge.f
    fPostEQCenterFrequency.f
    fPostEQBandwidth.f
    fPreLowpassCutoff.f
  EndStructure
  Structure BASS_FXECHO			; DSFXEcho
    fWetDryMix.f
    fFeedback.f
    fLeftDelay.f
    fRightDelay.f
    lPanDelay.BOOL
  EndStructure
  Structure BASS_FXFLANGER		; DSFXFlanger
    fWetDryMix.f
    fDepth.f
    fFeedback.f
    fFrequency.f
    lWaveform.l	; 0=triangle 1=sine
    fDelay.f
    lPhase.l		; BASS_FX_PHASE_xxx
  EndStructure
  Structure BASS_FXGARGLE		; DSFXGargle
    dwRateHz.l               ; Rate of modulation in hz
    dwWaveShape.l            ; 0=triangle 1=square
  EndStructure
  Structure BASS_FXI3DL2REVERB	; DSFXI3DL2Reverb
    lRoom.l                  ; [-10000 0]      Default: -1000 mB
    lRoomHF.l                ; [-10000 0]      Default: 0 mB
    flRoomRolloffFactor.f    ; [0.0 10.0]      Default: 0.0
    flDecayTime.f            ; [0.1 20.0]      Default: 1.49s
    flDecayHFRatio.f         ; [0.1 2.0]       Default: 0.83
    lReflections.l           ; [-10000 1000]   Default: -2602 mB
    flReflectionsDelay.f     ; [0.0 0.3]       Default: 0.007 s
    lReverb.l                ; [-10000 2000]   Default: 200 mB
    flReverbDelay.f          ; [0.0 0.1]       Default: 0.011 s
    flDiffusion.f            ; [0.0 100.0]     Default: 100.0 %
    flDensity.f              ; [0.0 100.0]     Default: 100.0 %
    flHFReference.f          ; [20.0 20000.0]  Default: 5000.0 Hz
  EndStructure
  Structure BASS_FXPARAMEQ		; DSFXParamEq
    fCenter.f
    fBandwidth.f
    fGain.f
  EndStructure
  Structure BASS_FXREVERB		; DSFXWavesReverb
    fInGain.f                ; [-96.00.0]            Default: 0.0 dB
    fReverbMix.f             ; [-96.00.0]            Default: 0.0 db
    fReverbTime.f            ; [0.0013000.0]         Default: 1000.0 ms
    fHighFreqRTRatio.f       ; [0.0010.999]          Default: 0.001
  EndStructure
;}
;{ Callbacks 
  ;-CB_STREAMPROC(*buffer, length.l, user.l)
  ;-CB_STREAMFILEPROC(action.l, param1.l, param2.l,user.l)
  ; User file stream callback function.
  ; action : The action To perform one of BASS_FILE_xxx values.
  ; param1 : Depends on "action"
  ; param2 : Depends on "action"
  ; user   : The 'user' parameter value given when calling BASS_StreamCreate
  ; Return : Depends on "action" 
  
  ;-CB_DOWNLOADPROC(*buffer, length.l, user.l)
  ; Internet stream download callback function.
  ; buffer : Buffer containing the downloaded Data... NULL=End of download
  ; length : Number of bytes in the buffer
  ; user   : The 'user' parameter value given when calling BASS_StreamCreateURL 
  
  ;-CB_SYNCPROC(handle.HSYNC, channel.l, Data_.l, user.l)
  ; Sync callback function. NOTE: a sync callback function should be very
  ; quick As other syncs can't be processed until it has finished. If the sync
  ; is a "mixtime" sync then other streams And MOD musics can't be mixed until
  ; it's finished either.
  ; handle : The sync that has occured
  ; channel: Channel that the sync occured in
  ; Data   : Additional Data associated With the sync's occurance
  ; user   : The 'user' parameter given when calling BASS_ChannelSetSync 
  
  ;-CB_DSPPROC(handle.HDSP, channel.l, *buffer, length.l, user.l)
  ; DSP callback function. NOTE: A DSP function should obviously be As quick As
  ; possible... other DSP functions streams And MOD musics can Not be processed
  ; Until it's finished.
  ; handle : The DSP handle
  ; channel: Channel that the DSP is being applied To
  ; buffer : Buffer To apply the DSP To
  ; length : Number of bytes in the buffer
  ; user   : The 'user' parameter given when calling BASS_ChannelSetDSP 
  
  ;-CB_RECORDPROC(handle.HRECORD, *buffer, length.l, user.l)
  ; Recording callback function.
  ; handle : The recording handle
  ; buffer : Buffer containing the recorded sample Data
  ; length : Number of bytes
  ; user   : The 'user' parameter value given when calling BASS_RecordStart
  ; Return : TRUE = Continue recording FALSE = stop 
;}

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 204
; FirstLine = 83
; Folding = BAAAAAAiAAg