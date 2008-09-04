
Macro MediaInfo_fileoptions
 l
EndMacro
Macro MediaInfo_infooptions
 l
EndMacro
Macro MediaInfo_info
 l
EndMacro
Macro MediaInfo_stream
  l
EndMacro

; Kinds of Stream 
Enumeration ;  MediaInfo_stream
  #MediaInfo_Stream_General  ; StreamKind = General
  #MediaInfo_Stream_Video    ; StreamKind = Video  
  #MediaInfo_Stream_Audio    ; StreamKind = Audio  
  #MediaInfo_Stream_Text     ; StreamKind = Text   
  #MediaInfo_Stream_Chapters ; StreamKind = Chapters
  #MediaInfo_Stream_Image    ; StreamKind = Image  
  #MediaInfo_Stream_Menu     ; StreamKind = Menu   
  #MediaInfo_Stream_Max      
EndEnumeration
; Kinds of Info 
Enumeration ;  MediaInfo_info
  #MediaInfo_Info_Name         ; InfoKind = Unique name of parameter       
  #MediaInfo_Info_Text         ; InfoKind = Value of parameter             
  #MediaInfo_Info_Measure      ; InfoKind = Unique name of measure unit of parameter
  #MediaInfo_Info_Options      ; InfoKind = See infooptions_t              
  #MediaInfo_Info_Name_Text    ; InfoKind = Translated name of parameter   
  #MediaInfo_Info_Measure_Text ; InfoKind = Translated name of measure unit
  #MediaInfo_Info_Info         ; InfoKind = More information about the parameter
  #MediaInfo_Info_HowTo        ; InfoKind = Information : how Data is found
  #MediaInfo_Info_Max         
EndEnumeration
; Option If InfoKind = Info_Options 
Enumeration ;  MediaInfo_infooptions
  #MediaInfo_InfoOption_ShowInInform     ; Show this parameter in Inform()
  #MediaInfo_InfoOption_Reserved 
  #MediaInfo_InfoOption_ShowInSupported  ; Internal use only (info : Must be showed in Info_Capacities() )
  #MediaInfo_InfoOption_TypeOfValue      ; Value Return by a standard Get() can be : T (Text), I (Integer, warning up To 64 bits), F (Float), D (Date), B (Binary datas coded Base64) (Numbers are in Base 10)
  #MediaInfo_InfoOption_Max
EndEnumeration
; File opening options 
Enumeration ;  MediaInfo_fileoptions
  #MediaInfo_FileOption_Nothing        = $00
  #MediaInfo_FileOption_Recursive      = $01 ; Browse folders recursively
  #MediaInfo_FileOption_CloseAll       = $02 ; Close all files before open
  #MediaInfo_FileOption_Max            = $04
EndEnumeration

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 46
; Folding = A9
; EnableUnicode