if (instance_exists(targeted_ship)){
	if (targeted_ship.shields > previous_shields){
		targeted_ship.shields = previous_shields
	}

	targeted_ship.ability_shield_active = false
}
