XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

Dim dashes.d(3)
dashes(0) = 50.0   ; ink 
dashes(1) = 10.0  ; skip 
dashes(2) = 10.0  ; ink 
dashes(3) = 10.0   ; skip

Define.l ndash  = 4
Define.d offset = -50.0

cairo_set_dash (*cr, @dashes(), ndash, offset)
cairo_set_line_width (*cr, 10.0)

cairo_move_to (*cr, 128.0, 25.6)
cairo_line_to (*cr, 230.4, 230.4)
cairo_rel_line_to (*cr, -102.4, 0.0)
cairo_curve_to (*cr, 51.2, 230.4, 51.2, 128.0, 128.0, 128.0)

cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample06.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
