XIncludeFile "RW_Cheetah_Res.pb"
Import "cheetah4.lib"
  ;LIBMAIN() As "_LIBMAIN"
  xdbCheetah(*xdb.CHEETAH4_Structure) As "_XDBCHEETAH"
EndImport

Procedure.l xdbShutdown()
  Protected dbf.CHEETAH4_Structure
  dbf\nAction = #XDB_SHUTDOWN
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbCreateDatabase(sData.s)
   Protected dbf.CHEETAH4_Structure 
   dbf\nAction = #XDB_CREATEDATABASE
   dbf\nData   = @sData
   dbf\nLen    = Len(sData)
   ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbOpenDatabase(sData.s, dbfHandle.l)
   Protected dbf.CHEETAH4_Structure 
   dbf\nAction = #XDB_OPENDATABASE
   dbf\nData   = @sData
   dbf\nLen    = Len(sData) 
   ReturnVal   = xdbCheetah(@dbf)
   ; Return the database handle 
   dbfHandle   = dbf\reserved   
   ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbCloseDatabase(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\reserved  = dbfHandle
  dbf\nAction   = #XDB_CLOSEDATABASE
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbClearBuffer(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction  = #XDB_CLEARBUFFER
  dbf\reserved = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbPutRecord(dbfHandle.l, nRecordNumber.l, nDataAddress.l = 0)
  Protected dbf.CHEETAH4_Structure 
  ; If the incoming Record Number is 0 or negative then the record is Appended.
  dbf\nAction     = #XDB_PUTRECORD
  dbf\nData       = nDataAddress                  
  dbf\nData4byte  = nRecordNumber   
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure         
Procedure.l xdbRecordCount(dbfHandle.l, nRecordCount.l)
   Protected dbf.CHEETAH4_Structure 
   Protected stats.CHEETAH4_STATS_Structure
   dbf\nAction  = #XDB_STATS
   dbf\nData    = @stats
   dbf\reserved = dbfHandle
   ReturnVal    = xdbCheetah(@dbf)
   nRecordCount = stats\RecordCount
   ProcedureReturn ReturnVal
EndProcedure         
Procedure.l xdbRecordSize(dbfHandle.l, nRecordSize.l)
   Protected dbf.CHEETAH4_Structure 
   Protected stats.CHEETAH4_STATS_Structure
   dbf\nAction  = #XDB_STATS
   dbf\nData    = @stats
   dbf\reserved = dbfHandle
   ReturnVal    = xdbCheetah(@dbf)
   nRecordSize  = stats\RecordSize
   ProcedureReturn ReturnVal
EndProcedure         
Procedure.l xdbFieldCount(dbfHandle.l, nFieldCount.l)
   Protected dbf.CHEETAH4_Structure 
   Protected stats.CHEETAH4_STATS_Structure
   dbf\nAction  = #XDB_STATS
   dbf\nData    = @stats 
   dbf\reserved = dbfHandle
   ReturnVal    = xdbCheetah(@dbf)
   nFieldCount  = stats\FieldCount
   ProcedureReturn ReturnVal
EndProcedure         
Procedure.l xdbGetRecord(dbfHandle.l, nRecordNumber.l, nDataAddress.l = 0)
   Protected dbf.CHEETAH4_Structure 
   ; If nDataAddress is specified then the record buffer is copied to
   ; that data location. This is useful for retrieving a record directly
   ; into a Structure variable.
   dbf\nAction     = #XDB_GETRECORD
   dbf\nData       = nDataAddress
   dbf\nData4byte  = nRecordNumber
   dbf\reserved    = dbfHandle
   ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbFieldNumber(dbfHandle.l, sFieldName.s, nFieldNumber.l)
   Protected dbf.CHEETAH4_Structure 
   ; Convert the Field Name to Field Number
   dbf\nAction  = #XDB_FIELDNUMBER
   dbf\nData    = @sFieldName
   If Len(sFieldName) < 10
      dbf\nLen     = Len(sFieldName)
   Else
      dbf\nLen     = 10
   EndIf
   dbf\reserved = dbfHandle
   ReturnVal    = xdbCheetah(@dbf)
   nFieldNumber = dbf\nData4byte
   ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbSetField(dbfHandle.l, sFieldName.s, nFieldNumber.l, sData.s)
  Protected dbf.CHEETAH4_Structure 
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0      
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode 
      ProcedureReturn errcode
    EndIf
  EndIf                 
  dbf\nAction     = #XDB_SETFIELD
  dbf\nData       = @sData 
  dbf\nLen        = Len(sData)
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbGetField(dbfHandle.l, sFieldName.s, nFieldNumber.l, nTrimSpaces.l, sFieldValue.s)
  Protected dbf.CHEETAH4_Structure
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn errcode
    EndIf
  EndIf                 
  
  dbf\nAction     = #XDB_GETFIELD
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  ReturnVal       = xdbCheetah(@dbf)
  
  sFieldValue = Space(dbf\nLen)
  CopyMemory(@sFieldValue, dbf\nData, dbf\nLen)
  If nTrimSpaces <> 0 
    sFieldValue = RTrim(sFieldValue)
  EndIf
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbFieldInfo(dbfHandle.l, *FieldInfo.CHEETAH4_FIELD_Structure, nFieldNumber.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction     = #XDB_FIELDINFO
  dbf\nData       = @*FieldInfo
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure         
Procedure.s xdbGetFieldStructure(dbfHandle.l, sFieldName.s, nFieldNumber.l)
  Protected dbf.CHEETAH4_Structure 
  Protected FieldInfo.CHEETAH4_FIELD_Structure
  Protected errcode.l                              
  ; ** NOTE: This wrapper does not return an error like
  ; all of the other wrappers. It simply returns the
  ; field Structure of the field. This is for convenience.
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0      
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn ""
    EndIf
  EndIf                 
  
  dbf\nAction     = #XDB_FIELDINFO
  dbf\nData       = @FieldInfo
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  xdbCheetah(@dbf)
  
  ProcedureReturn Chr(FieldInfo\FieldStructure)
EndProcedure
Procedure.l xdbGetFieldLength(dbfHandle.l, sFieldName.s, nFieldNumber.l)
  Protected dbf.CHEETAH4_Structure 
  Protected FieldInfo.CHEETAH4_FIELD_Structure
  Protected errcode.l                              
  ; ** NOTE: This wrapper does not return an error like
  ; all of the other wrappers. It simply returns the
  ; field length of the field. This is for convenience.
  
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn 0
    EndIf
  EndIf
  dbf\nAction     = #XDB_FIELDINFO
  dbf\nData       = @FieldInfo
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  xdbCheetah(@dbf)
  ProcedureReturn FieldInfo\FieldLength
EndProcedure
Procedure.l xdbDeleteRecord(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure
  ; Deletes the currently loaded database record. The database
  ; record must already have been loaded via xdbGetRecord
  dbf\nAction     = #XDB_DELETERECORD
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure         
Procedure.l xdbIsDeleted(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure 
  ; Determines if the currently loaded database record is marked
  ; for deletion. The database record must already have been loaded 
  ; via xdbGetRecord. 
  
  ; ** NOTE: This wrapper does not return an error like
  ; all of the other wrappers. It simply returns TRUE/FALSE.
  ; This is for convenience.
  
  dbf\nAction  = #XDB_ISDELETED
  dbf\reserved = dbfHandle
  xdbCheetah(@dbf)
  ProcedureReturn dbf\nLen
EndProcedure         
Procedure.l xdbRecallRecord(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure 
  ; Undeletes the currently loaded database record if it was marked
  ; for deletion. The database record must already have been loaded 
  ; via xdbGetRecord
  dbf\nAction     = #XDB_RECALLRECORD
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure         
Procedure.l xdbPack(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction  = #XDB_PACK
  dbf\reserved = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure         
Procedure.l xdbZap(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction  = #XDB_ZAP
  dbf\reserved = dbfHandle
ProcedureReturn xdbCheetah(@dbf)
EndProcedure         
Procedure.l xdbReindex(dbfHandle.l)
  Protected dbf.CHEETAH4_Structure 
  ; Reindexes all open indexes/Tags associated with the dbfHandle. You
  ; can not reindex individual indexes.
  dbf\nAction    = #XDB_REINDEX
  dbf\reserved   = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure         
Procedure.l xdbSetFieldBinary8(dbfHandle.l, sFieldName.s, nFieldNumber.l, *nData)
  Protected dbf.CHEETAH4_Structure 
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn errcode
    EndIf
  EndIf                 
  
  dbf\nAction     = #XDB_SETFIELD
  dbf\nData       = @nData
  dbf\nLen        = 8
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbSetFieldBinary4(dbfHandle.l, sFieldName.s, nFieldNumber.l, nData.l)
  Protected dbf.CHEETAH4_Structure 
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode 
      ProcedureReturn errcode
    EndIf
  EndIf                 
  
  dbf\nAction     = #XDB_SETFIELD
  dbf\nData       = @nData
  dbf\nLen        = 4
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbSetFieldCurrency(dbfHandle.l, sFieldName.s, nFieldNumber.l, *nData)
  Protected dbf.CHEETAH4_Structure 
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn errcode
    EndIf
  EndIf     
  
  dbf\nAction     = #XDB_SETFIELD
  dbf\nData       = @nData
  dbf\nLen        = 8
  dbf\nData4byte  = nFieldNumber
  dbf\reserved    = dbfHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbGetFieldBinary8(dbfHandle.l, sFieldName.s, nFieldNumber.l, *nFieldValue)
  Protected dbf.CHEETAH4_Structure 
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0 
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn errcode
    EndIf
  EndIf                 

  dbf\nAction    = #XDB_GETFIELD
  dbf\nData4byte = nFieldNumber
  dbf\reserved   = dbfHandle
  ReturnVal      =  xdbCheetah(@dbf)
  
  nFieldValue    = dbf\nData8byte
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbGetFieldBinary4(dbfHandle.l, sFieldName.s, nFieldNumber.l, *nFieldValue.l)
  Protected dbf.CHEETAH4_Structure 
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn errcode
    EndIf
  EndIf                 
  
  dbf\nAction    = #XDB_GETFIELD
  dbf\nData4byte = nFieldNumber
  dbf\reserved   = dbfHandle
  ReturnVal      =  xdbCheetah(@dbf)
  
  nFieldValue    = dbf\nData4byte     
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbGetFieldCurrency(dbfHandle.l, sFieldName.s, nFieldNumber.l, *nFieldValue)
  Protected dbf.CHEETAH4_Structure 
  Protected errcode.l
  ; If the field number was not specified then retrieve 
  ; the number via the field name.
  If nFieldNumber = 0
    errcode = xdbFieldNumber(dbfHandle, sFieldName, nFieldNumber)
    If errcode
      ProcedureReturn errcode
    EndIf
  EndIf
  dbf\nAction    = #XDB_GETFIELD
  dbf\nData4byte = nFieldNumber
  dbf\reserved   = dbfHandle
  xdbCheetah(@dbf)
  ProcedureReturn dbf\nData8byte
EndProcedure
Procedure.l xdbCreateIndex(sData.s )
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction = #XDB_CREATEINDEX
  dbf\nData   = @sData
  dbf\nLen    = Len(sData)
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbOpenIndex(nData.s, dbfHandle.l, idxHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction    = #XDB_OPENINDEX
  dbf\nData      = @nData
  dbf\nLen       = Len(nData) 
  dbf\nData4byte = @dbfHandle
  ReturnVal      = xdbCheetah(@dbf)
  ; Return the index handle 
  PokeL(idxHandle, dbf\reserved)
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbCreateTag(sData.s, idxHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction    = #XDB_CREATETAG
  dbf\nData      = @sData
  dbf\nLen       = Len(sData)
  dbf\nData4byte = idxHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbGetTag(sData.s, idxHandle.l, tagHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction    = #XDB_GETTAG
  dbf\nData      = @sData
  dbf\nLen       = Len(sData)
  dbf\nData4byte = idxHandle
  ReturnVal      = xdbCheetah(@dbf)
  PokeL(tagHandle, dbf\reserved)
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbDeleteTag(sData.s, idxHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction    = #XDB_DELETETAG
  dbf\nData      = @sData
  dbf\nLen       = Len(sData)
  dbf\nData4byte = idxHandle
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbCloseIndex(idxHandle.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\reserved  = idxHandle
  dbf\nAction   = #XDB_CLOSEINDEX
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbAddKey(tagHandle.l, sKey.s, nRecordNumber.l)
  Protected dbf.CHEETAH4_Structure 
  ; This Procedure is only useful for standalone indexes. For indexes
  ; associated with a an open database, the keys are added automatically
  ; whenever a database record is added or updated.
  ; NOTE: Remember to pass the Tag Handle rather than the Index Handle.
  
  dbf\reserved   = tagHandle
  dbf\nData      = @sKey
  dbf\nLen       = Len(sKey)
  dbf\nAction    = #XDB_ADDKEY
  dbf\nData4byte = nRecordNumber   
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbDeleteKey(tagHandle.l, sKey.s, nRecordNumber.l)
  Protected dbf.CHEETAH4_Structure 
  ; This Procedure is only useful for standalone indexes. For indexes
  ; associated with a an open database, the keys are deleted automatically
  ; whenever a database record is Packed or Zapped.
  
  ; NOTE: Remember to pass the Tag Handle rather than the Index Handle.
  
  dbf\reserved   = tagHandle
  dbf\nData      = @sKey
  dbf\nLen       = Len(sKey)
  dbf\nAction    = #XDB_DELETEKEY
  dbf\nData4byte = nRecordNumber   
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbGetKey(tagHandle.l, KeyValue.l, nRecordNumber.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction  = #XDB_GETKEY
  dbf\reserved = tagHandle
  ReturnVal    = xdbCheetah(@dbf)
  Debug PeekS(dbf\nData, dbf\nLen)
  PokeS(KeyValue, PeekS(dbf\nData, dbf\nLen))
  PokeL(nRecordNumber, dbf\nData4byte)
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbMove(dbfHandle.l, nTagHandle.l, nOperation.l, nRecordNumber.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction    = nOperation
  dbf\nData4byte = dbfHandle
  dbf\reserved   = nTagHandle
  ReturnVal      = xdbCheetah(@dbf)
  ; Return the record number as retrieved from the index tag
  PokeL(nRecordNumber, dbf\nData4byte)
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbSeek(nTagHandle.l, sKey.s, *nRecordNumber.l)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction    = #XDB_SEEK
  dbf\reserved   = nTagHandle
  dbf\nData      = @sKey
  dbf\nLen       = Len(sKey)
  ReturnVal      = xdbCheetah(@dbf)

  ; Return the record number as retrieved from the index tag
  nRecordNumber  = dbf\nData4byte
  ProcedureReturn ReturnVal
EndProcedure
Procedure.l xdbDumpIndex(sData.s, idxHandle.l, nMaxKeySize.l)
  Protected dbf.CHEETAH4_Structure 
  ; This Procedure is used for developer purposes in order to dump
  ; information about an index to disk ("_dump.txt"). For regular
  ; programs, this Procedure is meaningless.
  dbf\nData      = @sData
  dbf\nLen       = Len(sData)
  dbf\reserved   = idxHandle
  dbf\nAction    = #XDB_DUMPINDEX
  ; nMaxKeySize is the amount of the Key that will be printed to the
  ; debug text file. This is useful for when trying to display a report
  ; that has keys greater than the screen width. By specifying a smaller
  ; value for nMaxkeySize then only the Left(Key, nMaxKeySize) characters
  ; will be displayed.
  dbf\nData4Byte = nMaxKeySize
  ProcedureReturn xdbCheetah(@dbf)
EndProcedure
Procedure.l xdbMakeDateTime(sDateTime.s, *nDateTime)
  Protected dbf.CHEETAH4_Structure 
  dbf\nAction = #XDB_MAKEDATETIME
  dbf\nData   = @sDateTime
  dbf\nLen    = Len(sDateTime)
  ReturnVal   = xdbCheetah(@dbf)
  nDateTime = dbf\nData8byte
  ProcedureReturn ReturnVal
EndProcedure

; IDE Options = PureBasic 4.20 (Windows - x86)
; CursorPosition = 505
; Folding = AAAAAAAAAAw