;================================================================
; Project   LibCurl
; Title     Sample_1
; Author    Progi1984
; Date      19/01/2008
; Notes     Sends a request to a HTTPS server
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

  curl  = curl_easy_init()
fp  = CreateFile(#PB_Any, "Samples\Sample_1_SourceForge.htm")
If curl
  Debug curl_easy_setopt(curl, #CURLOPT_URL, @"https://sourceforge.net/")
  Debug curl_easy_setopt(curl, #CURLOPT_SSL_VERIFYPEER, 0)
  Debug curl_easy_setopt(curl, #CURLOPT_SSL_VERIFYHOST, 0)
  Debug curl_easy_setopt(curl, #CURLOPT_HEADER, 0) 
  Debug curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteFunction())
  res = curl_easy_perform(curl)
  Debug res
  
  WriteString(fp, RW_LibCurl_GetData(), 0)
  CloseFile(fp)
  
  ;always cleanup 
  Debug curl_easy_cleanup(curl)
EndIf

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = -