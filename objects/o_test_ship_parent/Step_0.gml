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


//TEST