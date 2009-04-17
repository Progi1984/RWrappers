XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

cairo_move_to (*cr, 128.0, 25.6)
cairo_line_to (*cr, 230.4, 230.4)
cairo_rel_line_to (*cr, -102.4, 0.0)
cairo_curve_to (*cr, 51.2, 230.4, 51.2, 128.0, 128.0, 128.0)
cairo_close_path (*cr)

cairo_move_to (*cr, 64.0, 25.6)
cairo_rel_line_to (*cr, 51.2, 51.2)
cairo_rel_line_to (*cr, -51.2, 51.2)
cairo_rel_line_to (*cr, -51.2, -51.2)
cairo_close_path (*cr)

cairo_set_line_width (*cr, 10.0)
cairo_set_source_rgb (*cr, 0, 0, 1)
cairo_fill_preserve (*cr)
cairo_set_source_rgb (*cr, 0, 0, 0)
cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample07.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
