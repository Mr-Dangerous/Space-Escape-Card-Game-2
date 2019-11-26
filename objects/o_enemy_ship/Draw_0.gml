draw_self()

//exhaust effect
if (speed > 0){
	//length dir instead
	_rocket_x = x + lengthdir_x(-317*image_xscale, image_angle)
	_rocket_y = y + lengthdir_y(-317*image_yscale, image_angle)
	//fix alter
	draw_sprite_ext(exhaust_type, rocket_image_counter/2, _rocket_x, _rocket_y, image_xscale, image_yscale, image_angle, c_white, .8)
	rocket_image_counter++
	if (rocket_image_counter = 20) rocket_image_counter = 0
	}
	if (speed = 0){
		rocket_image_counter = 0
}

//