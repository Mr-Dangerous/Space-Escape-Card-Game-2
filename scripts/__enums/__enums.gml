enum card {
	inactive,
	in_hangar,
	moving
}

enum ship {
	planning, //ship can be moved about
	idle, //ship cna't be moved, but flies in formation
	scouting, //ship is travelign ina scouting direction
	moving, //
	recon, //ship is not going to skirmish(used for cloaked
	skirmishing, // skirmishing with the 
	returning, // returning fromt eh scout mission
	repositioning, //moving to a new grid coordinate
	approaching_enemy, //move towards enemy squad until a valid target appears
	attacking_interceptor, //code to execute fighting an inerceptor
	attacking_fighter, //code to execute fighting a fighter
	attacking_frigate // code to execute fighting a frigate
}
enum interceptor_combat{
	vector_sliding,
	close_distance,
	orbit,
	joust,
	hard_disengage,
	disengage,
	out_of_combat
}

enum camera {
	free_look,
	locked,
	all_encompassing
}

enum squad {
	moving,
	defend_sector
}