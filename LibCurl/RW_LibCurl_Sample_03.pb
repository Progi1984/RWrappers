;================================
; Project   LibCurl
; Title     Sample_3
; Author    Progi1984
; Date      19/01/2008
; Notes     Get the response strings from the FTP server
;================================

XIncludeFile "RW_LibCurl_Inc.pb"

ProcedureC.l Write_ResponseFile(*ptr, size.l, nmemb.l, *DataStore)
  ProcedureReturn WriteData(*DataStore, *ptr, size & 255 * nmemb)
EndProcedure
ProcedureC.l Write_FTPFile(*ptr, size.l, nmemb.l, *DataStore)
  ProcedureReturn WriteData(*DataStore, *ptr, size & 255 * nmemb)
EndProcedure

Global curl.l, res.l
Global ftpfile.l, respfile.l

; local file name To store the file As 
ftpfile = OpenFile(#PB_Any, "Samples\Sample_3_ftp-list.txt")

; local file name To store the FTP server's response lines in 
respfile = OpenFile(#PB_Any, "Samples\Sample_3_ftp-responses.txt")

curl = curl_easy_init()
If curl
  ; Get a file listing from sunet 
  curl_easy_setopt(curl, #CURLOPT_URL, @"ftp://ftp.sunet.se/")
  curl_easy_setopt(curl, #CURLOPT_WRITEDATA, ftpfile)
  curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @Write_FTPFile())
  ; If you intend To use this on windows With a libcurl DLL, you must use
  ;  CURLOPT_WRITEFUNCTION As well 
  curl_easy_setopt(curl, #CURLOPT_HEADERFUNCTION, @Write_ResponseFile())
  curl_easy_setopt(curl, #CURLOPT_WRITEHEADER, respfile)
  res = curl_easy_perform(curl)
  Debug res
  ; always cleanup 
  curl_easy_cleanup(curl)
EndIf

CloseFile(ftpfile) ; close the local file 
CloseFile(respfile) ; close the response file 

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = 9