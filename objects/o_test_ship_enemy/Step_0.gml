/// @description

one_pressed = keyboard_check_pressed(ord("A"))
two_pressed = keyboard_check_pressed(ord("S"))
three_pressed = keyboard_check_pressed(ord("D"))
four_pressed = keyboard_check_pressed(ord("F"))
five_pressed = keyboard_check_pressed(ord("G"))
six_pressed = keyboard_check_pressed(ord("H"))
seven_pressed = keyboard_check_pressed(ord("J"))
eight_pressed = keyboard_check_pressed(ord("K"))
nine_pressed = keyboard_check_pressed(ord("L"))
zero_pressed = keyboard_check_pressed(ord("P"))

if (one_pressed){
	seek = !seek
	show_debug_message("seek")
	scr_show_truth(seek)
}
if (two_pressed){
	flee = !flee
	show_debug_message("flee")
	scr_show_truth(flee)
}
if (three_pressed){
	pursue = !pursue
	show_debug_message("pursue")
	scr_show_truth(pursue)
}
if (four_pressed){
	evade = !evade
	show_debug_message("evade")
	scr_show_truth(evade)
}
if (five_pressed){
	follow = !follow
	show_debug_message("follow")
	scr_show_truth(follow)
	
}
if (six_pressed){
	joust = !joust
	show_debug_message("joust")
	scr_show_truth(joust)
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


ship_target = instance_nearest(x, y, o_player_ship_test)
if (instance_exists(ship_target)){
	scr_movement_manager(ship_target.x, ship_target.y, seek, flee, pursue, evade, follow, joust)
}