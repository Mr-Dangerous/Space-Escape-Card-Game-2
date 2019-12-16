draw_self()
if (generate_laser = true){
	var laser_direction =  image_angle
	laser_frame_counter++
	if (laser_frame_counter >= 3){
		laser_frame_counter = 0
		laser_frame++
		if (laser_frame > 5){
			laser_frame = 0
		}
	}
	//laser_origin
	draw_sprite_ext(s_mining_laser_test_origin, laser_frame, x, y, .05, .05, laser_direction, c_white, 1)
	
	//laser_endpoint
	
	draw_sprite_ext(s_laser_red_test_endpoint, laser_frame, target_x, target_y, .05, .05, laser_direction, c_white, 1)
	
	//laser_body - assume 12 is the size of the object
	var _x_offset = x + lengthdir_x(6, laser_direction)
	var _y_offset = y + lengthdir_y(6, laser_direction)
	
	var laser_body_distance = point_distance(_x_offset, _y_offset, target_x, target_y)
	var laser_image_x_scale = laser_body_distance/312
	
	draw_sprite_ext(s_laser_red_test_body, laser_frame, _x_offset, _y_offset, laser_image_x_scale, .05, laser_direction, c_white, 1)
	
	
}
