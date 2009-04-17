XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)




cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample18.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
