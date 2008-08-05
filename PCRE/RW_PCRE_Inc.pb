; Documentation
;   Website     http://www.pcre.org/
;   Functions   http://www.adp-gmbh.ch/cpp/regexp/pcre/functions.html
;   Sample 1    http://www.adp-gmbh.ch/cpp/regexp/pcre/test_1.html
XIncludeFile "RW_PCRE_Res.pb"
;{ Imports
  ImportC "pcre.lib"
  ;   DllGetVersion() As "_DllGetVersion"
    RW_pcre_compile(pattern.l, options.l, errptr.l, erroffset.l, tableptr.l) As "_pcre_compile"
  ;   pcre_compile2() As "_pcre_compile2"
    pcre_config(what.l, where.l) As "_pcre_config"
    RW_pcre_copy_named_substring(code.l, subject.l, ovector.l, stringcount.l, stringname.l, buffer.l, buffersize.l) As "_pcre_copy_named_substring"
    RW_pcre_copy_substring(subject.l, ovector.l, stringcount.l, stringnumber.l, buffer.l, buffersize.l) As "_pcre_copy_substring"
  ;   pcre_dfa_exec() As "_pcre_dfa_exec"
    RW_pcre_exec(code.l, extra.l, subject.l, length.l, startoffset.l, options.l, ovector.l, ovecsize.l) As "_pcre_exec"
    RW_pcre_free_substring(stringptr.l) As "_pcre_free_substring"
    pcre_free_substring_list(stringptr.l) As "_pcre_free_substring_list"
    pcre_fullinfo(code.l, extra.l, what.l, where.l) As "_pcre_fullinfo"
    RW_pcre_get_named_substring(code.l, subject.l, ovector.l, stringcount.l, stringname.l, stringptr.l) As "_pcre_get_named_substring"
    RW_pcre_get_stringnumber(code.l, name.l) As "_pcre_get_stringnumber"
  ;   pcre_get_stringtable_entries() As "_pcre_get_stringtable_entries"
    RW_pcre_get_substring(subject.l, ovector.l, stringcount.l, stringnumber.l, stringptr.l) As "_pcre_get_substring"
    RW_pcre_get_substring_list(subject.l, ovector.l, stringcount.l, listptr.l) As "_pcre_get_substring_list"
    pcre_info(code.l, optptr.l, firstcharptr.l) As "_pcre_info"
    pcre_maketables() As "_pcre_maketables"
  ;   pcre_refcount() As "_pcre_refcount"
    RW_pcre_study(code.l, options.l, errptr.l) As "_pcre_study"
    RW_pcre_version() As "_pcre_version"
  ;   regcomp() As "_regcomp"
  ;   regerror() As "_regerror"
  ;   regexec() As "_regexec"
  ;   regfree() As "_regfree"
  EndImport
;}
;{ Procedures
  Procedure pcre_compile(pattern.s, options.l, errptr.l, erroffset.l, tableptr.l)
    ProcedureReturn RW_pcre_compile(@pattern, options.l, errptr.l, erroffset.l, tableptr.l)
  EndProcedure
  Procedure pcre_copy_named_substring(code.l, subject.s, ovector.l, stringcount.l, stringname.s, buffer.l, buffersize.l)
    ProcedureReturn RW_pcre_copy_named_substring(code.l, @subject, ovector.l, stringcount.l, @stringname, buffer.l, buffersize.l)
  EndProcedure
  Procedure pcre_copy_substring(subject.s, ovector.l, stringcount.l, stringnumber.l, buffer.s, buffersize.l)
    ProcedureReturn RW_pcre_copy_substring(@subject, ovector.l, stringcount.l, stringnumber.l, @buffer, buffersize.l)
  EndProcedure
  Procedure pcre_exec(code.l, extra.l, subject.s, length.l, startoffset.l, options.l, ovector.l, ovecsize.l)
    ProcedureReturn RW_pcre_exec(code.l, extra.l, @subject, length.l, startoffset.l, options.l, ovector.l, ovecsize.l)
  EndProcedure
  Procedure pcre_free_substring(stringptr.s)
    ProcedureReturn RW_pcre_free_substring(@stringptr)
  EndProcedure
  Procedure pcre_get_named_substring(code.l, subject.s, ovector.l, stringcount.l, stringname.s, stringptr.l)
    ProcedureReturn RW_pcre_get_named_substring(code.l, @subject, ovector.l, stringcount.l, @stringname, stringptr.l)
  EndProcedure
  Procedure pcre_get_stringnumber(code.l, name.s)
    ProcedureReturn RW_pcre_get_stringnumber(code.l, @name)
  EndProcedure
  Procedure pcre_get_substring(subject.s, ovector.l, stringcount.l, stringnumber.l, stringptr.l)
    ProcedureReturn RW_pcre_get_substring(@subject, ovector.l, stringcount.l, stringnumber.l, stringptr.l)
  EndProcedure
  Procedure pcre_get_substring_list(subject.s, ovector.l, stringcount.l, listptr.l)
    ProcedureReturn RW_pcre_get_substring_list(@subject, ovector.l, stringcount.l, listptr.l)
  EndProcedure
  Procedure pcre_study(code.l, options.l, errptr.l)
    ProcedureReturn RW_pcre_study(code.l, options.l, errptr.l)
  EndProcedure
  Procedure.s pcre_version()
    ProcedureReturn PeekS(RW_pcre_version())
  EndProcedure
;}

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 69
; Folding = AA9