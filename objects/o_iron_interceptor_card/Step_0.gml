var view_x_position = camera_get_view_x(view_camera[0])
var view_y_position = camera_get_view_y(view_camera[0])
var view_width = camera_get_view_width(view_camera[0])
var view_height = camera_get_view_height(view_camera[0])


switch (state){
	case ship.inactive:
		visible = false
	break;
	
	case ship.in_hangar:
		if (visible = false){
			visible = true
		}
		image_angle += .05
		//note that when the camera starts to zoom... somethings gotta give.
		
		if (hangar_slot < 5 and hangar_slot != -1){
			x = view_x_position + 64
			y = view_y_position + 300 + (64*hangar_slot)
		}
		
		if (hangar_slot >= 5){
			x = view_x_position + 150
			y = view_y_position + 300 + (64*(hangar_slot - 5))
		}
	break;
}
