var _nearest_grid_space = instance_nearest(mouse_x, mouse_y, o_grid_box)

//destroy the isntance if its not close enoguh to a valid box

if (distance_to_object(_nearest_grid_space) < 25 and _nearest_grid_space.player_unit_assigned = noone){
	with (ship_reference){
		assigned_defensive_grid_space = _nearest_grid_space
		if (assigned_defensive_grid_space.recon_square = true){
			recon = true
			recon_direction = assigned_defensive_grid_space.recon_direction
			recon_distance_multiplier = assigned_defensive_grid_space.recon_distance_multiplier
		} else {
			recon = false
		}
		state = ship.planning
	}
	with (_nearest_grid_space){
		player_unit_assigned = other.ship_reference
				
	}
	with (assigned_grid_space){
		player_unit_assigned = noone
	}
	
}


var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)
var _x_offset = gui_width/9
var _y_offset = gui_height/4
if (point_in_rectangle(_mouse_x, _mouse_y, 4, _y_offset, _x_offset, gui_height - _y_offset)){
	var card_game_controller = instance_find(o_card_game, 0)
	var hangar_size = array_length_1d(card_game_controller.hangar_slots)
	for (var i = 0; i < hangar_size; i++){
		if (card_game_controller.hangar_slots[i] = noone){
			var _card_object_reference = ship_reference.card_reference
			var card_reference = instance_create_layer(x, y, "Card_UI", _card_object_reference)
			with(card_reference){
				state = card.in_hangar
				hangar_slot = i
			}
			
			assigned_grid_space.player_unit_assigned = noone
			assigned_grid_space = noone
			var _fleet_size = 15
			for (i = 0; i < _fleet_size; i++){
				if (squad_object.fleet[i] = ship_reference){
					squad_object.fleet[i] = noone
				}
			}
			instance_destroy(ship_reference)
			break;
		}
	}
	
}
instance_destroy()
