XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

Define.d xc = 128.0
Define.d yc = 128.0
Define.d radius = 100.0
Define.d angle1 = 45.0  * (#PI/180.0)  ; angles are specified 
Define.d angle2 = 180.0 * (#PI/180.0)  ; in radians           

cairo_set_line_width (*cr, 10.0)
cairo_arc_negative (*cr, xc, yc, radius, angle1, angle2)
cairo_stroke (*cr)

; draw helping lines 
cairo_set_source_rgba (*cr, 1, 0.2, 0.2, 0.6)
cairo_set_line_width (*cr, 6.0)

cairo_arc (*cr, xc, yc, 10.0, 0, 2*#PI)
cairo_fill (*cr)

cairo_arc (*cr, xc, yc, radius, angle1, angle1)
cairo_line_to (*cr, xc, yc)
cairo_arc (*cr, xc, yc, radius, angle2, angle2)
cairo_line_to (*cr, xc, yc)
cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample01.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
