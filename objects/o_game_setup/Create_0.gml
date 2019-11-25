var i = 0
var spawn_position_distance = 3000

repeat (16){
possible_spawn_location[i, 0] = 0//x
possible_spawn_location[i, 1] = 0//y
i++
}
i = 0

//row 1 and 5
repeat(5){
	possible_spawn_location[i, 0] = 500 + i*spawn_position_distance
	possible_spawn_location[i, 1] = 500 
	possible_spawn_location[i+11, 0] = 500 + i*spawn_position_distance
	possible_spawn_location[i+11, 1] = 15000
	i++
}

//row 2
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 3500
i++
possible_spawn_location[i, 0] = 15500
possible_spawn_location[i, 1] = 3500
i++

//row 3
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 2500
i++
possible_spawn_location[i, 0] = 15500
possible_spawn_location[i, 1] = 6500
i++

//row 4
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 9500
i++
possible_spawn_location[i, 0] = 15500
possible_spawn_location[i, 1] = 9500
i++