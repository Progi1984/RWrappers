XIncludeFile "RW_PCRE_Inc.pb"

Debug "Version : "+pcre_version()
Debug "---------------------------------------------------"

#OVECCOUNT = 30 ; should be a multiple of 3
Global str.s = "regular expressions=very cool"
Global Dim ovector.l(#OVECCOUNT)

  re = pcre_compile ("([^=]*)=(.*)", 0, @error, @erroroffset,0)
                    ; the pattern 
                    ; Default options 
                    ; For error message 
                    ; For error offset 
                    ; use default character tables 
  If re = 0
    Debug "pcre_compile failed (offset: "+Str(erroffset)+"), "+Str(error)
    End
  EndIf 

  rc = pcre_exec(re, 0, str, Len(str), 0,0,@ovector(), #OVECCOUNT)
                ; the compiled pattern 
                ; no extra Data - pattern was Not studied 
                ; the string To match 
                ; the length of the string 
                ; start at offset 0 in the subject 
                ; Default options 
                ; output vector For substring information 
                ; number of elements in the output vector 
  If rc < 0
    Select rc
      Case #PCRE_ERROR_NOMATCH
        Debug "String didn't match"
      Default
        Debug "Error while matching:"+Str(rc)
    EndSelect  
    End
  EndIf
  
  For i = 0 To rc -1
    Debug Str(i)+":"+Mid(str, ovector(2*i)+1,ovector(2*i+1) - ovector(2*i))
  Next
  
  
; IDE Options = PureBasic 4.20 (Windows - x86)
; Folding = -