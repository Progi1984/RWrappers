;================================================================
; Project   LibCurl
; Title     Sample_0
; Author    Progi1984
; Date      19/01/2008
; Notes     Get the content of a page
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

curl  = curl_easy_init()
fp  = CreateFile(#PB_Any, "Samples\Sample_0_LibCurl.htm")
If curl
  Debug curl_easy_setopt(curl, #CURLOPT_URL, @"curl.haxx.se")
  Debug curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteFunction())
  
  Debug curl_easy_perform(curl)
  Debug curl_easy_cleanup(curl)
  
  WriteString(fp, RW_LibCurl_GetData(), 0)
  CloseFile(fp)
EndIf
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = -