number_of_asteroids = irandom_range(4, 7)
resource_array[0, 0] = 0 //relative x position of the asteroid
resource_array[0, 1] = 0 //relative y position of the asteroid
resource_array[0, 2] = 1 //image_scale_x of the asteroid
resource_array[0, 3] = 0 //resource reference
resource_array[0, 4] = 0 //spin speed
resource_array[0, 5] = 0 //image_angle
resource_array[0, 6] = 0 //image_scale_y

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
	resource_array[i, 0] = irandom_range(-300, 300)
	resource_array[i, 1] = irandom_range(-300, 300)
	resource_array[i, 2] = random_range(.02, .2)
	resource_array[i, 3] = asteroid_sprite 
	resource_array[i, 4] = random_range(-.5, .5)
	resource_array[i, 5] = irandom(359)
	resource_array[i, 6] = random_range(.05, .2)
}