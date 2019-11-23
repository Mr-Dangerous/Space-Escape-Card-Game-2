/// @description Game start!
if (!game_created){
	var _player_start_location = irandom(15)
	var _enemy_start_location = irandom(15)

	var acceptable_start_locations = false
	while (acceptable_start_locations = false){
		if (_player_start_location !=_enemy_start_location){
			var spawn_side = ""
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
	var _player_x = possible_spawn_location[_player_start_location, 0]
	var _player_y = possible_spawn_location[_player_start_location, 1]

	var _enemy_x = possible_spawn_location[_enemy_start_location, 1]
	var _enemy_y = possible_spawn_location[_enemy_start_location, 1]

	var player_squad = instance_create_layer(_player_x, _player_y, "Instances", o_player_squad)
	var enemy_squad = instance_create_layer(_enemy_x, _enemy_y, "Instances", o_enemy_squad)
	game_created = true
}