XIncludeFile "RW_LibBzip2_Res.pb"
ImportC "bzip2.lib"
  BZ2_bzBuffToBuffCompress(dest.p-ascii, destLen.l, source.p-ascii, sourceLen.l, blockSize100k.l, verbosity.l, workFactor.l) As "_BZ2_bzBuffToBuffCompress"
  BZ2_bzBuffToBuffDecompress(dest.p-ascii, destLen.l, source.p-ascii, sourceLen.l, small.l, verbosity.l) As "_BZ2_bzBuffToBuffDecompress"
  
  BZ2_bzCompress(*strm.bz_stream, action.l) As "_BZ2_bzCompress"
  BZ2_bzCompressEnd(*strm.bz_stream) As "_BZ2_bzCompressEnd"
  BZ2_bzCompressInit(*strm.bz_stream, blockSize100k.l, verbosity.l, workFactor.l = 30) As "_BZ2_bzCompressInit"
  
  BZ2_bzDecompress(*strm.bz_stream) As "_BZ2_bzDecompress"
  BZ2_bzDecompressEnd(*strm.bz_stream) As "_BZ2_bzDecompressEnd"
  BZ2_bzDecompressInit(*strm.bz_stream, verbosity.l, small.l) As "_BZ2_bzDecompressInit"
  
  BZ2_bzRead_(bzerror.l, b.l, *buf, len.l) As "_BZ2_bzRead"
  BZ2_bzReadClose(bzerror.l, b.l) As "_BZ2_bzReadClose"
  BZ2_bzReadGetUnused(bzerror.l, b.l, *unused, nUnused.l) As "_BZ2_bzReadGetUnused"
  BZ2_bzReadOpen(bzerror.l, f.l, verbosity.l, small.l, *unused, nUnused.l) As "_BZ2_bzReadOpen"
  
  BZ2_bzWrite_(bzerror.l, b.l, *buf, len.l) As "_BZ2_bzWrite"
  BZ2_bzWriteClose(bzerror.l, b.l, abandon.l, nbytes_in.l, nbytes_out.l) As "_BZ2_bzWriteClose"
  BZ2_bzWriteClose64(bzerror.l, b.l, abandon.l, nbytes_in_lo32.l, nbytes_in_hi32.l, nbytes_out_lo32.l, nbytes_out_hi32.l) As "_BZ2_bzWriteClose64"
  BZ2_bzWriteOpen(bzerror.l, f.l, blockSize100k.l, verbosity.l, workFactor.l) As "_BZ2_bzWriteOpen"
  
  BZ2_bzclose(b.l) As "_BZ2_bzclose"
  BZ2_bzdopen(fd.l, mode.p-ascii) As "_BZ2_bzdopen"
  BZ2_bzerror(b.l, errnum.l) As "_BZ2_bzerror"
  BZ2_bzflush(b.l) As "_BZ2_bzflush"
  BZ2_bzlibVersion() As "_BZ2_bzlibVersion"
  BZ2_bzopen(path.p-ascii, mode.p-ascii) As "_BZ2_bzopen"
  BZ2_bzread(b.l, *buf, len.l) As "_BZ2_bzread"
  BZ2_bzwrite(b.l, *buf, len.l) As "_BZ2_bzwrite"
  
  DllGetVersion() As "_DllGetVersion"
EndImport


; IDE Options = PureBasic 4.10 (Windows - x86)
; CursorPosition = 7
; Folding = -