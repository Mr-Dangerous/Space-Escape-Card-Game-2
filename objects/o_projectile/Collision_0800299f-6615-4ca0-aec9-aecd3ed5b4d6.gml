if (!player_attack){
	var damage_array = calculate_damage(damage_type, damage, other)
	with(other){
		armor -= damage_array[0]
		shields -= damage_array[1]
		if (shields < 0){
			shields = 0
		}
	}		
	instance_destroy()
}
