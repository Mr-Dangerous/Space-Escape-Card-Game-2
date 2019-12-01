if (!player_attack){
	var damage_array = calculate_damage(damage_type, damage, other)
	with (other){
		armor -= damage_array[0]
		shields -= damage_array[1]
		if (other.damage_effect = true){
		//execute damage effect
		}
	}
}

