XIncludeFile "RW_TagLib_Inc.pb"

; 01_-_Vivaldi_Spring_mvt_1_Allegro_-_John_Harrison_violin.ogg>   http://commons.wikimedia.org/wiki/File:01_-_Vivaldi_Spring_mvt_1_Allegro_-_John_Harrison_violin.ogg

Define.l OGGFile = taglib_file_new_type("data\01_-_Vivaldi_Spring_mvt_1_Allegro_-_John_Harrison_violin.ogg", #TagLib_File_OggVorbis)
Define.l OGGFileTag
Define.l OGGFileProperties
Define.l Seconds
Define.l Minutes

If OGGFile
  OGGFileTag = taglib_file_tag(OGGFile)
  OGGFileProperties = taglib_file_audioproperties(OGGFile)

  Debug "-- TAG --"
  Debug "Title  > " + PeekS(taglib_tag_title(OGGFileTag))
  Debug "Artist > " + PeekS(taglib_tag_artist(OGGFileTag))
  Debug "Album  > " + PeekS(taglib_tag_album(OGGFileTag))
  Debug "Year   > " + Str(taglib_tag_year(OGGFileTag))
  Debug "Comment> " + PeekS(taglib_tag_comment(OGGFileTag))
  Debug "Track  > " + Str(taglib_tag_track(OGGFileTag))
  Debug "Genre  > " + PeekS(taglib_tag_genre(OGGFileTag))

  Seconds = taglib_audioproperties_length(OGGFileProperties) % 60
  Minutes = (taglib_audioproperties_length(OGGFileProperties) - Seconds) / 60

  Debug "-- AUDIO --"
  Debug "Bitrate    > " + Str(taglib_audioproperties_bitrate(OGGFileProperties))
  Debug "Sample Rate> " + Str(taglib_audioproperties_samplerate(OGGFileProperties))
  Debug "Channels   > " + Str(taglib_audioproperties_channels(OGGFileProperties))
  Debug "Length     > " + Str(Minutes) + ":" + Str(Seconds)

  taglib_tag_free_strings()

  taglib_file_free(OGGFile)
EndIf 