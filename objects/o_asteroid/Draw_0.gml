for (var i = 0; i <number_of_asteroids; i++){
	var _sprite = resource_array[i, 3]
	var _rotation_speed = resource_array[i, 4]
	resource_array[i, 5] += _rotation_speed
	var _image_angle = resource_array[i, 5]
	var _x = x+resource_array[i, 0]
	var _y = y+resource_array[i, 1]
	var image_scale_x = resource_array[i, 2]
	var image_scale_y = resource_array[i, 6]
	draw_sprite_ext(_sprite, 0, _x, _y, image_scale_x, image_scale_x, _image_angle, c_white, 1)
	
}
