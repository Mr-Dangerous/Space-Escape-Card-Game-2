#region PreStateMachine
//iron interceptor
if (vector_locked){
	turn_speed = max_turn_speed - ((speed/max_speed))
}
if (!vector_locked){
	turn_speed = max_turn_speed
}


if (enemy_squad_target != noone and target_acquired = true){
	state = ship.approaching_enemy
	target_acquired = true
}


#endregion

#region state machine
switch(state){
	
	#region ship.planning
	case ship.planning:
		x = assigned_defensive_grid_space.x 
		y = assigned_defensive_grid_space.y 
		image_angle = 0
		speed = 0
		
		
		if (recon){
			image_angle = recon_direction + 0
		
		}
	break;
	#endregion
	
	#region scouting
	case ship.scouting:
		//this needs to become a path
		turn_to_face_direction(recon_direction)
		direction = image_angle
		motion_add(direction, acceleration_rate)
		limit_speed()
		
		camera_object = instance_find(o_camera, 0)
		zoom_level = camera_object.camera_zoom
		image_xscale = image_scale*zoom_level*.5
		image_yscale = image_scale*zoom_level*.5
		
		
		var _nearest_enemy = instance_nearest(x, y, target_ship_type)
		
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
		
		scout_range--
		if (scout_range < 0){
			scout_range = 1000
			state = ship.returning
		}
	
			
	break;
	#endregion
	
	#region skirmishing
		case ship.skirmishing:
			//leave skirmish when low on fuel
			scout_range-=.3
			if (scout_range < 0){
				scout_range = max_scout_range
				state = ship.returning
				vector_locked = false
			}
			//leave state if enemy is dead
			if (!instance_exists(ship_target)){
				var _nearest_enemy = instance_nearest(x, y, target_ship_type)
				if (distance_to_object(_nearest_enemy) > basic_attack_range or _nearest_enemy.recon = false){
					state = ship.returning
					vector_locked = false
				} else {
					ship_target = _nearest_enemy
				}
			}
			
			if (instance_exists(ship_target)){
				//nearby allies
				var ally_count = 2
				var allied_ship = instance_nearest(x, y, allied_ship_type)
				var allied_ship_2 = instance_nth_nearest(x, y, allied_ship_type, 2)
				if (instance_exists(allied_ship)){
					if (distance_to_object(allied_ship) > 400 or !allied_ship.can_skirmish){
						allied_ship = noone
						ally_count--
					}
				}
				if (instance_exists(allied_ship_2)){
					if (distance_to_object(allied_ship_2) > 400 or !allied_ship.can_skirmish){
						allied_ship_2 = noone
						ally_count--
					}
				}
				
				//check to see if outnumbered
				/*
				if (instance_nth_nearest(x, y, target_ship_type, ally_count) != noone){
					state = ship.returning
					combat_state = interceptor_combat.out_of_combat
					vector_locked = false
				}
				*/
				//check to see if enough damage has been sustained to warrant returning
				if (!ship_ok and interceptor_combat.out_of_combat){
					state = ship.returning
					vector_locked = false
				}
				//select weapon, if available
				/*
				In all seriousness, how is this giong to work?  
				*/
				
				var _selected_weapon = basic_attack_array
				var projectile_speed = weapon_1_projectile_speed
				
				//precombat variables
				
				var _target_direction = ship_target.direction
				var _target_speed = ship_target.speed
				var _distance_to_target = distance_to_object(ship_target)
				var _projectile_flight_time = _distance_to_target/projectile_speed
					
				var _lead_target_x = ship_target.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
				var _lead_target_y = ship_target.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
				//combat!  finally!
				show_debug_message(scout_range)
				switch (combat_state){
					
					case interceptor_combat.out_of_combat:
						if (_distance_to_target < basic_attack_range * 1.5){
							combat_state = interceptor_combat.close_distance
							vector_locked = false
							previous_combat_state = "out_of_combat"
						} else {
							turn_to_face_direction(recon_direction + 0)
							direction = image_angle
							motion_add(direction, acceleration_rate)
							limit_speed()
						}
						show_debug_message("out_of_combat")
						
					break;
					
					case interceptor_combat.vector_sliding:
						//fire!!!
						if (vector_locked = false){
							vector_locked = true
						}
						var _aim_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
						turn_to_face_direction(_aim_direction)
						if (angle_difference(image_angle, _aim_direction) < 2){
							if (basic_attack_fire_counter >= basic_attack_fire_rate){
								fire_basic_attack(_selected_weapon)
								basic_attack_fire_counter = 0
							}
						}
						if (_distance_to_target > basic_attack_range * .9){
							combat_state = interceptor_combat.close_distance
							vector_locked = false
							previous_combat_state = "vector_sliding"
						}
						if (_distance_to_target < basic_attack_range * .3 and basic_attack_fire_counter = 0){
							combat_state = interceptor_combat.orbit
							orbit = 0
							previous_combat_state = "vector_sliding"
						}
						if (!ship_ok){
							combat_state = interceptor_combat.hard_disengage
							vector_locked = false
							previous_combat_state = "vector_sliding"
						}
						vector_sliding_counter = 0
						show_debug_message("vector_sliding")
						
					break;
					
					case interceptor_combat.close_distance:
						var _travel_direction = point_direction(x,y, ship_target.x, ship_target.y)
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						motion_add(direction, acceleration_rate)
						limit_speed()
						
						if (_distance_to_target < basic_attack_range * .8){
							combat_state = interceptor_combat.joust//changed from orbit
							vector_locked = false
							previous_combat_state = "close_distance"
							if (abs(angle_difference(direction, _target_direction)> 95)){
								combat_state = interceptor_combat.joust
								previous_combat_state = "close_distance"
								show_debug_message(ship_ok)
								vector_locked = false
							}
						}
						show_debug_message("close_distance")
					break;
					
					case interceptor_combat.orbit:
						//determine by random for now
						if (orbit_spin = 0){
							var _random_seed = irandom(1)
							orbit_spin = _random_seed
							if (orbit_spin = 0){
								orbit_spin = -1
							}
						}
						var _direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
						var _tangent_direction = _direction_from_target - (90*orbit_spin)
						if (_tangent_direction < 0){
							_tangent_direction += 359
						}
						turn_to_face_direction(_tangent_direction)
						direction = image_angle
						motion_add(direction, acceleration_rate)
						limit_speed()
						
						//exit the state
						if (distance_to_object(ship_target) > basic_attack_range * .8 and ship_ok = true){
							combat_state = interceptor_combat.close_distance
							vector_locked = false
							previous_combat_state = "orbit"
						}
						
						if (distance_to_object(ship_target) < basic_attack_range * .5 and ship_ok = true){
							var _direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
							if (abs(angle_difference(_direction_from_target, _target_direction)) < 15){
								var _direction_to_target = point_direction(x, y, ship_target.x, ship_target.y)
								if (abs(angle_difference(direction, _direction_to_target)) < turn_speed * 5){
								combat_state = interceptor_combat.joust
								vector_locked = false
								previous_combat_state = "orbit"
								} else {
									combat_state = interceptor_combat.hard_disengage
									vector_locked = false
									previous_combat_state = "orbit"
								}
							} else {
								combat_state = interceptor_combat.disengage
								vector_locked = false
								previous_combat_state = "orbit"
							}
						}
							
					show_debug_message("orbit")
						
					break;
					
					case interceptor_combat.joust:
						var _travel_direction = point_direction(x, y, ship_target.x, ship_target.y)
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						motion_add(direction, acceleration_rate)
						limit_speed()
						if (abs(angle_difference(direction, _travel_direction)) < 5 and speed = max_speed and vector_sliding_counter > 25){
							combat_state =interceptor_combat.vector_sliding
							previous_combat_state = "joust"
						}
						if (abs(angle_difference(direction, _travel_direction)) > 35){
							combat_state = interceptor_combat.orbit
							vector_locked = false
							orbit_spin = 0
							previous_combat_state = "joust"
						}
						show_debug_message("jousting")
					break;
					
					case interceptor_combat.disengage:
					//just using the hard disengge for now
						var _travel_direction = point_direction(x, y, ship_target.x, ship_target.y)-180
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						motion_add(direction, acceleration_rate)
						limit_speed()
						if (!ship_ok and _distance_to_target < basic_attack_range and speed = max_speed){
							state = ship.returning
							vector_locked = false
							previous_combat_state = ""
						}
						if (speed = max_speed and _distance_to_target < basic_attack_range * .75 and vector_sliding_counter > 25){
							combat_state = interceptor_combat.vector_sliding
							previous_combat_state = "disengage"
						}
						if (speed = max_speed and _distance_to_target > basic_attack_range *.75){
							combat_state = interceptor_combat.orbit
							previous_combat_state = "disengage"
							vector_locked = false
							orbit = 0
						}
						show_debug_message("disengage")
					break;
					
					case interceptor_combat.hard_disengage:
						var _travel_direction = point_direction(x, y, ship_target.x, ship_target.y)-180
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						motion_add(direction, acceleration_rate)
						limit_speed()
						if (!ship_ok and _distance_to_target < basic_attack_range and speed = max_speed){
							state = ship.returning
							vector_locked = false
						}
						if (speed = max_speed and _distance_to_target < basic_attack_range * .75 and vector_sliding_counter > 25){
							combat_state = interceptor_combat.vector_sliding
							previous_combat_state = "hard_disengage"
						}
						if (speed = max_speed and _distance_to_target > basic_attack_range *.75){
							combat_state = interceptor_combat.orbit
							previous_combat_state = "hard_disengage"
							vector_locked = false
							orbit = 0
						}
						show_debug_message("hard disengage")
						
					break;
					
					
				}
				//attacks and abilties
			}
		break;
	#endregion
	
	#region recon
	case ship.recon:
		
	break;
	#endregion
	
	#region approaching enemy
	case ship.approaching_enemy:
	/*
		nearest_targets[0] = 0
		if (ship_target = noone){
			while (ship_target = noone){
				if (target_ship_type = o_enemy_ship){
				//search for nearby frigates
					
					
				//search for nearby fighters
				
				//search for nearby interceptors
				
				//priority assign
				}
				if (target_ship_type = o_player_ship){
				
				}
								
				ship_target = nearest_targets[0]
			}
			
		}
	*/
	break;
	#endregion
	
	#region ship.returning
	case ship.returning:
		if (!place_meeting(x, y, assigned_defensive_grid_space)){
			_p_dir = point_direction(x, y, assigned_defensive_grid_space.x, assigned_defensive_grid_space.y)
			motion_add(direction, acceleration_rate)
			limit_speed()
			turn_to_face_direction(_p_dir)
			direction = image_angle
		}
		if (place_meeting(x, y, assigned_defensive_grid_space)){
			x = assigned_defensive_grid_space.x
			y = assigned_defensive_grid_space.y
			state = ship.planning
		}
	break;
	#endregion
		
	#region repositioning
	case ship.repositioning:
		if (!place_meeting(x, y, assigned_defensive_grid_space)){
			_p_dir = point_direction(x, y, assigned_defensive_grid_space.x, assigned_defensive_grid_space.y)
			motion_add(direction, acceleration_rate)
			limit_speed()
			turn_to_face_direction(_p_dir)
			direction = image_angle
		}
		if (place_meeting(x, y, assigned_defensive_grid_space)){
			x = assigned_defensive_grid_space.x
			y = assigned_defensive_grid_space.y
			state = ship.planning
		}
	break;
	#endregion
	
	#region ship.interceptor_attacking
		case ship.attacking_interceptor:
			
		break;
	#endregion
	
	#region ship.fighter_attacking
	
	#endregion
	
	#region ship.frigate_attacking
	
	#endregion
	
	#region ship_ability
	
	#endregion
}
#endregion

#region post state mcahine variable checks
//DOTS
//counters
if (basic_attack_fire_counter < basic_attack_fire_rate){
	basic_attack_fire_counter++
}

vector_sliding_counter++

//is the ship ok?
if (shields = 0 and armor < max_armor*.5){
	ship_ok = false
} else {
	ship_ok = true
}
#endregion