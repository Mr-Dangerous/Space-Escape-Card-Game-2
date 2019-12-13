with(assigned_defensive_grid_space){
	player_unit_assigned = noone
}
with(squad_object){
	var fleet_size = array_length_1d(fleet)
	for (var i = 0; i < fleet_size; i++){
		if (fleet[i] = other){
			fleet[i] = noone
			break;
		}
	}
}
