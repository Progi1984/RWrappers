XIncludeFile "RW_gs_Res.pb"


Import "gsdll32.lib"
;   gsdll_revision(a.l, b.l, c.l, d.l) As "_gsdll_revision@16"
;   gsdll_init(a.l, b.l, c.l, d.l) As "_gsdll_init@16"
;   gsdll_execute_begin() As "_gsdll_execute_begin@0"
;   gsdll_execute_cont(a.l, b.l) As "_gsdll_execute_cont@8"
;   gsdll_execute_end() As "_gsdll_execute_end@0"
;   gsdll_exit() As "_gsdll_exit@0"
;   gsdll_lock_device(a.l, b.l) As "_gsdll_lock_device@8"
;   gsdll_copy_dib(a.l) As "_gsdll_copy_dib@4"
;   gsdll_copy_palette(a.l) As "_gsdll_copy_palette@4"
;   gsdll_draw(a.l, b.l, c.l, d.l) As "_gsdll_draw@16"
;   gsdll_get_bitmap_row(a.l, b.l, c.l, d.l, e.l) As "_gsdll_get_bitmap_row@20"
  gsapi_revision(*pr.gsapi_revision_t, len.l) As "_gsapi_revision@8"
  gsapi_new_instance(*pinstance, *caller_handle) As "_gsapi_new_instance@8"
  gsapi_delete_instance(*instance) As "_gsapi_delete_instance@4"
  gsapi_init_with_args(*instance, argc.l, *argv) As "_gsapi_init_with_args@12"
  gsapi_run_string_begin(*instance, user_errors.l, *pexit_code.l) As "_gsapi_run_string_begin@12"
  gsapi_run_string_continue(*instance, str.s, length.l, user_errors.l, *pexit_code.l) As "_gsapi_run_string_continue@20"
  gsapi_run_string_end(*instance, user_errors.l, *pexit_code.l) As "_gsapi_run_string_end@12"
  gsapi_run_string_with_length(*instance, str.s, length.l, user_errors.l, *pexit_code.l) As "_gsapi_run_string_with_length@20"
  gsapi_run_string(*instance, str.s, user_errors.l, *pexit_code.l) As "_gsapi_run_string@16"
  gsapi_run_file(*instance, file_name.s, user_errors.l, *pexit_code.l) As "_gsapi_run_file@16"
  gsapi_exit(*instance) As "_gsapi_exit@4"
  gsapi_set_stdio(*instance, *stdin_fn, *stdout_fn, stderr_fn) As "_gsapi_set_stdio@16"
  gsapi_set_poll(*instance, *poll_fn) As "_gsapi_set_poll@8"
  gsapi_set_display_callback(*instance, *callback) As "_gsapi_set_display_callback@8"
  gsapi_set_visual_tracer(*I) As "_gsapi_set_visual_tracer@4"
EndImport

; 
;    name.s = "alphabet"
; ;    name.s = "annots" ; BUG
; ;    name.s = "chess"
; ;    name.s = "colorcir"
; ;    name.s = "doretree"
; ;    name.s = "escher"
; ;    name.s = "grayalph"
; ;    name.s = "snowflak"
; ;    name.s = "vasarely"
; ;    name.s = "waterfal"
; Procedure ps2pdf(FileName.s)
;   Protected gsargc = 10
;   Protected code.l, code1.l
;   Protected Dim  gsargv.s(gsargc)
;     gsargv(0) = "ps2pdf"
;     gsargv(1) = "-dNOPAUSE"
;     gsargv(2) = "-dBATCH"
;     gsargv(3) = "-dSAFER"
;     gsargv(4) = "-sDEVICE=pdfwrite"
;     gsargv(5) = "-sOutputFile=out_"+FileName+".pdf"
;     gsargv(6) = "-c"
;     gsargv(7) = ".setpdfwrite"
;     gsargv(8) = "-f"
;     gsargv(9) = "Samples\"+FileName+".ps"
;   code = gsapi_new_instance(@minst, #Null)
;   If code < 0
;     Debug "Error : gsapi_new_instance > Error instanciation"
;     ProcedureReturn #False
;   EndIf
; 
; 
;   code = gsapi_init_with_args(minst, gsargc, @gsargv())
;   Debug code
;   code1 = gsapi_exit(minst)
;   If code = 0 And code = #e_Quit
;     code = code1
;   EndIf
; 
;     gsapi_delete_instance(minst);
; 
;     If ((code = 0) And (code = #e_Quit))
; 	    Debug 0
; 	  Else
; 	    Debug 1
; 	  EndIf
;   EndProcedure
;    ps2pdf(name)

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 79
; FirstLine = 36
; Folding = -