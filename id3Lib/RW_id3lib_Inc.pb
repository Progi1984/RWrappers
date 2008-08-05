XIncludeFile "RW_id3lib_Res.pb"
ImportC "ID3lib.lib"
  ;- field wrappers
  ID3Field_AddASCII(*field.ID3Field, string.p-ascii) As "_ID3Field_AddASCII@8"
  ID3Field_AddUNICODE(*field.ID3Field, string.p-unicode) As "_ID3Field_AddUNICODE@8"
  ID3Field_Clear(*field.ID3Field) As "_ID3Field_Clear@4"
  ID3Field_FromFile(*field.ID3Field, filename.p-ascii) As "_ID3Field_FromFile@8"
  ID3Field_GetASCII(*field.ID3Field, *buffer, maxChars.l) As "_ID3Field_GetASCII@12"
  ID3Field_GetASCIIItem(*field.ID3Field, *buffer, maxChars.l, itemNum.l) As "_ID3Field_GetASCIIItem@16"
  ID3Field_GetBINARY(*field.ID3Field, *buffer, buffLength.l) As "_ID3Field_GetBINARY@12"
  ID3Field_GetINT(*field.ID3Field) As "_ID3Field_GetINT@4"
  ID3Field_GetNumTextItems(*field.ID3Field) As "_ID3Field_GetNumTextItems@4"
  ID3Field_GetUNICODE(*field.ID3Field, *buffer, maxChars.l) As "_ID3Field_GetUNICODE@12"
  ID3Field_GetUNICODEItem(*field.ID3Field, *buffer.l, maxChars.l, itemNum.l) As "_ID3Field_GetUNICODEItem@16"
  ID3Field_SetASCII(*field.ID3Field, string.p-ascii) As "_ID3Field_SetASCII@8"
  ID3Field_SetBINARY(*field.ID3Field, *data_, size.l) As "_ID3Field_SetBINARY@12"
  ID3Field_SetINT(*field.ID3Field, data_.l) As "_ID3Field_SetINT@8"
  ID3Field_SetUNICODE(*field.ID3Field, string.p-unicode) As "_ID3Field_SetUNICODE@8"
  ID3Field_Size(*field.ID3Field) As "_ID3Field_Size@4"
  ID3Field_ToFile(*field.ID3Field, filename.p-ascii) As "_ID3Field_ToFile@8"
  ;-frame wrappers
  ID3Frame_Clear(*frame.ID3Frame) As "_ID3Frame_Clear@4"
  ID3Frame_Delete(*frame.ID3Frame) As "_ID3Frame_Delete@4"
  ID3Frame_GetCompression(*frame.ID3Frame) As "_ID3Frame_GetCompression@4"
  ID3Frame_GetField(*frame.ID3Frame, name.l) As "_ID3Frame_GetField@8"
  ID3Frame_GetID(*frame.ID3Frame) As "_ID3Frame_GetID@4"
  ID3Frame_New() As "_ID3Frame_New@0"
  ID3Frame_NewID(id.l) As "_ID3Frame_NewID@4"
  ID3Frame_SetCompression(*frame.ID3Frame, comp.l) As "_ID3Frame_SetCompression@8"
  ID3Frame_SetID(*frame.ID3Frame, id.l) As "_ID3Frame_SetID@8"
  ID3TagConstIterator_Delete(*iter.ID3TagConstIterator) As "_ID3TagConstIterator_Delete@4"
  ID3TagConstIterator_GetNext(*iter.ID3TagConstIterator) As "_ID3TagConstIterator_GetNext@4"
  ;-tag wrappers
  ID3TagIterator_Delete(*iter.ID3TagIterator) As "_ID3TagIterator_Delete@4"
  ID3TagIterator_GetNext(*iter.ID3TagIterator) As "_ID3TagIterator_GetNext@4"
  ID3Tag_AddFrame(*tag.ID3Tag, *frame.ID3Frame) As "_ID3Tag_AddFrame@8"
  ID3Tag_AddFrames(*tag.ID3Tag, *frames.ID3Frame, num.l) As "_ID3Tag_AddFrames@12"
  ID3Tag_AttachFrame(*tag.ID3Tag, *frame.ID3Frame) As "_ID3Tag_AttachFrame@8"
  ID3Tag_Clear(*tag.ID3Tag) As "_ID3Tag_Clear@4"
  ID3Tag_CreateConstIterator(*tag.ID3Tag) As "_ID3Tag_CreateConstIterator@4"
  ID3Tag_CreateIterator(*tag.ID3Tag) As "_ID3Tag_CreateIterator@4"
  ID3Tag_Delete(*tag.ID3Tag) As "_ID3Tag_Delete@4"
  ID3Tag_FindFrameWithASCII(*tag.ID3Tag, id.l, fld.l, data_.p-ascii) As "_ID3Tag_FindFrameWithASCII@16"
  ID3Tag_FindFrameWithID(*tag.ID3Tag, id.l) As "_ID3Tag_FindFrameWithID@8"
  ID3Tag_FindFrameWithINT(*tag.ID3Tag, id.l, fld.l, data_.l) As "_ID3Tag_FindFrameWithINT@16"
  ID3Tag_FindFrameWithUNICODE(*tag.ID3Tag, id.l, fld.l, data_.p-unicode) As "_ID3Tag_FindFrameWithUNICODE@16"
  ID3Tag_HasChanged(*tag.ID3Tag) As "_ID3Tag_HasChanged@4"
  ID3Tag_HasTagType(*tag.ID3Tag, tt.l) As "_ID3Tag_HasTagType@8"
  ID3Tag_Link(*tag.ID3Tag, filename.p-ascii) As "_ID3Tag_Link@8"
  ID3Tag_LinkWithFlags(*tag.ID3Tag, filename.p-ascii, flags.l) As "_ID3Tag_LinkWithFlags@12"
  ID3Tag_New() As "_ID3Tag_New@0"
  ID3Tag_NumFrames(*tag.ID3Tag) As "_ID3Tag_NumFrames@4"
  ID3Tag_Parse(*tag.ID3Tag, *header, *buffer) As "_ID3Tag_Parse@12"
  ID3Tag_RemoveFrame(*tag.ID3Tag, *frame.ID3Frame) As "_ID3Tag_RemoveFrame@8"
  ID3Tag_SetExtendedHeader(*tag.ID3Tag, ext.l) As "_ID3Tag_SetExtendedHeader@8"
  ID3Tag_SetPadding(*tag.ID3Tag, pad.l) As "_ID3Tag_SetPadding@8"
  ID3Tag_SetUnsync(*tag.ID3Tag, unsync.l) As "_ID3Tag_SetUnsync@8"
  ID3Tag_Strip(*tag.ID3Tag, ulTagFlags.l) As "_ID3Tag_Strip@8"
  ID3Tag_Update(*tag.ID3Tag) As "_ID3Tag_Update@4"
  ID3Tag_UpdateByTagType(*tag.ID3Tag, tag_type.l) As "_ID3Tag_UpdateByTagType@8"
EndImport

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 15
; FirstLine = 13
; Folding = -