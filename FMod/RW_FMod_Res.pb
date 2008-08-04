;{ Macros
  Macro FMOD_BOOL
    l
  EndMacro
  Macro FMOD_MODE
    l
  EndMacro
  Macro FMOD_TIMEUNIT
    l
  EndMacro
  Macro FMOD_INITFLAGS
    l
  EndMacro
  Macro FMOD_CAPS
    l
  EndMacro
  Macro FMOD_DEBUGLEVEL
    l
  EndMacro
  Macro FMOD_MEMORY_TYPE
    l
  EndMacro
  Macro FMOD_SOUND_FORMAT
    l
  EndMacro
  Macro FMOD_SYSTEM_CALLBACKTYPE
    l
  EndMacro
  Macro FMOD_PLUGINTYPE
    l
  EndMacro
  Macro FMOD_TAGTYPE
    l
  EndMacro
  Macro FMOD_TAGDATATYPE
    l
  EndMacro
  Macro FMOD_SOUND_TYPE
    l
  EndMacro
  Macro FMOD_SPEAKERMAPTYPE
    l
  EndMacro
  Macro FMOD_SOUNDGROUP_BEHAVIOR
    l
  EndMacro
  Macro FMOD_SYNCPOINT
    l
  EndMacro
  Macro FMOD_OPENSTATE
    l
  EndMacro
  Macro FMOD_SYSTEM
    l
  EndMacro
  Macro FMOD_GEOMETRY
    l
  EndMacro
  Macro FMOD_CHANNEL
    l
  EndMacro
  Macro FMOD_CHANNELINDEX
    l
  EndMacro
  Macro FMOD_REVERB
    l
  EndMacro
  Macro FMOD_CHANNELGROUP
    l
  EndMacro
  Macro FMOD_SOUNDGROUP
    l
  EndMacro
  Macro FMOD_SPEAKER
    l
  EndMacro
  Macro FMOD_DSP_TYPE
    l
  EndMacro
  Macro FMOD_SOUND
    l
  EndMacro
  Macro FMOD_DSP
    l
  EndMacro
  Macro FMOD_DSP_FFT_WINDOW
    l
  EndMacro
  Macro FMOD_RESULT
    l
  EndMacro
;}

;{ Enumerations
  Enumeration ; FMOD_RESULT
      #FMOD_OK                        ; No errors. 
      #FMOD_ERR_ALREADYLOCKED         ; Tried To call lock a second time before unlock was called. 
      #FMOD_ERR_BADCOMMAND            ; Tried To call a function on a Data type that does Not allow this type of functionality (ie calling Sound::lock on a streaming sound). 
      #FMOD_ERR_CDDA_DRIVERS          ; Neither NTSCSI nor ASPI could be initialised. 
      #FMOD_ERR_CDDA_INIT             ; An error occurred While initialising the CDDA subsystem. 
      #FMOD_ERR_CDDA_INVALID_DEVICE   ; Couldn't find the specified device. */
      #FMOD_ERR_CDDA_NOAUDIO          ; No audio tracks on the specified disc. 
      #FMOD_ERR_CDDA_NODEVICES        ; No CD/DVD devices were found.  
      #FMOD_ERR_CDDA_NODISC           ; No disc present in the specified drive. 
      #FMOD_ERR_CDDA_READ             ; A CDDA Read error occurred. 
      #FMOD_ERR_CHANNEL_ALLOC         ; Error trying To allocate a channel. 
      #FMOD_ERR_CHANNEL_STOLEN        ; The specified channel has been reused To play another sound. 
      #FMOD_ERR_COM                   ; A Win32 COM related error occured. COM failed To initialize Or a QueryInterface failed meaning a Windows codec Or driver was Not installed properly. 
      #FMOD_ERR_DMA                   ; DMA Failure.  See Debug output For more information. 
      #FMOD_ERR_DSP_CONNECTION        ; DSP connection error.  Connection possibly caused a cyclic dependancy. 
      #FMOD_ERR_DSP_FORMAT            ; DSP Format error.  A DSP unit may have attempted To connect To this network With the wrong format. 
      #FMOD_ERR_DSP_NOTFOUND          ; DSP connection error.  Couldn't find the DSP unit specified. */
      #FMOD_ERR_DSP_RUNNING           ; DSP error.  Cannot perform this operation While the network is in the middle of running.  This will most likely happen If a connection Or disconnection is attempted in a DSP callback. 
      #FMOD_ERR_DSP_TOOMANYCONNECTIONS; DSP connection error.  The unit being connected To Or disconnected should only have 1 input Or output. 
      #FMOD_ERR_FILE_BAD              ; Error loading file. 
      #FMOD_ERR_FILE_COULDNOTSEEK     ; Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format. */
      #FMOD_ERR_FILE_DISKEJECTED      ; Media was ejected While reading. 
      #FMOD_ERR_FILE_EOF              ; End of file unexpectedly reached While trying To Read essential Data (truncated Data?). 
      #FMOD_ERR_FILE_NOTFOUND         ; File Not found. 
      #FMOD_ERR_FILE_UNWANTED         ; Unwanted file access occured. 
      #FMOD_ERR_FORMAT                ; Unsupported file Or audio format. 
      #FMOD_ERR_HTTP                  ; A HTTP error occurred. This is a catch-all For HTTP errors Not listed elsewhere. 
      #FMOD_ERR_HTTP_ACCESS           ; The specified resource requires authentication Or is forbidden. 
      #FMOD_ERR_HTTP_PROXY_AUTH       ; Proxy authentication is required To access the specified resource. 
      #FMOD_ERR_HTTP_SERVER_ERROR     ; A HTTP server error occurred. 
      #FMOD_ERR_HTTP_TIMEOUT          ; The HTTP request timed out. 
      #FMOD_ERR_INITIALIZATION        ; FMOD was Not initialized correctly To support this function. 
      #FMOD_ERR_INITIALIZED           ; Cannot call this command after System::init. 
      #FMOD_ERR_INTERNAL              ; An error occured that wasn't supposed to.  Contact support. */
      #FMOD_ERR_INVALID_ADDRESS       ; On Xbox 360 this memory address passed To FMOD must be physical (ie allocated With XPhysicalAlloc.) 
      #FMOD_ERR_INVALID_FLOAT         ; Value passed in was a NaN Inf Or denormalized float. 
      #FMOD_ERR_INVALID_HANDLE        ; An invalid object handle was used. 
      #FMOD_ERR_INVALID_PARAM         ; An invalid parameter was passed To this function. 
      #FMOD_ERR_INVALID_SPEAKER       ; An invalid speaker was passed To this function based on the current speaker mode. 
      #FMOD_ERR_INVALID_VECTOR        ; The vectors passed in are Not unit length Or perpendicular. 
      #FMOD_ERR_IRX                   ; PS2 only.  fmodex.irx failed To initialize.  This is most likely because you forgot To load it. 
      #FMOD_ERR_MAXAUDIBLE            ; Reached maximum audible playback count For this sound's soundgroup. */
      #FMOD_ERR_MEMORY                ; Not enough memory Or resources. 
      #FMOD_ERR_MEMORY_IOP            ; PS2 only.  Not enough memory Or resources on PlayStation 2 IOP ram. 
      #FMOD_ERR_MEMORY_SRAM           ; Not enough memory Or resources on console sound ram. 
      #FMOD_ERR_MEMORY_CANTPOINT      ; Can't use FMOD_OPENMEMORY_POINT on non PCM source data or non mp3/xma/adpcm data if FMOD_CREATECOMPRESSEDSAMPLE was used. */
      #FMOD_ERR_NEEDS2D               ; Tried To call a command on a 3d sound when the command was meant For 2d sound. 
      #FMOD_ERR_NEEDS3D               ; Tried To call a command on a 2d sound when the command was meant For 3d sound. 
      #FMOD_ERR_NEEDSHARDWARE         ; Tried To use a feature that requires hardware support.  (ie trying To play a VAG compressed sound in software on PS2). 
      #FMOD_ERR_NEEDSSOFTWARE         ; Tried To use a feature that requires the software engine.  Software engine has either been turned off Or command was executed on a hardware channel which does Not support this feature. 
      #FMOD_ERR_NET_CONNECT           ; Couldn't connect to the specified host. */
      #FMOD_ERR_NET_SOCKET_ERROR      ; A socket error occurred.  This is a catch-all For socket-related errors Not listed elsewhere. 
      #FMOD_ERR_NET_URL               ; The specified URL couldn't be resolved. */
      #FMOD_ERR_NET_WOULD_BLOCK       ; Operation on a non-blocking socket could Not complete immediately. 
      #FMOD_ERR_NOTREADY              ; Operation could Not be performed because specified sound is Not ready. 
      #FMOD_ERR_OUTPUT_ALLOCATED      ; Error initializing output device but more specifically the output device is already in use And cannot be reused. 
      #FMOD_ERR_OUTPUT_CREATEBUFFER   ; Error creating hardware sound buffer. 
      #FMOD_ERR_OUTPUT_DRIVERCALL     ; A call To a standard soundcard driver failed which could possibly mean a bug in the driver Or resources were missing Or exhausted. 
      #FMOD_ERR_OUTPUT_ENUMERATION    ; Error enumerating the available driver list. List may be inconsistent due To a recent device addition Or removal. 
      #FMOD_ERR_OUTPUT_FORMAT         ; Soundcard does Not support the minimum features needed For this soundsystem (16bit stereo output). 
      #FMOD_ERR_OUTPUT_INIT           ; Error initializing output device. 
      #FMOD_ERR_OUTPUT_NOHARDWARE     ; #FMOD_HARDWARE was specified but the sound card does Not have the resources nescessary To play it. 
      #FMOD_ERR_OUTPUT_NOSOFTWARE     ; Attempted To create a software sound but no software channels were specified in System::init. 
      #FMOD_ERR_PAN                   ; Panning only works With mono Or stereo sound sources. 
      #FMOD_ERR_PLUGIN                ; An unspecified error has been returned from a 3rd party plugin. 
      #FMOD_ERR_PLUGIN_MISSING        ; A requested output dsp unit type Or codec was Not available. 
      #FMOD_ERR_PLUGIN_RESOURCE       ; A resource that the plugin requires cannot be found. (ie the DLS file For MIDI playback) 
      #FMOD_ERR_PLUGIN_INSTANCES      ; The number of allowed instances of a plugin has been exceeded. 
      #FMOD_ERR_RECORD                ; An error occured trying To initialize the recording device. 
      #FMOD_ERR_REVERB_INSTANCE       ; Specified Instance in #FMOD_REVERB_PROPERTIES couldn't be set. Most likely because another application has locked the EAX4 FX slot. */
      #FMOD_ERR_SUBSOUNDS             ; The error occured because the sound referenced contains subsounds.  (ie you cannot play the parent sound As a Static sample only its subsounds.) 
      #FMOD_ERR_SUBSOUND_ALLOCATED    ; This subsound is already being used by another sound you cannot have more than one parent To a sound.  Null out the other parent's entry first. */
      #FMOD_ERR_TAGNOTFOUND           ; The specified tag could Not be found Or there are no tags. 
      #FMOD_ERR_TOOMANYCHANNELS       ; The sound created exceeds the allowable input channel count.  This can be increased using the maxinputchannels parameter in System::setSoftwareFormat. 
      #FMOD_ERR_UNIMPLEMENTED         ; Something in FMOD hasn't been implemented when it should be! contact support! */
      #FMOD_ERR_UNINITIALIZED         ; This command failed because System::init Or System::setDriver was Not called. 
      #FMOD_ERR_UNSUPPORTED           ; A command issued was Not supported by this object.  Possibly a plugin without certain callbacks specified. 
      #FMOD_ERR_UPDATE                ; An error caused by System::update occured. 
      #FMOD_ERR_VERSION               ; The version number of this file format is Not supported. 
  
      #FMOD_ERR_EVENT_FAILED          ; An Event failed To be retrieved most likely due To 'just fail' being specified As the max playbacks behavior. 
      #FMOD_ERR_EVENT_INTERNAL        ; An error occured that wasn't supposed to.  See debug log for reason. */
      #FMOD_ERR_EVENT_INFOONLY        ; Can't execute this command on an EVENT_INFOONLY event. */
      #FMOD_ERR_EVENT_MAXSTREAMS      ; Event failed because 'Max streams' was hit when #FMOD_INIT_FAIL_ON_MAXSTREAMS was specified. 
      #FMOD_ERR_EVENT_MISMATCH        ; FSB mismatches the FEV it was compiled With Or FEV was built For a different platform. 
      #FMOD_ERR_EVENT_NAMECONFLICT    ; A category With the same name already exists. 
      #FMOD_ERR_EVENT_NOTFOUND        ; The requested event event group event category Or event property could Not be found. 
  
      #FMOD_RESULT_FORCEINT = 65536    ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_OUTPUTTYPE
    #FMOD_OUTPUTTYPE_AUTODETECT      ; Picks the best output mode For the platform.  This is the Default. 
    #FMOD_OUTPUTTYPE_UNKNOWN         ; All         - 3rd party plugin unknown.  This is For use With System::getOutput only. 
    #FMOD_OUTPUTTYPE_NOSOUND         ; All         - All calls in this mode succeed but make no sound. 
    #FMOD_OUTPUTTYPE_WAVWRITER       ; All         - Writes output To fmodoutput.wav by Default.  Use the 'extradriverdata' parameter in System::init by simply passing the filename As a string To set the wav filename. 
    #FMOD_OUTPUTTYPE_NOSOUND_NRT     ; All         - Non-realtime version of #FMOD_OUTPUTTYPE_NOSOUND.  User can drive mixer With System::update at whatever rate they want. 
    #FMOD_OUTPUTTYPE_WAVWRITER_NRT   ; All         - Non-realtime version of #FMOD_OUTPUTTYPE_WAVWRITER.  User can drive mixer With System::update at whatever rate they want. 
    #FMOD_OUTPUTTYPE_DSOUND          ; Win32/Win64 - DirectSound output.  Use this To get hardware accelerated 3d audio And EAX Reverb support. (Default on Windows) 
    #FMOD_OUTPUTTYPE_WINMM           ; Win32/Win64 - Windows Multimedia output. 
    #FMOD_OUTPUTTYPE_OPENAL          ; Win32/Win64 - OpenAL 1.1 output. Use this For lower CPU overhead than #FMOD_OUTPUTTYPE_DSOUND And also Vista H/W support With Creative Labs cards. 
    #FMOD_OUTPUTTYPE_WASAPI          ; Win32       - Windows Audio Session API. (Default on Windows Vista) 
    #FMOD_OUTPUTTYPE_ASIO            ; Win32       - Low latency ASIO driver. 
    #FMOD_OUTPUTTYPE_OSS             ; Linux       - Open Sound System output. (Default on Linux) 
    #FMOD_OUTPUTTYPE_ALSA            ; Linux       - Advanced Linux Sound Architecture output. 
    #FMOD_OUTPUTTYPE_ESD             ; Linux       - Enlightment Sound Daemon output. 
    #FMOD_OUTPUTTYPE_SOUNDMANAGER    ; Mac         - Macintosh SoundManager output.  (Default on Mac carbon library)
    #FMOD_OUTPUTTYPE_COREAUDIO       ; Mac         - Macintosh CoreAudio output.  (Default on Mac OSX library) 
    #FMOD_OUTPUTTYPE_XBOX            ; Xbox        - Native hardware output. (Default on Xbox) 
    #FMOD_OUTPUTTYPE_PS2             ; PS2         - Native hardware output. (Default on PS2) 
    #FMOD_OUTPUTTYPE_PS3             ; PS3         - Native hardware output. (Default on PS3) 
    #FMOD_OUTPUTTYPE_GC              ; GameCube    - Native hardware output. (Default on GameCube) 
    #FMOD_OUTPUTTYPE_XBOX360         ; Xbox 360    - Native hardware output. (Default on Xbox 360) 
    #FMOD_OUTPUTTYPE_PSP             ; PSP         - Native hardware output. (Default on PSP) 
    #FMOD_OUTPUTTYPE_WII			        ; Wii			- Native hardware output. (Default on Wii) 
    #FMOD_OUTPUTTYPE_MAX             ; Maximum number of output types supported. 
    #FMOD_OUTPUTTYPE_FORCEINT = 65536 ; Makes sure this enum is signed 32bit. 
  EndEnumeration 
  Enumeration ; FMOD_SPEAKERMAPTYPE
    #FMOD_SPEAKERMAPTYPE_DEFAULT     ; This is the Default And just means FMOD decides which speakers it puts the source channels. 
    #FMOD_SPEAKERMAPTYPE_ALLMONO     ; This means the sound is made up of all mono sounds.  All voices will be panned To the front center by Default in this Case.  
    #FMOD_SPEAKERMAPTYPE_ALLSTEREO    ; This means the sound is made up of all stereo sounds.  All voices will be panned To front left And front right alternating every second channel.  
  EndEnumeration
  Enumeration ; FMOD_SPEAKERMODE
    #FMOD_SPEAKERMODE_RAW              ; There is no specific speakermode.  Sound channels are mapped in order of input To output.  Use System::setSoftwareFormat To specify speaker count. See remarks For more information. 
    #FMOD_SPEAKERMODE_MONO             ; The speakers are monaural. 
    #FMOD_SPEAKERMODE_STEREO           ; The speakers are stereo (Default). 
    #FMOD_SPEAKERMODE_QUAD             ; 4 speaker setup.  This includes front left front right rear left rear right.  
    #FMOD_SPEAKERMODE_SURROUND         ; 5 speaker setup.  This includes front left front right center rear left rear right. 
    #FMOD_SPEAKERMODE_5POINT1          ; 5.1 speaker setup.  This includes front left front right center rear left rear right And a subwoofer. 
    #FMOD_SPEAKERMODE_7POINT1          ; 7.1 speaker setup.  This includes front left front right center rear left rear right side left side right And a subwoofer. 
    #FMOD_SPEAKERMODE_PROLOGIC         ; Stereo output but Data is encoded in a way that is picked up by a Prologic/Prologic2 decoder And split into a 5.1 speaker setup. 
    #FMOD_SPEAKERMODE_MAX              ; Maximum number of speaker modes supported. 
    #FMOD_SPEAKERMODE_FORCEINT = 65536  ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_SPEAKER
    #FMOD_SPEAKER_FRONT_LEFT
    #FMOD_SPEAKER_FRONT_RIGHT
    #FMOD_SPEAKER_FRONT_CENTER
    #FMOD_SPEAKER_LOW_FREQUENCY
    #FMOD_SPEAKER_BACK_LEFT
    #FMOD_SPEAKER_BACK_RIGHT
    #FMOD_SPEAKER_SIDE_LEFT
    #FMOD_SPEAKER_SIDE_RIGHT   
    #FMOD_SPEAKER_MAX                                        ; Maximum number of speaker types supported. 
    #FMOD_SPEAKER_MONO        = #FMOD_SPEAKER_FRONT_LEFT     ; For use With FMOD_SPEAKERMODE_MONO And Channel::SetSpeakerLevels.  Mapped To same value As FMOD_SPEAKER_FRONT_LEFT. 
    #FMOD_SPEAKER_NULL        = #FMOD_SPEAKER_MAX            ; A non speaker.  Use this To send. 
    #FMOD_SPEAKER_SBL         = #FMOD_SPEAKER_SIDE_LEFT      ; For use With FMOD_SPEAKERMODE_7POINT1 on PS3 where the extra speakers are surround back inside of side speakers. 
    #FMOD_SPEAKER_SBR         = #FMOD_SPEAKER_SIDE_RIGHT     ; For use With FMOD_SPEAKERMODE_7POINT1 on PS3 where the extra speakers are surround back inside of side speakers. 
    #FMOD_SPEAKER_FORCEINT    = 65536                         ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_PLUGINTYPE
    #FMOD_PLUGINTYPE_OUTPUT          ; The plugin type is an output module.  FMOD mixed audio will play through one of these devices 
    #FMOD_PLUGINTYPE_CODEC           ; The plugin type is a file format codec.  FMOD will use these codecs To load file formats For playback. 
    #FMOD_PLUGINTYPE_DSP             ; The plugin type is a DSP unit.  FMOD will use these plugins As part of its DSP network To apply effects To output Or generate sound in realtime. 
    #FMOD_PLUGINTYPE_MAX             ; Maximum number of plugin types supported. 
    #FMOD_PLUGINTYPE_FORCEINT = 65536 ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_SOUND_TYPE
    #FMOD_SOUND_TYPE_UNKNOWN         ; 3rd party / unknown plugin format. 
    #FMOD_SOUND_TYPE_AAC             ; AAC.  Currently unsupported. 
    #FMOD_SOUND_TYPE_AIFF            ; AIFF. 
    #FMOD_SOUND_TYPE_ASF             ; Microsoft Advanced Systems Format (ie WMA/ASF/WMV). 
    #FMOD_SOUND_TYPE_AT3             ; Sony ATRAC 3 format 
    #FMOD_SOUND_TYPE_CDDA            ; Digital CD audio. 
    #FMOD_SOUND_TYPE_DLS             ; Sound font / downloadable sound bank. 
    #FMOD_SOUND_TYPE_FLAC            ; FLAC lossless codec. 
    #FMOD_SOUND_TYPE_FSB             ; FMOD Sample Bank. 
    #FMOD_SOUND_TYPE_GCADPCM         ; GameCube ADPCM 
    #FMOD_SOUND_TYPE_IT              ; Impulse Tracker. 
    #FMOD_SOUND_TYPE_MIDI            ; MIDI. 
    #FMOD_SOUND_TYPE_MOD             ; Protracker / Fasttracker MOD. 
    #FMOD_SOUND_TYPE_MPEG            ; MP2/MP3 MPEG. 
    #FMOD_SOUND_TYPE_OGGVORBIS       ; Ogg vorbis. 
    #FMOD_SOUND_TYPE_PLAYLIST        ; Information only from ASX/PLS/M3U/WAX playlists 
    #FMOD_SOUND_TYPE_RAW             ; Raw PCM Data. 
    #FMOD_SOUND_TYPE_S3M             ; ScreamTracker 3. 
    #FMOD_SOUND_TYPE_SF2             ; Sound font 2 format. 
    #FMOD_SOUND_TYPE_USER            ; User created sound. 
    #FMOD_SOUND_TYPE_WAV             ; Microsoft WAV. 
    #FMOD_SOUND_TYPE_XM              ; FastTracker 2 XM. 
    #FMOD_SOUND_TYPE_XMA             ; Xbox360 XMA 
    #FMOD_SOUND_TYPE_VAG             ; PlayStation 2 / PlayStation Portable adpcm VAG format. 
    #FMOD_SOUND_TYPE_MAX             ; Maximum number of sound types supported. 
    #FMOD_SOUND_TYPE_FORCEINT = 65536 ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_SOUND_FORMAT
    #FMOD_SOUND_FORMAT_NONE             ; Unitialized / unknown. 
    #FMOD_SOUND_FORMAT_PCM8             ; 8bit integer PCM Data. 
    #FMOD_SOUND_FORMAT_PCM16            ; 16bit integer PCM Data.  
    #FMOD_SOUND_FORMAT_PCM24            ; 24bit integer PCM Data.  
    #FMOD_SOUND_FORMAT_PCM32            ; 32bit integer PCM Data.  
    #FMOD_SOUND_FORMAT_PCMFLOAT         ; 32bit floating point PCM Data.  
    #FMOD_SOUND_FORMAT_GCADPCM          ; Compressed GameCube DSP Data. 
    #FMOD_SOUND_FORMAT_IMAADPCM         ; Compressed IMA ADPCM / Xbox ADPCM Data. 
    #FMOD_SOUND_FORMAT_VAG              ; Compressed PlayStation 2 / PlayStation Portable ADPCM Data. 
    #FMOD_SOUND_FORMAT_XMA              ; Compressed Xbox360 Data. 
    #FMOD_SOUND_FORMAT_MPEG             ; Compressed MPEG layer 2 Or 3 Data. 
    #FMOD_SOUND_FORMAT_MAX              ; Maximum number of sound formats supported.    
    #FMOD_SOUND_FORMAT_FORCEINT = 65536  ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_OPENSTATE
    #FMOD_OPENSTATE_READY = 0       ; Opened And ready To play. 
    #FMOD_OPENSTATE_LOADING         ; Initial load in progress. 
    #FMOD_OPENSTATE_ERROR           ; Failed To open - file Not found out of memory etc.  See Return value of Sound::getOpenState For what happened. 
    #FMOD_OPENSTATE_CONNECTING      ; Connecting To remote host (internet sounds only). 
    #FMOD_OPENSTATE_BUFFERING       ; Buffering Data. 
    #FMOD_OPENSTATE_SEEKING         ; Seeking To subsound And re-flushing stream buffer. 
    #FMOD_OPENSTATE_STREAMING       ; Ready And playing, but Not possible To release at this time without stalling the main thread.
    #FMOD_OPENSTATE_MAX             ; Maximum number of open state types. 
    #FMOD_OPENSTATE_FORCEINT = 65536 ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_SOUNDGROUP_BEHAVIOR
    #FMOD_SOUNDGROUP_BEHAVIOR_FAIL              ; Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting will simply fail during System::playSound. 
    #FMOD_SOUNDGROUP_BEHAVIOR_MUTE              ; Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting will be silent then If another sound in the group stops the sound that was silent before becomes audible again. 
    #FMOD_SOUNDGROUP_BEHAVIOR_STEALLOWEST       ; Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting will steal the quietest / least important sound playing in the group. 
    #FMOD_SOUNDGROUP_BEHAVIOR_MAX               ; Maximum number of open state types. 
    #FMOD_SOUNDGROUP_BEHAVIOR_FORCEINT = 65536   ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_CHANNEL_CALLBACKTYPE
    #FMOD_CHANNEL_CALLBACKTYPE_END                  ; Called when a sound ends. 
    #FMOD_CHANNEL_CALLBACKTYPE_VIRTUALVOICE         ; Called when a voice is swapped out Or swapped in. 
    #FMOD_CHANNEL_CALLBACKTYPE_SYNCPOINT            ; Called when a syncpoint is encountered.  Can be from wav file markers. 
    #FMOD_CHANNEL_CALLBACKTYPE_MAX                  ; Maximum number of callback types supported. 
    #FMOD_CHANNEL_CALLBACKTYPE_FORCEINT = 65536      ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_SYSTEM_CALLBACKTYPE
    #FMOD_SYSTEM_CALLBACKTYPE_DEVICELISTCHANGED         ; Called from System::update when the enumerated list of devices has changed. 
    #FMOD_SYSTEM_CALLBACKTYPE_MEMORYALLOCATIONFAILED    ; Called directly when a memory allocation fails somewhere in FMOD. 
    #FMOD_SYSTEM_CALLBACKTYPE_THREADCREATED             ; Called directly when a thread is created.
    #FMOD_SYSTEM_CALLBACKTYPE_BADDSPCONNECTION          ; Called when a bad connection was made With DSP::addInput. Usually called from mixer thread because that is where the connections are made.
    #FMOD_SYSTEM_CALLBACKTYPE_MAX                       ; Maximum number of callback types supported. 
    #FMOD_SYSTEM_CALLBACKTYPE_FORCEINT = 65536           ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_DSP_FFT_WINDOW
    #FMOD_DSP_FFT_WINDOW_RECT            ; w[n] = 1.0                                                                                            
    #FMOD_DSP_FFT_WINDOW_TRIANGLE        ; w[n] = TRI(2n/N)                                                                                      
    #FMOD_DSP_FFT_WINDOW_HAMMING         ; w[n] = 0.54 - (0.46 * Cos(n/N) )                                                                      
    #FMOD_DSP_FFT_WINDOW_HANNING         ; w[n] = 0.5 *  (1.0  - Cos(n/N) )                                                                      
    #FMOD_DSP_FFT_WINDOW_BLACKMAN        ; w[n] = 0.42 - (0.5  * Cos(n/N) ) + (0.08 * Cos(2.0 * n/N) )                                           
    #FMOD_DSP_FFT_WINDOW_BLACKMANHARRIS  ; w[n] = 0.35875 - (0.48829 * Cos(1.0 * n/N)) + (0.14128 * Cos(2.0 * n/N)) - (0.01168 * Cos(3.0 * n/N)) 
    #FMOD_DSP_FFT_WINDOW_MAX             ; Maximum number of FFT window types supported. 
    #FMOD_DSP_FFT_WINDOW_FORCEINT = 65536 ; Makes sure this enum is signed 32bit. 
  EndEnumeration 
  Enumeration ; FMOD_DSP_RESAMPLER
    #FMOD_DSP_RESAMPLER_NOINTERP        ; No interpolation.  High frequency aliasing hiss will be audible depending on the sample rate of the sound. 
    #FMOD_DSP_RESAMPLER_LINEAR          ; Linear interpolation (Default method).  Fast And good quality causes very slight lowpass effect on low frequency sounds. 
    #FMOD_DSP_RESAMPLER_CUBIC           ; Cubic interoplation.  Slower than linear interpolation but better quality. 
    #FMOD_DSP_RESAMPLER_SPLINE          ; 5 point spline interoplation.  Slowest resampling method but best quality. 
    #FMOD_DSP_RESAMPLER_MAX             ; Maximum number of resample methods supported. 
    #FMOD_DSP_RESAMPLER_FORCEINT = 65536 ; Makes sure this enum is signed 32bit. 
  EndEnumeration 
  Enumeration ; FMOD_TAGTYPE
    #FMOD_TAGTYPE_UNKNOWN = 0
    #FMOD_TAGTYPE_ID3V1
    #FMOD_TAGTYPE_ID3V2
    #FMOD_TAGTYPE_VORBISCOMMENT
    #FMOD_TAGTYPE_SHOUTCAST
    #FMOD_TAGTYPE_ICECAST
    #FMOD_TAGTYPE_ASF
    #FMOD_TAGTYPE_MIDI
    #FMOD_TAGTYPE_PLAYLIST
    #FMOD_TAGTYPE_FMOD
    #FMOD_TAGTYPE_USER
    #FMOD_TAGTYPE_MAX               ; Maximum number of tag types supported. 
    #FMOD_TAGTYPE_FORCEINT = 65536   ; Makes sure this enum is signed 32bit. 
  EndEnumeration 
  Enumeration ; FMOD_TAGDATATYPE
    #FMOD_TAGDATATYPE_BINARY = 0
    #FMOD_TAGDATATYPE_INT
    #FMOD_TAGDATATYPE_FLOAT
    #FMOD_TAGDATATYPE_STRING
    #FMOD_TAGDATATYPE_STRING_UTF16
    #FMOD_TAGDATATYPE_STRING_UTF16BE
    #FMOD_TAGDATATYPE_STRING_UTF8
    #FMOD_TAGDATATYPE_CDTOC
    #FMOD_TAGDATATYPE_MAX               ; Maximum number of tag datatypes supported. 
    #FMOD_TAGDATATYPE_FORCEINT = 65536   ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_CHANNELINDEX
    #FMOD_CHANNEL_FREE  = -1      ; For a channel index, FMOD chooses a free voice using the priority system. 
    #FMOD_CHANNEL_REUSE = -2      ; For a channel index, re-use the channel handle that was passed in. 
  EndEnumeration
  Enumeration ; FMOD_DSP_TYPE
      #FMOD_DSP_TYPE_UNKNOWN            ; This unit was created via a non FMOD plugin so has an unknown purpose. 
      #FMOD_DSP_TYPE_MIXER              ; This unit does nothing but take inputs And mix them together then feed the result To the soundcard unit. 
      #FMOD_DSP_TYPE_OSCILLATOR         ; This unit generates sine/square/saw/triangle Or noise tones. 
      #FMOD_DSP_TYPE_LOWPASS            ; This unit filters sound using a high quality resonant lowpass filter algorithm but consumes more CPU time. 
      #FMOD_DSP_TYPE_ITLOWPASS          ; This unit filters sound using a resonant lowpass filter algorithm that is used in Impulse Tracker but With limited cutoff range (0 To 8060hz). 
      #FMOD_DSP_TYPE_HIGHPASS           ; This unit filters sound using a resonant highpass filter algorithm. 
      #FMOD_DSP_TYPE_ECHO               ; This unit produces an echo on the sound And fades out at the desired rate. 
      #FMOD_DSP_TYPE_FLANGE             ; This unit produces a flange effect on the sound. 
      #FMOD_DSP_TYPE_DISTORTION         ; This unit distorts the sound. 
      #FMOD_DSP_TYPE_NORMALIZE          ; This unit normalizes Or amplifies the sound To a certain level. 
      #FMOD_DSP_TYPE_PARAMEQ            ; This unit attenuates Or amplifies a selected frequency range. 
      #FMOD_DSP_TYPE_PITCHSHIFT         ; This unit bends the pitch of a sound without changing the speed of playback. 
      #FMOD_DSP_TYPE_CHORUS             ; This unit produces a chorus effect on the sound. 
      #FMOD_DSP_TYPE_REVERB             ; This unit produces a reverb effect on the sound. 
      #FMOD_DSP_TYPE_VSTPLUGIN          ; This unit allows the use of Steinberg VST plugins 
      #FMOD_DSP_TYPE_WINAMPPLUGIN       ; This unit allows the use of Nullsoft Winamp plugins 
      #FMOD_DSP_TYPE_ITECHO             ; This unit produces an echo on the sound And fades out at the desired rate As is used in Impulse Tracker. 
      #FMOD_DSP_TYPE_COMPRESSOR         ; This unit implements dynamic compression (linked multichannel wideband) 
      #FMOD_DSP_TYPE_SFXREVERB          ; This unit implements SFX reverb 
      #FMOD_DSP_TYPE_LOWPASS_SIMPLE     ; This unit filters sound using a simple lowpass With no resonance but has flexible cutoff And is fast. 
      #FMOD_DSP_TYPE_FORCEINT = 65536    ; Makes sure this enum is signed 32bit. 
  EndEnumeration
  Enumeration ; FMOD_DSP_OSCILLATOR
      #FMOD_DSP_OSCILLATOR_TYPE   ; Waveform type.  0 = sine.  1 = square. 2 = sawup. 3 = sawdown. 4 = triangle. 5 = noise.  
      #FMOD_DSP_OSCILLATOR_RATE   ; Frequency of the sinewave in hz.  1.0 To 22000.0.  Default = 220.0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_LOWPASS
      #FMOD_DSP_LOWPASS_CUTOFF    ; Lowpass cutoff frequency in hz.   10.0 To 22000.0.  Default = 5000.0. 
      #FMOD_DSP_LOWPASS_RESONANCE ; Lowpass resonance Q value. 1.0 To 10.0.  Default = 1.0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_ITLOWPASS
      #FMOD_DSP_ITLOWPASS_CUTOFF    ; Lowpass cutoff frequency in hz.  1.0 To 22000.0.  Default = 5000.0/ 
      #FMOD_DSP_ITLOWPASS_RESONANCE ; Lowpass resonance Q value.  0.0 To 127.0.  Default = 1.0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_HIGHPASS
      #FMOD_DSP_HIGHPASS_CUTOFF    ; Highpass cutoff frequency in hz.  1.0 To output 22000.0.  Default = 5000.0. 
      #FMOD_DSP_HIGHPASS_RESONANCE ; Highpass resonance Q value.  1.0 To 10.0.  Default = 1.0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_ECHO
      #FMOD_DSP_ECHO_DELAY       ; Echo delay in ms.  10  To 5000.  Default = 500. 
      #FMOD_DSP_ECHO_DECAYRATIO  ; Echo decay per delay.  0 To 1.  1.0 = No decay 0.0 = total decay (ie simple 1 line delay).  Default = 0.5. 
      #FMOD_DSP_ECHO_MAXCHANNELS ; Maximum channels supported.  0 To 16.  0 = same As fmod's default output polyphony, 1 = mono, 2 = stereo etc.  See remarks for more.  Default = 0.  It is suggested to leave at 0! */
      #FMOD_DSP_ECHO_DRYMIX      ; Volume of original signal To pass To output.  0.0 To 1.0. Default = 1.0. 
      #FMOD_DSP_ECHO_WETMIX      ; Volume of echo signal To pass To output.  0.0 To 1.0. Default = 1.0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_FLANGE
      #FMOD_DSP_FLANGE_DRYMIX      ; Volume of original signal To pass To output.  0.0 To 1.0. Default = 0.45. 
      #FMOD_DSP_FLANGE_WETMIX      ; Volume of flange signal To pass To output.  0.0 To 1.0. Default = 0.55. 
      #FMOD_DSP_FLANGE_DEPTH       ; Flange depth.  0.01 To 1.0.  Default = 1.0. 
      #FMOD_DSP_FLANGE_RATE         ; Flange speed in hz.  0.0 To 20.0.  Default = 0.1. 
  EndEnumeration
  Enumeration ; FMOD_DSP_DISTORTION
      #FMOD_DSP_DISTORTION_LEVEL    ; Distortion value.  0.0 To 1.0.  Default = 0.5. 
  EndEnumeration
  Enumeration ; FMOD_DSP_NORMALIZE
      #FMOD_DSP_NORMALIZE_FADETIME    ; Time To ramp the silence To full in ms.  0.0 To 20000.0. Default = 5000.0. 
      #FMOD_DSP_NORMALIZE_THRESHHOLD  ; Lower volume range threshold To ignore.  0.0 To 1.0.  Default = 0.1.  Raise higher To stop amplification of very quiet signals. 
      #FMOD_DSP_NORMALIZE_MAXAMP       ; Maximum amplification allowed.  1.0 To 100000.0.  Default = 20.0.  1.0 = no amplifaction higher values allow more boost. 
  EndEnumeration
  Enumeration ; FMOD_DSP_PARAMEQ
      #FMOD_DSP_PARAMEQ_CENTER     ; Frequency center.  20.0 To 22000.0.  Default = 8000.0. 
      #FMOD_DSP_PARAMEQ_BANDWIDTH  ; Octave range around the center frequency To filter.  0.2 To 5.0.  Default = 1.0. 
      #FMOD_DSP_PARAMEQ_GAIN        ; Frequency Gain.  0.05 To 3.0.  Default = 1.0.  
  EndEnumeration
  Enumeration ; FMOD_DSP_PITCHSHIFT
      #FMOD_DSP_PITCHSHIFT_PITCH       ; Pitch value.  0.5 To 2.0.  Default = 1.0. 0.5 = one octave down 2.0 = one octave up.  1.0 does Not change the pitch. 
      #FMOD_DSP_PITCHSHIFT_FFTSIZE     ; FFT window size.  256 512 1024 2048 4096.  Default = 1024.  Increase this To reduce 'smearing'.  This effect is a warbling sound similar To when an mp3 is encoded at very low bitrates. 
      #FMOD_DSP_PITCHSHIFT_OVERLAP     ; Removed.  Do Not use.  FMOD now uses 4 overlaps And cannot be changed. 
      #FMOD_DSP_PITCHSHIFT_MAXCHANNELS  ; Maximum channels supported.  0 To 16.  0 = same As fmod's default output polyphony, 1 = mono, 2 = stereo etc.  See remarks for more.  Default = 0.  It is suggested to leave at 0! */
  EndEnumeration
  Enumeration ; FMOD_DSP_CHORUS
      #FMOD_DSP_CHORUS_DRYMIX   ; Volume of original signal To pass To output.  0.0 To 1.0. Default = 0.5. 
      #FMOD_DSP_CHORUS_WETMIX1  ; Volume of 1st chorus tap.  0.0 To 1.0.  Default = 0.5. 
      #FMOD_DSP_CHORUS_WETMIX2  ; Volume of 2nd chorus tap. This tap is 90 degrees out of phase of the first tap.  0.0 To 1.0.  Default = 0.5. 
      #FMOD_DSP_CHORUS_WETMIX3  ; Volume of 3rd chorus tap. This tap is 90 degrees out of phase of the second tap.  0.0 To 1.0.  Default = 0.5. 
      #FMOD_DSP_CHORUS_DELAY    ; Chorus delay in ms.  0.1 To 100.0.  Default = 40.0 ms. 
      #FMOD_DSP_CHORUS_RATE     ; Chorus modulation rate in hz.  0.0 To 20.0.  Default = 0.8 hz. 
      #FMOD_DSP_CHORUS_DEPTH    ; Chorus modulation depth.  0.0 To 1.0.  Default = 0.03. 
      #FMOD_DSP_CHORUS_FEEDBACK  ; Chorus feedback.  Controls how much of the wet signal gets fed back into the chorus buffer.  0.0 To 1.0.  Default = 0.0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_REVERB
      #FMOD_DSP_REVERB_ROOMSIZE ; Roomsize. 0.0 To 1.0.  Default = 0.5 
      #FMOD_DSP_REVERB_DAMP     ; Damp.     0.0 To 1.0.  Default = 0.5 
      #FMOD_DSP_REVERB_WETMIX   ; Wet mix.  0.0 To 1.0.  Default = 0.33 
      #FMOD_DSP_REVERB_DRYMIX   ; Dry mix.  0.0 To 1.0.  Default = 0.66 
      #FMOD_DSP_REVERB_WIDTH    ; Stereo width. 0.0 To 1.0.  Default = 1.0 
      #FMOD_DSP_REVERB_MODE      ; Mode.     0 (normal) 1 (freeze).  Default = 0 
  EndEnumeration
  Enumeration ; FMOD_DSP_ITECHO
      #FMOD_DSP_ITECHO_WETDRYMIX      ; Ratio of wet (processed) signal To dry (unprocessed) signal. Must be in the range from 0.0 through 100.0 (all wet). The Default value is 50. 
      #FMOD_DSP_ITECHO_FEEDBACK       ; Percentage of output fed back into input in the range from 0.0 through 100.0. The Default value is 50. 
      #FMOD_DSP_ITECHO_LEFTDELAY      ; Delay For left channel in milliseconds in the range from 1.0 through 2000.0. The Default value is 500 ms. 
      #FMOD_DSP_ITECHO_RIGHTDELAY     ; Delay For right channel in milliseconds in the range from 1.0 through 2000.0. The Default value is 500 ms. 
      #FMOD_DSP_ITECHO_PANDELAY        ; Value that specifies whether To Swap left And right delays With each successive echo. The Default value is zero meaning no Swap. Possible values are defined As 0.0 (equivalent To FALSE) And 1.0 (equivalent To TRUE).  CURRENTLY Not SUPPORTED. 
  EndEnumeration
  Enumeration ; FMOD_DSP_COMPRESSOR
      #FMOD_DSP_COMPRESSOR_THRESHOLD  ; Threshold level (dB) in the range from -60 through 0. The Default value is 0.  
      #FMOD_DSP_COMPRESSOR_ATTACK     ; Gain reduction attack time (milliseconds) in the range from 10 through 200. The Default value is 50. 
      #FMOD_DSP_COMPRESSOR_RELEASE    ; Gain reduction release time (milliseconds) in the range from 20 through 1000. The Default value is 50. 
      #FMOD_DSP_COMPRESSOR_GAINMAKEUP  ; Make-up gain (dB) applied after limiting in the range from 0 through 30. The Default value is 0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_SFXREVERB
      #FMOD_DSP_SFXREVERB_DRYLEVEL            ; Dry Level      : Mix level of dry signal in output in mB.  Ranges from -10000.0 To 0.0.  Default is 0. 
      #FMOD_DSP_SFXREVERB_ROOM                ; Room           : Room effect level at low frequencies in mB.  Ranges from -10000.0 To 0.0.  Default is 0.0. 
      #FMOD_DSP_SFXREVERB_ROOMHF              ; Room HF        : Room effect high-frequency level re. low frequency level in mB.  Ranges from -10000.0 To 0.0.  Default is 0.0. 
      #FMOD_DSP_SFXREVERB_ROOMROLLOFFFACTOR   ; Room Rolloff   : Like DS3D flRolloffFactor but For room effect.  Ranges from 0.0 To 10.0. Default is 10.0 
      #FMOD_DSP_SFXREVERB_DECAYTIME           ; Decay Time     : Reverberation decay time at low-frequencies in seconds.  Ranges from 0.1 To 20.0. Default is 1.0. 
      #FMOD_DSP_SFXREVERB_DECAYHFRATIO        ; Decay HF Ratio : High-frequency To low-frequency decay time ratio.  Ranges from 0.1 To 2.0. Default is 0.5. 
      #FMOD_DSP_SFXREVERB_REFLECTIONSLEVEL    ; Reflections    : Early reflections level relative To room effect in mB.  Ranges from -10000.0 To 1000.0.  Default is -10000.0. 
      #FMOD_DSP_SFXREVERB_REFLECTIONSDELAY    ; Reflect Delay  : Delay time of first reflection in seconds.  Ranges from 0.0 To 0.3.  Default is 0.02. 
      #FMOD_DSP_SFXREVERB_REVERBLEVEL         ; Reverb         : Late reverberation level relative To room effect in mB.  Ranges from -10000.0 To 2000.0.  Default is 0.0. 
      #FMOD_DSP_SFXREVERB_REVERBDELAY         ; Reverb Delay   : Late reverberation delay time relative To first reflection in seconds.  Ranges from 0.0 To 0.1.  Default is 0.04. 
      #FMOD_DSP_SFXREVERB_DIFFUSION           ; Diffusion      : Reverberation diffusion (echo density) in percent.  Ranges from 0.0 To 100.0.  Default is 100.0. 
      #FMOD_DSP_SFXREVERB_DENSITY             ; Density        : Reverberation density (modal density) in percent.  Ranges from 0.0 To 100.0.  Default is 100.0. 
      #FMOD_DSP_SFXREVERB_HFREFERENCE         ; HF Reference   : Reference high frequency in Hz.  Ranges from 20.0 To 20000.0. Default is 5000.0. 
      #FMOD_DSP_SFXREVERB_ROOMLF              ; Room LF        : Room effect low-frequency level in mB.  Ranges from -10000.0 To 0.0.  Default is 0.0. 
      #FMOD_DSP_SFXREVERB_LFREFERENCE          ; LF Reference   : Reference low-frequency in Hz.  Ranges from 20.0 To 1000.0. Default is 250.0. 
  EndEnumeration
  Enumeration ; FMOD_DSP_LOWPASS_SIMPLE
      #FMOD_DSP_LOWPASS_SIMPLE_CUTOFF     ; Lowpass cutoff frequency in hz.  10.0 To 22000.0.  Default = 5000.0 
  EndEnumeration
  Enumeration ; FMOD_DELAYTYPE
    #FMOD_DELAYTYPE_END_MS              ; Delay at the End of the sound in milliseconds.  Use delayhi only.   Channel::isPlaying will remain true Until this delay has passed even though the sound itself has stopped playing.
    #FMOD_DELAYTYPE_DSPCLOCK_START      ; Time the sound started If Channel::getDelay is used, Or If Channel::setDelay is used, the sound will delay playing Until this exact tick. 
    #FMOD_DELAYTYPE_DSPCLOCK_END        ; Time the sound should End. If this is non-zero, the channel will go silent at this exact tick. 

    #FMOD_DELAYTYPE_MAX                 ; Maximum number of tag datatypes supported. 
    #FMOD_DELAYTYPE_FORCEINT = 65536    ; Makes sure this enum is signed 32bit. 
  EndEnumeration

;}
;{ Constantes 
  #FMOD_VERSION                     = $00041204
  
  
  #FMOD_CAPS_NONE                   = $00000000  ; Device has no special capabilities. 
  #FMOD_CAPS_HARDWARE               = $00000001  ; Device supports hardware mixing. 
  #FMOD_CAPS_HARDWARE_EMULATED      = $00000002  ; User has device set To 'Hardware acceleration = off' in control panel, And now extra 200ms latency is incurred. 
  #FMOD_CAPS_OUTPUT_MULTICHANNEL    = $00000004  ; Device can do multichannel output, ie greater than 2 channels. 
  #FMOD_CAPS_OUTPUT_FORMAT_PCM8     = $00000008  ; Device can output To 8bit integer PCM. 
  #FMOD_CAPS_OUTPUT_FORMAT_PCM16    = $00000010  ; Device can output To 16bit integer PCM. 
  #FMOD_CAPS_OUTPUT_FORMAT_PCM24    = $00000020  ; Device can output To 24bit integer PCM. 
  #FMOD_CAPS_OUTPUT_FORMAT_PCM32    = $00000040  ; Device can output To 32bit integer PCM. 
  #FMOD_CAPS_OUTPUT_FORMAT_PCMFLOAT = $00000080  ; Device can output To 32bit floating point PCM. 
  #FMOD_CAPS_REVERB_EAX2            = $00000100  ; Device supports EAX2 reverb. 
  #FMOD_CAPS_REVERB_EAX3            = $00000200  ; Device supports EAX3 reverb. 
  #FMOD_CAPS_REVERB_EAX4            = $00000400  ; Device supports EAX4 reverb  
  #FMOD_CAPS_REVERB_EAX5			      = $00000800  ; Device supports EAX5 reverb  
  #FMOD_CAPS_REVERB_I3DL2           = $00001000  ; Device supports I3DL2 reverb. 
  #FMOD_CAPS_REVERB_LIMITED         = $00002000  ; Device supports some form of limited hardware reverb, maybe parameterless And only selectable by environment. 
  
  #FMOD_DEBUG_LEVEL_NONE           = $00000000
  #FMOD_DEBUG_LEVEL_LOG            = $00000001
  #FMOD_DEBUG_LEVEL_ERROR          = $00000002
  #FMOD_DEBUG_LEVEL_WARNING        = $00000004
  #FMOD_DEBUG_LEVEL_HINT           = $00000008
  #FMOD_DEBUG_LEVEL_ALL            = $000000FF    
  #FMOD_DEBUG_TYPE_MEMORY          = $00000100
  #FMOD_DEBUG_TYPE_THREAD          = $00000200
  #FMOD_DEBUG_TYPE_FILE            = $00000400
  #FMOD_DEBUG_TYPE_NET             = $00000800
  #FMOD_DEBUG_TYPE_EVENT           = $00001000
  #FMOD_DEBUG_TYPE_ALL             = $0000FFFF                      
  #FMOD_DEBUG_DISPLAY_TIMESTAMPS   = $01000000
  #FMOD_DEBUG_DISPLAY_LINENUMBERS  = $02000000
  #FMOD_DEBUG_DISPLAY_COMPRESS     = $04000000
  #FMOD_DEBUG_DISPLAY_ALL          = $0F000000   
  #FMOD_DEBUG_ALL                  = $FFFFFFFF
  
  #FMOD_MEMORY_NORMAL             = $00000000       ; Standard memory. 
  #FMOD_MEMORY_XBOX360_PHYSICAL   = $00100000       ; Requires XPhysicalAlloc / XPhysicalFree. 
  #FMOD_MEMORY_PERSISTENT         = $00200000       ; Persistent memory. Memory will be freed when System::release is called. 
  #FMOD_MEMORY_SECONDARY          = $00400000       ; Secondary memory. Allocation should be in secondary memory. For example RSX on the PS3.
  
  #FMOD_INIT_NORMAL                  = $00000000 ; All platforms - Initialize normally 
  #FMOD_INIT_STREAM_FROM_UPDATE      = $00000001 ; All platforms - No stream thread is created internally.  Streams are driven from System::update.  Mainly used With non-realtime outputs. 
  #FMOD_INIT_3D_RIGHTHANDED          = $00000002 ; All platforms - FMOD will treat +X As right, +Y As up And +Z As backwards (towards you). 
  #FMOD_INIT_SOFTWARE_DISABLE        = $00000004 ; All platforms - Disable software mixer To save memory.  Anything created With FMOD_SOFTWARE will fail And DSP will Not work. 
  #FMOD_INIT_SOFTWARE_OCCLUSION      = $00000008 ; All platforms - All FMOD_SOFTWARE With FMOD_3D based voices will add a software lowpass filter effect into the DSP chain which is automatically used when Channel::set3DOcclusion is used Or the geometry API. 
  #FMOD_INIT_SOFTWARE_HRTF           = $00000010 ; All platforms - All FMOD_SOFTWARE With FMOD_3D based voices will add a software lowpass filter effect into the DSP chain which causes sounds To sound duller when the sound goes behind the listener.  Use System::setAdvancedSettings To adjust cutoff frequency. 
  #FMOD_INIT_ENABLE_PROFILE          = $00000020 ; All platforms - Enable TCP/IP based host which allows "DSPNet Listener.exe" To connect To it, And view the DSP dataflow network graph in real-time. 
  #FMOD_INIT_SOFTWARE_REVERB_ON_FX   = $00000040 ; All platforms - Apply reverb connections to the channel DSP head (after the DSP effects) instead of directly to the sound source.
  #FMOD_INIT_VOL0_BECOMES_VIRTUAL    = $00000080 ; All platforms - Any sounds that are 0 volume will go virtual And Not be processed except For having their positions updated virtually.  Use System::setAdvancedSettings To adjust what volume besides zero To switch To virtual at. 
  #FMOD_INIT_WASAPI_EXCLUSIVE        = $00000100 ; Win32 Vista only - For WASAPI output - Enable exclusive access To hardware, lower latency at the expense of excluding other applications from accessing the audio hardware. 
  #FMOD_INIT_DSOUND_HRTFNONE         = $00000200 ; Win32 only - For DirectSound output - FMOD_HARDWARE | FMOD_3D buffers use simple stereo panning/doppler/attenuation when 3D hardware acceleration is Not present. 
  #FMOD_INIT_DSOUND_HRTFLIGHT        = $00000400 ; Win32 only - For DirectSound output - FMOD_HARDWARE | FMOD_3D buffers use a slightly higher quality algorithm when 3D hardware acceleration is Not present. 
  #FMOD_INIT_DSOUND_HRTFFULL         = $00000800 ; Win32 only - For DirectSound output - FMOD_HARDWARE | FMOD_3D buffers use full quality 3D playback when 3d hardware acceleration is Not present. 
  #FMOD_INIT_PS2_DISABLECORE0REVERB  = $00010000 ; PS2 only - Disable reverb on CORE 0 To regain 256k SRAM. 
  #FMOD_INIT_PS2_DISABLECORE1REVERB  = $00020000 ; PS2 only - Disable reverb on CORE 1 To regain 256k SRAM. 
  #FMOD_INIT_PS2_DONTUSESCRATCHPAD   = $00040000 ; PS2 only - Disable FMOD's usage of the scratchpad. */
  #FMOD_INIT_PS2_SWAPDMACHANNELS     = $00080000 ; PS2 only - Changes FMOD from using SPU DMA channel 0 For software mixing, And 1 For sound Data upload/file streaming, To 1 And 0 respectively. 
  #FMOD_INIT_XBOX_REMOVEHEADROOM     = $00100000 ; Xbox only - By Default DirectSound attenuates all sound by 6db To avoid clipping/distortion.  CAUTION.  If you use this flag you are responsible For the final mix To make sure clipping / distortion doesn't happen. */
  #FMOD_INIT_360_MUSICMUTENOTPAUSE   = $00200000 ; Xbox 360 only - The "music" channelgroup which by Default pauses when custom 360 dashboard music is played, can be changed To mute (therefore continues playing) instead of pausing, by using this flag. 
  #FMOD_INIT_SYNCMIXERWITHUPDATE     = $00400000 ; Win32/Wii/PS3/Xbox/Xbox 360 - FMOD Mixer thread is woken up To do a mix when System::update is called rather than waking periodically on its own timer. 
  
  #FMOD_DEFAULT                   = $00000000  ; FMOD_DEFAULT is a Default sound type.  Equivalent To all the defaults listed below.  FMOD_LOOP_OFF, FMOD_2D, FMOD_HARDWARE. 
  #FMOD_LOOP_OFF                  = $00000001  ; For non looping sounds. (Default).  Overrides FMOD_LOOP_NORMAL / FMOD_LOOP_BIDI. 
  #FMOD_LOOP_NORMAL               = $00000002  ; For forward looping sounds. 
  #FMOD_LOOP_BIDI                 = $00000004  ; For bidirectional looping sounds. (only works on software mixed Static sounds). 
  #FMOD_2D                        = $00000008  ; Ignores any 3d processing. (Default). 
  #FMOD_3D                        = $00000010  ; Makes the sound positionable in 3D.  Overrides FMOD_2D. 
  #FMOD_HARDWARE                  = $00000020  ; Attempts To make sounds use hardware acceleration. (Default). 
  #FMOD_SOFTWARE                  = $00000040  ; Makes the sound be mixed by the FMOD CPU based software mixer.  Overrides FMOD_HARDWARE.  Use this For FFT, DSP, compressed sample support, 2D multi-speaker support And other software related features. 
  #FMOD_CREATESTREAM              = $00000080  ; Decompress at runtime, streaming from the source provided (ie from disk).  Overrides FMOD_CREATESAMPLE And FMOD_CREATECOMPRESSEDSAMPLE.  Note a stream can only be played once at a time due To a stream only having 1 stream buffer And file handle.  Open multiple streams To have them play concurrently. 
  #FMOD_CREATESAMPLE              = $00000100  ; Decompress at loadtime, decompressing Or decoding whole file into memory As the target sample format (ie PCM).  Fastest For FMOD_SOFTWARE based playback And most flexible.  
  #FMOD_CREATECOMPRESSEDSAMPLE    = $00000200  ; Load MP2, MP3, IMAADPCM Or XMA into memory And leave it compressed.  During playback the FMOD software mixer will decode it in realtime As a 'compressed sample'.  Can only be used in combination With FMOD_SOFTWARE.  Overrides FMOD_CREATESAMPLE.  If the sound Data is Not ADPCM, MPEG Or XMA it will behave As If it was created With FMOD_CREATESAMPLE And decode the sound into PCM. 
  #FMOD_OPENUSER                  = $00000400  ; Opens a user created Static sample Or stream. Use FMOD_CREATESOUNDEXINFO To specify format And/Or Read callbacks.  If a user created 'sample' is created With no Read callback, the sample will be empty.  Use Sound::lock And Sound::unlock To place sound Data into the sound If this is the Case. 
  #FMOD_OPENMEMORY                = $00000800  ; "name_or_data" will be interpreted As a pointer To memory instead of filename For creating sounds.  Use FMOD_CREATESOUNDEXINFO To specify length.  FMOD duplicates the memory into its own buffers.  Can be freed after open. 
  #FMOD_OPENMEMORY_POINT          = $10000000  ; "name_or_data" will be interpreted As a pointer To memory instead of filename For creating sounds.  Use FMOD_CREATESOUNDEXINFO To specify length.  This differs To FMOD_OPENMEMORY in that it uses the memory As is, without duplicating the memory into its own buffers.  FMOD_SOFTWARE only.  Doesn't work with FMOD_HARDWARE, as sound hardware cannot access main ram on a lot of platforms.  Cannot be freed after open, only after Sound::release.   Will not work if the data is compressed and FMOD_CREATECOMPRESSEDSAMPLE is not used. */
  #FMOD_OPENRAW                   = $00001000  ; Will ignore file format And treat As raw pcm.  Use FMOD_CREATESOUNDEXINFO To specify format.  Requires at least defaultfrequency, numchannels And format To be specified before it will open.  Must be little endian Data. 
  #FMOD_OPENONLY                  = $00002000  ; Just open the file, dont prebuffer Or Read.  Good For fast opens For info, Or when sound::readData is To be used. 
  #FMOD_ACCURATETIME              = $00004000  ; For System::createSound - For accurate Sound::getLength/Channel::setPosition on VBR MP3, And MOD/S3M/XM/IT/MIDI files.  Scans file first, so takes longer To open. FMOD_OPENONLY does Not affect this. 
  #FMOD_MPEGSEARCH                = $00008000  ; For corrupted / bad MP3 files.  This will search all the way through the file Until it hits a valid MPEG header.  Normally only searches For 4k. 
  #FMOD_NONBLOCKING               = $00010000  ; For opening sounds And getting streamed subsounds (seeking) asyncronously.  Use Sound::getOpenState To poll the state of the sound As it opens Or retrieves the subsound in the background. 
  #FMOD_UNIQUE                    = $00020000  ; Unique sound, can only be played one at a time 
  #FMOD_3D_HEADRELATIVE           = $00040000  ; Make the sound's position, velocity and orientation relative to the listener. */
  #FMOD_3D_WORLDRELATIVE          = $00080000  ; Make the sound's position, velocity and orientation absolute (relative to the world). (DEFAULT) */
  #FMOD_3D_LOGROLLOFF             = $00100000  ; This sound will follow the standard logarithmic rolloff model where mindistance = full volume, maxdistance = where sound stops attenuating, And rolloff is fixed according To the Global rolloff factor.  (Default) 
  #FMOD_3D_LINEARROLLOFF          = $00200000  ; This sound will follow a linear rolloff model where mindistance = full volume, maxdistance = silence.  Rolloffscale is ignored. 
  #FMOD_3D_CUSTOMROLLOFF          = $04000000  ; This sound will follow a rolloff model defined by Sound::set3DCustomRolloff / Channel::set3DCustomRolloff.  
  #FMOD_3D_IGNOREGEOMETRY         = $40000000  ; Is Not affect by geometry occlusion.  If Not specified in Sound::setMode, Or Channel::setMode, the flag is cleared And it is affected by geometry again. 
  #FMOD_CDDA_FORCEASPI            = $00400000  ; For CDDA sounds only - use ASPI instead of NTSCSI To access the specified CD/DVD device. 
  #FMOD_CDDA_JITTERCORRECT        = $00800000  ; For CDDA sounds only - perform jitter correction. Jitter correction helps produce a more accurate CDDA stream at the cost of more CPU time. 
  #FMOD_UNICODE                   = $01000000  ; Filename is double-byte unicode. 
  #FMOD_IGNORETAGS                = $02000000  ; Skips id3v2/asf/etc tag checks when opening a sound, To reduce seek/Read overhead when opening files (helps With CD performance). 
  #FMOD_LOWMEM                    = $08000000  ; Removes some features from samples To give a lower memory overhead, like Sound::getName.  See remarks. 
  #FMOD_LOADSECONDARYRAM          = $20000000  ; Load sound into the secondary RAM of supported platform. On PS3, sounds will be loaded into RSX/VRAM. 
  #FMOD_VIRTUAL_PLAYFROMSTART     = $80000000  ; For sounds that start virtual (due To being quiet Or low importance), instead of swapping back To audible, And playing at the correct offset according To time, this flag makes the sound play from the start. 
  
  
  #FMOD_TIMEUNIT_MS                = $00000001  ; Milliseconds. 
  #FMOD_TIMEUNIT_PCM               = $00000002  ; PCM Samples, related To milliseconds * samplerate / 1000. 
  #FMOD_TIMEUNIT_PCMBYTES          = $00000004  ; Bytes, related To PCM samples * channels * datawidth (ie 16bit = 2 bytes). 
  #FMOD_TIMEUNIT_RAWBYTES          = $00000008  ; Raw file bytes of (compressed) sound Data (does Not include headers).  Only used by Sound::getLength And Channel::getPosition. 
  #FMOD_TIMEUNIT_MODORDER          = $00000100  ; MOD/S3M/XM/IT.  Order in a sequenced module format.  Use Sound::getFormat To determine the PCM format being decoded To. 
  #FMOD_TIMEUNIT_MODROW            = $00000200  ; MOD/S3M/XM/IT.  Current row in a sequenced module format.  Sound::getLength will Return the number of rows in the currently playing Or seeked To pattern. 
  #FMOD_TIMEUNIT_MODPATTERN        = $00000400  ; MOD/S3M/XM/IT.  Current pattern in a sequenced module format.  Sound::getLength will Return the number of patterns in the song And Channel::getPosition will Return the currently playing pattern. 
  #FMOD_TIMEUNIT_SENTENCE_MS       = $00010000  ; Currently playing subsound in a sentence time in milliseconds. 
  #FMOD_TIMEUNIT_SENTENCE_PCM      = $00020000  ; Currently playing subsound in a sentence time in PCM Samples, related To milliseconds * samplerate / 1000. 
  #FMOD_TIMEUNIT_SENTENCE_PCMBYTES = $00040000  ; Currently playing subsound in a sentence time in bytes, related To PCM samples * channels * datawidth (ie 16bit = 2 bytes). 
  #FMOD_TIMEUNIT_SENTENCE          = $00080000  ; Currently playing sentence index according To the channel. 
  #FMOD_TIMEUNIT_SENTENCE_SUBSOUND = $00100000  ; Currently playing subsound index in a sentence. 
  #FMOD_TIMEUNIT_BUFFERED          = $10000000  ; Time value As seen by buffered stream.  This is always ahead of audible time, And is only used For processing. 
  
  #FMOD_REVERB_FLAGS_DECAYTIMESCALE        = $00000001 ; 'EnvSize' affects reverberation decay time 
  #FMOD_REVERB_FLAGS_REFLECTIONSSCALE      = $00000002 ; 'EnvSize' affects reflection level 
  #FMOD_REVERB_FLAGS_REFLECTIONSDELAYSCALE = $00000004 ; 'EnvSize' affects initial reflection delay time 
  #FMOD_REVERB_FLAGS_REVERBSCALE           = $00000008 ; 'EnvSize' affects reflections level 
  #FMOD_REVERB_FLAGS_REVERBDELAYSCALE      = $00000010 ; 'EnvSize' affects late reverberation delay time 
  #FMOD_REVERB_FLAGS_DECAYHFLIMIT          = $00000020 ; AirAbsorptionHF affects DecayHFRatio 
  #FMOD_REVERB_FLAGS_ECHOTIMESCALE         = $00000040 ; 'EnvSize' affects echo time 
  #FMOD_REVERB_FLAGS_MODULATIONTIMESCALE   = $00000080 ; 'EnvSize' affects modulation time 
  #FMOD_REVERB_FLAGS_CORE0                 = $00000100 ; PS2 Only - Reverb is applied To CORE0 (hw voices 0-23) 
  #FMOD_REVERB_FLAGS_CORE1                 = $00000200 ; PS2 Only - Reverb is applied To CORE1 (hw voices 24-47) 
  #FMOD_REVERB_FLAGS_HIGHQUALITYREVERB     = $00000400 ; GameCube/Wii. Use high quality reverb 
  #FMOD_REVERB_FLAGS_HIGHQUALITYDPL2REVERB = $00000800 ; GameCube/Wii. Use high quality DPL2 reverb 
  
  #FMOD_REVERB_FLAGS_DEFAULT               = #FMOD_REVERB_FLAGS_DECAYTIMESCALE | #FMOD_REVERB_FLAGS_REFLECTIONSSCALE | #FMOD_REVERB_FLAGS_REFLECTIONSDELAYSCALE | #FMOD_REVERB_FLAGS_REVERBSCALE | #FMOD_REVERB_FLAGS_REVERBDELAYSCALE | #FMOD_REVERB_FLAGS_DECAYHFLIMIT |  #FMOD_REVERB_FLAGS_CORE0 | #FMOD_REVERB_FLAGS_CORE1
  
  #FMOD_REVERB_CHANNELFLAGS_DIRECTHFAUTO  = $00000001 ; Automatic setting of 'Direct'  due To distance from listener 
  #FMOD_REVERB_CHANNELFLAGS_ROOMAUTO      = $00000002 ; Automatic setting of 'Room'  due To distance from listener 
  #FMOD_REVERB_CHANNELFLAGS_ROOMHFAUTO    = $00000004 ; Automatic setting of 'RoomHF' due To distance from listener 
  #FMOD_REVERB_CHANNELFLAGS_INSTANCE0  = $00000008 ; EAX4/GameCube/Wii. Specify channel To target reverb instance 0. 
  #FMOD_REVERB_CHANNELFLAGS_INSTANCE1  = $00000010 ; EAX4/GameCube/Wii. Specify channel To target reverb instance 1. 
  #FMOD_REVERB_CHANNELFLAGS_INSTANCE2  = $00000020 ; EAX4/GameCube/Wii. Specify channel To target reverb instance 2. 
  #FMOD_REVERB_CHANNELFLAGS_INSTANCE3  = $00000040 ; EAX5. Specify channel To target reverb instance 3. 
  
  #FMOD_REVERB_CHANNELFLAGS_DEFAULT       = #FMOD_REVERB_CHANNELFLAGS_DIRECTHFAUTO | #FMOD_REVERB_CHANNELFLAGS_ROOMAUTO| #FMOD_REVERB_CHANNELFLAGS_ROOMHFAUTO| #FMOD_REVERB_CHANNELFLAGS_INSTANCE0
;}
;{ DataSection
  DataSection
    ;        Inst Env  Size    Diffus  Room   RoomHF  RmLF DecTm   DecHF  DecLF   Refl  RefDel  RefPan               Revb  RevDel  ReverbPan           EchoTm  EchDp  ModTm  ModDp  AirAbs  HFRef    LFRef  RRlOff Diffus  Densty  FLAGS 
    Data_FMOD_PRESET_OFF:
      Data.f  0, -1,  7.5,   1.00, -10000, -10000, 0,   1.00,  1.00, 1.0,  -2602, 0.007, 0.0,0.0,0.0,   200, 0.011, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0,   0.0,   0.0, $33
    Data_FMOD_PRESET_GENERIC:
      Data.f  0,  0,  7.5,   1.00, -1000,  -100,   0,   1.49,  0.83, 1.0,  -2602, 0.007, 0.0,0.0,0.0,   200, 0.011, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_PADDEDCELL:
      Data.f  0,  1,  1.4,   1.00, -1000,  -6000,  0,   0.17,  0.10, 1.0,  -1204, 0.001, 0.0,0.0,0.0,   207, 0.002, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_ROOM:
      Data.f  0,  2,  1.9,   1.00, -1000,  -454,   0,   0.40,  0.83, 1.0,  -1646, 0.002, 0.0,0.0,0.0,    53, 0.003, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_BATHROOM:
      Data.f  0,  3,  1.4,   1.00, -1000,  -1200,  0,   1.49,  0.54, 1.0,   -370, 0.007, 0.0,0.0,0.0,  1030, 0.011, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0,  60.0, $3
    Data_FMOD_PRESET_LIVINGROOM:
      Data.f  0,  4,  2.5,   1.00, -1000,  -6000,  0,   0.50,  0.10, 1.0,  -1376, 0.003, 0.0,0.0,0.0, -1104, 0.004, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_STONEROOM:
      Data.f  0,  5,  11.6,  1.00, -1000,  -300,   0,   2.31,  0.64, 1.0,   -711, 0.012, 0.0,0.0,0.0,    83, 0.017, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_AUDITORIUM:
      Data.f  0,  6,  21.6,  1.00, -1000,  -476,   0,   4.32,  0.59, 1.0,   -789, 0.020, 0.0,0.0,0.0,  -289, 0.030, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_CONCERTHALL:
      Data.f  0,  7,  19.6,  1.00, -1000,  -500,   0,   3.92,  0.70, 1.0,  -1230, 0.020, 0.0,0.0,0.0,    -2, 0.029, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_CAVE:
      Data.f  0,  8,  14.6,  1.00, -1000,  0,      0,   2.91,  1.30, 1.0,   -602, 0.015, 0.0,0.0,0.0,  -302, 0.022, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $1
    Data_FMOD_PRESET_ARENA:
      Data.f  0,  9,  36.2,  1.00, -1000,  -698,   0,   7.24,  0.33, 1.0,  -1166, 0.020, 0.0,0.0,0.0,    16, 0.030, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_HANGAR:
      Data.f  0,  10, 50.3,  1.00, -1000,  -1000,  0,   10.05, 0.23, 1.0,   -602, 0.020, 0.0,0.0,0.0,   198, 0.030, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_CARPETTEDHALLWAY:
      Data.f  0,  11, 1.9,   1.00, -1000,  -4000,  0,   0.30,  0.10, 1.0,  -1831, 0.002, 0.0,0.0,0.0, -1630, 0.030, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_HALLWAY:
      Data.f  0,  12, 1.8,   1.00, -1000,  -300,   0,   1.49,  0.59, 1.0,  -1219, 0.007, 0.0,0.0,0.0,   441, 0.011, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_STONECORRIDOR:
      Data.f  0,  13, 13.5,  1.00, -1000,  -237,   0,   2.70,  0.79, 1.0,  -1214, 0.013, 0.0,0.0,0.0,   395, 0.020, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_ALLEY:
      Data.f  0,  14, 7.5,   0.30, -1000,  -270,   0,   1.49,  0.86, 1.0,  -1204, 0.007, 0.0,0.0,0.0,    -4, 0.011, 0.0,0.0,0.0, 0.125, 0.95, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_FOREST:
      Data.f  0,  15, 38.0,  0.30, -1000,  -3300,  0,   1.49,  0.54, 1.0,  -2560, 0.162, 0.0,0.0,0.0,  -229, 0.088, 0.0,0.0,0.0, 0.125, 1.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0,  79.0, 100.0, $3
    Data_FMOD_PRESET_CITY:
      Data.f  0,  16, 7.5,   0.50, -1000,  -800,   0,   1.49,  0.67, 1.0,  -2273, 0.007, 0.0,0.0,0.0, -1691, 0.011, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0,  50.0, 100.0, $3
    Data_FMOD_PRESET_MOUNTAINS:
      Data.f  0,  17, 100.0, 0.27, -1000,  -2500,  0,   1.49,  0.21, 1.0,  -2780, 0.300, 0.0,0.0,0.0, -1434, 0.100, 0.0,0.0,0.0, 0.250, 1.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0,  27.0, 100.0, $1
    Data_FMOD_PRESET_QUARRY:
      Data.f  0,  18, 17.5,  1.00, -1000,  -1000,  0,   1.49,  0.83, 1.0, -10000, 0.061, 0.0,0.0,0.0,   500, 0.025, 0.0,0.0,0.0, 0.125, 0.70, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    Data_FMOD_PRESET_PLAIN:
      Data.f  0,  19, 42.5,  0.21, -1000,  -2000,  0,   1.49,  0.50, 1.0,  -2466, 0.179, 0.0,0.0,0.0, -1926, 0.100, 0.0,0.0,0.0, 0.250, 1.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0,  21.0, 100.0, $3
    Data_FMOD_PRESET_PARKINGLOT:
      Data.f  0,  20, 8.3,   1.00, -1000,  0,      0,   1.65,  1.50, 1.0,  -1363, 0.008, 0.0,0.0,0.0, -1153, 0.012, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $1
    Data_FMOD_PRESET_SEWERPIPE:
      Data.f  0,  21, 1.7,   0.80, -1000,  -1000,  0,   2.81,  0.14, 1.0,    429, 0.014, 0.0,0.0,0.0,  1023, 0.021, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 0.000, -5.0, 5000.0, 250.0, 0.0,  80.0,  60.0, $3
    Data_FMOD_PRESET_UNDERWATER:
      Data.f  0,  22, 1.8,   1.00, -1000,  -4000,  0,   1.49,  0.10, 1.0,   -449, 0.007, 0.0,0.0,0.0,  1700, 0.011, 0.0,0.0,0.0, 0.250, 0.00, 1.18, 0.348, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $3
    
    ; Non I3DL2 presets 
    Data_FMOD_PRESET_DRUGGED:
      Data.f  0,  23, 1.9,   0.50, -1000,  0,      0,   8.39,  1.39, 1.0,  -115,  0.002, 0.0,0.0,0.0,   985, 0.030, 0.0,0.0,0.0, 0.250, 0.00, 0.25, 1.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $1
    Data_FMOD_PRESET_DIZZY:
      Data.f  0,  24, 1.8,   0.60, -1000,  -400,   0,   17.23, 0.56, 1.0,  -1713, 0.020, 0.0,0.0,0.0,  -613, 0.030, 0.0,0.0,0.0, 0.250, 1.00, 0.81, 0.310, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $1
    Data_FMOD_PRESET_PSYCHOTIC:
      Data.f  0,  25, 1.0,   0.50, -1000,  -151,   0,   7.56,  0.91, 1.0,  -626,  0.020, 0.0,0.0,0.0,   774, 0.030, 0.0,0.0,0.0, 0.250, 0.00, 4.00, 1.000, -5.0, 5000.0, 250.0, 0.0, 100.0, 100.0, $1
    
    ; PlayStation 2 / PlayStation Portable Only presets 
    Data_FMOD_PRESET_PS2_ROOM:
      Data.f  0,  1,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_STUDIO_A:
      Data.f  0,  2,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_STUDIO_B:
      Data.f  0,  3,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_STUDIO_C:
      Data.f  0,  4,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_HALL:
      Data.f  0,  5,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_SPACE:
      Data.f  0,  6,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_ECHO:
      Data.f  0,  7,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.75, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_DELAY:
      Data.f  0,  8,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
    Data_FMOD_PRESET_PS2_PIPE:
      Data.f  0,  9,  0,      0,     0,      0,      0,   0.0,   0.0,  0.0,     0,  0.000, 0.0,0.0,0.0,     0, 0.000, 0.0,0.0,0.0, 0.250, 0.00, 0.00, 0.000,  0.0, 0000.0,   0.0, 0.0,   0.0,   0.0, $31
  EndDataSection  
;}
;{ Callbacks
  ; CB_FMOD_OUTPUT_GETNUMDRIVERSCALLBACK(*output_state, numdrivers.l)
  ; CB_FMOD_OUTPUT_GETDRIVERNAMECALLBACK(*output_state, id.l, name.s, namelen.l)
  ; CB_FMOD_OUTPUT_GETDRIVERCAPSCALLBACK(*output_state, id.l, caps.FMOD_CAPS)
  ; CB_FMOD_OUTPUT_INITCALLBACK         (*output_state, selecteddriver.l, flags.FMOD_INITFLAGS, outputrate.l, outputchannels.l, outputformat.l, dspbufferlength.l, dspnumbuffers.l, *extradriverdata)
  ; CB_FMOD_OUTPUT_CLOSECALLBACK        (*output_state)
  ; CB_FMOD_OUTPUT_UPDATECALLBACK       (*output_state)
  ; CB_FMOD_OUTPUT_GETHANDLECALLBACK    (*output_state, *handle)
  ; CB_FMOD_OUTPUT_GETPOSITIONCALLBACK  (*output_state, pcm.l)
  ; CB_FMOD_OUTPUT_LOCKCALLBACK         (*output_state, offset.l, length.l, *ptr1, *ptr2, len1.l, len2.l)
  ; CB_FMOD_OUTPUT_UNLOCKCALLBACK       (*output_state, *ptr1, *ptr2, len1.l, len2.l)
  ; CB_FMOD_OUTPUT_READFROMMIXER        (*output_state, *buffer, length.l)
  
  ; CB_FMOD_DSP_CREATECALLBACK          (*dsp_state)
  ; CB_FMOD_DSP_RELEASECALLBACK         (*dsp_state)
  ; CB_FMOD_DSP_RESETCALLBACK           (*dsp_state)
  ; CB_FMOD_DSP_READCALLBACK            (*dsp_state, inbuffer.f, outbuffer.f, length.l, inchannels.l, outchannels.l)
  ; CB_FMOD_DSP_SETPOSITIONCALLBACK     (*dsp_state, pos.l)
  ; CB_FMOD_DSP_SETPARAMCALLBACK        (*dsp_state, index.l, value.f);
  ; CB_FMOD_DSP_GETPARAMCALLBACK        (*dsp_state, index.l, *value.f, *valuestr.s)
  ; CB_FMOD_DSP_DIALOGCALLBACK          (*dsp_state, *hwnd, show.l);
  
  ; CB_FMOD_CODEC_OPENCALLBACK          (*codec_state, usermode.FMOD_MODE, *userexinfo.FMOD_CREATESOUNDEXINFO)
  ; CB_FMOD_CODEC_CLOSECALLBACK         (*codec_state)
  ; CB_FMOD_CODEC_READCALLBACK          (*codec_state, *buffer, sizebytes.l, *bytesread.l)
  ; CB_FMOD_CODEC_GETLENGTHCALLBACK     (*codec_state, *length.l, lengthtype.FMOD_TIMEUNIT)
  ; CB_FMOD_CODEC_SETPOSITIONCALLBACK   (*codec_state, subsound.l, position.l, postype.FMOD_TIMEUNIT)
  ; CB_FMOD_CODEC_GETPOSITIONCALLBACK   (*codec_state, *position.l, postype.FMOD_TIMEUNIT)
  ; CB_FMOD_CODEC_SOUNDCREATECALLBACK   (*codec_state, subsound.l, *sound.FMOD_SOUND)
  ; CB_FMOD_CODEC_METADATACALLBACK      (*codec_state, tagtype.l, *name.s, *Data_, datalen.l, datatype.l, uniquev)
  ; CB_FMOD_CODEC_GETWAVEFORMAT         (*codec_state, index.l, *waveformat.FMOD_CODEC_WAVEFORMAT)
  
  ; CB_FMOD_SYSTEM_CALLBACK             (*system.FMOD_SYSTEM, type.l, commanddata1.l, commanddata2v)
  
  ; CB_FMOD_CHANNEL_CALLBACK            (*channel.FMOD_CHANNEL, type.l, command.l, commanddata1.l, commanddata2.l)
  
  ; CB_FMOD_SOUND_NONBLOCKCALLBACK      (*sound.FMOD_SOUND, result.l)
  ; CB_FMOD_SOUND_PCMREADCALLBACK       (*sound.FMOD_SOUND, *Data_, datalen.l)
  ; CB_FMOD_SOUND_PCMSETPOSCALLBACK     (*sound.FMOD_SOUND, subsound.l, position.l, postype.l)
                                        
  ; CB_FMOD_FILE_OPENCALLBACK           (name.s, unicode.l, filesize.l, *handle, *userdata)
  ; CB_FMOD_FILE_CLOSECALLBACK          (*handle, *userdata)
  ; CB_FMOD_FILE_READCALLBACK           (*handle, *buffer, sizebytes.l, *bytesread.l, *userdata)
  ; CB_FMOD_FILE_SEEKCALLBACK           (*handle, pos.l, *userdata)
  
  ; CB_FMOD_MEMORY_ALLOCCALLBACK        (size.l, type.l)
  ; CB_FMOD_MEMORY_REALLOCCALLBACK      (*ptr, size.l, type.l)
  ; CB_FMOD_MEMORY_FREECALLBACK         (*ptr, type.l)
  
  ; CB_FMOD_3D_ROLLOFFCALLBACK          (*channel.FMOD_CHANNEL, distance.f)
;}
;{ Structures
  Structure FMOD_VECTOR
  	x.f        ; X co-ordinate in 3D space. 
    y.f        ; Y co-ordinate in 3D space. 
    z.f        ; Z co-ordinate in 3D space. 
    Data1.w
  EndStructure
  Structure FMOD_GUID
      Data1.l       ; Specifies the first 8 hexadecimal digits of the GUI
      Data2.l       ; Specifies the first group of 4 hexadecimal digits.   
      Data3.l       ; Specifies the second group of 4 hexadecimal digits.  
      Data4.w[8]    ; Array of 8 bytes. The first 2 bytes contain the third group of 4 hexadecimal digits. The remaining 6 bytes contain the final 12 hexadecimal digits. 
  EndStructure
  Structure FMOD_TAG
    type.FMOD_TAGTYPE         ; [out] The type of this tag. 
    datatype.FMOD_TAGDATATYPE ; [out] The type of Data that this tag contains 
    name.s                    ; [out] The name of this tag i.e. "TITLE", "ARTIST" etc. 
    *data_                    ; [out] Pointer To the tag Data - its format is determined by the datatype member 
    datalen.l                 ; [out] Length of the Data contained in this tag 
    updated.FMOD_BOOL         ; [out] True If this tag has been updated since last being accessed With Sound::getTag 
  EndStructure
  Structure FMOD_CDTOC
    numtracks.l  ; [out] The number of tracks on the CD 
    min.l[100]   ; [out] The start offset of each track in minutes 
    sec.l[100]   ; [out] The start offset of each track in seconds 
    frame.l[100] ; [out] The start offset of each track in frames 
  EndStructure
  Structure FMOD_CREATESOUNDEXINFO
    cbsize.l                            ; [in] Size of this Structure.  This is used so the Structure can be expanded in the future And still work on older versions of FMOD Ex. 
    length.l                            ; [in] Optional. Specify 0 To ignore. Size in bytes of file To load, Or sound To create (in this Case only If FMOD_OPENUSER is used).  Required If loading from memory.  If 0 is specified, then it will use the size of the file (unless loading from memory then an error will be returned). 
    fileoffset.l                        ; [in] Optional. Specify 0 To ignore. Offset from start of the file To start loading from.  This is useful For loading files from inside big Data files. 
    numchannels.l                       ; [in] Optional. Specify 0 To ignore. Number of channels in a sound mandatory If FMOD_OPENUSER Or FMOD_OPENRAW is used. 
    defaultfrequency.l                  ; [in] Optional. Specify 0 To ignore. Default frequency of sound in a sound mandatory If FMOD_OPENUSER Or FMOD_OPENRAW is used.  Other formats use the frequency determined by the file format. 
    format.FMOD_SOUND_FORMAT            ; [in] Optional. Specify 0 Or FMOD_SOUND_FORMAT_NONE To ignore. Format of the sound mandatory If FMOD_OPENUSER Or FMOD_OPENRAW is used.  Other formats use the format determined by the file format.   
    decodebuffersize.l                  ; [in] Optional. Specify 0 To ignore. For streams.  This determines the size of the double buffer (in PCM samples) that a stream uses.  Use this For user created streams If you want To determine the size of the callback buffer passed To you.  Specify 0 To use FMOD's default size which is currently equivalent to 400ms of the sound format created/loaded. */
    initialsubsound.l                   ; [in] Optional. Specify 0 To ignore. In a multi-sample file format such As .FSB/.DLS/.SF2, specify the initial subsound To seek To, only If FMOD_CREATESTREAM is used. 
    numsubsounds.l                      ; [in] Optional. Specify 0 To ignore Or have no subsounds.  In a user created multi-sample sound, specify the number of subsounds within the sound that are accessable With Sound::getSubSound. 
    *inclusionlist.l                    ; [in] Optional. Specify 0 To ignore. In a multi-sample format such As .FSB/.DLS/.SF2 it may be desirable To specify only a subset of sounds To be loaded out of the whole file.  This is an array of subsound indices To load into memory when created. 
    inclusionlistnum.l                  ; [in] Optional. Specify 0 To ignore. This is the number of integers contained within the inclusionlist array. 
    *pcmreadcallback                    ; FMOD_SOUND_PCMREADCALLBACK   [in] Optional. Specify 0 To ignore. Callback To 'piggyback' on FMOD's read functions and accept or even write PCM data while FMOD is opening the sound.  Used for user sounds created with FMOD_OPENUSER or for capturing decoded data as FMOD reads it. */
    *pcmsetposcallback                  ; FMOD_SOUND_PCMSETPOSCALLBACK [in] Optional. Specify 0 To ignore. Callback For when the user calls a seeking function such As Channel::setTime Or Channel::setPosition within a multi-sample sound, And For when it is opened.
    *nonblockcallback                   ; FMOD_SOUND_NONBLOCKCALLBACK  [in] Optional. Specify 0 To ignore. Callback For successful completion, Or error While loading a sound that used the FMOD_NONBLOCKING flag.
    dlsname.s                           ; [in] Optional. Specify 0 To ignore. Filename For a DLS Or SF2 sample set when loading a MIDI file. If Not specified, on Windows it will attempt To open /windows/system32/drivers/gm.dls Or /windows/system32/drivers/etc/gm.dls, on Mac it will attempt To load /System/Library/Components/CoreAudio.component/Contents/Resources/gs_instruments.dls, otherwise the MIDI will fail To open. Current DLS support is For level 1 of the specification. 
    encryptionkey.s                     ; [in] Optional. Specify 0 To ignore. Key For encrypted FSB file.  Without this key an encrypted FSB file will Not load. 
    maxpolyphony.l                     ; [in] Optional. Specify 0 To ignore. For sequenced formats With dynamic channel allocation such As .MID And .IT, this specifies the maximum voice count allowed While playing.  .IT defaults To 64.  .MID defaults To 32. 
    *userdata                           ; [in] Optional. Specify 0 To ignore. This is user Data To be attached To the sound during creation.  Access via Sound::getUserData. 
    suggestedsoundtype.FMOD_SOUND_TYPE  ; [in] Optional. Specify 0 Or FMOD_SOUND_TYPE_UNKNOWN To ignore.  Instead of scanning all codec types, use this To speed up loading by making it jump straight To this codec. 
    *useropen                           ; FMOD_FILE_OPENCALLBACK    [in] Optional. Specify 0 To ignore. Callback For opening this file. 
    *userclose                          ; FMOD_FILE_CLOSECALLBACK   [in] Optional. Specify 0 To ignore. Callback For closing this file. 
    *userread                           ; FMOD_FILE_READCALLBACK    [in] Optional. Specify 0 To ignore. Callback For reading from this file. 
    *userseek                           ; FMOD_FILE_SEEKCALLBACK    [in] Optional. Specify 0 To ignore. Callback For seeking within this file. 
    speakermap.FMOD_SPEAKERMAPTYPE      ; [in] Optional. Specify 0 To ignore. Use this To differ the way fmod maps multichannel sounds To speakers.  See FMOD_SPEAKERMAPTYPE For more. 
    *initialsoundgroup.FMOD_SOUNDGROUP  ; [in] Optional. Specify 0 To ignore. Specify a sound group If required, To put sound in As it is created. 
    initialseekposition.l               ; [in] Optional. Specify 0 To ignore. For streams. Specify an initial position To seek the stream To. 
    initialseekpostype.FMOD_TIMEUNIT    ; [in] Optional. Specify 0 To ignore. For streams. Specify the time unit For the position set in initialseekposition. 
  EndStructure
  Structure FMOD_REVERB_PROPERTIES
                              ;      MIN   MAX   Default  DESCRIPTION 
    Instance.l          ; [in]      0   , 3   , 0    , Environment Instance. Simultaneous HW reverbs are possible on some platforms. (SUPPORTED:EAX4(3 instances)/GC And Wii (2 instances)) 
    Environment.l       ; [in/out]  -1  , 25  , -1   , sets all listener properties.  -1 = OFF.                    (SUPPORTED:EAX/PS2) 
    EnvSize.f           ; [in/out] 1.0   , 100.0 , 7.5  , environment size in meters                          (SUPPORTED:EAX) 
    EnvDiffusion.f      ; [in/out] 0.0   , 1.0   , 1.0  , environment diffusion                             (SUPPORTED:EAX/Xbox1/GC) 
    Room.l              ; [in/out] -10000, 0   , -1000  , room effect level (at mid frequencies)                    (SUPPORTED:EAX/Xbox1/GC/I3DL2/SFX) 
    RoomHF.l            ; [in/out] -10000, 0   , -100   , relative room effect level at high frequencies                (SUPPORTED:EAX/Xbox1/I3DL2/SFX) 
    RoomLF.l            ; [in/out] -10000, 0   , 0    , relative room effect level at low frequencies                 (SUPPORTED:EAX/SFX) 
    DecayTime.f         ; [in/out] 0.1   , 20.0  , 1.49   , reverberation decay time at mid frequencies                   (SUPPORTED:EAX/Xbox1/GC/I3DL2/SFX) 
    DecayHFRatio.f      ; [in/out] 0.1   , 2.0   , 0.83   , high-frequency To mid-frequency decay time ratio                (SUPPORTED:EAX/Xbox1/I3DL2/SFX) 
    DecayLFRatio.f      ; [in/out] 0.1   , 2.0   , 1.0  , low-frequency To mid-frequency decay time ratio                 (SUPPORTED:EAX) 
    Reflections.l       ; [in/out] -10000, 1000  , -2602  , early reflections level relative To room effect                 (SUPPORTED:EAX/Xbox1/GC/I3DL2/SFX) 
    ReflectionsDelay.f  ; [in/out] 0.0   , 0.3   , 0.007  , initial reflection delay time                         (SUPPORTED:EAX/Xbox1/I3DL2/SFX) 
    ReflectionsPan.f[3] ; [in/out]     ,     , [0,0,0], early reflections panning vector                        (SUPPORTED:EAX) 
    Reverb.l            ; [in/out] -10000, 2000  , 200  , late reverberation level relative To room effect                (SUPPORTED:EAX/Xbox1/I3DL2/SFX) 
    ReverbDelay.f       ; [in/out] 0.0   , 0.1   , 0.011  , late reverberation delay time relative To initial reflection          (SUPPORTED:EAX/Xbox1/GC/I3DL2/SFX) 
    ReverbPan.f[3]      ; [in/out]     ,     , [0,0,0], late reverberation panning vector                       (SUPPORTED:EAX) 
    EchoTime.f          ; [in/out] .075  , 0.25  , 0.25   , echo time                                   (SUPPORTED:EAX/PS2(FMOD_PRESET_PS2_ECHO/FMOD_PRESET_PS2_DELAY only) 
    EchoDepth.f         ; [in/out] 0.0   , 1.0   , 0.0  , echo depth                                  (SUPPORTED:EAX/PS2(FMOD_PRESET_PS2_ECHO only) 
    ModulationTime.f    ; [in/out] 0.04  , 4.0   , 0.25   , modulation time                                 (SUPPORTED:EAX) 
    ModulationDepth.f   ; [in/out] 0.0   , 1.0   , 0.0  , modulation depth                                (SUPPORTED:EAX/GC) 
    AirAbsorptionHF.f   ; [in/out] -100  , 0.0   , -5.0   , change in level per meter at high frequencies                 (SUPPORTED:EAX) 
    HFReference.f       ; [in/out] 1000.0, 20000 , 5000.0 , reference high frequency (hz)                         (SUPPORTED:EAX/Xbox1/I3DL2/SFX) 
    LFReference.f       ; [in/out] 20.0  , 1000.0, 250.0  , reference low frequency (hz)                          (SUPPORTED:EAX/SFX) 
    RoomRolloffFactor.f ; [in/out] 0.0   , 10.0  , 0.0  , like rolloffscale in System::set3DSettings but For reverb room size effect  (SUPPORTED:EAX/Xbox1/I3DL2/SFX) 
    Diffusion.f         ; [in/out] 0.0   , 100.0 , 100.0  , Value that controls the echo density in the late reverberation decay.     (SUPPORTED:I3DL2/Xbox1/SFX) 
    Density.f           ; [in/out] 0.0   , 100.0 , 100.0  , Value that controls the modal density in the late reverberation decay     (SUPPORTED:I3DL2/Xbox1/SFX) 
    Flags.l             ; [in/out] FMOD_REVERB_FLAGS - modifies the behavior of above properties                      (SUPPORTED:EAX/PS2/GC/WII) 
  EndStructure
  Structure FMOD_REVERB_CHANNELPROPERTIES  
                                  ;      MIN   MAX  Default  DESCRIPTION 
    Direct.l                ; [in/out] -10000, 1000,  0,     direct path level (at low And mid frequencies)        (SUPPORTED:EAX/I3DL2/Xbox1/SFX) 
    DirectHF.l              ; [in/out] -10000, 0,   0,     relative direct path level at high frequencies        (SUPPORTED:EAX/I3DL2/Xbox1) 
    Room.l                  ; [in/out] -10000, 1000,  0,     room effect level (at low And mid frequencies)        (SUPPORTED:EAX/I3DL2/Xbox1/GC/SFX) 
    RoomHF.l                ; [in/out] -10000, 0,   0,     relative room effect level at high frequencies        (SUPPORTED:EAX/I3DL2/Xbox1) 
    Obstruction.l           ; [in/out] -10000, 0,   0,     main obstruction control (attenuation at high frequencies)  (SUPPORTED:EAX/I3DL2/Xbox1) 
    ObstructionLFRatio.f    ; [in/out] 0.0,  1.0,   0.0,   obstruction low-frequency level re. main control      (SUPPORTED:EAX/I3DL2/Xbox1) 
    Occlusion.l             ; [in/out] -10000, 0,   0,     main occlusion control (attenuation at high frequencies)  (SUPPORTED:EAX/I3DL2/Xbox1) 
    OcclusionLFRatio.f      ; [in/out] 0.0,  1.0,   0.25,  occlusion low-frequency level re. main control        (SUPPORTED:EAX/I3DL2/Xbox1) 
    OcclusionRoomRatio.f    ; [in/out] 0.0,  10.0,  1.5,   relative occlusion control For room effect          (SUPPORTED:EAX) 
    OcclusionDirectRatio.f  ; [in/out] 0.0,  10.0,  1.0,   relative occlusion control For direct path          (SUPPORTED:EAX) 
    Exclusion.l             ; [in/out] -10000, 0,   0,     main exlusion control (attenuation at high frequencies)   (SUPPORTED:EAX) 
    ExclusionLFRatio.f      ; [in/out] 0.0,  1.0,   1.0,   exclusion low-frequency level re. main control        (SUPPORTED:EAX) 
    OutsideVolumeHF.l       ; [in/out] -10000, 0,   0,     outside sound cone level at high frequencies        (SUPPORTED:EAX) 
    DopplerFactor.f         ; [in/out] 0.0,  10.0,  0.0,   like DS3D flDopplerFactor but per source          (SUPPORTED:EAX) 
    RolloffFactor.f         ; [in/out] 0.0,  10.0,  0.0,   like DS3D flRolloffFactor but per source          (SUPPORTED:EAX) 
    RoomRolloffFactor.f     ; [in/out] 0.0,  10.0,  0.0,   like DS3D flRolloffFactor but For room effect         (SUPPORTED:EAX/I3DL2/Xbox1) 
    AirAbsorptionFactor.f   ; [in/out] 0.0,  10.0,  1.0,   multiplies AirAbsorptionHF member of FMOD_REVERB_PROPERTIES (SUPPORTED:EAX) 
    Flags.l                 ; [in/out] FMOD_REVERB_CHANNELFLAGS - modifies the behavior of properties            (SUPPORTED:EAX) 
  EndStructure
  Structure FMOD_ADVANCEDSETTINGS
    cbsize.l                  ; [in]   Size of this Structure.  Use SizeOf(FMOD_ADVANCEDSETTINGS)  NOTE: This must be set before calling System::getAdvancedSettings! 
    maxMPEGcodecs.l           ; [in/out] Optional. Specify 0 To ignore. For use With FMOD_CREATECOMPRESSEDSAMPLE only.  Mpeg  codecs consume 29,424 bytes per instance And this number will determine how many mpeg channels can be played simultaneously.  Default = 16. 
    maxADPCMcodecs.l          ; [in/out] Optional. Specify 0 To ignore. For use With FMOD_CREATECOMPRESSEDSAMPLE only.  ADPCM codecs consume 2,136 bytes per instance (based on FSB encoded ADPCM block size - see remarks) And this number will determine how many ADPCM channels can be played simultaneously.  Default = 32. 
    maxXMAcodecs.l            ; [in/out] Optional. Specify 0 To ignore. For use With FMOD_CREATECOMPRESSEDSAMPLE only.  XMA   codecs consume 20,512 bytes per instance And this number will determine how many XMA channels can be played simultaneously.  Default = 32.  
    maxPCMcodecs.l            ; [in/out] Optional. Specify 0 To ignore. For use With PS3 only.              PCM   codecs consume 12,672 bytes per instance And this number will determine how many streams And PCM voices can be played simultaneously. Default = 16 
    ASIONumChannels.l         ; [in/out] Optional. Specify 0 To ignore. Number of channels available on the ASIO device. 
    *ASIOChannelList.s        ; [in/out] Optional. Specify 0 To ignore. Pointer To an array of strings (number of entries defined by ASIONumChannels) With ASIO channel names. 
    *ASIOSpeakerList.FMOD_SPEAKER ; [in/out] Optional. Specify 0 To ignore. Pointer To a list of speakers that the ASIO channels map To.  This can be called after System::init To remap ASIO output. 
    max3DReverbDSPs.l         ; [in/out] Optional. Specify 0 To ignore. The max number of 3d reverb DSP's in the system. */
    HRTFMinAngle.f            ; [in/out] Optional. Specify 0 To ignore. For use With FMOD_INIT_SOFTWARE_HRTF.  The angle (0-360) of a 3D sound from the listener's forward vector at which the HRTF function begins to have an effect.  Default = 180.0. */
    HRTFMaxAngle.f            ; [in/out] Optional. Specify 0 To ignore. For use With FMOD_INIT_SOFTWARE_HRTF.  The angle (0-360) of a 3D sound from the listener's forward vector at which the HRTF function begins to have maximum effect.  Default = 360.0.  */
    HRTFFreq.f                ; [in/out] Optional. Specify 0 To ignore. For use With FMOD_INIT_SOFTWARE_HRTF.  The cutoff frequency of the HRTF's lowpass filter function when at maximum effect. (i.e. at HRTFMaxAngle).  Default = 4000.0. */
    vol0virtualvol.f          ; [in/out] Optional. Specify 0 To ignore. For use With FMOD_INIT_VOL0_BECOMES_VIRTUAL.  If this flag is used, And the volume is 0.0, then the sound will become virtual.  Use this value To raise the threshold To a different point where a sound goes virtual. 
    eventqueuesize.l          ; [in/out] Optional. Specify 0 To ignore. For use With FMOD Event system only.  Specifies the number of slots available For simultaneous non blocking loads.  Default = 32. 
    defaultDecodeBufferSize.l ; [in/out] Optional. Specify 0 To ignore. For streams. This determines the Default size of the double buffer (in milliseconds) that a stream uses.  Default = 400ms 
  EndStructure
  Structure FMOD_CODEC_DESCRIPTION
    name.s                  ; [in] Name of the codec. 
    version.l               ; [in] Plugin writer's version number. */
    defaultasstream.l       ; [in] Tells FMOD To open the file As a stream when calling System::createSound, And Not a Static sample.  Should normally be 0 (FALSE), because generally the user wants To decode the file into memory when using System::createSound.   Mainly used For formats that decode For a very long time, Or could use large amounts of memory when decoded.  Usually sequenced formats such As mod/s3m/xm/it/midi fall into this category.   It is mainly To stop users that don't know what they're doing from getting FMOD_ERR_MEMORY returned from createSound when they should have in fact called System::createStream Or used FMOD_CREATESTREAM in System::createSound. 
    timeunits.FMOD_TIMEUNIT ; [in] When setposition codec is called, only these time formats will be passed To the codec. Use bitwise Or To accumulate different types. 
    *open                   ; FMOD_CODEC_OPENCALLBACK         [in] Open callback For the codec For when FMOD tries To open a sound using this codec. 
    *close                  ; FMOD_CODEC_CLOSECALLBACK        [in] Close callback For the codec For when FMOD tries To close a sound using this codec.  
    *Read                   ; FMOD_CODEC_READCALLBACK         [in] Read callback For the codec For when FMOD tries To Read some Data from the file To the destination format (specified in the open callback). 
    *getlength              ; FMOD_CODEC_GETLENGTHCALLBACK    [in] Callback To Return the length of the song in whatever format required when Sound::getLength is called. 
    *setposition            ; FMOD_CODEC_SETPOSITIONCALLBACK  [in] Seek callback For the codec For when FMOD tries To seek within the file With Channel::setPosition. 
    *getposition            ; FMOD_CODEC_GETPOSITIONCALLBACK  [in] Tell callback For the codec For when FMOD tries To get the current position within the With Channel::getPosition. 
    *soundcreate            ; FMOD_CODEC_SOUNDCREATECALLBACK  [in] Sound creation callback For the codec when FMOD finishes creating the sound.  (So the codec can set more parameters For the related created sound, ie loop points/mode Or 3D attributes etc). 
    *getwaveformat          ; FMOD_CODEC_GETWAVEFORMAT        [in] Callback To tell FMOD about the waveformat of a particular subsound.  This is To save memory, rather than saving 1000 FMOD_CODEC_WAVEFORMAT structures in the codec, the codec might have a more optimal way of storing this information. 
  EndStructure
  Structure FMOD_CODEC_WAVEFORMAT
    name.s{256}   ; [in] Name of sound.
    format.l      ; FMOD_SOUND_FORMAT [in] Format For (decompressed) codec output, ie FMOD_SOUND_FORMAT_PCM8, FMOD_SOUND_FORMAT_PCM16.
    channels.l    ; [in] Number of channels used by codec, ie mono = 1, stereo = 2. 
    frequency.l   ; [in] Default frequency in hz of the codec, ie 44100. 
    lengthbytes.l ; [in] Length in bytes of the source Data. 
    lengthpcm.l   ; [in] Length in decompressed, PCM samples of the file, ie length in seconds * frequency.  Used For Sound::getLength And For memory allocation of Static decompressed sample Data. 
    blockalign.l  ; [in] Blockalign in decompressed, PCM samples of the optimal decode chunk size For this format.  The codec Read callback will be called in multiples of this value. 
    loopstart.l   ; [in] Loopstart in decompressed, PCM samples of file. 
    loopend.l     ; [in] Loopend in decompressed, PCM samples of file. 
    mode.l        ; FMOD_MODE [in] Mode To determine whether the sound should by Default load As looping, non looping, 2d Or 3d. 
    channelmask.l ; [in] Microsoft speaker channel mask, As defined For WAVEFORMATEXTENSIBLE And is found in ksmedia.h.  Leave at 0 To play in natural speaker order. 
  EndStructure
  Structure FMOD_CODEC_STATE
    numsubsounds.l                      ; [in] Number of 'subsounds' in this sound.  Anything other than 0 makes it a 'container' format (ie CDDA/DLS/FSB etc which contain 1 Or more su bsounds).  For most normal, single sound codec such As WAV/AIFF/MP3, this should be 0 As they are Not a container For subsounds, they are the sound by itself. 
    *waveformat.FMOD_CODEC_WAVEFORMAT   ; [in] Pointer To an array of format structures containing information about each sample.  Can be 0 Or NULL If FMOD_CODEC_GETWAVEFORMAT callback is preferred.  The number of entries here must equal the number of subsounds defined in the subsound parameter. If numsubsounds = 0 then there should be 1 instance of this Structure. 
    *plugindata                         ; [in] Plugin writer created Data the codec author wants To attach To this object. 
    *filehandle                         ; [out] This will Return an internal FMOD file handle To use With the callbacks provided.  
    filesize.l                          ; [out] This will contain the size of the file in bytes. 
    *fileread                           ; FMOD_FILE_READCALLBACK      [out] This will Return a callable FMOD file function To use from codec. 
    *fileseek                           ; FMOD_FILE_SEEKCALLBACK      [out] This will Return a callable FMOD file function To use from codec.  
    *metadata                           ; FMOD_CODEC_METADATACALLBACK [out] This will Return a callable FMOD metadata function To use from codec.  
  EndStructure    
  Structure FMOD_DSP_PARAMETERDESC
    min.f          ; [in] Minimum value of the parameter (ie 100.0). 
    max.f          ; [in] Maximum value of the parameter (ie 22050.0). 
    defaultval.f   ; [in] Default value of parameter. 
    name.s{16}     ; [in] Name of the parameter To be displayed (ie "Cutoff frequency"). 
    label.s{16}    ; [in] Short string To be put Next To value To denote the unit type (ie "hz"). 
    description.s  ; [in] Description of the parameter To be displayed As a help item / tooltip For this parameter. 
  EndStructure
  Structure FMOD_DSP_DESCRIPTION
    name.s{32}        ; [in] Name of the unit To be displayed in the network. 
    version.l         ; [in] Plugin writer's version number. */
    channels.l        ; [in] Number of channels.  Use 0 To process whatever number of channels is currently in the network.  >0 would be mostly used If the unit is a unit that only generates sound. 
    *create           ; FMOD_DSP_CREATECALLBACK       [in] Create callback.  This is called when DSP unit is created.  Can be null. 
    *release          ; FMOD_DSP_RELEASECALLBACK      [in] Release callback.  This is called just before the unit is freed so the user can do any cleanup needed For the unit.  Can be null. 
    *reset            ; FMOD_DSP_RESETCALLBACK        [in] Reset callback.  This is called by the user To reset any history buffers that may need resetting For a filter, when it is To be used Or re-used For the first time To its initial clean state.  Use To avoid clicks Or artifacts. 
    *Read             ; FMOD_DSP_READCALLBACK         [in] Read callback.  Processing is done here.  Can be null. 
    *setposition      ; FMOD_DSP_SETPOSITIONCALLBACK  [in] Set position callback.  This is called If the unit wants To update its position info but Not process Data, Or reset a cursor position internally If it is reading Data from a certain source.  Can be null. 
    numparameters.l   ; [in] Number of parameters used in this filter.  The user finds this With DSP::getNumParameters 
    *paramdesc.FMOD_DSP_PARAMETERDESC      ; [in] Variable number of parameter structures. 
    *setparameter     ; FMOD_DSP_SETPARAMCALLBACK     [in] This is called when the user calls DSP::setParameter.  Can be null. 
    *getparameter     ; FMOD_DSP_GETPARAMCALLBACK     [in] This is called when the user calls DSP::getParameter.  Can be null. 
    *config           ; FMOD_DSP_DIALOGCALLBACK       [in] This is called when the user calls DSP::showConfigDialog.  Can be used To display a dialog To configure the filter.  Can be null. 
    configwidth.l     ; [in] Width of config dialog graphic If there is one.  0 otherwise.
    configheight.l    ; [in] Height of config dialog graphic If there is one.  0 otherwise.
    *userdata         ; [in] Optional. Specify 0 To ignore. This is user Data To be attached To the DSP unit during creation.  Access via DSP::getUserData. 
  EndStructure
  Structure FMOD_DSP_STATE
    *instance    ; [out] Handle To the DSP hand the user created.  Not To be modified.  C++ users cast To FMOD::DSP To use.  
    *plugindata  ; [in] Plugin writer created Data the output author wants To attach To this object. 
  EndStructure
  Structure FMOD_OUTPUT_DESCRIPTION
    name.s                  ; [in] Name of the output. 
    version.l               ; [in] Plugin writer's version number. */
    polling.l               ; [in] If TRUE (non zero), this tells FMOD To start a thread And call getposition / lock / unlock For feeding Data.  If 0, the output is probably callback based, so all the plugin needs To do is call readfrommixer To the appropriate pointer.  
    *getnumdrivers          ; FMOD_OUTPUT_GETNUMDRIVERSCALLBACK  [in] For sound device Enumeration.  This callback is To give System::getNumDrivers somthing To Return. 
    *getdrivername          ; FMOD_OUTPUT_GETDRIVERNAMECALLBACK  [in] For sound device Enumeration.  This callback is To give System::getDriverName somthing To Return. 
    *getdrivercaps          ; FMOD_OUTPUT_GETDRIVERCAPSCALLBACK  [in] For sound device Enumeration.  This callback is To give System::getDriverCaps somthing To Return. 
    *init                   ; FMOD_OUTPUT_INITCALLBACK           [in] Initialization function For the output device.  This is called from System::init. 
    *close                  ; FMOD_OUTPUT_CLOSECALLBACK          [in] Cleanup / close down function For the output device.  This is called from System::close. 
    *update                 ; FMOD_OUTPUT_UPDATECALLBACK         [in] Update function that is called once a frame by the user.  This is called from System::update. 
    *gethandle              ; FMOD_OUTPUT_GETHANDLECALLBACK      [in] This is called from System::getOutputHandle.  This is just To Return a pointer To the internal system device object that the system may be using.
    *getposition            ; FMOD_OUTPUT_GETPOSITIONCALLBACK    [in] This is called from the FMOD software mixer thread If 'polling' = true.  This returns a position value in samples so that FMOD knows where And when To fill its buffer. 
    *lock                   ; FMOD_OUTPUT_LOCKCALLBACK           [in] This is called from the FMOD software mixer thread If 'polling' = true.  This function provides a pointer To Data that FMOD can write To when software mixing. 
    *unlock                 ; FMOD_OUTPUT_UNLOCKCALLBACK         [in] This is called from the FMOD software mixer thread If 'polling' = true.  This optional function accepts the Data that has been mixed And copies it Or does whatever it needs To before sending it To the hardware. 
  EndStructure               
  Structure FMOD_OUTPUT_STATE
    *plugindata      ; [in] Plugin writer created Data the output author wants To attach To this object. 
    *readfrommixer   ; FMOD_OUTPUT_READFROMMIXER [out] Function To update mixer And write the result To the provided pointer.  Used from callback based output only.  Polling based output uses lock/unlock/getposition. 
  EndStructure 
;}

ProcedureDLL.s FMOD_ErrorString(errcode.l)
    Select errcode
        Case #FMOD_ERR_ALREADYLOCKED:          ProcedureReturn "Tried to call lock a second time before unlock was called. "
        Case #FMOD_ERR_BADCOMMAND:             ProcedureReturn "Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound). "
        Case #FMOD_ERR_CDDA_DRIVERS:           ProcedureReturn "Neither NTSCSI nor ASPI could be initialised. "
        Case #FMOD_ERR_CDDA_INIT:              ProcedureReturn "An error occurred while initialising the CDDA subsystem. "
        Case #FMOD_ERR_CDDA_INVALID_DEVICE:    ProcedureReturn "Couldn't find the specified device. "
        Case #FMOD_ERR_CDDA_NOAUDIO:           ProcedureReturn "No audio tracks on the specified disc. "
        Case #FMOD_ERR_CDDA_NODEVICES:         ProcedureReturn "No CD/DVD devices were found. "
        Case #FMOD_ERR_CDDA_NODISC:            ProcedureReturn "No disc present in the specified drive. "
        Case #FMOD_ERR_CDDA_READ:              ProcedureReturn "A CDDA read error occurred. "
        Case #FMOD_ERR_CHANNEL_ALLOC:          ProcedureReturn "Error trying to allocate a channel. "
        Case #FMOD_ERR_CHANNEL_STOLEN:         ProcedureReturn "The specified channel has been reused to play another sound. "
        Case #FMOD_ERR_COM:                    ProcedureReturn "A Win32 COM related error occured. COM failed to initialize or a QueryInterface failed meaning a Windows codec or driver was not installed properly. "
        Case #FMOD_ERR_DMA:                    ProcedureReturn "DMA Failure.  See debug output for more information. "
        Case #FMOD_ERR_DSP_CONNECTION:         ProcedureReturn "DSP connection error.  Connection possibly caused a cyclic dependancy. "
        Case #FMOD_ERR_DSP_FORMAT:             ProcedureReturn "DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format. "
        Case #FMOD_ERR_DSP_NOTFOUND:           ProcedureReturn "DSP connection error.  Couldn't find the DSP unit specified. "
        Case #FMOD_ERR_DSP_RUNNING:            ProcedureReturn "DSP error.  Cannot perform this operation while the network is in the middle of running.  This will most likely happen if a connection or disconnection is attempted in a DSP callback. "
        Case #FMOD_ERR_DSP_TOOMANYCONNECTIONS: ProcedureReturn "DSP connection error.  The unit being connected to or disconnected should only have 1 input or output. "
        Case #FMOD_ERR_EVENT_FAILED:           ProcedureReturn "An Event failed to be retrieved, most likely due to 'just fail' being specified as the max playbacks behavior. "
        Case #FMOD_ERR_EVENT_INFOONLY:         ProcedureReturn "Can't execute this command on an EVENT_INFOONLY event. "
        Case #FMOD_ERR_EVENT_INTERNAL:         ProcedureReturn "An error occured that wasn't supposed to.  See debug log for reason. "
        Case #FMOD_ERR_EVENT_MAXSTREAMS:       ProcedureReturn "Event failed because 'Max streams' was hit when FMOD_INIT_FAIL_ON_MAXSTREAMS was specified. "
        Case #FMOD_ERR_EVENT_MISMATCH:         ProcedureReturn "FSB mismatches the FEV it was compiled with or FEV was built for a different platform. "
        Case #FMOD_ERR_EVENT_NAMECONFLICT:     ProcedureReturn "A category with the same name already exists. "
        Case #FMOD_ERR_EVENT_NOTFOUND:         ProcedureReturn "The requested event, event group, event category or event property could not be found. "
        Case #FMOD_ERR_FILE_BAD:               ProcedureReturn "Error loading file. "
        Case #FMOD_ERR_FILE_COULDNOTSEEK:      ProcedureReturn "Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format. "
        Case #FMOD_ERR_FILE_DISKEJECTED:       ProcedureReturn "Media was ejected while reading. "
        Case #FMOD_ERR_FILE_EOF:               ProcedureReturn "End of file unexpectedly reached while trying to read essential data (truncated data?). "
        Case #FMOD_ERR_FILE_NOTFOUND:          ProcedureReturn "File not found. "
        Case #FMOD_ERR_FILE_UNWANTED:          ProcedureReturn "Unwanted file access occured. "
        Case #FMOD_ERR_FORMAT:                 ProcedureReturn "Unsupported file or audio format. "
        Case #FMOD_ERR_HTTP:                   ProcedureReturn "A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere. "
        Case #FMOD_ERR_HTTP_ACCESS:            ProcedureReturn "The specified resource requires authentication or is forbidden. "
        Case #FMOD_ERR_HTTP_PROXY_AUTH:        ProcedureReturn "Proxy authentication is required to access the specified resource. "
        Case #FMOD_ERR_HTTP_SERVER_ERROR:      ProcedureReturn "A HTTP server error occurred. "
        Case #FMOD_ERR_HTTP_TIMEOUT:           ProcedureReturn "The HTTP request timed out. "
        Case #FMOD_ERR_INITIALIZATION:         ProcedureReturn "FMOD was not initialized correctly to support this function. "
        Case #FMOD_ERR_INITIALIZED:            ProcedureReturn "Cannot call this command after System::init. "
        Case #FMOD_ERR_INTERNAL:               ProcedureReturn "An error occured that wasn't supposed to.  Contact support. "
        Case #FMOD_ERR_INVALID_ADDRESS:        ProcedureReturn "On Xbox 360, this memory address passed to FMOD must be physical, (ie allocated with XPhysicalAlloc.) "
        Case #FMOD_ERR_INVALID_FLOAT:          ProcedureReturn "Value passed in was a NaN, Inf or denormalized float. "
        Case #FMOD_ERR_INVALID_HANDLE:         ProcedureReturn "An invalid object handle was used. "
        Case #FMOD_ERR_INVALID_PARAM:          ProcedureReturn "An invalid parameter was passed to this function. "
        Case #FMOD_ERR_INVALID_SPEAKER:        ProcedureReturn "An invalid speaker was passed to this function based on the current speaker mode. "
        Case #FMOD_ERR_INVALID_VECTOR:         ProcedureReturn "The vectors passed in are not unit length, or perpendicular. "
        Case #FMOD_ERR_IRX:                    ProcedureReturn "PS2 only.  fmodex.irx failed to initialize.  This is most likely because you forgot to load it. "
        Case #FMOD_ERR_MAXAUDIBLE:             ProcedureReturn "Reached maximum audible playback count for this sound's soundgroup. "
        Case #FMOD_ERR_MEMORY:                 ProcedureReturn "Not enough memory or resources. "
        Case #FMOD_ERR_MEMORY_CANTPOINT:       ProcedureReturn "Can't use FMOD_OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if FMOD_CREATECOMPRESSEDSAMPLE was used. "
        Case #FMOD_ERR_MEMORY_IOP:             ProcedureReturn "PS2 only.  Not enough memory or resources on PlayStation 2 IOP ram. "
        Case #FMOD_ERR_MEMORY_SRAM:            ProcedureReturn "Not enough memory or resources on console sound ram. "
        Case #FMOD_ERR_NEEDS2D:                ProcedureReturn "Tried to call a command on a 3d sound when the command was meant for 2d sound. "
        Case #FMOD_ERR_NEEDS3D:                ProcedureReturn "Tried to call a command on a 2d sound when the command was meant for 3d sound. "
        Case #FMOD_ERR_NEEDSHARDWARE:          ProcedureReturn "Tried to use a feature that requires hardware support.  (ie trying to play a VAG compressed sound in software on PS2). "
        Case #FMOD_ERR_NEEDSSOFTWARE:          ProcedureReturn "Tried to use a feature that requires the software engine.  Software engine has either been turned off, or command was executed on a hardware channel which does not support this feature. "
        Case #FMOD_ERR_NET_CONNECT:            ProcedureReturn "Couldn't connect to the specified host. "
        Case #FMOD_ERR_NET_SOCKET_ERROR:       ProcedureReturn "A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere. "
        Case #FMOD_ERR_NET_URL:                ProcedureReturn "The specified URL couldn't be resolved. "
        Case #FMOD_ERR_NET_WOULD_BLOCK:        ProcedureReturn "Operation on a non-blocking socket could not complete immediately. "
        Case #FMOD_ERR_NOTREADY:               ProcedureReturn "Operation could not be performed because specified sound is not ready. "
        Case #FMOD_ERR_OUTPUT_ALLOCATED:       ProcedureReturn "Error initializing output device, but more specifically, the output device is already in use and cannot be reused. "
        Case #FMOD_ERR_OUTPUT_CREATEBUFFER:    ProcedureReturn "Error creating hardware sound buffer. "
        Case #FMOD_ERR_OUTPUT_DRIVERCALL:      ProcedureReturn "A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted. "
        Case #FMOD_ERR_OUTPUT_ENUMERATION:     ProcedureReturn "Error enumerating the available driver list. List may be inconsistent due to a recent device addition or removal. "
        Case #FMOD_ERR_OUTPUT_FORMAT:          ProcedureReturn "Soundcard does not support the minimum features needed for this soundsystem (16bit stereo output). "
        Case #FMOD_ERR_OUTPUT_INIT:            ProcedureReturn "Error initializing output device. "
        Case #FMOD_ERR_OUTPUT_NOHARDWARE:      ProcedureReturn "FMOD_HARDWARE was specified but the sound card does not have the resources nescessary to play it. "
        Case #FMOD_ERR_OUTPUT_NOSOFTWARE:      ProcedureReturn "Attempted to create a software sound but no software channels were specified in System::init. "
        Case #FMOD_ERR_PAN:                    ProcedureReturn "Panning only works with mono or stereo sound sources. "
        Case #FMOD_ERR_PLUGIN:                 ProcedureReturn "An unspecified error has been returned from a 3rd party plugin. "
        Case #FMOD_ERR_PLUGIN_INSTANCES:       ProcedureReturn "The number of allowed instances of a plugin has been exceeded. "
        Case #FMOD_ERR_PLUGIN_MISSING:         ProcedureReturn "A requested output, dsp unit type or codec was not available. "
        Case #FMOD_ERR_PLUGIN_RESOURCE:        ProcedureReturn "A resource that the plugin requires cannot be found. (ie the DLS file for MIDI playback) "
        Case #FMOD_ERR_RECORD:                 ProcedureReturn "An error occured trying to initialize the recording device. "
        Case #FMOD_ERR_REVERB_INSTANCE:        ProcedureReturn "Specified Instance in FMOD_REVERB_PROPERTIES couldn't be set. Most likely because another application has locked the EAX4 FX slot. "
        Case #FMOD_ERR_SUBSOUNDS:              ProcedureReturn "The error occured because the sound referenced contains subsounds.  (ie you cannot play the parent sound as a static sample, only its subsounds.) "
        Case #FMOD_ERR_SUBSOUND_ALLOCATED:     ProcedureReturn "This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first. "
        Case #FMOD_ERR_TAGNOTFOUND:            ProcedureReturn "The specified tag could not be found or there are no tags. "
        Case #FMOD_ERR_TOOMANYCHANNELS:        ProcedureReturn "The sound created exceeds the allowable input channel count.  This can be increased using the maxinputchannels parameter in System::setSoftwareFormat. "
        Case #FMOD_ERR_UNIMPLEMENTED:          ProcedureReturn "Something in FMOD hasn't been implemented when it should be! contact support! "
        Case #FMOD_ERR_UNINITIALIZED:          ProcedureReturn "This command failed because System::init or System::setDriver was not called. "
        Case #FMOD_ERR_UNSUPPORTED:            ProcedureReturn "A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified. "
        Case #FMOD_ERR_UPDATE:                 ProcedureReturn "An error caused by System::update occured. "
        Case #FMOD_ERR_VERSION:                ProcedureReturn "The version number of this file format is not supported. "
        Case #FMOD_OK:                         ProcedureReturn "No errors."
        Default :                              ProcedureReturn "Unknown error."
    EndSelect
EndProcedure

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 1082
; Folding = AAAAAAAAAAAAAAg