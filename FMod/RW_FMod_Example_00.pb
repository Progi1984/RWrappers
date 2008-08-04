;================================================================
; Project   FMod
; Title     Sample_00
; Author    Progi1984
; Date      20/03/2008
; Notes     Read tags from a MP3 File
;================================================================
XIncludeFile "RW_FMod_Inc.pb"
EnableExplicit

  Global *system.FMOD_SYSTEM
  Global *sound.FMOD_SOUND
  Global result.FMOD_RESULT
  Global tag.FMOD_TAG
  Global numtags.l, numtagsupdated.l, count.l, version.l
  
  Procedure ErrCheck(result.l)
    If result <> #FMOD_OK
      Debug "FMOD error > ("+Str(result)+" "+FMOD_ErrorString(result)
      End
    EndIf
  EndProcedure

  
  Debug "=================================================================="
  Debug "ReadTags Example.  Copyright (c) Firelight Technologies 2004-2005."
  Debug "=================================================================="

  ; Create a System object And initialize.
  result = FMOD_System_Create(@*system)
  ErrCheck(result)

  result = FMOD_System_GetVersion(*system, @version)
  ErrCheck(result)

  If version < #FMOD_VERSION
    Debug "Error!  You are using an old version of FMOD "+Str(version)+".  This program requires "+Str(#FMOD_VERSION)
  EndIf

  result = FMOD_System_Init(*system, 100, #FMOD_INIT_NORMAL, #Null)
  ErrCheck(result)

  ; Open the specified file. Use FMOD_CREATESTREAM And FMOD_OPENONLY so it opens quickly
  result = FMOD_System_CreateSound(*system, "Samples\wave.mp3", #FMOD_SOFTWARE | #FMOD_2D | #FMOD_CREATESTREAM | #FMOD_OPENONLY, 0, @*sound)
  ErrCheck(result)

  ;Read And display all tags associated With this file
  Repeat
    ; An index of -1 means "get the first tag that's new or updated".
    ; If no tags are new Or updated then getTag will Return FMOD_ERR_TAGNOTFOUND.
    ; This is the first time we've read any tags so they'll all be new but after we've read them, 
    ; they won't be new any more.
    
    If (FMOD_Sound_GetTag(*sound, 0, -1, @tag) <> #FMOD_OK)
      Break
    EndIf
    If Tag\datatype = #FMOD_TAGDATATYPE_STRING
      Debug Tag\name+" = "+PeekS(Tag\Data_)+" ("+Str(Tag\datalen)+" bytes)"
    Else
      Debug Tag\name+" = <binary> ("+Str(Tag\datalen)+" bytes)"
    EndIf
  ForEver
  Debug ""

  ; Read all the tags regardless of whether they're updated or not. Also show the tag type.
  result = FMOD_Sound_GetNumTags(*sound, @numtags, @numtagsupdated)
  ErrCheck(result)
  For count = 0 To numtags-1
    result = FMOD_Sound_GetTag(*sound, 0, count, @tag)
    ErrCheck(result)
    Select Tag\type
      Case #FMOD_TAGTYPE_UNKNOWN :
        Debug "FMOD_TAGTYPE_UNKNOWN  "
      Case #FMOD_TAGTYPE_ID3V1 :
        Debug "FMOD_TAGTYPE_ID3V1  "
      Case #FMOD_TAGTYPE_ID3V2 :
        Debug "FMOD_TAGTYPE_ID3V2  "
      Case #FMOD_TAGTYPE_VORBISCOMMENT :
        Debug "FMOD_TAGTYPE_VORBISCOMMENT  "
      Case #FMOD_TAGTYPE_SHOUTCAST :
        Debug "FMOD_TAGTYPE_SHOUTCAST  "
      Case #FMOD_TAGTYPE_ICECAST :
        Debug "FMOD_TAGTYPE_ICECAST  "
      Case #FMOD_TAGTYPE_ASF :
        Debug "FMOD_TAGTYPE_ASF  "
      Case #FMOD_TAGTYPE_FMOD :
        Debug "FMOD_TAGTYPE_FMOD  "
      Case #FMOD_TAGTYPE_USER :
        Debug "FMOD_TAGTYPE_USER  "
    EndSelect

    If Tag\datatype = #FMOD_TAGDATATYPE_STRING
      Debug Tag\name+" = "+PeekS(Tag\Data_)+" ("+Str(Tag\datalen)+" bytes)"
    Else
      Debug Tag\name+" = ??? ("+Str(Tag\datalen)+" bytes)"
    EndIf
  Next
  Debug ""

  ; Find a specific tag by name. Specify an index > 0 To get access To multiple tags of the same name.
  result = FMOD_Sound_GetTag(*sound, @"ARTIST", 0, @tag)  : ErrCheck(result)
  Debug Tag\name+" = "+PeekS(Tag\Data_)+" ("+Str(Tag\datalen)+" bytes)"

  ; Shut down
  result = FMOD_Sound_Release(*sound)   : ErrCheck(result)
  result = FMOD_System_Close(*system)   : ErrCheck(result)
  result = FMOD_System_Release(*system) : ErrCheck(result)

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 5
; Folding = --