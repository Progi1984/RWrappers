XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

  Define.l w, h
  Define.cairo_surface_t *image
  
  cairo_arc (*cr, 128.0, 128.0, 76.8, 0, 2*#PI)
  cairo_clip (*cr)
  cairo_new_path (*cr) ; path Not consumed by clip()
  
  *image = cairo_image_surface_create_from_png ("romedalen.png")
  w = cairo_image_surface_get_width (*image)
  h = cairo_image_surface_get_height (*image)
  
  cairo_scale (*cr, 256.0/w, 256.0/h)
  
  cairo_set_source_surface (*cr, *image, 0, 0)
  cairo_paint (*cr)
  
  cairo_surface_destroy (*image)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample03.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
