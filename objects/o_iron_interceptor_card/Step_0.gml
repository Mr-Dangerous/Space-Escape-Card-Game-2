var view_x_position = camera_get_view_x(view_camera[0])
var view_y_position = camera_get_view_y(view_camera[0])
var view_width = camera_get_view_width(view_camera[0])
var view_height = camera_get_view_height(view_camera[0])


switch (state){
	case card.inactive:
		visible = false
		
	break;
	
	case card.in_hangar:
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
	
	case card.moving:
		x = mouse_x
		y = mouse_y
		
		if (mouse_check_button_released(mb_left)){
			var _nearest_grid_space = instance_nearest(x, y, o_grid_box)
			var _distance_to_space = distance_to_object(_nearest_grid_space)
			if (_distance_to_space < 25){
				//create the ship, destroy the card, empty the hangar slot
				var _new_ship = instance_create_layer(_nearest_grid_space.x, _nearest_grid_space.y, "Ships", o_iron_interceptor)
				with (_new_ship){
					assigned_defensive_grid_space = _nearest_grid_space
				}
				var _card_game = instance_find(o_card_game, 0)
				_card_game.hangar_slots[hangar_slot] = noone
				instance_destroy()
			} else {
				//go back to hangar
				state = card.in_hangar
			}
		}
}
