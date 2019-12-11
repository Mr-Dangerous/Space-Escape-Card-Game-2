//enemy_squad
target_squad = instance_nearest(x, y, target_squad_resource)

#region create fleet
if (create_fleet_counter >= 0){
	create_fleet_counter--
	if(create_fleet_counter = 0){
		
		repeat(10){
			var _open_squad_slot = -1
			
			
			for(i = 0; i < maximum_units; i++){
				if (fleet[i] = noone){
					_open_squad_slot = i
					i = 100 //ends the loop.... can I jsut exit?
				}
			}
			_x = x + irandom_range(-200, 200)
			_y = y + irandom_range(-200, 200)
			var _nearest_grid_space = instance_nearest(_x, _y, o_grid_box)
			if (_nearest_grid_space.player_unit_assigned = noone and _open_squad_slot != -1){
				
				var _new_ship = instance_create_layer(_nearest_grid_space.x, _nearest_grid_space.y, "Ships", o_alien_interceptor)
				fleet[_open_squad_slot] = _new_ship
				show_debug_message("ship_created!")
				
				with (_new_ship){
					assigned_defensive_grid_space = _nearest_grid_space
				}
				with (_nearest_grid_space){
					player_unit_assigned = _new_ship
					if (recon_square){
						_new_ship.recon_direction = recon_direction
						_new_ship.recon = true
						_new_ship.recon_distance_multiplier = recon_distance_multiplier
						
					}
				}
			}
		}
		
	}
}
#endregion

//move grid boxes with the ship
if (fleet[0] != 0){
	fleet_size = array_length_1d(fleet)
}
if (engage_enemy = true and combat_switch = false){
	combat_switch = true
	var _k = 0
	repeat(fleet_size){
		with(fleet[_k]){
			approach_enemy = true
		}
		_k++
	}
}
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
/*
for (i = 0; i < 25; i++){
	var _beacon_check = game_setup_controller.possible_spawn_location[i, 2]
	if (_beacon_check = current_sector){
		with (sector_map){
			player_location = other.i
		}
	}
}
*/

//Pre State machine checks
if(!instance_exists(target_squad)){
	target_squad = instance_nearest(x, y, target_squad_resource)
}

#region State Machine
switch (state){
	case squad.defend_sector:
		var nearest_enemy_squad = instance_nearest(x, y, target_squad_resource)
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
		
		if (instance_exists(target_squad)){
			if (distance_to_object(target_squad)< 2000){
				state = squad.combat
			}
		}
	break;
	
	case squad.find_enemy:
		moving = true
		//all placeholders for now
		target_beacon = target_squad //debugging
		//if (target_beacon = noone){
		//	var _random_seed = irandom(8)
		//	target_beacon = instance_nth_nearest(x, y, o_spawn_beacon, _random_seed)
		//}
		_p_dir = point_direction(x, y, target_beacon.x, target_beacon.y)
		turn_to_face_direction_no_correction(_p_dir)
		direction = image_angle
		speed+=acceleration_rate
		limit_speed()
		if (instance_exists(target_squad)){
			if (distance_to_object(target_squad)< 2000){
				state = squad.combat
			}
		}
		if (distance_to_object(target_beacon)<20){
			target_beacon = noone
		}
		
	break;	
	
	case squad.combat:
		if(instance_exists(target_squad)){
			if(distance_to_object(target_squad) < 2100){
				//enemy automatically seeks
				target_beacon = instance_nearest(target_squad.x, target_squad.y, o_spawn_beacon)
				state = squad.find_enemy
				var _k = 0
				repeat(fleet_size){
					with(fleet[_k]){
						approach_enemy = false
						disengage_enemy = true
					}
					_k++
				}
			}
			if (distance_to_object(target_squad) < 1200){
				var _p_dir = point_direction(x, y, target_squad.x, target_squad.y)
				turn_to_face_direction_no_correction(_p_dir)
				direction = image_angle
				speed-=acceleration_rate
				limit_speed()
			}
			if (distance_to_object(target_squad) < 1300){
				//assign the deploy command to all ships in the ship list
				var size = array_length_1d(fleet)
				_k = 0
				repeat(size){
					with(fleet[_k]){
						deploy = true
						enemy_squad_target = other.target_squad
						deploy_direction = point_direction(x, y, other.target_squad.x, other.target_squad.y)
					}
					_k++
				}
				speed -= acceleration_rate
					
			}
		} else {
			state = squad.defend_sector
		}
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

//post state machine
//scout_timer--
if (scout_timer = 0){
	scout_timer = 3000
	if (state = squad.defend_sector or state = squad.find_enemy or state = squad.moving){
		_k = 0
		repeat(fleet_size){
			if(fleet[_k].recon){
				with(fleet[_k]){
					scout_mission = true
					scout_range = max_scout_range
				}
			}
			_k++
		}
	}
	
}




	

