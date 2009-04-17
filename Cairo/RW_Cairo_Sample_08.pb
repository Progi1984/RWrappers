XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

cairo_set_line_width (*cr, 6);

cairo_rectangle (*cr, 12, 12, 232, 70);
cairo_new_sub_path (*cr)
cairo_arc (*cr, 64, 64, 40, 0, 2*#PI);
cairo_new_sub_path (*cr)
cairo_arc_negative (*cr, 192, 64, 40, 0, -2*#PI);

cairo_set_fill_rule (*cr, #CAIRO_FILL_RULE_EVEN_ODD);
cairo_set_source_rgb (*cr, 0, 0.7, 0)
cairo_fill_preserve (*cr);
cairo_set_source_rgb (*cr, 0, 0, 0)
cairo_stroke (*cr);

cairo_translate (*cr, 0, 128);
cairo_rectangle (*cr, 12, 12, 232, 70);
cairo_new_sub_path (*cr)
cairo_arc (*cr, 64, 64, 40, 0, 2*#PI);
cairo_new_sub_path (*cr)
cairo_arc_negative (*cr, 192, 64, 40, 0, -2*#PI);

cairo_set_fill_rule (*cr, #CAIRO_FILL_RULE_WINDING);
cairo_set_source_rgb (*cr, 0, 0, 0.9)
cairo_fill_preserve (*cr);
cairo_set_source_rgb (*cr, 0, 0, 0)
cairo_stroke (*cr);



cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample08.png")
cairo_destroy (*cr);
cairo_surface_destroy (surface);
