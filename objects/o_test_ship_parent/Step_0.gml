//TEST
ship_target = instance_nearest(x, y, target_ship_team)
if (instance_exists(ship_target)){
	var _distance_to_enemy = distance_to_object(ship_target)
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
	
}
scr_movement_manager_2()


//TEST