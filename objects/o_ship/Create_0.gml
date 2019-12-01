image_xscale = image_scale
image_yscale = image_scale

idle_direction = squad_object.idle_direction
if (team_squad_type = o_player_squad){
	state = ship.planning
}
if (team_squad_type = o_enemy_squad){
	state = ship.idle
}

