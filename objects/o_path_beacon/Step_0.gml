if (duration <= 0){
	x = irandom(room_width)
	y = irandom(room_height)
	duration = 2000
}
duration--

if (keyboard_check_pressed(ord("O"))){
	duration = 20
}
