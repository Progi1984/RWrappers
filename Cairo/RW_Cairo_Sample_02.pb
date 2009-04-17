XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

cairo_arc (*cr, 128.0, 128.0, 76.8, 0, 2 * #PI)
cairo_clip (*cr)

cairo_new_path (*cr)  ; current path is Not consumed by cairo_clip() 
cairo_rectangle (*cr, 0, 0, 256, 256)
cairo_fill (*cr)
cairo_set_source_rgb (*cr, 0, 1, 0)
cairo_move_to (*cr, 0, 0)
cairo_line_to (*cr, 256, 256)
cairo_move_to (*cr, 256, 0)
cairo_line_to (*cr, 0, 256)
cairo_set_line_width (*cr, 10.0)
cairo_stroke (*cr)



cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample02.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
