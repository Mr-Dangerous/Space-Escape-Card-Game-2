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
if (!joust){
	vector_sliding = false
}

//testing arrivals

if (distance_to_object(ship_target) < 50 * max_speed){
	if (joust){
		//turn off other behavior and break through!
		seek = false
		pursue = false
		evade = false
		follow = false
		flee = false
	} else { 
		seek = false
		pursue = false
		follow = false
		flee = false
		evade = true
	//hard break!
	}
}

var beacon_target = instance_nearest(x, y, o_path_beacon)

ship_target = instance_nearest(x, y, o_enemy_ship_test)
if (instance_exists(ship_target)){
	target_x = ship_target.x
	target_y = ship_target.y
	
} else {
	if (instance_exists(beacon_target)){
		target_x = beacon_target.x
		target_y = beacon_target.y
		
	}
}
scr_movement_manager(target_x, target_y, seek, flee, pursue, evade, follow, joust)
