#region PreStateMachine
if (vector_locked){
	turn_speed = max_turn_speed - ((speed/max_speed)*2)
}
if (!vector_locked){
	turn_speed = max_turn_speed
}
if (enemy_squad_target != noone and target_acquired = false){
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
			with (_nearest_enemy){
				detected = true
				visible = true
			}
			if (_nearest_enemy.recon = true){
				if (can_skirmish = true){
					state = ship.skirmishing
					ship_target = _nearest_enemy
				}
			}
			state = ship.recon
			
			
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
			//leave state if enemy is dead
			if (!instance_exists(ship_target)){
				var _nearest_enemy = instance_nearest(x, y, target_ship_type)
				if (distance_to_object(_nearest_enemy) > 200 or _nearest_enemy.recon = false){
					state = ship.returning
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
				}
				//check to see if enough damage has been sustained to warrant returning
				if (armor < max_armor*.33){
					state = ship.returning
				}
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
#endregion
