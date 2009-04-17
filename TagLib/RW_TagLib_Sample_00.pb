XIncludeFile "RW_TagLib_Inc.pb"

; What to do.mp3 >   http://www.jamendo.com/fr/album/438

Define.l MP3File = taglib_file_new("data\What to do.mp3")
Define.l MP3FileTag
Define.l MP3FileProperties
Define.l Seconds
Define.l Minutes

If MP3File
  MP3FileTag = taglib_file_tag(MP3File)
  MP3FileProperties = taglib_file_audioproperties(MP3File)

  Debug "-- TAG --"
  Debug "Title  > " + PeekS(taglib_tag_title(MP3FileTag))
  Debug "Artist > " + PeekS(taglib_tag_artist(MP3FileTag))
  Debug "Album  > " + PeekS(taglib_tag_album(MP3FileTag))
  Debug "Year   > " + Str(taglib_tag_year(MP3FileTag))
  Debug "Comment> " + PeekS(taglib_tag_comment(MP3FileTag))
  Debug "Track  > " + Str(taglib_tag_track(MP3FileTag))
  Debug "Genre  > " + PeekS(taglib_tag_genre(MP3FileTag))

  Seconds = taglib_audioproperties_length(MP3FileProperties) % 60
  Minutes = (taglib_audioproperties_length(MP3FileProperties) - Seconds) / 60

  Debug "-- AUDIO --"
  Debug "Bitrate    > " + Str(taglib_audioproperties_bitrate(MP3FileProperties))
  Debug "Sample Rate> " + Str(taglib_audioproperties_samplerate(MP3FileProperties))
  Debug "Channels   > " + Str(taglib_audioproperties_channels(MP3FileProperties))
  Debug "Length     > " + Str(Minutes) + ":" + Str(Seconds)

  taglib_tag_free_strings()

  taglib_file_free(MP3File)
EndIf 