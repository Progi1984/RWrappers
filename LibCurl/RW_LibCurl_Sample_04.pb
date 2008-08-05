;================================================================
; Project   LibCurl
; Title     Sample_4
; Author    Progi1984
; Date      19/01/2008
; Notes     Get the Content-Type from the recent transfer
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

Global curl.l, res.l, ct.l

curl = curl_easy_init()
If curl
  Debug curl_easy_setopt(curl, #CURLOPT_URL, @"curl.haxx.se")
  Debug curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteFunction())
  
  res = curl_easy_perform(curl)
  Debug res
  
  If #CURLE_OK = res
    ; ask For the content-type 
    res = curl_easy_getinfo(curl, #CURLINFO_CONTENT_TYPE, @ct)
    If #CURLE_OK = res And ct
      Debug "> Content-Type: "+PeekS(ct,-1,#PB_UTF8)
    EndIf
  EndIf
  
  ; always cleanup 
  Debug curl_easy_cleanup(curl)
EndIf


; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = -