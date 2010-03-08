;================================================================
; Project   LibCurl
; Title     Sample_8
; Author    Progi1984
; Date      25/02/2010
; Notes     Use Curl_Multi
;================================================================

XIncludeFile "RW_LibCurl_Inc.pb"

; Functions for getting content of pages
ProcedureC  RW_LibCurl_WriteStrFunctionHTTP1(*ptr, Size, NMemB, *Stream)
  ;retreives utf-8/ascii encoded data
  Protected SizeProper.l  = Size & 255
  Protected NMemBProper.l = NMemB
  Protected MyDataS.s
  Shared ReceivedDataHTTP1.s
  
  MyDataS = PeekS(*ptr, SizeProper * NMemBProper)
  ReceivedDataHTTP1 + MyDataS
  Debug "HTTP1>> " + MyDataS
  ProcedureReturn SizeProper * NMemBProper
EndProcedure
ProcedureC  RW_LibCurl_WriteStrFunctionHTTP2(*ptr, Size, NMemB, *Stream)
  ;retreives utf-8/ascii encoded data
  Protected SizeProper.l  = Size & 255
  Protected NMemBProper.l = NMemB
  Protected MyDataS.s
  Shared ReceivedDataHTTP2.s
  
  MyDataS = PeekS(*ptr, SizeProper * NMemBProper)
  ReceivedDataHTTP2 + MyDataS
  Debug "HTTP2>> " + MyDataS
  ProcedureReturn SizeProper * NMemBProper
EndProcedure

#NbTransfers = 2   ; Number of simultaneous transfers
Global Dim dimhCurl.l(#NbTransfers)
Global hMCurl.l
Global lStillRunning.l
Global lInc.l
Global lMsgLeft.l
Global *msg.CurlMsg

Debug "Init > START"
; Allocate one CURL handle per transfer
For lInc = 0 To #NbTransfers -1
  dimhCurl(lInc) = curl_easy_init()
Next

; define informations about HTTP transferts
curl_easy_setopt(dimhCurl(0), #CURLOPT_HTTPPROXYTUNNEL, #True)
curl_easy_setopt(dimhCurl(0), #CURLOPT_PROXY, @"PROXY_IP:PROXY_PORT")
curl_easy_setopt(dimhCurl(0), #CURLOPT_PROXYUSERPWD, @"PROXY_USERNAME:PROXY_PASSWORD")
curl_easy_setopt(dimhCurl(0), #CURLOPT_URL, @"www.purebasic.fr")
curl_easy_setopt(dimhCurl(0), #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteStrFunctionHTTP1())

curl_easy_setopt(dimhCurl(1), #CURLOPT_HTTPPROXYTUNNEL, #True)
curl_easy_setopt(dimhCurl(1), #CURLOPT_PROXY, @"PROXY_IP:PROXY_PORT")
curl_easy_setopt(dimhCurl(1), #CURLOPT_PROXYUSERPWD, @"PROXY_USERNAME:PROXY_PASSWORD")
curl_easy_setopt(dimhCurl(1), #CURLOPT_URL, @"www.sqlite.org")
curl_easy_setopt(dimhCurl(1), #CURLOPT_WRITEFUNCTION, @RW_LibCurl_WriteStrFunctionHTTP2())

; initialize a multi stack
hMCurl = curl_multi_init()
; add the individual transfers
For lInc = 0 To #NbTransfers -1
  curl_multi_add_handle(hMCurl, dimhCurl(lInc))
Next
Debug "Init > END"

; we start some action by calling perform right away
Repeat
Until curl_multi_perform(hMCurl, @lStillRunning) <> #CURLM_CALL_MULTI_PERFORM

While lStillRunning
  Define.timeval timeout
  Define.l rc, lMaxfd
  Define.fd_set fdread
  Define.fd_set fdwrite
  Define.fd_set fdexcep
  ZeroMemory_(@fdread, SizeOf(fd_set))
  ZeroMemory_(@fdwrite, SizeOf(fd_set))
  ZeroMemory_(@fdexcep, SizeOf(fd_set))
  ; set a suitable timeout to play around with
  timeout\tv_sec = 1
  timeout\tv_usec = 0
  ; get file descriptors from the transfers
  curl_multi_fdset(hMCurl, @fdread, @fdwrite, @fdexcep, @lMaxfd)
  If lMaxfd > - 1
    rc = select_(lMaxfd + 1, @fdread, @fdwrite, @fdexcep, @timeout)
    Select rc
      Case -1 : Debug "select error"  
      Case 0  : Debug "timeout, do something else"
      Default ; one or more of curl's file descriptors say there's data to read or write
        Repeat
        Until curl_multi_perform(hMCurl, @lStillRunning) <> #CURLM_CALL_MULTI_PERFORM
    EndSelect
  EndIf
Wend

; See how the transfers went
*msg = curl_multi_info_read(hMCurl, @lMsgLeft)
Repeat 
  If *msg > 0
    If *msg\msg = #CURLMSG_DONE
      Define.l lIndex, lFound
      lIndex = 0
      lFound = 0
  
      ; Find out which handle this message is about
      For lIndex = 0 To #NbTransfers - 1
        lFound = (*msg\easy_handle = dimhCurl(lIndex))
        If lFound
          Select lIndex
            Case 0
              Debug "HTTP1 transfer completed with status " + Str(*msg\result)
            Case 1
              Debug "HTTP2 transfer completed with status " + Str(*msg\result)
          EndSelect
        EndIf
      Next
    EndIf
  EndIf
Until *msg <> curl_multi_info_read(hMCurl, @lMsgLeft)

curl_multi_cleanup(hMCurl)
; Free the CURL handles
For lInc = 0 To #NbTransfers -1
  curl_easy_cleanup(dimhCurl(lInc))
Next
; IDE Options = PureBasic 4.40 (Windows - x86)
; CursorPosition = 59
; FirstLine = 12
; Folding = 9-