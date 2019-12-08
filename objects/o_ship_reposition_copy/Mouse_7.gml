var _nearest_grid_space = instance_nearest(mouse_x, mouse_y, o_grid_box)

//destroy the isntance if its not close enoguh to a valid box

if (distance_to_object(_nearest_grid_space) < 25 and _nearest_grid_space.player_unit_assigned = noone){
	with (ship_reference){
		assigned_defensive_grid_space = _nearest_grid_space
		if (assigned_defensive_grid_space.recon_square = true){
			recon = true
			recon_direction = assigned_defensive_grid_space.recon_direction
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
instance_destroy()
