draw_self()

//exhaust effect
//should be from an array called exhaust ports, for each exhaust port
exhaust_number = exhaust_ports[0,0]
rocket_frame_speed = exhaust_ports[0, 1]/10

var thrust_image_scale = 1
show_debug_message(thrust_image_scale)
if (speed != 0){
	//length dir instead
	i = 1
	repeat(exhaust_number){
		 
		_rocket_x = x + lengthdir_x(exhaust_ports[i, 0]*image_xscale, image_angle-exhaust_ports[i, 1])
		_rocket_y = y + lengthdir_y(exhaust_ports[i, 0]*image_yscale, image_angle-exhaust_ports[i, 1])
		draw_sprite_ext(exhaust_type, rocket_image_counter/rocket_frame_speed, _rocket_x, _rocket_y, image_xscale*thrust_image_scale, image_yscale*thrust_image_scale, image_angle, c_white, .8)
		rocket_image_counter++
		if (rocket_image_counter = 30) rocket_image_counter = exhaust_ports[0, 1]
		i++
	}
}

//