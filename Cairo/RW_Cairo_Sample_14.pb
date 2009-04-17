XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

  cairo_set_line_width (*cr, 40.96)
  cairo_move_to (*cr, 76.8, 84.48)
  cairo_rel_line_to (*cr, 51.2, -51.2)
  cairo_rel_line_to (*cr, 51.2, 51.2)
  cairo_set_line_join (*cr, #CAIRO_LINE_JOIN_MITER) ; Default 
  cairo_stroke (*cr)
  
  cairo_move_to (*cr, 76.8, 161.28)
  cairo_rel_line_to (*cr, 51.2, -51.2)
  cairo_rel_line_to (*cr, 51.2, 51.2)
  cairo_set_line_join (*cr, #CAIRO_LINE_JOIN_BEVEL)
  cairo_stroke (*cr)
  
  cairo_move_to (*cr, 76.8, 238.08)
  cairo_rel_line_to (*cr, 51.2, -51.2)
  cairo_rel_line_to (*cr, 51.2, 51.2)
  cairo_set_line_join (*cr, #CAIRO_LINE_JOIN_ROUND)
  cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample14.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
