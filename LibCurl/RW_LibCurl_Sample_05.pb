;================================================================
; Project   LibCurl
; Title     Sample_5
; Author    Progi1984
; Date      19/01/2008
; Notes     Send a HTTP request : POST
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"


Global curl, res.l

curl  = curl_easy_init()
fp    = OpenFile(#PB_Any, "Samples\Sample_5_POST_Return.html")
If curl
  ; First set the URL that is about To receive our POST. This URL can
  ;   just As well be a https:// URL If that is what should receive the Data. 
  Debug curl_easy_setopt(curl, #CURLOPT_URL, @"http://rootslabs.free.fr/useful/RW_LibCurl_Post.php")
  
  ; Now specify the POST Data 
  Debug curl_easy_setopt(curl, #CURLOPT_POSTFIELDS, @"name=daniel&project=curl")
  Debug curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteFunction())
  
  ; Perform the request, res will get the Return code 
  res = curl_easy_perform(curl)
  Debug res
  
  WriteString(fp, RW_LibCurl_GetData())
  CloseFile(fp)
  ; always cleanup 
  Debug curl_easy_cleanup(curl)
EndIf
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = -