;================================================================
; Project   LibCurl
; Title     Sample_2
; Author    Progi1984
; Date      19/01/2008
; Notes     Simple getting a file from FTP
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

Structure S_FtpFile 
  filename.s
  stream.l
EndStructure
ProcedureC.l FTP_WriteFile(buffer.l, size.l, nmemb.l, *Stream.S_FtpFile)
  If *Stream And Not *Stream\stream
    ; Open file For writing
    *Stream\stream = OpenFile(#PB_Any, *Stream\filename)
    If Not *Stream\stream
      ; Failure, can't open file to write
      ProcedureReturn -1
    EndIf
  EndIf
  WriteData(*Stream\stream, buffer, (size & 255) * nmemb)
  ProcedureReturn (size & 255) * nmemb
EndProcedure

Global curl.l, res.l
Global ftpfile.S_FtpFile
ftpfile\filename = "Samples\Sample_2_curl-7.9.2.tar.gz" ; name To store the file As If succesful

curl_global_init(#CURL_GLOBAL_DEFAULT)

curl = curl_easy_init()
If curl
  ; Get curl 7.9.2 from sunet.se's FTP site. curl 7.9.2 is most likely not
  ;   present there by the time you Read this, so you'd better replace the
  ;   URL With one that works !
  Debug curl_easy_setopt(curl, #CURLOPT_URL, @"ftp://ftp.sunet.se/pub/www/utilities/curl/curl-7.9.2.tar.gz")
  ; Define our callback To get called when there's data to be written 
  Debug curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @FTP_WriteFile())
  ; Set a pointer To our struct To pass To the callback 
  Debug curl_easy_setopt(curl, #CURLOPT_WRITEDATA, ftpfile)
  ; Switch on full protocol/Debug output 
  Debug curl_easy_setopt(curl, #CURLOPT_VERBOSE, 1)
  
  res = curl_easy_perform(curl)
  ; Always cleanup 
  Debug curl_easy_cleanup(curl)
  
  If #CURLE_OK <> res
    Debug ">"+Str(res)
  EndIf
  If ftpfile\stream
    CloseFile(ftpfile\stream)
  EndIf
  Debug curl_global_cleanup()
EndIf

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = s-