/// @description Game start!


if (!game_created){
	randomize()
	#region deprecated!  edge spawning
	/*
	randomize()
	var _player_start_location = irandom(15)
	var _enemy_start_location = irandom(15)
	
	var acceptable_start_locations = false
	while (acceptable_start_locations = false){
		if (_player_start_location !=_enemy_start_location){
			
			switch (_player_start_location){
				case 0:
					spawn_side = "top left corner"
				break;
				case 1:
					spawn_side = "top edge"
				break;
				case 2:
					spawn_side = "top edge"
				break;
				case 3:
					spawn_side = "top edge"
				break;
				case 4:
					spawn_side = "top right corner"
				break;
				case 5:
					spawn_side = "left edge"
				break;
				case 6:
					spawn_side = "right edge"
				break;
				case 7:
					spawn_side = "left edge"
				break;
				case 8:
					spawn_side = "right edge"
				break;
				case 9:
					spawn_side = "left edge"
				break;
				case 10:
					spawn_side = "right edge"
				break;
				case 11:
					spawn_side = "bottom left corner"
				break;
				case 12:
					spawn_side = "bottom edge"
				break;
				case 13:
					spawn_side = "bottom edge"
				break;
				case 14:
					spawn_side = "bottom edge"
				break;
				case 15:
					spawn_side = "bottom right corner"
				break;
			}
			switch(spawn_side){
				//top right corner
				case "top left corner":
					if (_enemy_start_location = 3 or
					_enemy_start_location = 4 or
					_enemy_start_location = 6 or
					_enemy_start_location = 8 or
					_enemy_start_location < 8){
						acceptable_start_locations = true
					}
				break;
				//top edge
				case "top edge":
					if(_enemy_start_location > 6){
						acceptable_start_locations = true
					}
				break;
				case "top right corner":
					if (_enemy_start_location < 2 or
					_enemy_start_location = 5 or
					_enemy_start_location = 7 or
					_enemy_start_location > 8){
						acceptable_start_locations = true
					}
				break;
				case "left edge":
					if (_enemy_start_location = 2 or
					_enemy_start_location = 3 or
					_enemy_start_location = 4 or
					_enemy_start_location = 6 or
					_enemy_start_location = 8 or
					_enemy_start_location = 10 or
					_enemy_start_location >13){
						acceptable_start_locations = true
					}
				break;
				case "right edge":
					if (_enemy_start_location < 3 or
					_enemy_start_location = 5 or
					_enemy_start_location = 7 or
					_enemy_start_location = 9 or
					_enemy_start_location = 11 or
					_enemy_start_location = 12 or
					_enemy_start_location = 13){
						acceptable_start_locations = true
					}
				break;
				case "bottom left corner":
					if(_enemy_start_location < 9 or
					_enemy_start_location = 10 or
					_enemy_start_location > 12){
						acceptable_start_locations = true
					}
				break;
				case "bottom edge":
					if(_enemy_start_location < 11){
						acceptable_start_locations = true
					}
				break;
				case "bottom right corner":
					if(_enemy_start_location < 10 or
					_enemy_start_location = 11 or
					_enemy_start_location = 12 or
					_enemy_start_location = 13){
						acceptable_start_locations = true
					}
				break;
			}
	
		}
		if (acceptable_start_locations = false){
			_enemy_start_location = irandom(15)
		}
	}
	
	//here
	var _player_x = possible_spawn_location[_player_start_location, 0]
	var _player_y = possible_spawn_location[_player_start_location, 1]

	var _enemy_x = possible_spawn_location[_enemy_start_location, 0]
	var _enemy_y = possible_spawn_location[_enemy_start_location, 1]
	
	
	switch (_enemy_start_location){
		case 0:
			_enemy_spawn_side = "top left corner"
		break;
		case 1:
			_enemy_spawn_side = "top edge"
		break;
		case 2:
			_enemy_spawn_side = "top edge"
		break;
		case 3:
			_enemy_spawn_side = "top edge"
		break;
		case 4:
			_enemy_spawn_side = "top right corner"
		break;
		case 5:
			_enemy_spawn_side = "left edge"
		break;
		case 6:
			_enemy_spawn_side = "right edge"
		break;
		case 7:
			_enemy_spawn_side = "left edge"
		break;
		case 8:
			_enemy_spawn_side = "right edge"
		break;
		case 9:
			_enemy_spawn_side = "left edge"
		break;
		case 10:
			_enemy_spawn_side = "right edge"
		break;
		case 11:
			_enemy_spawn_side = "bottom left corner"
		break;
		case 12:
			_enemy_spawn_side = "bottom edge"
		break;
		case 13:
			_enemy_spawn_side = "bottom edge"
		break;
		case 14:
			_enemy_spawn_side = "bottom edge"
		break;
		case 15:
			_enemy_spawn_side = "bottom right corner"
		break;
	}
	*/
	
	
	#endregion
	var player_start_position = irandom_range(0, 12)
	var enemy_start_position = irandom_range(14, 24)
	
	var _player_x = possible_spawn_location[player_start_position, 0]
	var _player_y = possible_spawn_location[player_start_position, 1]
	
	var _enemy_x = possible_spawn_location[enemy_start_position, 0]
	var _enemy_y = possible_spawn_location[enemy_start_position, 1]
	
	var player_squad = instance_create_layer(_player_x, _player_y, "Instances", o_player_squad)
	var enemy_squad = instance_create_layer(_enemy_x, _enemy_y, "Instances", o_enemy_squad)
	
	
	var _camera = instance_find(o_camera, 0)
	with (_camera){
		state = camera.locked
	}
	game_created = true
}
var i = 0
repeat(25){
	var _x = possible_spawn_location[i, 0]
	var _y = possible_spawn_location[i, 1]
	var _spawn_beacon = instance_create_layer(_x, _y, "Instances", o_spawn_beacon)
	possible_spawn_location[i, 2] = _spawn_beacon
	i++
}
