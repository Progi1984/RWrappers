;================================================================
; Project   LibCurl
; Title     Sample_6
; Author    Progi1984
; Date      28/01/2008
; Notes     Checks if an URL exists
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

Global urls_0.s  = "http://www.non-existant.fr"
Global urls_1.s  = "http://www.developpez.com/"
Global urls_2.s  = "http://php.developpez.com/faq/"
Global curl.l, ct.l

Procedure HTTP_Check_URL(url.s, timeout.l = 10)
  curl_easy_setopt(curl, #CURLOPT_URL, @url)
  curl_easy_setopt(curl, #CURLOPT_TIMEOUT, timeout)
  curl_easy_setopt(curl, #CURLOPT_CONNECTTIMEOUT, timeout)
  curl_easy_setopt(curl, #CURLOPT_NOBODY, #True)
  If Left(url, 8) = "https://"
    curl_easy_setopt(curl, #CURLOPT_SSL_VERIFYPEER, #False)
  EndIf
  res = curl_easy_perform(curl)
  If res <> 0
    ProcedureReturn #False
  EndIf
  
  ret = curl_easy_getinfo(curl, #CURLINFO_RESPONSE_CODE, @ct)
  If ct = 200 Or ct = 301 Or ct = 302
    ProcedureReturn #True
  Else
    ProcedureReturn #False
  EndIf
EndProcedure
  
curl = curl_easy_init()
If curl
  Debug urls_0 + " > " + Str(HTTP_Check_URL(urls_0))
  Debug urls_1 + " > " + Str(HTTP_Check_URL(urls_1))
  Debug urls_2 + " > " + Str(HTTP_Check_URL(urls_2))
EndIf
curl_easy_cleanup(curl)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = u