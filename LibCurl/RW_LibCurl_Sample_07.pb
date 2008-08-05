;================================================================
; Project   LibCurl
; Title     Sample_7
; Author    Progi1984
; Date      28/01/2008
; Notes     Read the listing of the FTP root directory 
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

Global FileList.s
Procedure Curl_FTP_list(ftp_url.s,login.s, mdp.s, timeout.l = 10)
  url.s = "ftp://"+login+":"+mdp+"@"+ftp_url
  curl = curl_easy_init()
  If curl
    curl_easy_setopt(curl, #CURLOPT_URL, @url)
    curl_easy_setopt(curl, #CURLOPT_TIMEOUT, timeout.l)
    curl_easy_setopt(curl, #CURLOPT_CONNECTTIMEOUT, timeout.l)
    curl_easy_setopt(curl, #CURLOPT_FTPLISTONLY, #True)
    curl_easy_setopt(curl, #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteFunction())
    res = curl_easy_perform(curl)
    curl_easy_cleanup(curl)
    If res <> #False
      ProcedureReturn #False;
    Else
      FileList = ReplaceString(RW_LibCurl_GetData(), Chr(13)+Chr(10),"-")
      ProcedureReturn #True
    EndIf
  Else
    ProcedureReturn #False
  EndIf
EndProcedure

fichiers = Curl_FTP_list("ftp_url", "login","mdp");
If fichiers = #False
  Debug "La connexion n'a pu être établie"
Else
  For i = 1 To CountString(FileList, "-")
    If GetExtensionPart(StringField(FileList, i, "-")) =""
      Debug "["+StringField(FileList, i, "-")+"]"
    Else
      Debug StringField(FileList, i, "-")
    EndIf
  Next
EndIf
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 8
; Folding = +-