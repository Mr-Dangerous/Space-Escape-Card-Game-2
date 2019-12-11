#region Prestate machine
if (deploy){
	deploy = false
	state = ship.deploy
	
}
if (scout_mission){
	var _scout_beacon_x = assigned_defensive_grid_space.x + lengthdir_x(max_speed * max_scout_range * recon_distance_multiplier, squad_object.image_angle + recon_direction)
	var _scout_beacon_y = assigned_defensive_grid_space.y + lengthdir_y(max_speed * max_scout_range * recon_distance_multiplier, squad_object.image_angle + recon_direction)
	scout_beacon = instance_create_layer(_scout_beacon_x, _scout_beacon_y, "Above_UI", o_scout_beacon)	
	state = ship.scouting
	scout_mission = false
}
if (approach_enemy){
	deploy = false
	state = ship.engage_enemy
}

if (approach_enemy = false and disengage_enemy = true){
	disengage_enemy = false
	state = ship.disengage
	disengage_counter = 10
}
#endregion

#region state machine
switch(state){
	
	#region planning
	case ship.planning:
		target_x = assigned_defensive_grid_space.x 
		target_y = assigned_defensive_grid_space.y 
		
		if (abs (x - target_x) > 20 or abs (y - target_y > 20)){
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
			if (recon){
				image_angle = recon_direction
			}
			speed -= acceleration_rate
			if (speed < 0){
				speed = 0
			}
			if (squad_object.moving = true){
				speed = squad_object.speed
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
		if (scout_range < 0 or (!instance_exists(scout_beacon) or distance_to_object(scout_beacon) < 10)){
			scout_range = max_scout_range
			state = ship.returning
		}
	
			
	break;
	#endregion
	
	#region skirmishing
	case ship.skirmishing:
	#region retarget
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
		#endregion
	#region check status of ship
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
		#endregion
	#region combat manuevers
	if (combat_timing_counter <= 0){
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
		if (_distance_to_enemy < basic_attack_range){
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
	#endregion
	
	break;
	#endregion
	
	#region deploy
	case ship.deploy:
		deploy = false
		if(instance_exists(enemy_squad_target)){
			target_x = x + lengthdir_x(100, deploy_direction)
			target_y = y + lengthdir_y(100, deploy_direction)
			seek = true
			flee = false
			evade = false
			pursue = false
			strafe = false
			ship_target = noone
			var nearest_enemy = instance_nearest(x, y, o_enemy_ship)
			var _distance_to_nearest_enemy = distance_to_object(nearest_enemy)
			if (_distance_to_nearest_enemy < 600 and squad_object.combat_switch = false){
				squad_object.engage_enemy = true
				
			}
		} 
		if(!instance_exists(enemy_squad_target)) state = ship.planning
		
	break;
	#endregion
	
	#region engage_enemy
	case ship.engage_enemy:
		approach_enemy = false
		//determine target
		
		if (ship_target = noone){
			var nearest_interceptor = noone
			var nearest_fighter = noone
			var nearest_frigate = noone
			if (allied_ship_team = o_player_ship){
				nearest_interceptor = instance_nearest(x, y, o_enemy_interceptor)
				nearest_fighter = instance_nearest(x, y, o_enemy_fighter)
				nearest_frigate = instance_nearest(x, y, o_enemy_frigate)
			}
			if (allied_ship_team = o_enemy_ship){
				nearest_interceptor = instance_nearest(x, y, o_player_interceptor)
				nearest_fighter = instance_nearest(x, y, o_player_fighter)
				nearest_frigate = instance_nearest(x, y, o_player_frigate)
			}
			if (distance_to_object(nearest_interceptor) > 6000){
				nearest_interceptor = noone
			}
			if (distance_to_object(nearest_fighter) > 6000){
				nearest_fighter = noone
			}
			if (distance_to_object(nearest_frigate) > 6000){
				nearest_frigate = noone
			}
			//switch targeting based on class
			//might be better as an array later
			switch(ship_class){
				case "interceptor":
					if (instance_exists(nearest_frigate)) ship_target = nearest_frigate
					if (instance_exists(nearest_interceptor)) ship_target = nearest_interceptor	
					if (instance_exists(nearest_fighter)) ship_target = nearest_fighter
					
				break;
				case "fighter":
					if (instance_exists(nearest_frigate)) ship_target = nearest_frigate
					if (instance_exists(nearest_fighter)) ship_target = nearest_fighter
					if (instance_exists(nearest_interceptor)) ship_target = nearest_interceptor
				break;
				case "frigate":
					if (instance_exists(nearest_frigate)) ship_target = nearest_frigate
					if (instance_exists(nearest_fighter)) ship_target = nearest_fighter
					if (instance_exists(nearest_interceptor)) ship_target = nearest_interceptor
				break;
			}
		}
		if (ship_target != noone){
				switch (ship_target.ship_class){
					case "interceptor":
						state = ship.attacking_interceptor
						approach_enemy = false
					break;
					case "fighter":
						state = ship.attacking_interceptor //to be changed later!
						approach_enemy = false
					break;
					case "frigate":
						state =ship.attacking_interceptor //to be changed later!
						approach_enemy = false
					break;
				}
			} 
			if (ship_target = noone){
				target_x = x + lengthdir_x(100, enemy_squad_target)
				target_y = y + lengthdir_y(100, enemy_squad_target)
				seek = true
			}
	break;
	#endregion
	
	#region attacking_interceptor
	case ship.attacking_interceptor:
		#region retarget
		if (!instance_exists(ship_target)){
			state = ship.engage_enemy
			seek = false
			pursue = false
			flee = false
			evade = false
			strafe = false
		}
		#endregion
		#region check status of ship
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
		
			#endregion
		#region combat manuevers
		if (combat_timing_counter <= 0){
		combat_timing_counter = (irandom_range(40, 80)-pilot_reflexes)
	
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
			if (_distance_to_enemy < basic_attack_range){
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
	#endregion
	break;
	#endregion
	
	#region attacking_fighter
	case ship.attacking_fighter:
		#region retarget
		if (!instance_exists(ship_target)){
			state = ship.engage_enemy
			seek = false
			pursue = false
			flee = false
			evade = false
			strafe = false
		}
		#endregion
		#region check status of ship
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
		
			#endregion
		#region combat manuevers
		if (combat_timing_counter <= 0){
		combat_timing_counter = (irandom_range(40, 80)-pilot_reflexes)
	
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
			if (_distance_to_enemy < basic_attack_range){
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
	#endregion
	break;
	#endregion
	
	#region attacking_frigate
	case ship.attacking_frigate:
		#region retarget
		if (!instance_exists(ship_target)){
			state = ship.engage_enemy
			seek = false
			pursue = false
			flee = false
			evade = false
			strafe = false
		}
		#endregion
		#region check status of ship
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
		
			#endregion
		#region combat manuevers
		if (combat_timing_counter <= 0){
		combat_timing_counter = (irandom_range(40, 80)-pilot_reflexes)
	
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
			if (_distance_to_enemy < basic_attack_range){
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
	#endregion
	break;
	#endregion
		
	#region disengage
	case ship.disengage:
		target_x = assigned_defensive_grid_space.x
		target_y = assigned_defensive_grid_space.y
		seek = true
		flee = false
		pursue = false
		evade= false
		strafe = false
		disengage_counter--
		if (disengage_counter = 0){
			state = ship.returning
			deploy = false
		}
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
	
		seek = true
		target_x = assigned_defensive_grid_space.x
		target_y = assigned_defensive_grid_space.y
		if (place_meeting(x, y, assigned_defensive_grid_space)){
			x = assigned_defensive_grid_space.x
			y = assigned_defensive_grid_space.y
			state = ship.planning
		}
	break;
#endregion
	
}
#endregion

#region Post state machine

//ship status
if (armor/damage_partition_tick < 1.2){
	ship_ok = false
} else {
	ship_ok = true
}

//counter ticks
if (basic_attack_fire_rate_counter < basic_attack_fire_rate){
		basic_attack_fire_rate_counter++
	}
	if (instance_exists(ship_target)){
	var _direction_to_target = point_direction(x, y, ship_target.x, ship_target.y)
	var _distance_to_target = distance_to_object(ship_target)
	var _angle_difference_to_target = abs(angle_difference(image_angle, _direction_to_target))

	if (_angle_difference_to_target < gimbal_fire_angle and
			_distance_to_target < basic_attack_range and
			basic_attack_fire_rate_counter >= basic_attack_fire_rate and
			can_attack = true){
		basic_attack_fire_rate_counter = 0
		fire_basic_attack(basic_attack_array)
	}
}

combat_timing_counter--


if (!movement_locked){
	scr_movement_manager_2()
} else {
	speed = 0
}


#endregion