draw_self()
//113, 534
if (speed > 0){
	//length dir instead
	_rocket_x = lengthdir_x(317*image_scale, image_angle)
	//fix alter
	draw_sprite_ext(s_rocket_exhaust_original, rocket_image_counter, _rocket_x, y, image_scale, image_scale, image_angle, c_white, .8)
	rocket_image_counter++
	if (rocket_image_counter = 10) rocket_image_counter = 0
	}
	if (speed = 0){
		rocket_image_counter = 0
}