var view_x_position = camera_get_view_x(view_camera[0])
var view_y_position = camera_get_view_y(view_camera[0])
var view_width = camera_get_view_width(view_camera[0])
var view_height = camera_get_view_height(view_camera[0])

var _camera_zoom = camera_controller.camera_zoom



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
			x = (view_x_position + (64*_camera_zoom))
			y = (view_y_position + (300 + (64*hangar_slot))*_camera_zoom)
		}
		
		if (hangar_slot >= 5){
			x = (view_x_position + (150*_camera_zoom))
			y = (view_y_position + (300 + (64*(hangar_slot - 5)))*_camera_zoom)
		}
		
	break;
	
	case card.moving:
		x = mouse_x
		y = mouse_y
		
		if (mouse_check_button_released(mb_left)){
			var _nearest_grid_space = instance_nearest(x, y, o_grid_box)
			var _distance_to_space = distance_to_object(_nearest_grid_space)
			var _squad_object = instance_find(o_player_squad, 0)
			var _squad_list = _squad_object.fleet
			
			var _open_squad_slot = -1
		
			for(i = 0; i < _squad_object.maximum_units; i++){
				if (_squad_list[i] = noone){
					_open_squad_slot = i
					i = 100 //ends the loop.... can I jsut exit?
				}
			}
			
			
			if (_distance_to_space < 25 and _nearest_grid_space.player_unit_assigned = noone and _open_squad_slot != -1){
				//create the ship, destroy the card, empty the hangar slot
				var _new_ship = instance_create_layer(_nearest_grid_space.x, _nearest_grid_space.y, "Ships", final_ship_resource)
				//give the grid space properites to the ship
				
				with (_new_ship){
					assigned_defensive_grid_space = _nearest_grid_space
				}
				with (_nearest_grid_space){
					player_unit_assigned = _new_ship
					if (recon_square){
						_new_ship.recon_direction = recon_direction
						_new_ship.recon = true
						_new_ship.recon_distance_multiplier = recon_distance_multiplier
						
					}
				}
				var _card_game = instance_find(o_card_game, 0)
				_card_game.hangar_slots[hangar_slot] = noone
				_squad_object.fleet[_open_squad_slot] = _new_ship
				
				instance_destroy()
			} else {
				//go back to hangar
				state = card.in_hangar
			}
		}
}
