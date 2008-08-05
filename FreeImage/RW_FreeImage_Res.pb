;- Constantes
;{
  #FREEIMAGE_MAJOR_VERSION    = 3
  #FREEIMAGE_MINOR_VERSION    = 10
  #FREEIMAGE_RELEASE_SERIAL   = 0
  ; types used IN THE library (directly copied from Windows) 
  #SEEK_SET                   = 0
  #SEEK_CUR                   = 1
  #SEEK_END                   = 2
  ; Indexes For byte arrays, masks And shifts For treating pixels As words ---
  ; These coincide With THE order of RGBQUAD And RGBTRIPLE --
  ; Little Endian (x86 / ms Windows, Linux) : BGR(a) order
  #FI_RGBA_BLUE			          = 0
  #FI_RGBA_GREEN			        = 1
  #FI_RGBA_RED				        = 2
  #FI_RGBA_ALPHA			        = 3
  #FI_RGBA_ALPHA_MASK	        = $FF000000
  #FI_RGBA_RED_MASK		        = $00FF0000
  #FI_RGBA_GREEN_MASK	        = $0000FF00
  #FI_RGBA_BLUE_MASK	        = $000000FF
  #FI_RGBA_RGB_MASK	          = #FI_RGBA_RED_MASK|#FI_RGBA_GREEN_MASK|#FI_RGBA_BLUE_MASK
  #FI_RGBA_BLUE_SHIFT		      = 0
  #FI_RGBA_GREEN_SHIFT	      =	8
  #FI_RGBA_RED_SHIFT		      = 16
  #FI_RGBA_ALPHA_SHIFT	      =	24
  
  ; THE 16bit macros only include masks And shifts, since each color element is Not byte aligned
  #FI16_555_RED_MASK          = $7C00
  #FI16_555_GREEN_MASK	      = $03E0
  #FI16_555_BLUE_MASK	        = $001F
  #FI16_555_RED_SHIFT	        =	10
  #FI16_555_GREEN_SHIFT	      = 5
  #FI16_555_BLUE_SHIFT		    = 0
  #FI16_565_RED_MASK		      = $F800
  #FI16_565_GREEN_MASK		    = $07E0
  #FI16_565_BLUE_MASK		      = $001F
  #FI16_565_RED_SHIFT		      = 11
  #FI16_565_GREEN_SHIFT	      = 5
  #FI16_565_BLUE_SHIFT		    = 0
  ; ICC Profile support 
  #FIICC_DEFAULT			        = $00
  #FIICC_COLOR_IS_CMYK		    = $01
  ; Load / Save flag Constants
  #BMP_DEFAULT        = 0
  #BMP_SAVE_RLE       = 1
  #CUT_DEFAULT        = 0
  #DDS_DEFAULT			  = 0
  #EXR_DEFAULT			  = 0		; save Data As half With piz-based wavelet compression
  #EXR_FLOAT			    = $0001	; save Data As float instead of As half (Not recommended)
  #EXR_NONE			      = $0002	; save With no compression
  #EXR_ZIP				    = $0004	; save With zlib compression, in blocks of 16 scan lines
  #EXR_PIZ				    = $0008	; save With piz-based wavelet compression
  #EXR_PXR24			    = $0010	; save With lossy 24-bit float compression
  #EXR_B44				    = $0020	; save With lossy 44% float compression - goes To 22% when combined With EXR_LC
  #EXR_LC				      = $0040	; save images With one luminance And two chroma channels, rather than As RGB (lossy compression)
  #FAXG3_DEFAULT		  = 0
  #GIF_DEFAULT			  = 0
  #GIF_LOAD256			  = 1		; Load the image As a 256 color image With ununsed palette entries, If it's 16 or 2 color
  #GIF_PLAYBACK		    = 2		; 'Play' the GIF To generate each frame (As 32bpp) instead of returning raw frame Data when loading
  #HDR_DEFAULT			  = 0
  #ICO_DEFAULT        = 0
  #ICO_MAKEALPHA		  = 1		; convert To 32bpp And create an alpha channel from the And-mask when loading
  #IFF_DEFAULT        = 0
  #J2K_DEFAULT			  = 0		; save With a 16:1 rate
  #JP2_DEFAULT			  = 0		; save With a 16:1 rate
  #JPEG_DEFAULT       = 0		; loading (see JPEG_FAST); saving (see JPEG_QUALITYGOOD)
  #JPEG_FAST          = $0001	; load the file As fast As possible, sacrificing some quality
  #JPEG_ACCURATE      = $0002	; load the file With the best quality, sacrificing some speed
  #JPEG_CMYK			    = $0004	; load separated CMYK "as is" (use | To combine With other load flags)
  #JPEG_QUALITYSUPERB = $80	; save With superb quality (100:1)
  #JPEG_QUALITYGOOD   = $0100	; save With good quality (75:1)
  #JPEG_QUALITYNORMAL = $0200	; save With normal quality (50:1)
  #JPEG_QUALITYAVERAGE= $0400	; save With average quality (25:1)
  #JPEG_QUALITYBAD    = $0800	; save With bad quality (10:1)
  #JPEG_PROGRESSIVE	  = $2000	; save As a progressive-JPEG (use | To combine With other save flags)
  #KOALA_DEFAULT      = 0
  #LBM_DEFAULT        = 0
  #MNG_DEFAULT        = 0
  #PCD_DEFAULT        = 0
  #PCD_BASE           = 1		; load the bitmap sized 768 x 512
  #PCD_BASEDIV4       = 2		; load the bitmap sized 384 x 256
  #PCD_BASEDIV16      = 3		; load the bitmap sized 192 x 128
  #PCX_DEFAULT        = 0
  #PNG_DEFAULT        = 0
  #PNG_IGNOREGAMMA		= 1		; avoid gamma correction
  #PNM_DEFAULT        = 0
  #PNM_SAVE_RAW       = 0       ; If set the writer saves in RAW format (i.e. P4, P5 Or P6)
  #PNM_SAVE_ASCII     = 1       ; If set the writer saves in ASCII format (i.e. P1, P2 Or P3)
  #PSD_DEFAULT        = 0
  #RAS_DEFAULT        = 0
  #SGI_DEFAULT			  = 0
  #TARGA_DEFAULT      = 0
  #TARGA_LOAD_RGB888  = 1       ; If set the loader converts RGB555 And ARGB8888 -> RGB888.
  #TIFF_DEFAULT       = 0
  #TIFF_CMYK			    = $0001	; reads/stores tags For separated CMYK (use | To combine With compression flags)
  #TIFF_PACKBITS      = $0100  ; save using PACKBITS compression
  #TIFF_DEFLATE       = $0200  ; save using DEFLATE compression (a.k.a. ZLIB compression)
  #TIFF_ADOBE_DEFLATE = $0400  ; save using ADOBE DEFLATE compression
  #TIFF_NONE          = $0800  ; save without any compression
  #TIFF_CCITTFAX3		  = $1000  ; save using CCITT Group 3 fax encoding
  #TIFF_CCITTFAX4		  = $2000  ; save using CCITT Group 4 fax encoding
  #TIFF_LZW			      = $4000	; save using LZW compression
  #TIFF_JPEG			    = $8000	; save using JPEG compression
  #WBMP_DEFAULT       = 0
  #XBM_DEFAULT			  = 0
  #XPM_DEFAULT			  = 0;}
;- Enumerations
;{
  ;I/O image format identifiers.
  Enumeration -1  ;FREE_IMAGE_FORMAT
    #FIF_UNKNOWN
    #FIF_BMP
    #FIF_ICO
    #FIF_JPEG
    #FIF_JNG
    #FIF_KOALA
    #FIF_LBM
    #FIF_MNG
    #FIF_PBM
    #FIF_PBMRAW
    #FIF_PCD
    #FIF_PCX
    #FIF_PGM
    #FIF_PGMRAW
    #FIF_PNG
    #FIF_PPM
    #FIF_PPMRAW
    #FIF_RAS
    #FIF_TARGA
    #FIF_TIFF
    #FIF_WBMP
    #FIF_PSD
    #FIF_CUT
    #FIF_XBM
    #FIF_XPM
    #FIF_DDS
    #FIF_GIF
    #FIF_HDR
    #FIF_FAXG
    #FIF_SGI
    #FIF_EXR
	  #FIF_J2K
	  #FIF_JP2
  EndEnumeration
  #FIF_IFF = #FIF_LBM
  ;Image type used IN FreeImage.
  Enumeration 0 ;FREE_IMAGE_TYPE
    #FIT_UNKNOWN 	; unknown type
    #FIT_BITMAP  	; standard image			: 1- 4- 8- 16- 24- 32-bit
    #FIT_UINT16		; array of unsigned short	: unsigned 16-bit
    #FIT_INT16		; array of short			: signed 16-bit
    #FIT_UINT32		; array of unsigned LONG	: unsigned 32-bit
    #FIT_INT32		; array of LONG			: signed 32-bit
    #FIT_FLOAT		; array of Float			: 32-bit IEEE floating point
    #FIT_DOUBLE		; array of double			: 64-bit IEEE floating point
    #FIT_COMPLEX	; array of #FICOMPLEX		: 2 x 64-bit IEEE floating point
    #FIT_RGB16		; 48-bit RGB image			: 3 x 16-bit
    #FIT_RGBA16		; 64-bit RGBA image		: 4 x 16-bit
    #FIT_RGBF		  ; 96-bit RGB Float image	: 3 x 32-bit IEEE floating point
    #FIT_RGBAF		; 128-bit RGBA Float image	: 4 x 32-bit IEEE floating point
  EndEnumeration
  ;Image color type used IN FreeImage.
  Enumeration 0;FREE_IMAGE_COLOR_TYPE
    #FIC_MINISWHITE 		; min Value is white
    #FIC_MINISBLACK 		; min Value is black
    #FIC_RGB        		; RGB color model
    #FIC_PALETTE    		; color map indexed
    #FIC_RGBALPHA   		; RGB color model With Alpha channel
    #FIC_CMYK       		; CMYK color model
  EndEnumeration
  ;Color quantization algorithms ; Constants used IN FreeImage_ColorQuantize.
  Enumeration 0;FREE_IMAGE_QUANTIZE
    #FIQ_WUQUANT 		; Xiaolin Wu color quantization algorithm
    #FIQ_NNQUANT 			; NeuQuant neural-net quantization algorithm by Anthony Dekker
  EndEnumeration
  ;Dithering algorithms ;Constants used IN FreeImage_Dither.
  Enumeration ;FREE_IMAGE_DITHER
    #FID_FS				; Floyd & Steinberg error diffusion
    #FID_BAYER4x4		; Bayer ordered dispersed dot dithering (order 2 Dithering matrix)
    #FID_BAYER8x8		; Bayer ordered dispersed dot dithering (order 3 Dithering matrix)
    #FID_CLUSTER6x6		; ordered clustered dot dithering (order 3 - 6x6 matrix)
    #FID_CLUSTER8x8		; ordered clustered dot dithering (order 4 - 8x8 matrix)
    #FID_CLUSTER16x16	; ordered clustered dot dithering (order 8 - 16x16 matrix)
    #FID_BAYER16x16			; Bayer ordered dispersed dot dithering (order 4 Dithering matrix)
  EndEnumeration
  ;Lossless JPEG transformations ;Constants used IN FreeImage_JPEGTransform
  Enumeration 0;FREE_IMAGE_JPEG_OPERATION
    #FIJPEG_OP_NONE				; NO transformation
    #FIJPEG_OP_FLIP_H			; horizontal flip
    #FIJPEG_OP_FLIP_V		; vertical flip
    #FIJPEG_OP_TRANSPOSE		; transpose across UL-to-LR axis
    #FIJPEG_OP_TRANSVERSE	; transpose across UR-to-LL axis
    #FIJPEG_OP_ROTATE_90		; 90-degree clockwise rotation
    #FIJPEG_OP_ROTATE_180	; 180-degree rotation
    #FIJPEG_OP_ROTATE_270		; 270-degree clockwise (Or 90 ccw)
  EndEnumeration
  ;Tone mapping operators ;Constants used IN FreeImage_ToneMapping.
  Enumeration 0;FREE_IMAGE_TMO
    #FITMO_DRAGO03	 	; Adaptive logarithmic mapping (f. Drago 2003)
    #FITMO_REINHARD05 ; Dynamic range reduction inspired by photoreceptor physiology (e. Reinhard 2005)
    #FITMO_FATTAL02   ;  Gradient domain high dynamic range compression (R. Fattal, 2002)
  EndEnumeration
  ;Upsampling / downsampling FIlters ;Constants used IN FreeImage_Rescale.
  Enumeration 0;FREE_IMAGE_FILTER
    #FILTER_BOX		  	; Box pulse Fourier window 1st order (constant) b-spline
    #FILTER_BICUBIC	  ; Mitchell & Netravali's two-param cubic FIlter
    #FILTER_BILINEAR   ; Bilinear FIlter
    #FILTER_BSPLINE	  ; 4th order (cubic) b-spline
    #FILTER_CATMULLROM	; Catmull-Rom spline Overhauser spline
    #FILTER_LANCZOS3	  ; Lanczos3 FIlter
  EndEnumeration
  ;Color channels ;Constants used IN color manipulation routines.
  Enumeration 0;FREE_IMAGE_COLOR_CHANNEL
    #FICC_RGB		; USE Red Green And Blue channels
    #FICC_RED	; USE Red channel
    #FICC_GREEN		; USE Green channel
    #FICC_BLUE	; USE Blue channel
    #FICC_ALPHA	; USE Alpha channel
    #FICC_BLACK	; USE black channel
    #FICC_REAL	; COMPLEX images: USE real part
    #FICC_IMAG	; COMPLEX images: USE imaginary part
    #FICC_MAG	; COMPLEX images: USE magnitude
    #FICC_PHASE		; COMPLEX images: USE phase
  EndEnumeration
  ;Metadata support 
  ;Tag Data type information (based ON TIFF specifIcations)
  ;Note: RATIONALs are THE ratio of two 32-bit integer values.
  Enumeration 0; FREE_IMAGE_MDTYPE
    #FIDT_NOTYPE			; placeholder 
    #FIDT_BYTE			; 8-bit unsigned integer 
    #FIDT_ASCII		; 8-bit Bytes w/ last byte NULL 
    #FIDT_SHORT		; 16-bit unsigned integer 
    #FIDT_LONG		; 32-bit unsigned integer 
    #FIDT_RATIONAL	; 64-bit unsigned fraction 
    #FIDT_SBYTE		; 8-bit signed integer 
    #FIDT_UNDEFINED	; 8-bit untyped Data 
    #FIDT_SSHORT		; 16-bit signed integer 
    #FIDT_SLONG		; 32-bit signed integer 
    #FIDT_SRATIONAL		; 64-bit signed fraction 
    #FIDT_FLOAT			; 32-bit IEEE floating point 
    #FIDT_DOUBLE			; 64-bit IEEE floating point 
    #FIDT_IFD		; 32-bit unsigned integer (offset) 
    #FIDT_PALETTE		; 32-bit RGBQUAD 
  EndEnumeration
  ;Metadata models supported by FreeImage
  Enumeration -1; FREE_IMAGE_MDMODEL
    #FIMD_NODATA
    #FIMD_COMMENTS			; single Comment Or keywords
    #FIMD_EXIF_MAIN		; Exif-TIFF Metadata
    #FIMD_EXIF_EXIF		; Exif-speci#FIc Metadata
    #FIMD_EXIF_GPS		; Exif GPS Metadata
    #FIMD_EXIF_MAKERNOTE	; Exif maker Note Metadata
    #FIMD_EXIF_INTEROP	; Exif interoperability Metadata
    #FIMD_IPTC			; IPTC/NAA Metadata
    #FIMD_XMP			; Abobe XMP Metadata
    #FIMD_GEOTIFF		; GeoTIFF Metadata
    #FIMD_ANIMATION		; Animation Metadata
    #FIMD_CUSTOM				; used To attach OTHER Metadata types To a dib
  EndEnumeration
;}
;- Structures
;{
  ; Bitmap types 
  ; FIBITMAP      Long
  ; FIMULTIBITMAP Long
  ; FIMETADATA    Long  Handle To a Metadata model
  ; FITAG         Long  Handle To a FreeImage Tag
  ; FIMEMORY      Long  Handle To a memory I/O stream
  
  ; types used IN THE library (specific To FreeImage) 
  ; 48-bit RGB 
  Structure FIRGB16
    Red.w
    Green.w
    Blue.w
  EndStructure
  ; 64-bit RGBA
  Structure FIRGBA16
    Red.w
    Green.w
    Blue.w
    Alpha.w
  EndStructure
  ; 96-bit RGB Float
  Structure FIRGBF
    Red.f
    Green.f
    Blue.f
  EndStructure
  ; 128-bit RGBA Float
  Structure FIRGBAF
    Red.f
    Green.f
    Blue.f
    Alpha.f
  EndStructure
  ; Data Structure for COMPLEX type (COMPLEX number)
  Structure FICOMPLEX
    r.d ; real part
    i.d ; imaginary part
  EndStructure
  Structure FIICCPROFILE
    flags.w;	; info flag
    Size.l	; profile's size measured in bytes
    data_.l	; points to a block of contiguous memory containing the profile
  EndStructure
  ; file IO routines
  Structure FreeImageIO
    read_proc.l; FI_ReadProc -pointer to the function used to read data
    write_proc.l; FI_WriteProc -pointer to the function used to write data
    seek_proc.l; FI_SeekProc - pointer to the function used to seek
    tell_proc.l  ; FI_TellProc - pointer to the function used to aquire the current position
  EndStructure
  ;{ Plugin routines
    ;.l(s)            FI_FormatProc()
    ;.l(s)            FI_DescriptionProc()
    ;.l(s)            FI_ExtensionListProc()
    ;.l(s)            FI_RegExprProc()
    ;.l                FI_OpenProc(IO.l(FreeImageIO), Handle.l(fi_handle), Read.b(Bool))
    ;.l                FI_CloseProc(IO.l(FreeImageIO), Handle.l(fi_handle), Data.l)
    ;.l                FI_PageCountProc(IO.l(FreeImageIO), Handle.l(fi_handle), Data.l)
    ;.l                FI_PageCapabilityProc(IO.l(FreeImageIO), Handle.l(fi_handle), Data.l)
    ;.l(FIBITMAP) FI_LoadProc(IO.l(FreeImageIO), Handle.l(fi_handle), page.l, flags.l, Data.l)
    ;.b               FI_SaveProc(IO.l(FreeImageIO), dib.l(FIBITMAP), Handle.l(fi_handle), page.l, flags.l, Data.l)
    ;.b               FI_ValidateProc(IO.l(FreeImageIO), Handle.l(fi_handle))
    ;.l(s)            FI_MimeProc()
    ;.b               FI_SupportsExportBPPProc(bpp.l)
    ;.b               FI_SupportsExportTypeProc(type.l => #FREE_IMAGE_TYPE)
    ;.b               FI_SupportsICCProfilesProc()
  ;}
  Structure Plugin
    format_proc.l
    description_proc.l
    extension_proc.l
    regexpr_proc.l
    open_proc.l
    close_proc.l
    pagecount_proc.l
    pagecapability_proc.l
    load_proc.l
    save_proc.l
    validate_proc.l
    mime_proc.l
    supports_export_bpp_proc.l
    supports_export_type_proc.l
    supports_icc_profiles_proc.l
  EndStructure
;}

; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 348
; Folding = AAAg