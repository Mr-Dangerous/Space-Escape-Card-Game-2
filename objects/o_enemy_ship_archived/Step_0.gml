if (vector_locked){
	turn_speed = max_turn_speed - ((speed/max_speed)*2)
}
if (!vector_locked){
	turn_speed = max_turn_speed
}

#region state machine
switch(state){
	case ship.planning:
		if (idle_drift_counter = 0){
			x = assigned_defensive_grid_space.x +irandom_range(-1, 1)
			y = assigned_defensive_grid_space.y + irandom_range(-1, 1)
			idle_drift_counter = irandom_range(100, 300)
			image_angle = idle_direction + irandom_range(-1, 1)
		}
		idle_drift_counter--
		
		if (recon){
			image_angle = recon_direction
		}
		
	break;
	
	case ship.idle:
		if (idle_drift_counter = 0){
			x = assigned_defensive_grid_space.x +irandom_range(-1, 1)
			y = assigned_defensive_grid_space.y + irandom_range(-1, 1)
			idle_drift_counter = irandom_range(100, 300)
			image_angle = idle_direction + irandom_range(-1, 1)
		}
		idle_drift_counter--
	break;
	
	case ship.scouting:
		turn_to_face_direction(recon_direction)
		direction = image_angle
		speed += acceleration_rate
		limit_speed()
		
		camera_object = instance_find(o_camera, 0)
		zoom_level = camera_object.camera_zoom
		image_xscale = image_scale*zoom_level*.5
		image_yscale = image_scale*zoom_level*.5
		
		if (x < 50 or x > room_width-50 or y < 50 or y > room_height-50){
			direction += 96
			image_angle = direction
			recon_direction = direction
		}
		
		var _nearest_enemy = instance_nearest(x, y, o_enemy_ship)
		
		if (distance_to_object(_nearest_enemy) < scan_range){
			with (_nearest_enemy){
				detected = true
				visible = true
			}
			state = ship.recon
			//var ship_array = squad_object.squad_ships
			
		}
		
		
		
	break;
	
	case ship.recon:
		
	break;
}
#endregion
