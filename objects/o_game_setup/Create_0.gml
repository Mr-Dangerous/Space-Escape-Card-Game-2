
var spawn_position_distance = 3000


possible_spawn_location[0, 0] = 0//x
possible_spawn_location[0, 1] = 0//y
possible_spawn_location[0, 2] = 0

var k = 0
for (i = 0; i < 5 ; i++){
	for (j = 0; j < 5; j++){
		possible_spawn_location[k, 1]= 500+(i * spawn_position_distance)
		possible_spawn_location[k, 0]= 500+(j * spawn_position_distance)
		k++
	}
}

/*
//row 1 and 5
repeat(5){
	possible_spawn_location[i, 0] = 500 + i*spawn_position_distance
	possible_spawn_location[i, 1] = 500 
	possible_spawn_location[i+11, 0] = 500 + i*spawn_position_distance
	possible_spawn_location[i+11, 1] = 12500
	i++
}

//row 2
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 3500
i++
possible_spawn_location[i, 0] = 12500
possible_spawn_location[i, 1] = 3500
i++

//row 3
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 3500
i++
possible_spawn_location[i, 0] = 12500
possible_spawn_location[i, 1] = 6500
i++

//row 4
possible_spawn_location[i, 0] = 500
possible_spawn_location[i, 1] = 9500
i++
possible_spawn_location[i, 0] = 12500
possible_spawn_location[i, 1] = 9500
i++
*/