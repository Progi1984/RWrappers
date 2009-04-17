XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

Define.cairo_text_extents_t extents

Define.s utf8 = "cairo"
Define.d x,y

cairo_select_font_face (*cr, "Sans", #CAIRO_FONT_SLANT_NORMAL, #CAIRO_FONT_WEIGHT_NORMAL)

cairo_set_font_size (*cr, 100.0)
cairo_text_extents (*cr, utf8, @extents)

x=25.0
y=150.0

cairo_move_to (*cr, x,y)
cairo_show_text (*cr, utf8)

; draw helping lines 
cairo_set_source_rgba (*cr, 1, 0.2, 0.2, 0.6)
cairo_set_line_width (*cr, 6.0)
cairo_arc (*cr, x, y, 10.0, 0, 2*#PI)
cairo_fill (*cr)
cairo_move_to (*cr, x,y)
cairo_rel_line_to (*cr, 0, -extents\height)
cairo_rel_line_to (*cr, extents\width, 0)
cairo_rel_line_to (*cr, extents\x_bearing, -extents\y_bearing)
cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample17.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
