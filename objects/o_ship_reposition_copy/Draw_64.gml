/// @description Draw the hangar
gui_height = display_get_gui_height()
gui_width = display_get_gui_width()

draw_set_color(c_lime) //make it nicer later!
draw_rectangle(4, gui_height - (gui_height/4), gui_width/9, gui_height/4, false)
