;{ Structures 
  Structure ID3Tag
    _dummy.s
  EndStructure
  Structure ID3TagIterator
    _dummy.s
  EndStructure
  Structure ID3TagConstIterator
    _dummy.s
  EndStructure
  Structure ID3Frame
    _dummy.s
  EndStructure
  Structure ID3Field
    _dummy.s
  EndStructure
  Structure ID3FrameInfo
    _dummy.s
  EndStructure
  Structure Mp3_Headerinfo
    layer.l       ; ENUM Mpeg_Layers
    version.l     ; ENUM Mpeg_Version
    bitrate.l     ; ENUM MP3_BitRates
    channelmode.l ; ENUM Mp3_ChannelMode
    modeext.l     ; ENUM Mp3_ModeExt
    emphasis.l    ; ENUM Mp3_Emphasis
    crc.l         ; ENUM Mp3_Crc
    vbr_bitrate.l ; avg bitrate from xing header
    frequency.l   ; samplerate
    framesize.l
    frames.l      ; nr of frames
    time.l        ; nr of seconds in song
    privatebit.l
    copyrighted.l
    original.l
  EndStructure
;}
;{ Macros
  Macro ID3TE_IS_SINGLE_BYTE_ENC(enc)
    enc = #ID3TE_ISO8859_1 Or enc = #ID3TE_UTF8
  EndMacro
  Macro ID3TE_IS_DOUBLE_BYTE_ENC(enc)
    enc = #ID3TE_UTF16 Or enc = #ID3TE_UTF16BE
  EndMacro
  Macro MASK(bits)
    (1 << (bits - 1))
  EndMacro
;}
;{ Constantes
  #ID3_TAGID               = "#ID3"
  #ID3_TAGIDSIZE           = 3
  #ID3_TAGHEADERSIZE       = 10
  #STR_V1_COMMENT_DESC     = "#ID3v1 Comment"
  
  #ID3_NR_OF_V1_GENRES = 148
  #MASK1 = MASK(1)
  #MASK2 = MASK(2)
  #MASK3 = MASK(3)
  #MASK4 = MASK(4)
  #MASK5 = MASK(5)
  #MASK6 = MASK(6)
  #MASK7 = MASK(7)
  #MASK8 = MASK(8)
  ; Constants Systems
  CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows
      #ID3_DIR_SEPARATOR          = '\\'
      #ID3_DIR_SEPARATOR_S        = "\\"
      #ID3_SEARCHPATH_SEPARATOR   = ''
      #ID3_SEARCHPATH_SEPARATOR_S = ""
    CompilerCase #PB_OS_Linux
      #ID3_DIR_SEPARATOR          = '/'
      #ID3_DIR_SEPARATOR_S        = "/"
      #ID3_SEARCHPATH_SEPARATOR   = ':'
      #ID3_SEARCHPATH_SEPARATOR_S = ":"
  CompilerEndSelect
;}
;{ Enumerations
  Enumeration -1; ID3_TextEnc
    #ID3TE_NONE
    #ID3TE_ISO8859_1
    #ID3TE_UTF16
    #ID3TE_UTF16BE
    #ID3TE_UTF8
    #ID3TE_NUMENCODINGS
    #ID3TE_ASCII = #ID3TE_ISO8859_1   ; do Not use this -> use #ID3TE_IS_SINGLE_BYTE_ENC(enc instead
    #ID3TE_UNICODE = #ID3TE_UTF16     ; do Not use this -> use #ID3TE_IS_DOUBLE_BYTE_ENC(enc instead
  EndEnumeration
  ; Enumeration of the various ID3 specifications
  Enumeration  ; ID3_V1Spec
    #ID3V1_0 = 0
    #ID3V1_1
    #ID3V1_NUMSPECS
  EndEnumeration
  Enumeration  ; ID3_V2Spec
    #ID3V2_UNKNOWN = -1
    #ID3V2_2_0 = 0
    #ID3V2_2_1
    #ID3V2_3_0
    #ID3V2_4_0
    #ID3V2_EARLIEST = #ID3V2_2_0
    #ID3V2_LATEST = #ID3V2_3_0
  EndEnumeration
  ; The various types of tags that ID3lib can handle
  Enumeration  ; ID3_TagType
    #ID3TT_NONE         =      0   ; Represents an empty Or non-existant tag 
    #ID3TT_ID3V1        = 1 << 0   ; Represents an #ID3v1 Or #ID3v1.1 tag 
    #ID3TT_ID3V2        = 1 << 1   ; Represents an #ID3v2 tag 
    #ID3TT_LYRICS3      = 1 << 2   ; Represents a Lyrics3 tag 
    #ID3TT_LYRICS3V2    = 1 << 3   ; Represents a Lyrics3 v2.00 tag 
    #ID3TT_MUSICMATCH   = 1 << 4   ; Represents a MusicMatch tag 
     ; Represents a Lyrics3 tag (For backwards compatibility 
    #ID3TT_LYRICS       = #ID3TT_LYRICS3
    ;* Represents both #ID3 tags: #ID3v1 And #ID3v2 
    #ID3TT_ID3          = #ID3TT_ID3V1 | #ID3TT_ID3V2
    ;* Represents all possible types of tags 
    #ID3TT_ALL          = ~#ID3TT_NONE
    ;* Represents all tag types that can be prepended To a file 
    #ID3TT_PREPENDED    = #ID3TT_ID3V2
    ;* Represents all tag types that can be appended To a file 
    #ID3TT_APPENDED     = #ID3TT_ALL & ~#ID3TT_ID3V2
  EndEnumeration
  ;Enumeration of the different types of fields in a frame.
  Enumeration  ; ID3_FieldID
    #ID3FN_NOFIELD = 0    ; No field 
    #ID3FN_TEXTENC        ; Text encoding (unicode Or ASCII 
    #ID3FN_TEXT           ; Text field 
    #ID3FN_URL            ; A URL 
    #ID3FN_DATA           ; Data field 
    #ID3FN_DESCRIPTION    ; Description field 
    #ID3FN_OWNER          ; Owner field 
    #ID3FN_EMAIL          ; Email field 
    #ID3FN_RATING         ; Rating field 
    #ID3FN_FILENAME       ; Filename field 
    #ID3FN_LANGUAGE       ; Language field 
    #ID3FN_PICTURETYPE    ; Picture type field 
    #ID3FN_IMAGEFORMAT    ; Image format field 
    #ID3FN_MIMETYPE       ; Mimetype field 
    #ID3FN_COUNTER        ; Counter field 
    #ID3FN_ID             ; Identifier/Symbol field 
    #ID3FN_VOLUMEADJ      ; Volume adjustment field 
    #ID3FN_NUMBITS        ; Number of bits field 
    #ID3FN_VOLCHGRIGHT    ; Volume chage on the right channel 
    #ID3FN_VOLCHGLEFT     ; Volume chage on the left channel 
    #ID3FN_PEAKVOLRIGHT   ; Peak volume on the right channel 
    #ID3FN_PEAKVOLLEFT    ; Peak volume on the left channel 
    #ID3FN_TIMESTAMPFORMAT; SYLT Timestamp Format 
    #ID3FN_CONTENTTYPE    ; SYLT content type 
    #ID3FN_LASTFIELDID    ; Last field placeholder 
  EndEnumeration
  ; Enumeration of the different types of frames recognized by ID3lib
  Enumeration  ; ID3_FrameID
    #ID3FID_NOFRAME = 0       ; ????  ;0  No known frame 
    #ID3FID_AUDIOCRYPTO       ; AENC  ;1  Audio encryption 
    #ID3FID_PICTURE           ; APIC  ;2  Attached picture 
    #ID3FID_AUDIOSEEKPOINT    ; ASPI  ;3  Audio seek point index 
    #ID3FID_COMMENT           ; COMM  ;4  Comments 
    #ID3FID_COMMERCIAL        ; COMR  ;5  Commercial frame 
    #ID3FID_CRYPTOREG         ; ENCR  ;6  Encryption method registration 
    #ID3FID_EQUALIZATION2     ; EQU2  ;7  Equalisation (2 )
    #ID3FID_EQUALIZATION      ; EQUA  ;8  Equalization 
    #ID3FID_EVENTTIMING       ; ETCO  ;9  Event timing codes 
    #ID3FID_GENERALOBJECT     ; GEOB  ;10 General encapsulated object 
    #ID3FID_GROUPINGREG       ; GRID  ;11 Group identification registration 
    #ID3FID_INVOLVEDPEOPLE    ; IPLS  ;12 Involved people list 
    #ID3FID_LINKEDINFO        ; LINK  ;13 Linked information 
    #ID3FID_CDID              ; MCDI  ;14 Music CD identifier 
    #ID3FID_MPEGLOOKUP        ; MLLT  ;15 MPEG location lookup table 
    #ID3FID_OWNERSHIP         ; OWNE  ;16 Ownership frame 
    #ID3FID_PRIVATE           ; PRIV  ;17 Private frame 
    #ID3FID_PLAYCOUNTER       ; PCNT  ;18 Play counter 
    #ID3FID_POPULARIMETER     ; POPM  ;19 Popularimeter 
    #ID3FID_POSITIONSYNC      ; POSS  ;20 Position synchronisation frame 
    #ID3FID_BUFFERSIZE        ; RBUF  ;21 Recommended buffer size 
    #ID3FID_VOLUMEADJ2        ; RVA2  ;22 Relative volume adjustment (2 )
    #ID3FID_VOLUMEADJ         ; RVAD  ;23 Relative volume adjustment 
    #ID3FID_REVERB            ; RVRB  ;24 Reverb 
    #ID3FID_SEEKFRAME         ; SEEK  ;25 Seek frame 
    #ID3FID_SIGNATURE         ; SIGN  ;26 Signature frame 
    #ID3FID_SYNCEDLYRICS      ; SYLT  ;27 Synchronized lyric/text 
    #ID3FID_SYNCEDTEMPO       ; SYTC  ;28 Synchronized tempo codes 
    #ID3FID_ALBUM             ; TALB  ;29 Album/Movie/Show title 
    #ID3FID_BPM               ; TBPM  ;30 BPM (beats per minute )
    #ID3FID_COMPOSER          ; TCOM  ;31 Composer 
    #ID3FID_CONTENTTYPE       ; TCON  ;32 Content type 
    #ID3FID_COPYRIGHT         ; TCOP  ;33 Copyright message 
    #ID3FID_DATE              ; TDAT  ;34 Date 
    #ID3FID_ENCODINGTIME      ; TDEN  ;35 Encoding time 
    #ID3FID_PLAYLISTDELAY     ; TDLY  ;36 Playlist delay 
    #ID3FID_ORIGRELEASETIME   ; TDOR  ;37 Original release time 
    #ID3FID_RECORDINGTIME     ; TDRC  ;38 Recording time 
    #ID3FID_RELEASETIME       ; TDRL  ;39 Release time 
    #ID3FID_TAGGINGTIME       ; TDTG  ;40 Tagging time 
    #ID3FID_INVOLVEDPEOPLE2   ; TIPL  ;41 Involved people list 
    #ID3FID_ENCODEDBY         ; TENC  ;42 Encoded by 
    #ID3FID_LYRICIST          ; TEXT  ;43 Lyricist/Text writer 
    #ID3FID_FILETYPE          ; TFLT  ;44 File type 
    #ID3FID_TIME              ; TIME  ;45 Time 
    #ID3FID_CONTENTGROUP      ; TIT1  ;46 Content group description 
    #ID3FID_TITLE             ; TIT2  ;47 Title/songname/content description 
    #ID3FID_SUBTITLE          ; TIT3  ;48 Subtitle/Description refinement 
    #ID3FID_INITIALKEY        ; TKEY  ;49 Initial key 
    #ID3FID_LANGUAGE          ; TLAN  ;50 Language(s) 
    #ID3FID_SONGLEN           ; TLEN  ;51 Length 
    #ID3FID_MUSICIANCREDITLIST; TMCL  ;52 Musician credits list 
    #ID3FID_MEDIATYPE         ; TMED  ;53 Media type 
    #ID3FID_MOOD              ; TMOO  ;54 Mood 
    #ID3FID_ORIGALBUM         ; TOAL  ;55 Original album/movie/show title 
    #ID3FID_ORIGFILENAME      ; TOFN  ;56 Original filename 
    #ID3FID_ORIGLYRICIST      ; TOLY  ;57 Original lyricist(s)/text writer(s) 
    #ID3FID_ORIGARTIST        ; TOPE  ;58 Original artist(s)/performer(s) 
    #ID3FID_ORIGYEAR          ; TORY  ;59 Original release year 
    #ID3FID_FILEOWNER         ; TOWN  ;60 File owner/licensee 
    #ID3FID_LEADARTIST        ; TPE1  ;61 Lead performer(s))/Soloist(s) 
    #ID3FID_BAND              ; TPE2  ;62 Band/orchestra/accompaniment 
    #ID3FID_CONDUCTOR         ; TPE3  ;63 Conductor/performer refinement 
    #ID3FID_MIXARTIST         ; TPE4  ;64 Interpreted remixed Or otherwise modified by 
    #ID3FID_PARTINSET         ; TPOS  ;65 Part of a set 
    #ID3FID_PRODUCEDNOTICE    ; TPRO  ;66 Produced notice 
    #ID3FID_PUBLISHER         ; TPUB  ;67 Publisher 
    #ID3FID_TRACKNUM          ; TRCK  ;68 Track number/Position in set 
    #ID3FID_RECORDINGDATES    ; TRDA  ;69 Recording dates 
    #ID3FID_NETRADIOSTATION   ; TRSN  ;70 Internet radio station name 
    #ID3FID_NETRADIOOWNER     ; TRSO  ;71 Internet radio station owner 
    #ID3FID_SIZE              ; TSIZ  ;72 Size 
    #ID3FID_ALBUMSORTORDER    ; TSOA  ;73 Album sort order 
    #ID3FID_PERFORMERSORTORDER; TSOP  ;74 Performer sort order 
    #ID3FID_TITLESORTORDER    ; TSOT  ;75 Title sort order 
    #ID3FID_ISRC              ; TSRC  ;76 ISRC (international standard recording code )
    #ID3FID_ENCODERSETTINGS   ; TSSE  ;77 Software/Hardware And settings used For encoding 
    #ID3FID_SETSUBTITLE       ; TSST  ;78 Set subtitle 
    #ID3FID_USERTEXT          ; TXXX  ;79 User defined text information 
    #ID3FID_YEAR              ; TYER  ;80 Year 
    #ID3FID_UNIQUEFILEID      ; UFID  ;81 Unique file identifier 
    #ID3FID_TERMSOFUSE        ; USER  ;82 Terms of use 
    #ID3FID_UNSYNCEDLYRICS    ; USLT  ;83 Unsynchronized lyric/text transcription 
    #ID3FID_WWWCOMMERCIALINFO ; WCOM  ;84 Commercial information 
    #ID3FID_WWWCOPYRIGHT      ; WCOP  ;85 Copyright/Legal infromation 
    #ID3FID_WWWAUDIOFILE      ; WOAF  ;86 Official audio file webpage 
    #ID3FID_WWWARTIST         ; WOAR  ;87 Official artist/performer webpage 
    #ID3FID_WWWAUDIOSOURCE    ; WOAS  ;88 Official audio source webpage 
    #ID3FID_WWWRADIOPAGE      ; WORS  ;89 Official internet radio station homepage 
    #ID3FID_WWWPAYMENT        ; WPAY  ;90 Payment 
    #ID3FID_WWWPUBLISHER      ; WPUB  ;91 Official publisher webpage 
    #ID3FID_WWWUSER           ; WXXX  ;92 User defined URL link 
    #ID3FID_METACRYPTO        ;       ;93 Encrypted meta frame (#ID3v2.2.x)
    #ID3FID_METACOMPRESSION   ;       ;94 Compressed meta frame (#ID3v2.2.1) 
    #ID3FID_LASTFRAMEID       ; >>>>  ;95 Last field placeholder 
  EndEnumeration
  Enumeration  ; ID3_V1Lengths
    #ID3_V1_LEN         = 128
    #ID3_V1_LEN_ID      =   3
    #ID3_V1_LEN_TITLE   =  30
    #ID3_V1_LEN_ARTIST  =  30
    #ID3_V1_LEN_ALBUM   =  30
    #ID3_V1_LEN_YEAR    =   4
    #ID3_V1_LEN_COMMENT =  30
    #ID3_V1_LEN_GENRE   =   1
  EndEnumeration
  Enumeration  ; ID3_FieldFlags
    #ID3FF_NONE       =      0
    #ID3FF_CSTR       = 1 << 0
    #ID3FF_LIST       = 1 << 1
    #ID3FF_ENCODABLE  = 1 << 2
    #ID3FF_TEXTLIST   = #ID3FF_CSTR | #ID3FF_LIST | #ID3FF_ENCODABLE
  EndEnumeration
  ; Enumeration of the types of field types 
  Enumeration  ; ID3_FieldType
    #ID3FTY_NONE           = -1
    #ID3FTY_INTEGER        = 0
    #ID3FTY_BINARY
    #ID3FTY_TEXTSTRING
    #ID3FTY_NUMTYPES
  EndEnumeration
  ; Predefined ID3lib error types.
  Enumeration  ; ID3_Err
    #ID3E_NoError = 0             ; No error reported 
    #ID3E_NoMemory                ; No available memory 
    #ID3E_NoData                  ; No Data To parse 
    #ID3E_BadData                 ; Improperly formatted Data 
    #ID3E_NoBuffer                ; No buffer To write To 
    #ID3E_SmallBuffer             ; Buffer is too small 
    #ID3E_InvalidFrameID          ; Invalid frame id 
    #ID3E_FieldNotFound           ; Requested field Not found 
    #ID3E_UnknownFieldType        ; Unknown field type 
    #ID3E_TagAlreadyAttached      ; Tag is already attached To a file 
    #ID3E_InvalidTagVersion       ; Invalid tag version 
    #ID3E_NoFile                  ; No file To parse 
    #ID3E_ReadOnly                ; Attempting To write To a Read-only file 
    #ID3E_zlibError                ; Error in compression/uncompression 
  EndEnumeration
  Enumeration  ; ID3_ContentType
    #ID3CT_OTHER = 0
    #ID3CT_LYRICS
    #ID3CT_TEXTTRANSCRIPTION
    #ID3CT_MOVEMENT
    #ID3CT_EVENTS
    #ID3CT_CHORD
    #ID3CT_TRIVIA
  EndEnumeration
  Enumeration  ; ID3_PictureType
    #ID3PT_OTHER = 0
    #ID3PT_PNG32ICON = 1     ;  32x32 pixels 'file icon' (PNG only
    #ID3PT_OTHERICON = 2     ; Other file icon
    #ID3PT_COVERFRONT = 3    ; Cover (front
    #ID3PT_COVERBACK = 4     ; Cover (back
    #ID3PT_LEAFLETPAGE = 5   ; Leaflet page
    #ID3PT_MEDIA = 6         ; Media (e.g. lable side of CD
    #ID3PT_LEADARTIST = 7    ; Lead artist/lead performer/soloist
    #ID3PT_ARTIST = 8        ; Artist/performer
    #ID3PT_CONDUCTOR = 9     ; Conductor
    #ID3PT_BAND = 10         ; Band/Orchestra
    #ID3PT_COMPOSER = 11     ; Composer
    #ID3PT_LYRICIST = 12     ; Lyricist/text writer
    #ID3PT_REC_LOCATION = 13 ; Recording Location
    #ID3PT_RECORDING = 14    ; During recording
    #ID3PT_PERFORMANCE = 15  ; During performance
    #ID3PT_VIDEO = 16        ; Movie/video screen capture
    #ID3PT_FISH = 17         ; A bright coloured fish
    #ID3PT_ILLUSTRATION = 18 ; Illustration
    #ID3PT_ARTISTLOGO = 19   ; Band/artist logotype
    #ID3PT_PUBLISHERLOGO = 20 ; Publisher/Studio logotype
  EndEnumeration
  Enumeration  ; ID3_TimeStampFormat
    #ID3TSF_FRAME  = 1
    #ID3TSF_MS
  EndEnumeration
  Enumeration  ; MP3_BitRates
    #MP3BITRATE_FALSE = -1
    #MP3BITRATE_NONE = 0
    #MP3BITRATE_8K   = 8000
    #MP3BITRATE_16K  = 16000
    #MP3BITRATE_24K  = 24000
    #MP3BITRATE_32K  = 32000
    #MP3BITRATE_40K  = 40000
    #MP3BITRATE_48K  = 48000
    #MP3BITRATE_56K  = 56000
    #MP3BITRATE_64K  = 64000
    #MP3BITRATE_80K  = 80000
    #MP3BITRATE_96K  = 96000
    #MP3BITRATE_112K = 112000
    #MP3BITRATE_128K = 128000
    #MP3BITRATE_144K = 144000
    #MP3BITRATE_160K = 160000
    #MP3BITRATE_176K = 176000
    #MP3BITRATE_192K = 192000
    #MP3BITRATE_224K = 224000
    #MP3BITRATE_256K = 256000
    #MP3BITRATE_288K = 288000
    #MP3BITRATE_320K = 320000
    #MP3BITRATE_352K = 352000
    #MP3BITRATE_384K = 384000
    #MP3BITRATE_416K = 416000
    #MP3BITRATE_448K = 448000
  EndEnumeration
  Enumeration  ; Mpeg_Layers
    #MPEGLAYER_FALSE = -1
    #MPEGLAYER_UNDEFINED
    #MPEGLAYER_III
    #MPEGLAYER_II
    #MPEGLAYER_I
  EndEnumeration
  Enumeration  ; Mpeg_Version
    #MPEGVERSION_FALSE = -1
    #MPEGVERSION_2_5
    #MPEGVERSION_Reserved
    #MPEGVERSION_2
    #MPEGVERSION_1
  EndEnumeration
  Enumeration  ; Mp3_Frequencies
    #MP3FREQUENCIES_FALSE = -1
    #MP3FREQUENCIES_Reserved = 0
    #MP3FREQUENCIES_8000HZ = 8000
    #MP3FREQUENCIES_11025HZ = 11025
    #MP3FREQUENCIES_12000HZ = 12000
    #MP3FREQUENCIES_16000HZ = 16000
    #MP3FREQUENCIES_22050HZ = 22050
    #MP3FREQUENCIES_24000HZ = 24000
    #MP3FREQUENCIES_32000HZ = 32000
    #MP3FREQUENCIES_48000HZ = 48000
    #MP3FREQUENCIES_44100HZ = 44100
  EndEnumeration
  Enumeration  ; Mp3_ChannelMode
    #MP3CHANNELMODE_FALSE = -1
    #MP3CHANNELMODE_STEREO
    #MP3CHANNELMODE_JOINT_STEREO
    #MP3CHANNELMODE_DUAL_CHANNEL
    #MP3CHANNELMODE_SINGLE_CHANNEL
  EndEnumeration
  Enumeration  ; Mp3_ModeExt
    #MP3MODEEXT_FALSE = -1
    #MP3MODEEXT_0
    #MP3MODEEXT_1
    #MP3MODEEXT_2
    #MP3MODEEXT_3
  EndEnumeration
  Enumeration  ; Mp3_Emphasis
    #MP3EMPHASIS_FALSE = -1
    #MP3EMPHASIS_NONE
    #MP3EMPHASIS_50_15MS
    #MP3EMPHASIS_Reserved
    #MP3EMPHASIS_CCIT_J17
  EndEnumeration
  Enumeration  ; Mp3_Crc
    #MP3CRC_ERROR_SIZE = -2
    #MP3CRC_MISMATCH = -1
    #MP3CRC_NONE = 0
    #MP3CRC_OK = 1
  EndEnumeration
;}
;{ Tableaux
  Global Dim ID3_v1_genre_description.s(#ID3_NR_OF_V1_GENRES)
  ;{
    ID3_v1_genre_description(0) = "Blues"
    ID3_v1_genre_description(1) = "Classic Rock"
    ID3_v1_genre_description(2) = "Country"
    ID3_v1_genre_description(3) = "Dance"
    ID3_v1_genre_description(4) = "Disco"
    ID3_v1_genre_description(5) = "Funk"
    ID3_v1_genre_description(6) = "Grunge"
    ID3_v1_genre_description(7) = "Hip-Hop"
    ID3_v1_genre_description(8) = "Jazz"
    ID3_v1_genre_description(9) = "Metal"
    ID3_v1_genre_description(10) = "New Age"
    ID3_v1_genre_description(11) = "Oldies"
    ID3_v1_genre_description(12) = "Other"
    ID3_v1_genre_description(13) = "Pop"
    ID3_v1_genre_description(14) = "R&B"
    ID3_v1_genre_description(15) = "Rap"
    ID3_v1_genre_description(16) = "Reggae"
    ID3_v1_genre_description(17) = "Rock"
    ID3_v1_genre_description(18) = "Techno"
    ID3_v1_genre_description(19) = "Industrial"
    ID3_v1_genre_description(20) = "Alternative"
    ID3_v1_genre_description(21) = "Ska"
    ID3_v1_genre_description(22) = "Death Metal"
    ID3_v1_genre_description(23) = "Pranks"
    ID3_v1_genre_description(24) = "Soundtrack"
    ID3_v1_genre_description(25) = "Euro-Techno"
    ID3_v1_genre_description(26) = "Ambient"
    ID3_v1_genre_description(27) = "Trip-Hop"
    ID3_v1_genre_description(28) = "Vocal"
    ID3_v1_genre_description(29) = "Jazz+Funk"
    ID3_v1_genre_description(30) = "Fusion"
    ID3_v1_genre_description(31) = "Trance"
    ID3_v1_genre_description(32) = "Classical"
    ID3_v1_genre_description(33) = "Instrumental"
    ID3_v1_genre_description(34) = "Acid"
    ID3_v1_genre_description(35) = "House"
    ID3_v1_genre_description(36) = "Game"
    ID3_v1_genre_description(37) = "Sound Clip"
    ID3_v1_genre_description(38) = "Gospel"
    ID3_v1_genre_description(39) = "Noise"
    ID3_v1_genre_description(40) = "AlternRock"
    ID3_v1_genre_description(41) = "Bass"
    ID3_v1_genre_description(42) = "Soul"
    ID3_v1_genre_description(43) = "Punk"
    ID3_v1_genre_description(44) = "Space"
    ID3_v1_genre_description(45) = "Meditative"
    ID3_v1_genre_description(46) = "Instrumental Pop"
    ID3_v1_genre_description(47) = "Instrumental Rock"
    ID3_v1_genre_description(48) = "Ethnic"
    ID3_v1_genre_description(49) = "Gothic"
    ID3_v1_genre_description(50) = "Darkwave"
    ID3_v1_genre_description(51) = "Techno-Industrial"
    ID3_v1_genre_description(52) = "Electronic"
    ID3_v1_genre_description(53) = "Pop-Folk"
    ID3_v1_genre_description(54) = "Eurodance"
    ID3_v1_genre_description(55) = "Dream"
    ID3_v1_genre_description(56) = "Southern Rock"
    ID3_v1_genre_description(57) = "Comedy"
    ID3_v1_genre_description(58) = "Cult"
    ID3_v1_genre_description(59) = "Gangsta"
    ID3_v1_genre_description(60) = "Top 40"
    ID3_v1_genre_description(61) = "Christian Rap"
    ID3_v1_genre_description(62) = "Pop/Funk"
    ID3_v1_genre_description(63) = "Jungle"
    ID3_v1_genre_description(64) = "Native American"
    ID3_v1_genre_description(65) = "Cabaret"
    ID3_v1_genre_description(66) = "New Wave"
    ID3_v1_genre_description(67) = "Psychadelic"
    ID3_v1_genre_description(68) = "Rave"
    ID3_v1_genre_description(69) = "Showtunes"
    ID3_v1_genre_description(70) = "Trailer"
    ID3_v1_genre_description(71) = "Lo-Fi"
    ID3_v1_genre_description(72) = "Tribal"
    ID3_v1_genre_description(73) = "Acid Punk"
    ID3_v1_genre_description(74) = "Acid Jazz"
    ID3_v1_genre_description(75) = "Polka"
    ID3_v1_genre_description(76) = "Retro"
    ID3_v1_genre_description(77) = "Musical"
    ID3_v1_genre_description(78) = "Rock & Roll"
    ID3_v1_genre_description(79) = "Hard Rock"
    ; following are winamp extentions
    ID3_v1_genre_description(80) = "Folk"
    ID3_v1_genre_description(81) = "Folk-Rock"
    ID3_v1_genre_description(82) = "National Folk"
    ID3_v1_genre_description(83) = "Swing"
    ID3_v1_genre_description(84) = "Fast Fusion"
    ID3_v1_genre_description(85) = "Bebob"
    ID3_v1_genre_description(86) = "Latin"
    ID3_v1_genre_description(87) = "Revival"
    ID3_v1_genre_description(88) = "Celtic"
    ID3_v1_genre_description(89) = "Bluegrass"
    ID3_v1_genre_description(90) = "Avantgarde"
    ID3_v1_genre_description(91) = "Gothic Rock"
    ID3_v1_genre_description(92) = "Progressive Rock"
    ID3_v1_genre_description(93) = "Psychedelic Rock"
    ID3_v1_genre_description(94) = "Symphonic Rock"
    ID3_v1_genre_description(95) = "Slow Rock"
    ID3_v1_genre_description(96) = "Big Band"
    ID3_v1_genre_description(97) = "Chorus"
    ID3_v1_genre_description(98) = "Easy Listening"
    ID3_v1_genre_description(99) = "Acoustic"
    ID3_v1_genre_description(100) = "Humour"
    ID3_v1_genre_description(101) = "Speech"
    ID3_v1_genre_description(102) = "Chanson"
    ID3_v1_genre_description(103) = "Opera"
    ID3_v1_genre_description(104) = "Chamber Music"
    ID3_v1_genre_description(105) = "Sonata"
    ID3_v1_genre_description(106) = "Symphony"
    ID3_v1_genre_description(107) = "Booty Bass"
    ID3_v1_genre_description(108) = "Primus"
    ID3_v1_genre_description(109) = "Porn Groove"
    ID3_v1_genre_description(110) = "Satire"
    ID3_v1_genre_description(111) = "Slow Jam"
    ID3_v1_genre_description(112) = "Club"
    ID3_v1_genre_description(113) = "Tango"
    ID3_v1_genre_description(114) = "Samba"
    ID3_v1_genre_description(115) = "Folklore"
    ID3_v1_genre_description(116) = "Ballad"
    ID3_v1_genre_description(117) = "Power Ballad"
    ID3_v1_genre_description(118) = "Rhythmic Soul"
    ID3_v1_genre_description(119) = "Freestyle"
    ID3_v1_genre_description(120) = "Duet"
    ID3_v1_genre_description(121) = "Punk Rock"
    ID3_v1_genre_description(122) = "Drum Solo"
    ID3_v1_genre_description(123) = "A capella"
    ID3_v1_genre_description(124) = "Euro-House"
    ID3_v1_genre_description(125) = "Dance Hall"
    ID3_v1_genre_description(126) = "Goa"
    ID3_v1_genre_description(127) = "Drum & Bass"
    ID3_v1_genre_description(128) = "Club-House"
    ID3_v1_genre_description(129) = "Hardcore"
    ID3_v1_genre_description(130) = "Terror"
    ID3_v1_genre_description(131) = "Indie"
    ID3_v1_genre_description(132) = "Britpop"
    ID3_v1_genre_description(133) = "Negerpunk"
    ID3_v1_genre_description(134) = "Polsk Punk"
    ID3_v1_genre_description(135) = "Beat"
    ID3_v1_genre_description(136) = "Christian Gangsta Rap"
    ID3_v1_genre_description(137) = "Heavy Metal"
    ID3_v1_genre_description(138) = "Black Metal"
    ID3_v1_genre_description(139) = "Crossover"
    ID3_v1_genre_description(140) = "Contemporary Christian"
    ID3_v1_genre_description(141) = "Christian Rock "
    ID3_v1_genre_description(142) = "Merengue"
    ID3_v1_genre_description(143) = "Salsa"
    ID3_v1_genre_description(144) = "Trash Metal"
    ID3_v1_genre_description(145) = "Anime"
    ID3_v1_genre_description(146) = "JPop"
    ID3_v1_genre_description(147) = "Synthpop"
  ;}
;}
ProcedureDLL.s ID3_V1GENRE2DESCRIPTION(x.l)
  If x < #ID3_NR_OF_V1_GENRES And x >= 0 
    ProcedureReturn ID3_v1_genre_description(x)
  Else
    ProcedureReturn ""
  EndIf
EndProcedure

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 323
; FirstLine = 11
; Folding = BACAAg6