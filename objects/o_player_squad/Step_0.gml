//test function
speed = 10

image_angle = direction

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
			show_debug_message(player_location)
		}
	}
}


	
