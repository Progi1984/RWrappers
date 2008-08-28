#gs_error_unknownerror      = -1	; unknown error 
#gs_error_interrupt         = -6
#gs_error_invalidaccess     = -7
#gs_error_invalidfileaccess = -9
#gs_error_invalidfont       = -10
#gs_error_ioerror           = -12
#gs_error_limitcheck        = -13
#gs_error_nocurrentpoint    = -14
#gs_error_rangecheck        = -15
#gs_error_typecheck         = -20
#gs_error_undefined         = -21
#gs_error_undefinedfilename = -22
#gs_error_undefinedresult   = -23
#gs_error_VMerror           = -25
#gs_error_unregistered      = -28

#gs_error_hit_detected      = -99

#gs_error_Fatal             = -100

Macro display_callback
  display_callback_s
EndMacro

Structure gsapi_revision_t
  product.l
  copyright.l
  revision.l
  revisiondate.l
EndStructure


#e_unknownerror = -1	; unknown error 
#e_dictfull = -2
#e_dictstackoverflow = -3
#e_dictstackunderflow = -4
#e_execstackoverflow = -5
#e_interrupt = -6
#e_invalidaccess = -7
#e_invalidexit = -8
#e_invalidfileaccess = -9
#e_invalidfont = -10
#e_invalidrestore = -11
#e_ioerror = -12
#e_limitcheck = -13
#e_nocurrentpoint = -14
#e_rangecheck = -15
#e_stackoverflow = -16
#e_stackunderflow = -17
#e_syntaxerror = -18
#e_timeout = -19
#e_typecheck = -20
#e_undefined = -21
#e_undefinedfilename = -22
#e_undefinedresult = -23
#e_unmatchedmark = -24
#e_VMerror = -25		; must be the last Level 1 error 

Macro LEVEL1_ERROR_NAMES
 "unknownerror", "dictfull", "dictstackoverflow", "dictstackunderflow", "execstackoverflow", "interrupt", "invalidaccess", "invalidexit", "invalidfileaccess", "invalidfont", "invalidrestore", "ioerror", "limitcheck", "nocurrentpoint", "rangecheck", "stackoverflow", "stackunderflow", "syntaxerror", "timeout", "typecheck", "undefined", "undefinedfilename", "undefinedresult", "unmatchedmark", "VMerror"
EndMacro

	; ------ Additional Level 2 errors (also in DPS ------ 

#e_configurationerror = -26
#e_undefinedresource = -27
#e_unregistered = -28

Macro LEVEL2_ERROR_NAMES
 "configurationerror", "undefinedresource", "unregistered"
EndMacro
	; ------ Additional DPS errors ------ 

#e_invalidcontext = -29
; invalidid is For the Next DPS extension. 
#e_invalidid = -30

Macro DPS_ERROR_NAMES
 "invalidcontext", "invalidid"
EndMacro
Macro ERROR_NAMES
 LEVEL1_ERROR_NAMES, LEVEL2_ERROR_NAMES, DPS_ERROR_NAMES
EndMacro
	; ------ Pseudo-errors used internally ------ 

;
; Internal code For a fatal error.
; gs_interpret also returns this For a .quit With a positive exit code.
 
#e_Fatal = -100

;
; Internal code For the .quit operator.
; The real quit code is an integer on the operand stack.
; gs_interpret returns this only For a .quit With a zero exit code.
 
#e_Quit = -101

;
; Internal code For a normal exit from the interpreter.
; Do Not use outside of interp.c.
 
#e_InterpreterExit = -102

;
; Internal code that indicates that a Procedure has been stored in the
; remap_proc of the graphics state, And should be called before retrying
; the current token.  This is used For color remapping involving a call
; back into the interpreter -- inelegant, but effective.
 
#e_RemapColor = -103

;
; Internal code To indicate we have underflowed the top block
; of the e-stack.
 
#e_ExecStackUnderflow = -104

;
; Internal code For the vmreclaim operator With a positive operand.
; We need To handle this As an error because otherwise the interpreter
; won't reload enough of its state when the operator returns.
 
#e_VMreclaim = -105

;
; Internal code For requesting more input from run_string.
 
#e_NeedInput = -106

;
; Internal code For a normal exit when usage info is displayed.
; This allows Window versions of Ghostscript To pause Until
; the message can be Read.
 
#e_Info = -110

;
; which error codes require re-executing the current object.
 
Macro ERROR_IS_INTERRUPT(ecode)
  (ecode = #e_interrupt And ecode = #e_timeout)
EndMacro
  
; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 26
; FirstLine = 5
; Folding = --
; EnableUnicode