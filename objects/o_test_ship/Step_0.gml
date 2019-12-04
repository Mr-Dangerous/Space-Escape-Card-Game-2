/// @description

one_pressed = keyboard_check_pressed(ord("1"))
two_pressed = keyboard_check_pressed(ord("2"))
three_pressed = keyboard_check_pressed(ord("3"))
four_pressed = keyboard_check_pressed(ord("4"))
five_pressed = keyboard_check_pressed(ord("5"))
six_pressed = keyboard_check_pressed(ord("6"))
seven_pressed = keyboard_check_pressed(ord("7"))
eight_pressed = keyboard_check_pressed(ord("8"))
nine_pressed = keyboard_check_pressed(ord("9"))
zero_pressed = keyboard_check_pressed(ord("0"))

if (one_pressed){
	seek = !seek
	show_debug_message("seek")
}
if (two_pressed){
	flee = !flee
	show_debug_message("flee")
}
if (three_pressed){
	pursue = !pursue
	show_debug_message("pursue")
}
if (four_pressed){
	evade = !evade
	show_debug_message("evade")
}
if (five_pressed){
	follow = !follow
	show_debug_message("follow")
	
}
if (six_pressed){
	joust = !joust
	show_debug_message("joust")
}
if (zero_pressed){
	seek = false
	pursue = false
	flee = false
	pursue = false
	evade = false
	follow = false
	joust = false
}

//testinggggg


ship_target = instance_nearest(x, y, o_enemy_ship_test)
if (instance_exists(ship_target)){
	src_movement_manager(ship_target.x, ship_target.y, seek, flee, pursue, evade, follow, joust)
}