/*
speed = 2

direction_change_counter--

if (direction_change_counter <= 0){
	_new_direction = irandom(360)
	direction_change_counter = 200
}
turn_to_face_direction(_new_direction)
direction = image_angle
limit_speed()