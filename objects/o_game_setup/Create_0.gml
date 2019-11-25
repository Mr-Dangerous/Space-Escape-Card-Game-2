var i = 0
var spawn_position_distance = 1000

repeat (16){
possible_spawn_location[i, 0] = 0
possible_spawn_location[i, 1] = 0
i++
}
i = 0

//row 1 and 5
repeat(5){
	possible_spawn_location[i, 0] = 500 + i*spawn_position_distance
	possible_spawn_location[i, 1] = 500
	possible_spawn_location[i+11, 0] = 500 + i*spawn_position_distance
	possible_spawn_location[i+11, 1] = 4500
	i++
}

//row 2
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 1500
i++
possible_spawn_location[i, 0] = 4500
possible_spawn_location[i, 1] = 1500
i++

//row 3
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 2500
i++
possible_spawn_location[i, 0] = 4500
possible_spawn_location[i, 1] = 2500
i++

//row 4
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 3500
i++
possible_spawn_location[i, 0] = 4500
possible_spawn_location[i, 1] = 3500
i++