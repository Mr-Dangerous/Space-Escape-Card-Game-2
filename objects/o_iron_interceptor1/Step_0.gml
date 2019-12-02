#region PreStateMachine
if (vector_locked){
	turn_speed = max_turn_speed - ((speed/max_speed)*2)
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
		image_angle = squad_object.image_angle
		speed = 0
		
		
		if (recon){
			image_angle = recon_direction + squad_object.image_angle
		}
		
		
	break;
	#endregion
	
	#region scouting
	case ship.scouting:
		//this needs to become a path
		turn_to_face_direction(recon_direction + squad_object.image_angle)
		direction = image_angle
		speed += acceleration_rate
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
			}
			//leave state if enemy is dead
			if (!instance_exists(ship_target)){
				var _nearest_enemy = instance_nearest(x, y, target_ship_type)
				if (distance_to_object(_nearest_enemy) > 200 or _nearest_enemy.recon = false){
					state = ship.returning
				} else {
					ship_target = _nearest_enemy
				}
			}
			
			if (instance_exists(ship_target)){
				//nearby allies
				var ally_count = 2
				var allied_ship = instance_nearest(x, y, allied_ship_type)
				var allied_ship_2 = instance_nth_nearest(x, y, allied_ship_type, 2)
				if (distance_to_object(allied_ship) > 400 or !allied_ship.can_skirmish){
					allied_ship = noone
					ally_count--
				}
				if (distance_to_object(allied_ship_2) > 400 or !allied_ship.can_skirmish){
					allied_ship_2 = noone
					ally_count--
				}
				
				//check to see if outnumbered
				if (instance_nth_nearest(x, y, target_ship_type, ally_count) != noone){
					state = ship.returning
					combat_state = interceptor_combat.out_of_combat
					vector_locked = false
				}
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
				switch (combat_state){
					
					case interceptor_combat.out_of_combat:
						if (_distance_to_target < basic_attack_range * 1.5){
							combat_state = interceptor_combat.close_distance
						} else {
							turn_to_face_direction(recon_direction + squad_object.image_angle)
							direction = image_angle
							speed += acceleration_rate
							limit_speed()
						}
						
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
							state = interceptor_combat.out_of_combat
							vector_locked = false
						}
						if (!ship_ok){
							state = interceptor_combat.hard_disengage
							vector_locked = false
						}
						
					break;
					
					case interceptor_combat.close_distance:
						var _travel_direction = point_direction(x,y, ship_target.x, ship_target.y)
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						speed += acceleration_rate
						limit_speed()
						
						if (_distance_to_target < basic_attack_range * .8){
							combat_state = interceptor_combat.orbit
							if (abs(angle_difference(direction, _target_direction)> 95)){
								combat_state = interceptor_combat.joust
							}
						}
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
						speed += acceleration_rate
						limit_speed()
						
						//exit the state
						if (distance_to_object(ship_target) > basic_attack_range * .8 and ship_ok = true){
							combat_state = interceptor_combat.close_distance
						}
						if (distance_to_object(ship_target) < basic_attack_range * .5 and ship_ok = true){
							var _direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
							if (abs(angle_difference(_direction_from_target, _target_direction)) < 15){
								var _direction_to_target = point_direction(x, y, ship_target.x, ship_target.y)
								if (abs(angle_difference(direction, _direction_to_target)) < turn_speed * 5){
								combat_state = interceptor_combat.joust
								} else {
									combat_state = interceptor_combat.hard_disengage
								}
							} else {
								combat_state = interceptor_combat.disengage
							}
						}
							
				
						
					break;
					
					case interceptor_combat.joust:
						var _travel_direction = point_direction(x, y, ship_target.x, ship_target.y)
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						speed += acceleration_rate
						limit_speed()
						if (abs(angle_difference(direction, _travel_direction)) < 5 and speed = max_speed){
							combat_state =interceptor_combat.vector_sliding
						}
						if (abs(angle_difference(direction, _travel_direction)) > 35){
							combat_state = interceptor_combat.orbit
							orbit_spin = 0
						}
					break;
					
					case interceptor_combat.disengage:
					//just using the hard disengge for now
						var _travel_direction = point_direction(x, y, ship_target.x, ship_target.y)-180
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						speed += acceleration_rate
						limit_speed()
						if (!ship_ok and _distance_to_target < basic_attack_range and speed = max_speed){
							state = ship.returning
						}
						if (speed = max_speed and _distance_to_target < basic_attack_range * .75){
							combat_state = interceptor_combat.vector_sliding
						}
						if (speed = max_speed and _distance_to_target > basic_attack_range *.75){
							combat_state = interceptor_combat.orbit
							orbit = 0
						}
					break;
					
					case interceptor_combat.hard_disengage:
						var _travel_direction = point_direction(x, y, ship_target.x, ship_target.y)-180
						turn_to_face_direction(_travel_direction)
						direction = image_angle
						speed += acceleration_rate
						limit_speed()
						if (!ship_ok and _distance_to_target < basic_attack_range and speed = max_speed){
							state = ship.returning
						}
						if (speed = max_speed and _distance_to_target < basic_attack_range * .75){
							combat_state = interceptor_combat.vector_sliding
						}
						if (speed = max_speed and _distance_to_target > basic_attack_range *.75){
							combat_state = interceptor_combat.orbit
							orbit = 0
						}
						
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
			speed += acceleration_rate
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
			speed += acceleration_rate
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

//is the ship ok?
if (shields = 0 and armor < max_armor*.5){
	ship_ok = false
} else {
	ship_ok = true
}
#endregion
