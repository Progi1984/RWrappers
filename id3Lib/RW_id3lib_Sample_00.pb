;================================================================
; Project   id3lib
; Title     Sample_00
; Author    Progi1984
; Date      20/03/08; Notes     Listing tags of a MP3 file
;================================================================

XIncludeFile "RW_id3lib_Inc.pb"
EnableExplicit

Global *mp3.ID3Tag
  *mp3 = ID3Tag_New()
  ID3Tag_Link(*mp3, "Samples\sample_0.mp3")
  ;ID3Tag_Link(*mp3, "Samples\sample_1.mp3")
  ;ID3Tag_Link(*mp3, "Samples\sample_2.mp3")
Global *iter.ID3TagIterator = ID3Tag_CreateIterator(*mp3)
Global *frame.ID3Frame = #Null
Global *field.ID3Field = #Null
Global *frame = ID3TagIterator_GetNext(*iter)
Global id.l, numbers.l, str_l.l, str_s.s


  numbers =ID3Tag_NumFrames(*mp3)
  Debug "Frames Number > "+Str(numbers)
  Debug "------------"
  While *frame <> #Null
    *frame = ID3TagIterator_GetNext(*iter)
    id = ID3Frame_GetID(*frame)
    If id > 0
      Debug "Type     > "+Str(id)
        *field = ID3Frame_GetField(*frame, #ID3FN_TEXT)
        str_l = AllocateMemory(128)
        ID3Field_GetASCII(*field, str_l, 128)
        str_s = PeekS(str_l)
      If id = #ID3FID_CONTENTTYPE
        Debug "Content > "+ ID3_V1GENRE2DESCRIPTION(Val(Mid(str_s,2, Len(str_s)-1)))
      Else
        Debug "Content > "+str_s
      EndIf
      Debug "------------"
    EndIf
  Wend 
  ID3TagIterator_Delete(*iter) 
; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 4
; EnableThread