;{ Constantes
;}
;{ Enumerations
  Enumeration ; TagLib_File_Type
    #TagLib_File_MPEG
    #TagLib_File_OggVorbis
    #TagLib_File_FLAC
    #TagLib_File_MPC
    #TagLib_File_OggFlac
    #TagLib_File_WavPack
    #TagLib_File_Speex
    #TagLib_File_TrueAudio
  EndEnumeration
  Enumeration ; TagLib_ID3v2_Encoding
    #TagLib_ID3v2_Latin1
    #TagLib_ID3v2_UTF16
    #TagLib_ID3v2_UTF16BE
    #TagLib_ID3v2_UTF8
  EndEnumeration
;}
;{ Macros
  Macro bool
    l
  EndMacro
  ;Enumerations
  Macro TagLib_File_Type
    l
  EndMacro
  Macro TagLib_ID3v2_Encoding
    l
  EndMacro
;} 
;{ Structures
  Structure TagLib_File
    dummy.l
  EndStructure
  Structure TagLib_Tag
    dummy.l
  EndStructure
  Structure TagLib_AudioProperties
    dummy.l
  EndStructure
;}
;{ Prototypes
;}
