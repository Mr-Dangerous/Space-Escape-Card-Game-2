
#region state machine
switch(state){
	
	#region planning
	case ship.planning:
		target_x = assigned_defensive_grid_space.x 
		target_y = assigned_defensive_grid_space.y 
		
		if (abs (x - target_x) > 10 and abs (y - target_y > 10)){
			formation_locked = false
			seek = true
		} else {
			formation_locked = true
		}	
		if (formation_locked){
			//might need to just become 
			if (x != target_x ){
				x_creeping_direction = sign(target_x - x)
				x += x_creeping_direction
			}
			if (y != target_y){
				y_creeping_direction = sign(target_y - y)
				y += y_creeping_direction
			}
			if (abs(x - target_x) < 2 and abs (y-target_y) < 2){
				x = target_x
				y = target_y
			}
			seek = false
			if (abs(angle_difference(image_angle, squad_object.image_angle) < turn_speed)){
				turn_to_face_direction(squad_object.image_angle)
			} else {
				image_angle = squad_object.image_angle
			}
		}	
			
	break;
	#endregion
	
	#region scouting
	case ship.scouting:
		//this needs to become a path
		seek = true
		if (instance_exists(scout_beacon)){
			target_x = scout_beacon.x
			target_y = scout_beacon.y
			
			var _nearest_enemy = instance_nearest(x, y, target_ship_team)
		
			if (distance_to_object(_nearest_enemy) < scan_range){
				if (_nearest_enemy.recon = true){
					if (can_skirmish = true){
						state = ship.skirmishing
						ship_target = _nearest_enemy
					} else {
						state = ship.recon
					}
				}			
			}
		}
		
		scout_range--
		if (scout_range < 0 or (!instance_exists(scout_beacon))){
			scout_range = max_scout_range
			state = ship.returning
		}
	
			
	break;
	#endregion
	
	#region skirmishing
	case ship.skirmishing:
		if (!instance_exists(ship_target)){
			var _nearest_enemy = instance_nearest(x, y, target_ship_team)
		
			if (distance_to_object(_nearest_enemy) < scan_range){
				if (_nearest_enemy.recon = true){
					if (can_skirmish = true){
						state = ship.skirmishing
						ship_target = _nearest_enemy
					} else {
						state = ship.returning
						scout_range = max_scout_range
					}
				}			
			}
		}
		if (ship_ok){
			if (seek){
				seek = false
			}
			if (!pursue or !evade or !strafe){
				pursue = true
			}
		}
		if (!ship_ok){
			pursue = false
			seek = false
			evade = false
			flee = true
			strafe = false
			if (distance_to_object(ship_target) > 300){
				state = ship.returning
			}
		}
		scout_range -= .5
		if (scout_range < 0){
			state = ship.returning
		}
	
	break;
	#endregion
	
	#region ship.returning
	case ship.returning:
		target_x = assigned_defensive_grid_space.x
		target_y = assigned_defensive_grid_space.y
		if (place_meeting(x, y, assigned_defensive_grid_space)){
			state = ship.planning
		}
		seek = true
		evade = false
		flee = false
		pursue = false
		strafe = false
	break;
	#endregion
	
	#region repositioning
	case ship.repositioning:
		state = ship.planning
	break;
#endregion
	
}
#endregion



#region Post state machine
if (!movement_locked){
	scr_movement_manager_2()
} else {
	speed = 0
}
//counter ticks
basic_attack_fire_rate_counter++
#endregion




















//TEST
if (combat_timing_counter = 0){
	combat_timing_counter = (irandom_range(40, 80)-pilot_reflexes)
	ship_target = instance_nearest(x, y, target_ship_team)
	if (instance_exists(ship_target)){
		var _distance_to_enemy = distance_to_object(ship_target)
		if (vector_locked = true){//meaning the ship can rotate freely and not change direction
			vector_locked = false
		}
		//this expression should return false if the fight can't happen anymore
		if (_distance_to_enemy < 500){
			target_x = ship_target.x
			target_y = ship_target.y
		}
		if (_distance_to_enemy < 300 and !pursue and !evade){
			pursue = true
			seek = false
			flee = false
		}
		if (_distance_to_enemy > 300 and !seek and !flee){
			pursue = false
			evade = false
			seek = true
		}
		if (_distance_to_enemy < weapon_range){
			var _random_seed = irandom_range(1, 2)
			switch (_random_seed){
				case 1:
					evade = true
					pursue = false
				break;
				case 2:
					pursue = true
					evade = false
				break;
				case 3:
					strafe = true
					evade = false
					pursue = false
					vector_locked = false
				break;
			}
			
		} else {
			evade = false
		}
	
	}
}
combat_timing_counter--
scr_movement_manager_2()

//Fire upon the enemy



//TEST