


if (instance_exists(resource)){
	target_x = resource.x
	target_y = resource.y
}

if (!instance_exists(resource)){
	state = drone.returning
}

switch (state){
	case drone.deploy:
		speed += acceleration_rate
		limit_speed()
		image_angle = direction
		deploy_counter--
		if (deploy_counter <= 0){
			state = drone.approaching
		}
			
	break;
	case drone.approaching:
		if (distance_to_point(target_x, target_y) > 150){
			speed += acceleration_rate
			_p_dir = point_direction(x, y, target_x, target_y)
			turn_to_face_direction(_p_dir)
			direction = image_angle
			limit_speed()
		} else {
			state = drone.gathering
		}
		if (distance_to_object(parent_squad) > 600){
			state = drone.returning
		}
			
	break;
	
	case drone.gathering:
		target_x = resource.x
		target_y = resource.y
		_travel_dir = point_direction(x, y, target_x, target_y) + 90
		_image_dir = point_direction(x, y, target_x, target_y)
		speed += acceleration_rate
		direction = _travel_dir
		
		limit_speed()
		turn_to_face_direction(_image_dir)
		if (abs (angle_difference(image_angle, _image_dir) < 3)){
			generate_laser = true
		} else {
			generate_laser = false
		}
	break;
	
	case drone.returning:
		generate_laser = false
		target_x = parent_squad.x
		target_y = parent_squad.y
		speed += acceleration_rate
		_p_dir = point_direction(x, y, target_x, target_y)
		turn_to_face_direction(_p_dir)
		limit_speed()
		if (distance_to_object(parent_squad) < 10){
			parent_squad.drones += 1//need to add this
			instance_destroy()
		}
		
	break;
	
}
