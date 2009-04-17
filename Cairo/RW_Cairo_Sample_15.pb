XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

cairo_select_font_face (*cr, "Sans", #CAIRO_FONT_SLANT_NORMAL, #CAIRO_FONT_WEIGHT_BOLD)
cairo_set_font_size (*cr, 90.0)

cairo_move_to (*cr, 10.0, 135.0)
cairo_show_text (*cr, "Hello")

cairo_move_to (*cr, 70.0, 165.0)
cairo_text_path (*cr, "void")
cairo_set_source_rgb (*cr, 0.5, 0.5, 1)
cairo_fill_preserve (*cr)
cairo_set_source_rgb (*cr, 0, 0, 0)
cairo_set_line_width (*cr, 2.56)
cairo_stroke (*cr)

; draw helping lines 
cairo_set_source_rgba (*cr, 1, 0.2, 0.2, 0.6)
cairo_arc (*cr, 10.0, 135.0, 5.12, 0, 2*#PI)
cairo_close_path (*cr)
cairo_arc (*cr, 70.0, 165.0, 5.12, 0, 2*#PI)
cairo_fill (*cr)



cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample15.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
