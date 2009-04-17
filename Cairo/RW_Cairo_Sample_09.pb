XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

Define.cairo_pattern_t pat

pat = cairo_pattern_create_linear (0.0, 0.0,  0.0, 256.0)
cairo_pattern_add_color_stop_rgba (pat, 1, 0, 0, 0, 1)
cairo_pattern_add_color_stop_rgba (pat, 0, 1, 1, 1, 1)
cairo_rectangle (*cr, 0, 0, 256, 256)
cairo_set_source (*cr, pat)
cairo_fill (*cr)
cairo_pattern_destroy (pat)

pat = cairo_pattern_create_radial (115.2, 102.4, 25.6, 102.4,  102.4, 128.0)
cairo_pattern_add_color_stop_rgba (pat, 0, 1, 1, 1, 1)
cairo_pattern_add_color_stop_rgba (pat, 1, 0, 0, 0, 1)
cairo_set_source (*cr, pat)
cairo_arc (*cr, 128.0, 128.0, 76.8, 0, 2 * #PI)
cairo_fill (*cr)
cairo_pattern_destroy (pat)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample09.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
