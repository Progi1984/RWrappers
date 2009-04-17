XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)


Define.l w, h
Define.cairo_surface_t image
Define.cairo_pattern_t pattern
Define.cairo_matrix_t  matrix

image = cairo_image_surface_create_from_png ("romedalen.png")
w = cairo_image_surface_get_width (image)
h = cairo_image_surface_get_height (image)

pattern = cairo_pattern_create_for_surface (image)
cairo_pattern_set_extend (pattern, #CAIRO_EXTEND_REPEAT)

cairo_translate (*cr, 128.0, 128.0)
cairo_rotate (*cr, #PI / 4)
cairo_scale (*cr, 1 / Sqr(2), 1 / Sqr(2))
cairo_translate (*cr, -128.0, -128.0)

cairo_matrix_init_scale (@matrix, w/256.0 * 5.0, h/256.0 * 5.0)
cairo_pattern_set_matrix (pattern, @matrix)

cairo_set_source (*cr, pattern)

cairo_rectangle (*cr, 0, 0, 256.0, 256.0)
cairo_fill (*cr)

cairo_pattern_destroy (pattern)
cairo_surface_destroy (image)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample11.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
