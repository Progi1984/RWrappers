;================================================================
; Project   LibCurl
; Title     Sample_0
; Author    Progi1984
; Date      19/01/2008
; Notes     Get the content of a page
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

curl  = curl_easy_init()
fp  = CreateFile(#PB_Any, "Samples"+#LibCurl_SeparatorDir+"Sample_0_LibCurl.htm")
If curl
  ; Using with a proxy
  ; Debug curl_easy_setopt(curl, #CURLOPT_HTTPPROXYTUNNEL, #True)
  ; Debug curl_easy_setopt(curl, #CURLOPT_PROXY, @"proxy_ip:proxy_port")
  ; Debug curl_easy_setopt(curl, #CURLOPT_PROXYUSERPWD, @"proxy_login:proxy_password"); 

  Debug curl_easy_setopt(curl, #CURLOPT_URL, @"curl.haxx.se")
  Debug curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteStrFunction())
  
  Debug curl_easy_perform(curl)
  Debug curl_easy_cleanup(curl)
  
  WriteString(fp, RW_LibCurl_GetString(), 0)
  CloseFile(fp)
EndIf