XIncludeFile "RW_TagLib_Res.pb"
Import "tag.lib"
EndImport
ImportC "tag_c.lib"
  taglib_set_strings_unicode(unicode.bool) As "_taglib_set_strings_unicode"
  taglib_set_string_management_enabled(management.bool) As "_taglib_set_string_management_enabled"
  taglib_file_new.l(filename.s) As "_taglib_file_new"
  taglib_file_new_type.l(filename.s, type.TagLib_File_Type) As "_taglib_file_new_type"
  taglib_file_free(*file.TagLib_File) As "_taglib_file_free"
  taglib_file_is_valid.bool(*file.TagLib_File) As "_taglib_file_is_valid"
  taglib_file_tag.l(*file.TagLib_File) As "_taglib_file_tag"
  taglib_file_audioproperties.l(*file.TagLib_File) As "_taglib_file_audioproperties"
  taglib_file_save.bool(*file.TagLib_File) As "_taglib_file_save"
  taglib_tag_year(*tag.TagLib_Tag) As "_taglib_tag_year"
  taglib_tag_track(*tag.TagLib_Tag) As "_taglib_tag_track"
  taglib_tag_set_title(*tag.TagLib_Tag, title.s) As "_taglib_tag_set_title"
  taglib_tag_set_artist(*tag.TagLib_Tag, artist.s) As "_taglib_tag_set_artist"
  taglib_tag_set_album(*tag.TagLib_Tag, album.s) As "_taglib_tag_set_album"
  taglib_tag_set_comment(*tag.TagLib_Tag, comment.s) As "_taglib_tag_set_comment"
  taglib_tag_set_genre(*tag.TagLib_Tag, genre.s) As "_taglib_tag_set_genre"
  taglib_tag_set_year(*tag.TagLib_Tag, year.l) As "_taglib_tag_set_year"
  taglib_tag_set_track(*tag.TagLib_Tag, track.l) As "_taglib_tag_set_track"
  taglib_audioproperties_length(*audioProperties.TagLib_AudioProperties) As "_taglib_audioproperties_length"
  taglib_audioproperties_bitrate(*audioProperties.TagLib_AudioProperties) As "_taglib_audioproperties_bitrate"
  taglib_audioproperties_samplerate(*audioProperties.TagLib_AudioProperties) As "_taglib_audioproperties_samplerate"
  taglib_audioproperties_channels(*audioProperties.TagLib_AudioProperties) As "_taglib_audioproperties_channels"
  taglib_id3v2_set_default_text_encoding(encoding.TagLib_ID3v2_Encoding) As "_taglib_id3v2_set_default_text_encoding"
  taglib_tag_title(*tag.TagLib_Tag) As "_taglib_tag_title"
  taglib_tag_artist(*tag.TagLib_Tag) As "_taglib_tag_artist"
  taglib_tag_album(*tag.TagLib_Tag) As "_taglib_tag_album"
  taglib_tag_comment(*tag.TagLib_Tag) As "_taglib_tag_comment"
  taglib_tag_genre(*tag.TagLib_Tag) As "_taglib_tag_genre"
  taglib_tag_free_strings() As "_taglib_tag_free_strings"
EndImport