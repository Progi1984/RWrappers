;{ Structures }
  Structure Q_Entry
    name.s
    value.s
    *next_.Q_Entry
  EndStructure
  Structure Q_CGIenv
    auth_type.s
    content_length.s
    content_type.s
    document_root.s
    gateway_interface.s
    http_accept.s
    http_accept_encoding.s
    http_accept_language.s
    http_connection.s
    http_cookie.s
    http_host.s
    http_referer.s
    http_user_agent.s
    query_string.s
    remote_addr.s
    remote_host.s
    remote_port.s
    remote_user.s
    request_method.s
    request_uri.s
    script_filename.s
    script_name.s
    server_admin.s
    server_name.s
    server_port.s
    server_protocol.s
    server_software.s
    server_signature.s
    unique_id.s
  
    ;Miscellaneous Informations Supported by qDecoder
    year.l
    mon.l
    day.l
    hour.l
    min.l
    sec.l
  EndStructure
  Structure MD5_CTX
    state.l[4]          ; state (ABCD) 
    count.l[2]          ; number of bits, modulo 2^64 (lsb first)
    buffer.s{64}        ; input buffer
  EndStructure
;}
;{ Macros }
  Macro qfValue	
    qsValue
  EndMacro
  Macro qfiValue
    qsiValue
  EndMacro
  Macro qfValueFirst
    qsValueFirst
  EndMacro
  Macro qfValueNext
    qsValueNext
  EndMacro
  Macro qfPrint	
    qsPrint
  EndMacro
  Macro qfFree
    qsFree
  EndMacro
;}
