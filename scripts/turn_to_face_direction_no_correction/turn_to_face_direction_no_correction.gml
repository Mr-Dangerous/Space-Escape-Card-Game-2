var _point_direction = argument0

if (image_angle != _point_direction){
		_angle_difference = angle_difference(image_angle, _point_direction)
		image_angle -= sign(_angle_difference)*turn_speed
		if (abs(_angle_difference) < 1){
			image_angle = _point_direction
		}

	}