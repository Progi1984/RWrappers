;{ Macros }
  Macro ExceptionType
    l
  EndMacro
  Macro MagickWand
    l
  EndMacro
  Macro ssize_t
    l
  EndMacro
  Macro MagickStatusType
    q
  EndMacro
  Macro BlobInfo
    _BlobInfo
  EndMacro
  Macro ExceptionInfo
    _ExceptionInfo
  EndMacro
  Macro Image
    _Image
  EndMacro
  Macro ImageInfo
    _ImageInfo
  EndMacro
  Macro FilterTypes
    l
  EndMacro
;}
;{ Constantes 
  #MaxTextExtent              = 4096
  #MAGICKCORE_QUANTUM_DEPTH  = 16
  #MAGICKCORE_X11_DELEGATE = #True
  ; Permit enciphering And deciphering image pixels.
  #MAGICKCORE_CIPHER_SUPPORT = 1
  ; To use the bzip2 compression library
  #MAGICKCORE_BZLIB_DELEGATE = 1
  ; To use the FreeType (TrueType & Postscript font support) library
  #MAGICKCORE_FREETYPE_DELEGATE = 1
  ; To use the JBIG library
  #MAGICKCORE_JBIG_DELEGATE = 1
  ; To use the Jasper JPEG v2 library
  #MAGICKCORE_JP2_DELEGATE = 1
  ; To use the IJG JPEG v1 library
  #MAGICKCORE_JPEG_DELEGATE = 1
  ; To use the "little" Color Management System (LCMS) library
  #MAGICKCORE_LCMS_DELEGATE = 1
  ; To use the PNG library
  #MAGICKCORE_PNG_DELEGATE = 1
  ; To use the TIFF library
  #MAGICKCORE_TIFF_DELEGATE = 1
  ; To use the Windows GDI32 library (For clipboard And emf modules)
  #MAGICKCORE_WINGDI32_DELEGATE = 1
  ; To use the libwmf WMF parsing library
  #MAGICKCORE_WMFLITE_DELEGATE = 1
  ; To use the GNOME XML library
  #MAGICKCORE_XML_DELEGATE = 1
  ; To use the zlib ZIP compression library
  #MAGICKCORE_ZLIB_DELEGATE = 1
  ; the package name.
  #MAGICKCORE_PACKAGE_NAME = "ImageMagick"
  ; To 1 If you have the <ft2build.h> header file. 
  #MAGICKCORE_HAVE_FT2BUILD_H = 1
  ; To 1 If you have the `ftruncate' function. 
  #MAGICKCORE_HAVE_FTRUNCATE = 1
  ; To support memory mapping files For improved performance
  #MAGICKCORE_HAVE_MMAP_FILEIO = 1
  ; To 1 If you have the `raise' function. 
  #MAGICKCORE_HAVE_RAISE = 1
  ; To 1 If you have the `memmove' function. 
  #MAGICKCORE_HAVE_MEMMOVE = 1
  ; To 1 If you have the `sysconf' function. 
  #MAGICKCORE_HAVE_SYSCONF = 1
  ; To 1 If you have the `vsnprintf' function. 
  #MAGICKCORE_HAVE_VSNPRINTF = 1
  ; To 1 If you have the `popen' function. 
  #MAGICKCORE_HAVE_POPEN = 1
  ; To   If you have the `strcasecmp' function. 
  #MAGICKCORE_HAVE_STRCASECMP = 1
  ; To 1 If you have the `strncasecmp' function. 
  #MAGICKCORE_HAVE_STRNCASECMP = 1
  ; To 1 If you have the `tempnam' function. 
  #MAGICKCORE_HAVE_TEMPNAM = 1
  ; To include the <sys/types.h> header file
  #MAGICKCORE_HAVE_SYS_TYPES_H = 1
  ; To 1 If you have the `_wfopen' function. 
  #MAGICKCORE_HAVE__WFOPEN = 1
  ; To 1 If you have the `_wstat' function. 
  #MAGICKCORE_HAVE__WSTAT = 1
  #MAGICKCORE_HAVE_VSNPRINTF = 1
  #MAGICKCORE_HAVE_SETVBUF = 1
  #MAGICKCORE_HAVE_TEMPNAM = 1
  #MAGICKCORE_HAVE_RAISE = 1
  ; Tiff features.
  ; To 1 If you have the <tiffconf.h> header file. 
  #MAGICKCORE_HAVE_TIFFCONF_H = 1
  ; To 1 If you have the `TIFFMergeFieldInfo' function. 
  #MAGICKCORE_HAVE_TIFFMERGEFIELDINFO = 1
  ; To 1 If you have the `TIFFSetErrorHandlerExt' function. 
  #MAGICKCORE_HAVE_TIFFSETERRORHANDLEREXT = 1
  ; To 1 If you have the `TIFFSetTagExtender' function. 
  #MAGICKCORE_HAVE_TIFFSETTAGEXTENDER = 1
  ; To 1 If you have the `TIFFSetWarningHandlerExt' function. 
  #MAGICKCORE_HAVE_TIFFSETWARNINGHANDLEREXT = 1
;}
;{ Enumerations 
  Enumeration ; ChannelType
    #UndefinedChannel
    #RedChannel = $0001
    #GrayChannel = $0001
    #CyanChannel = $0001
    #GreenChannel = $0002
    #MagentaChannel = $0002
    #BlueChannel = $0004
    #YellowChannel = $0004
    #AlphaChannel = $0008
    #OpacityChannel = $0008
    #MatteChannel = $0008  ; deprecated 
    #BlackChannel = $0020
    #IndexChannel = $0020
    #TrueAlphaChannel = $0040
    #RGBChannels = $0080
    #GrayChannels = $0080
    #AllChannels = $003F
    #DefaultChannels = #AllChannels &~ #OpacityChannel
  EndEnumeration  
  Enumeration ; ClassType
    #UndefinedClass
    #DirectClass
    #PseudoClass
  EndEnumeration 
  Enumeration ; MagickBooleanType
    #MagickFalse = 0
    #MagickTrue = 1
  EndEnumeration 
  Enumeration ; FilterTypes
    #UndefinedFilter
    #PointFilter
    #BoxFilter
    #TriangleFilter
    #HermiteFilter
    #HanningFilter
    #HammingFilter
    #BlackmanFilter
    #GaussianFilter
    #QuadraticFilter
    #CubicFilter
    #CatromFilter
    #MitchellFilter
    #LanczosFilter
    #BesselFilter
    #SincFilter
    #KaiserFilter
    #WelshFilter
    #ParzenFilter
    #LagrangeFilter
    #BohmanFilter
    #BartlettFilter
    #SentinelFilter  ; a count of all the filters Not a real filter 
  EndEnumeration
;}
;{ Compiler Defines
  CompilerSelect #MAGICKCORE_QUANTUM_DEPTH
    CompilerCase 8 ;{
      #MagickEpsilon    = 1.0e-6
      #MagickHuge       = 1.0e6
      #MaxColormapSize  = 256
      #MaxMap           = 255
      Macro MagickRealType
        d
      EndMacro
      CompilerIf Defined(MAGICKCORE_HDRI_SUPPORT #PB_Constant)
        Macro Quantum
          f
        EndMacro 
        #QuantumRange   = 255.0
        #QuantumFormat  = "%g"
      CompilerElse
        Macro Quantum
          c
        EndMacro
        #QuantumRange   = 255
        #QuantumFormat  = "%u"
      CompilerEndIf
    ;}
    CompilerCase 16 ;{
      #MagickEpsilon    = 1.0e-10
      #MagickHuge       = 1.0e12
      #MaxColormapSize  = 65536
      #MaxMap           = 65535
      Macro MagickRealType
        d
      EndMacro
      CompilerIf Defined(MAGICKCORE_HDRI_SUPPORT, #PB_Constant)
        Macro Quantum
          f
        EndMacro
        #QuantumRange   = 65535.0
        #QuantumFormat  = "%g"
      CompilerElse
        Macro Quantum
          c
        EndMacro
        #QuantumRange   = 65535
        #QuantumFormat  = "%u"
      CompilerEndIf
    ;}
    CompilerCase 32 ;{
      #MagickEpsilon    = 1.0e-10
      #MagickHuge       = 1.0e12
      #MaxColormapSize  = 65536
      #MaxMap           = 65535
      Macro MagickRealType
        d
      EndMacro
      CompilerIf Defined(MAGICKCORE_HDRI_SUPPORT #PB_Constant)
        Macro Quantum
          f
        EndMacro
        #QuantumRange   = 4294967295.0
        #QuantumFormat  = "%g"
      CompilerElse
        Macro Quantum
          q
        EndMacro
        #QuantumRange   = 4294967295
        #QuantumFormat  = "%u"
      CompilerEndIf
    ;}
    CompilerCase 64 ;{
      CompilerIf Defined(MAGICKCORE_HAVE_LONG_DOUBLE_WIDER, #PB_Constant)
        #MagickEpsilon  = 1.0e-10
        #MagickHuge     = 1.0e12
        #MaxColormapSize= 65536
        #MaxMap         = 65535
        Macro MagickRealType
          d
        EndMacro
        CompilerIf Defined(MAGICKCORE_HDRI_SUPPORT)
          Macro Quantum
            d
          EndMacro
          #QuantumRange = 18446744073709551615.0
          #QuantumFormat= "%g"
        CompilerElse
          Macro Quantum
            q
          EndMacro
          #QuantumRange = 18446744073709551615
          #QuantumFormat= "%llu"
        CompilerEndIf
      CompilerElse
        CompilerIf Not Defined(_CH_, #PB_Constant)
          MessageRequester("ImageMagick", "Specified value of MAGICKCORE_QUANTUM_DEPTH is Not supported")
          End
        CompilerEndIf
      CompilerEndIf
    ;}
  CompilerEndSelect
  #MaxRGB = #QuantumRange  ; deprecated 
  CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
    CompilerIf #MAGICKCORE_SIZEOF_UNSIGNED_LONG_LONG = 8
      Macro MagickOffsetType
        l
      EndMacro
      Macro MagickSizeType
        q
      EndMacro
      #MagickSizeFormat = "%10llu"
    CompilerElse
      Macro MagickOffsetType
        l
      EndMacro
      Macro MagickSizeType
        q
      EndMacro
      #MagickSizeFormat = "%10lu"
    CompilerEndIf
  CompilerElse
      Macro MagickOffsetType
        q
      EndMacro
      Macro MagickSizeType
        q
      EndMacro
      #MagickSizeFormat = "%10llu"
  CompilerEndIf
  CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
    #ExceptionInfo = #MagickExceptionInfo
  CompilerEndIf
;}
;{ Structures }
  Structure PixelWand
    id.l
    name.s{#MaxTextExtent}
    ;-TODOexception.ExceptionInfo 
    ;-TODOpixel.MagickPixelPacket 
    count.l
    ;-TODOdebug_.MagickBooleanType 
    signature.l
  EndStructure
;{
