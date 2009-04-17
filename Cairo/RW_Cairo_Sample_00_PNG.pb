XIncludeFile "RW_Cairo_Inc.pb"

Define.d xc = 600 / 2
Define.d yc = 200 / 3
Define.d radius = 100.0
Define.d angle1 = 45.0  * (#PI/180.0)  ; angles are specified 
Define.d angle2 = 180.0 * (#PI/180.0)  ; in radians     

  surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 600, 200)
  *cr = cairo_create (surface)
  cairo_save (*cr)

    cairo_set_line_width (*cr, 10.0)
    cairo_arc (*cr, xc, yc, radius, angle1, angle2)
    cairo_stroke (*cr)
    
    ; draw helping lines 
    cairo_set_source_rgba (*cr, 1, 0.2, 0.2, 0.6)
    cairo_set_line_width (*cr, 6.0)
    
    cairo_arc (*cr, xc, yc, 10.0, 0, 2*#PI)
    cairo_fill (*cr)
    
    cairo_arc (*cr, xc, yc, radius, angle1, angle1)
    cairo_line_to (*cr, xc, yc)
    cairo_arc (*cr, xc, yc, radius, angle2, angle2)
    cairo_line_to (*cr, xc, yc)
    cairo_stroke (*cr)
    
    cairo_show_page (*cr)

  cairo_restore (*cr)
  cairo_surface_write_to_png (surface, "Samples\sample00.png")
  cairo_destroy (*cr)
  cairo_surface_destroy (surface)
