XIncludeFile "RW_Cairo_Inc.pb"


surface = cairo_image_surface_create (#CAIRO_FORMAT_ARGB32, 256, 256)
*cr = cairo_create (surface)

cairo_save (*cr)

Define.d x0      = 25.6   ; parameters like cairo_rectangle 
Define.d y0      = 25.6
Define.d rect_width  = 204.8
Define.d rect_height = 204.8
Define.d radius = 102.4   ; And an approximate curvature radius 

Define.d x1,y1

x1=x0+rect_width
y1=y0+rect_height
If (Not rect_width Or Not rect_height)
    End
EndIf
If (rect_width/2<radius)
  If (rect_height/2<radius)
    cairo_move_to  (*cr, x0, (y0 + y1)/2)
    cairo_curve_to (*cr, x0 ,y0, x0, y0, (x0 + x1)/2, y0)
    cairo_curve_to (*cr, x1, y0, x1, y0, x1, (y0 + y1)/2)
    cairo_curve_to (*cr, x1, y1, x1, y1, (x1 + x0)/2, y1)
    cairo_curve_to (*cr, x0, y1, x0, y1, x0, (y0 + y1)/2)
  Else
    cairo_move_to  (*cr, x0, y0 + radius)
    cairo_curve_to (*cr, x0 ,y0, x0, y0, (x0 + x1)/2, y0)
    cairo_curve_to (*cr, x1, y0, x1, y0, x1, y0 + radius)
    cairo_line_to (*cr, x1 , y1 - radius)
    cairo_curve_to (*cr, x1, y1, x1, y1, (x1 + x0)/2, y1)
    cairo_curve_to (*cr, x0, y1, x0, y1, x0, y1- radius)
  EndIf
Else
  If rect_height/2 < radius
    cairo_move_to  (*cr, x0, (y0 + y1)/2)
    cairo_curve_to (*cr, x0 , y0, x0 , y0, x0 + radius, y0)
    cairo_line_to (*cr, x1 - radius, y0)
    cairo_curve_to (*cr, x1, y0, x1, y0, x1, (y0 + y1)/2)
    cairo_curve_to (*cr, x1, y1, x1, y1, x1 - radius, y1)
    cairo_line_to (*cr, x0 + radius, y1)
    cairo_curve_to (*cr, x0, y1, x0, y1, x0, (y0 + y1)/2)
  Else
    cairo_move_to  (*cr, x0, y0 + radius)
    cairo_curve_to (*cr, x0 , y0, x0 , y0, x0 + radius, y0)
    cairo_line_to (*cr, x1 - radius, y0)
    cairo_curve_to (*cr, x1, y0, x1, y0, x1, y0 + radius)
    cairo_line_to (*cr, x1 , y1 - radius)
    cairo_curve_to (*cr, x1, y1, x1, y1, x1 - radius, y1)
    cairo_line_to (*cr, x0 + radius, y1)
    cairo_curve_to (*cr, x0, y1, x0, y1, x0, y1- radius)
  EndIf
EndIf
cairo_close_path (*cr)

cairo_set_source_rgb (*cr, 0.5, 0.5, 1)
cairo_fill_preserve (*cr)
cairo_set_source_rgba (*cr, 0.5, 0, 0, 0.5)
cairo_set_line_width (*cr, 10.0)
cairo_stroke (*cr)


cairo_restore (*cr)
cairo_surface_write_to_png (surface, "Samples\sample04.png")
cairo_destroy (*cr)
cairo_surface_destroy (surface)
