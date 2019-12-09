/*
image_xscale = image_scale
image_yscale = image_scale

idle_direction = squad_object.idle_direction
if (team_squad_type = o_player_squad){
	state = ship.planning
}
if (team_squad_type = o_enemy_squad){
	state = ship.idle
}

#region basic attack
//header
//For each gun that shoots, use this.
basic_attack_array[0, 0] = basic_attack_number
if (allied_ship_type = o_player_ship){
	basic_attack_array[0, 1] = true
} else {
	basic_attack_array[0, 1] = false
}

var weapon_1_length_offset = point_distance(0, 0, (weapon_1_x_offset * image_scale), (weapon_1_y_offset * image_scale))
var weapon_1_direction_offset = point_direction(0, 0, (weapon_1_x_offset * image_scale), (weapon_1_y_offset* image_scale))

basic_attack_array[1, 0] = weapon_1_projectile_speed
basic_attack_array[1, 1] = weapon_1_projectile_resource
basic_attack_array[1, 2] = weapon_1_projectile_damage
basic_attack_array[1, 3] = weapon_1_projectile_damage_type
basic_attack_array[1, 4] = weapon_1_length_offset
basic_attack_array[1, 5] = weapon_1_direction_offset
#endregion