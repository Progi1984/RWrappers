; Structure used for each database that is opened
Structure CHEETAH4_Structure
  nAction.l       ; Cheetah action to take
  nData.l         ; usually address to a string
  nLen.l          ; usually length of a string
  nData4byte.l
  nData8byte.d 
  errcode.l
  reserved.l      ; do not tamper with this value
EndStructure
; Structure for use with XDB_FIELDINFO 
Structure CHEETAH4_FIELD_Structure
  FieldName.s{11} ; name of the field in ASCII
  FieldStructure.b; Structure of field in ASCII
  FieldLength.l   ; Length
  FieldDecimals.l ; number of decimals in numeric field
EndStructure
; Structure for use with XDB_STATS
Structure CHEETAH4_STATS_Structure
  RecordCount.l   ; number of records in the database
  RecordSize.l    ; includes 1 character for the deleted flag
  FieldCount.l    ; number of fields in the database
EndStructure

; Action Codes 
#XDB_STATS               = 1
#XDB_SHUTDOWN            = 2
#XDB_CREATEDATABASE      = 3
#XDB_OPENDATABASE        = 4
#XDB_CLOSEDATABASE       = 5 
#XDB_SETFIELD            = 6
#XDB_GETFIELD            = 7
#XDB_FIELDNUMBER         = 8
#XDB_CLEARBUFFER         = 9
#XDB_GETRECORD           = 10
#XDB_PUTRECORD           = 11
#XDB_DELETERECORD        = 12
#XDB_RECALLRECORD        = 13
#XDB_MAKEDATETIME        = 14
#XDB_PACK                = 15
#XDB_ZAP                 = 16
#XDB_ISDELETED           = 17
#XDB_FIELDINFO           = 18
#XDB_REINDEX             = 19
#XDB_CREATEINDEX         = 20
#XDB_OPENINDEX           = 21
#XDB_CLOSEINDEX          = 22
#XDB_CREATETAG           = 23
#XDB_GETTAG              = 24
#XDB_DELETETAG           = 25
#XDB_ADDKEY              = 26 
#XDB_DELETEKEY           = 27
#XDB_GETKEY              = 28
#XDB_MOVEFIRST           = 29
#XDB_MOVENEXT            = 30
#XDB_MOVELAST            = 31
#XDB_MOVEPREV            = 32
#XDB_MOVEPREVIOUS        = #XDB_MOVEPREV
#XDB_MOVENEXT_ATOMIC     = 33
#XDB_MOVEPREV_ATOMIC     = 34
#XDB_MOVEPREVIOUS_ATOMIC = #XDB_MOVEPREV_ATOMIC
#XDB_SEEK                = 35
#XDB_DUMPINDEX           = 500


;Error Codes
#ERR_ACTION              = 1000
#ERR_DATA                = 1001
#ERR_FILENAME            = 1002 
#ERR_FILEStructure       = 1003   
#ERR_ACCESSMODE          = 1004
#ERR_SHAREMODE           = 1005
#ERR_FILEACCESS          = 1006
#ERR_MAXFIELDS           = 1007
#ERR_FIELDNAME           = 1008
#ERR_FIELDStructure      = 1009
#ERR_FIELDLENGTH         = 1010
#ERR_FIELDDECIMALS       = 1011
#ERR_MEMORYALLOC         = 1012
#ERR_FIELDNUMBER         = 1013
#ERR_RECORDNUMBER        = 1014
#ERR_BLOCKSIZE           = 1015
#ERR_FIELDMISMATCH       = 1016  ; field is invalid for file Structure (dbase, foxpro)
#ERR_DATETIME            = 1017   
#ERR_MISSINGMEMO         = 1018
#ERR_TAGNAME             = 1019
#ERR_TAGEXPRESSION       = 1020
#ERR_INDEXTAGFULL        = 1021  
#ERR_KEYSIZE             = 1022  
#ERR_MOVEERROR           = 1023
#ERR_SEEKNOMATCH         = 1024
#ERR_SEEKEXACTMATCH      = 1025
#ERR_SEEKPARTIALMATCH    = 1026
                     

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 86
; FirstLine = 25
; Folding = 5