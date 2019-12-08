//move grid boxes with the ship

var _k = 0
repeat(81){
	_length = grid_boxes[_k, 3]
	_direction = grid_boxes[_k, 2] + image_angle
	var _x = x + lengthdir_x(_length, _direction)
	var _y = y + lengthdir_y(_length, _direction)
	var _grid_box = grid_boxes[_k, 4]
	with (_grid_box){
		x = _x
		y = _y
		image_angle = other.image_angle
	}
	_k++
}

current_sector = instance_nearest(x, y, o_spawn_beacon)

for (i = 0; i < 25; i++){
	var _beacon_check = game_setup_controller.possible_spawn_location[i, 2]
	if (_beacon_check = current_sector){
		with (sector_map){
			player_location = other.i
		}
	}
}

//Pre State machine checks
if (target_sector != -1){
	state = squad.moving
	sector_beacon = game_setup_controller.possible_spawn_location[target_sector, 2]
	target_sector = -1
	
}

#region State Machine
switch (state){
	case squad.defend_sector:
		var nearest_enemy_squad = instance_nearest(x, y, o_enemy_squad)
		if (instance_exists(nearest_enemy_squad)){
			if (distance_to_object(nearest_enemy_squad) < 2000){
				_p_dir = point_direction(x, y, nearest_enemy_squad.x, nearest_enemy_squad.y)
				turn_to_face_direction_no_correction(_p_dir)
				direction = image_angle
			}
		} else {
			var beacon = instance_nearest(x, y, o_spawn_beacon)
			_p_dir = point_direction(x, y, beacon.x, beacon.y)
			turn_to_face_direction_no_correction(_p_dir)
			direction = image_angle
		}
		if (speed > 0){
			speed -= acceleration_rate
		}
		limit_speed()
	break;
	
	case squad.moving:
		moving = true
		_p_dir = point_direction(x, y, sector_beacon.x, sector_beacon.y)
		turn_to_face_direction_no_correction(_p_dir)
		direction = image_angle
		speed += acceleration_rate
		limit_speed()
		if (distance_to_object(sector_beacon) < 300){
			sector_beacon = noone
			target_sector = -1
			state = squad.defend_sector
			moving = false
		}
	break;
}
#endregion


	
