XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

  cairo_move_to (*cr, 50.0, 75.0)
  cairo_line_to (*cr, 200.0, 75.0)
  
  cairo_move_to (*cr, 50.0, 125.0)
  cairo_line_to (*cr, 200.0, 125.0)
  
  cairo_move_to (*cr, 50.0, 175.0)
  cairo_line_to (*cr, 200.0, 175.0)
  
  cairo_set_line_width (*cr, 30.0)
  cairo_set_line_cap (*cr, #CAIRO_LINE_CAP_ROUND)
  cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample12.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
