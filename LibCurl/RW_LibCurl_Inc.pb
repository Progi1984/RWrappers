XIncludeFile "RW_LibCurl_Res.pb"

Macro DQuote
  "
EndMacro
CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Linux
    Macro SymbolName(Val)
      DQuote#Val#DQuote
    EndMacro
    #LibCurl_ImportLib = "/usr/lib/libcurl.so.3"
    #LibCurl_SeparatorDir = "/"
  CompilerCase #PB_OS_Windows
    Macro SymbolName(Val)
      DQuote _#Val#DQuote
    EndMacro
    #LibCurl_ImportLib = "LibCurl.lib"
    #LibCurl_SeparatorDir = "\"
CompilerEndSelect

;- Imports
ImportC #LibCurl_ImportLib
  curl_easy_cleanup(handle.l) As SymbolName(curl_easy_cleanup)
  curl_easy_duphandle(handle.l) As SymbolName(curl_easy_duphandle)
  curl_easy_getinfo(curl.l, info_type.l, info.l) As SymbolName(curl_easy_getinfo)
  curl_easy_init() As SymbolName(curl_easy_init)
  curl_easy_perform(handle.l) As SymbolName(curl_easy_perform)
  curl_easy_recv(*curl, *buffer, buflen.l,*n) As SymbolName(curl_easy_recv)
  curl_easy_reset(handle.l) As SymbolName(curl_easy_reset)
  curl_easy_send(*curl, *buffer, buflen.l, *n) As SymbolName(curl_easy_send)
  curl_easy_setopt(handle.l, option.l, parameter.l) As SymbolName(curl_easy_setopt)
  curl_easy_strerror(errornum.l) As SymbolName(curl_easy_strerror)
  curl_escape(url.l, length.l) As SymbolName(curl_escape)
  curl_formadd(firstitem.l, lastitem.l) As SymbolName(curl_formadd)
  curl_formfree(form.l) As SymbolName(curl_formfree)
  curl_formget(*form.curl_httppost, *arg, append) As SymbolName(curl_formget)
  curl_free(ptr.l) As SymbolName(curl_free)
  curl_getdate(datestring.l, now.l) As SymbolName(curl_getdate)
  curl_getenv(name.l) As SymbolName(curl_getenv)
  curl_global_cleanup() As SymbolName(curl_global_cleanup)
  curl_global_init(flags.l) As SymbolName(curl_global_init)
  curl_global_init_mem(flags.l, m.l, f.l, r.l, s.l, c.l) As SymbolName(curl_global_init_mem)
  curl_mprintf(format.l) As SymbolName(curl_mprintf)
  curl_mfprintf(fd.l, format.l) As SymbolName(curl_mfprintf)
  curl_msprintf(buffer.l, format.l) As SymbolName(curl_msprintf)
  curl_msnprintf(buffer.l, maxlength.l, format.l) As SymbolName(curl_msnprintf)
  curl_mvprintf(format.l, args.l) As SymbolName(curl_mvprintf)
  curl_mvfprintf(fd.l, format.l, args.l) As SymbolName(curl_mvfprintf)
  curl_mvsprintf(buffer.l, format.l, args.l) As SymbolName(curl_mvsprintf)
  curl_mvsnprintf(buffer.l, maxlength.l, format.l, args.l) As SymbolName(curl_mvsnprintf)
  curl_maprintf(format.l) As SymbolName(curl_maprintf)
  curl_mvaprintf(format.l, args.l) As SymbolName(curl_mvaprintf)
  curl_multi_add_handle(multi_handle.l, easy_handle.l) As SymbolName(curl_multi_add_handle)
  curl_multi_assign(*multi_handle, sockfd.l, *sockp) As SymbolName(curl_multi_assign)
  curl_multi_cleanup(multi_handle.l) As SymbolName(curl_multi_cleanup)
  curl_multi_fdset(multi_handle.l, read_fd_set.l, write_fd_set.l, exc_fd_set.l, max_fd.l) As SymbolName(curl_multi_fdset)
  curl_multi_info_read(multi_handle.l, msgs_in_queue.l) As SymbolName(curl_multi_info_read)
  curl_multi_init() As SymbolName(curl_multi_init)
  curl_multi_perform(multi_handle.l, running_handles.l) As SymbolName(curl_multi_perform)
  curl_multi_remove_handle(multi_handle.l, easy_handle.l) As SymbolName(curl_multi_remove_handle)
  curl_multi_strerror(errornum.l) As SymbolName(curl_multi_strerror)
  curl_multi_socket(*multi_handle, s.l, *running_handles) As SymbolName(curl_multi_socket)
  curl_multi_socket_action(*multi_handle, s.l, ev_bitmask.l, *running_handles) As SymbolName(curl_multi_socket_action)
  curl_multi_socket_all(*multi_handle, *running_handles) As SymbolName(curl_multi_socket_all)
  curl_share_cleanup(share_handle.l) As SymbolName(curl_share_cleanup)
  curl_share_init() As SymbolName(curl_share_init)
  curl_share_setopt(share.l, option.l, parameter.l) As SymbolName(curl_share_setopt)
  curl_share_strerror(errornum.l) As SymbolName(curl_share_strerror)
  curl_slist_append(slist.l, string.p-utf8) As SymbolName(curl_slist_append)
  curl_slist_free_all(slist.l) As SymbolName(curl_slist_free_all)
  curl_strequal(str1.l, str2.l) As SymbolName(curl_strequal)
  curl_strnequal(str1.l, str2.l, len.l) As SymbolName(curl_strnequal)
  curl_unescape(url.l, length.l) As SymbolName(curl_unescape)
  curl_version() As SymbolName(curl_version)
  curl_version_info(type.l) As SymbolName(curl_version_info)
EndImport;}

ProcedureC  RW_LibCurl_WriteFunction(*ptr, Size, NMemB, *Stream)
  ;retreives utf-8/ascii encoded data
  Protected SizeProper.l  = Size & 255
  Protected NMemBProper.l = NMemB
  Protected MyDataS.s
  Shared ReceivedData.s
  
  MyDataS = PeekS(*ptr, SizeProper * NMemBProper)
  ReceivedData + MyDataS
  ;Debug "> " + MyDataS
  ;Debug "# " + Str(Len(MyDataS))
  ;Debug "@ " + Str(Len(ReceivedData))
  ProcedureReturn SizeProper * NMemBProper
EndProcedure
Procedure.s RW_LibCurl_GetData()
  Shared ReceivedData.s
  ProcedureReturn ReceivedData
EndProcedure
