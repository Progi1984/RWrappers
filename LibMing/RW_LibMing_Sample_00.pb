XIncludeFile "RW_LibMing_Inc.pb"

  
	m.SWFMovie = newSWFMovieWithVersion(8)

	fill.SWFFillStyle = newSWFSolidFillStyle(255, 128, 0, 255)
	shape.SWFShape = newSWFShape()
	SWFShape_setRightFillStyle(shape, fill)
	
	SWFShape_setLine(shape, 1, 0,0,0,255)
	SWFShape_drawLine(shape, 100, 0)
	SWFShape_drawLine(shape, 0, 100)
	SWFShape_drawLine(shape, -100, 0)
	SWFShape_drawLine(shape, 0, -100)

	SWFMovie_add(m, shape)
	SWFMovie_save(m, "Samples\Sample_00.swf")