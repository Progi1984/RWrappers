XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

  cairo_set_line_width (*cr, 30.0)
  cairo_set_line_cap  (*cr, #CAIRO_LINE_CAP_BUTT) ; Default 
  cairo_move_to (*cr, 64.0, 50.0) 
  cairo_line_to (*cr, 64.0, 200.0)
  cairo_stroke (*cr)
  cairo_set_line_cap  (*cr, #CAIRO_LINE_CAP_ROUND)
  cairo_move_to (*cr, 128.0, 50.0) 
  cairo_line_to (*cr, 128.0, 200.0)
  cairo_stroke (*cr)
  cairo_set_line_cap  (*cr, #CAIRO_LINE_CAP_SQUARE)
  cairo_move_to (*cr, 192.0, 50.0) 
  cairo_line_to (*cr, 192.0, 200.0)
  cairo_stroke (*cr)
  
  ; draw helping lines 
  cairo_set_source_rgb (*cr, 1, 0.2, 0.2)
  cairo_set_line_width (*cr, 2.56)
  cairo_move_to (*cr, 64.0, 50.0) 
  cairo_line_to (*cr, 64.0, 200.0)
  cairo_move_to (*cr, 128.0, 50.0)  
  cairo_line_to (*cr, 128.0, 200.0)
  cairo_move_to (*cr, 192.0, 50.0) 
  cairo_line_to (*cr, 192.0, 200.0)
  cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample13.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
