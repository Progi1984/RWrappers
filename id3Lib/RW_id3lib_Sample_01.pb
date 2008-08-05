;================================================================
; Project   id3lib
; Title     Sample_01
; Author    Progi1984
; Date      20/03/08
; Notes     Updating a frame of the MP3 File
;================================================================

XIncludeFile "RW_id3lib_Inc.pb"
EnableExplicit

Global *mp3.ID3Tag
Global *frame.ID3Frame = #Null
Global *field.ID3Field = #Null
Global numbers.l, MemStr.l = AllocateMemory(128), YourComment.s

  *mp3 = ID3Tag_New()
  ID3Tag_Link(*mp3, "Samples\sample_0.mp3")
  ;ID3Tag_Link(*mp3, "Samples\sample_1.mp3")
  ;ID3Tag_Link(*mp3, "Samples\sample_2.mp3")

  ; Count the number of frames
  numbers =ID3Tag_NumFrames(*mp3)
  Debug "Frames Number > "+Str(numbers)
  
  ; Find if a Comment frame exists
  *frame = ID3Tag_FindFrameWithID(*mp3, #ID3FID_COMMENT)
  ; Else create a new one
  If *frame = 0
    *frame = ID3Frame_New()
    ID3Frame_SetId(*frame, #ID3FID_COMMENT)
  Else
    ; Find the content of the Comment frame
    *field = ID3Frame_GetField(*frame, #ID3FN_TEXT)
    ID3Field_GetASCII(*field, MemStr, 128)
    Debug "Comment Before Update > "+PeekS(MemStr)
    Debug "------------"
  EndIf
  
  ; Update the Comment Frame
  YourComment = InputRequester("RW_id3lib", "Comment :", "Comment at "+FormatDate("%dd/%mm/%yyyy %hh:%ii:%ss", Date()))
  *field = ID3Frame_GetField(*frame, #ID3FN_TEXT)
  ID3Field_SetASCII(*field, YourComment)
  ID3Tag_Update(*mp3)
  
  ; Count the number of frames
  numbers =ID3Tag_NumFrames(*mp3)
  Debug "Frames Number > "+Str(numbers)
  
  ; Find the content of the Comment frame
  *field = ID3Frame_GetField(*frame, #ID3FN_TEXT)
  ID3Field_GetASCII(*field, MemStr, 128)
  Debug "Comment After Update > "+PeekS(MemStr)
  Debug "------------"

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 16
; FirstLine = 3
; Folding = -