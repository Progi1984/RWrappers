XIncludeFile "RW_MediaInfo_Inc.pb"

  Handle = MediaInfo_New()
  If Handle
    MessageRequester("MediaInfo: Version", PeekS(MediaInfo_Option(Handle, "Info_Version", "")))
    If MediaInfo_Open(Handle, "Samples\Example.ogg")         
      ; Lets get some general example infos of the first stream found (index 0)
      Info.s =  "----- General -----"
      Info + #CRLF$ + "Duration : "     + PeekS(MediaInfo_Get(Handle, #MediaInfo_Stream_General, 0, "Duration/String3", #MediaInfo_Info_Text, #MediaInfo_Info_Name))
      Info + #CRLF$ + "Format : "       + PeekS(MediaInfo_Get(Handle, #MediaInfo_Stream_General, 0, "Format", #MediaInfo_Info_Text, #MediaInfo_Info_Name)) + #CRLF$
     
      ; Some infos of the Videostream if included
      Info + #CRLF$ + "----- Video -----"
      Info + #CRLF$ + "Format : "       + PeekS(MediaInfo_Get(Handle,#MediaInfo_Stream_Video, 0, "Format", #MediaInfo_Info_Text, #MediaInfo_Info_Name))
      Info + #CRLF$ + "Format/Info : "  + PeekS(MediaInfo_Get(Handle,#MediaInfo_Stream_Video, 0, "Format/Info", #MediaInfo_Info_Text, #MediaInfo_Info_Name))
      Info + #CRLF$ + "Width : "        + PeekS(MediaInfo_Get(Handle,#MediaInfo_Stream_Video, 0, "Width", #MediaInfo_Info_Text, #MediaInfo_Info_Name))
      Info + #CRLF$ + "Height : "       + PeekS(MediaInfo_Get(Handle,#MediaInfo_Stream_Video, 0, "Height", #MediaInfo_Info_Text, #MediaInfo_Info_Name)) + #CRLF$
     
      ; Some infos of the Audiostream if included
      Info + #CRLF$ + "----- Audio -----"
      Info + #CRLF$ + "Channels : "     + PeekS(MediaInfo_Get(Handle,#MediaInfo_Stream_Audio, 0, "Channel(s)", #MediaInfo_Info_Text, #MediaInfo_Info_Name))
      Info + #CRLF$ + "SamplingRate : " + PeekS(MediaInfo_Get(Handle,#MediaInfo_Stream_Audio, 0, "SamplingRate", #MediaInfo_Info_Text, #MediaInfo_Info_Name)) + " hz"
      MessageRequester("MediaInfo: Some example infos", Info)
     
      ; Example for obtaining less Infos ...
      MediaInfo_Option(Handle, "Complete", "")
      MessageRequester("MediaInfo: Inform with Complete=false", PeekS(MediaInfo_Inform(Handle, #False)))
     
      ; ... and all infos
      MediaInfo_Option(Handle, "Complete", "1")
      MessageRequester("MediaInfo: Inform with Complete=true", PeekS(MediaInfo_Inform(Handle, #True)))
     
      ; Another example of the  Inform option
      MediaInfo_Option(Handle, "Inform", "General;File size is %FileSize/String%")
      MessageRequester("MediaInfo: Custom Inform", PeekS(MediaInfo_Inform(Handle, #False)))

      ; Option to save a list of all supported MediaInfo parameters
      FileID = CreateFile(#PB_Any, "Samples\ListOfParameters.txt")
      WriteString(FileID, PeekS(MediaInfo_Option(Handle, "Info_Parameters", "")))
      CloseFile(FileID)
    EndIf
    MediaInfo_Close(Handle)
  EndIf
  MediaInfo_Delete(Handle)