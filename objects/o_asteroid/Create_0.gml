number_of_asteroids = irandom_range(4, 7)
asteroid_position_array[0, 0] = 0 //relative x position of the asteroid
asteroid_position_array[0, 1] = 0 //relative y position of the asteroid
asteroid_position_array[0, 2] = 1 //image_scale of the asteroid
asteroid_position_array[0, 3] = 0 //resource reference
asteroid_position_array[0, 4] = 0 //spin speed
asteroid_position_array[0, 5] = 0 //image_angle

//determine random seed for the sprite
sprite_group = irandom(4)

for (var i = 0; i < number_of_asteroids;i++){
	//select 
	#region the asteroid sprite
	var asteroid_sprite = 0
	switch(sprite_group){
		case 0:
			asteroid_sprite = choose(s_meteor_1, s_meteor_2)
		break;
		
		case 1:
			asteroid_sprite = choose(s_meteor_3, s_meteor_4)
		break;
		
		case 2:
			asteroid_sprite = choose(s_meteor_5, s_meteor_6)
		break;
		
		case 3:
			asteroid_sprite = choose(s_meteor_7, s_meteor_8)
		break;
		
		case 4:
			asteroid_sprite = choose(s_meteor_9, s_meteor_10)
		break;
	}
	#endregion
	asteroid_position_array[i, 0] = irandom_range(-300, 300)
	asteroid_position_array[i, 1] = irandom_range(-300, 300)
	asteroid_position_array[i, 2] = random_range(.04, .2)
	asteroid_position_array[i, 3] = asteroid_sprite 
	asteroid_position_array[i, 4] = random_range(-1, 1)
	asteroid_position_array[i, 5] = irandom(359)
}