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
		
		
	break;
}
#endregion
