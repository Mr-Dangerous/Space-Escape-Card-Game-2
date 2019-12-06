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
if (!joust or !strafe){
	vector_sliding = false
}

//testing arrivals
/*
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
*/

//psuedo skirmishing state


var beacon_target = instance_nearest(x, y, o_path_beacon)

ship_target = instance_nearest(x, y, o_player_ship_test)
var _distance = distance_to_object(ship_target)

var _combat_manuever_distance = 50*max_speed
combat_manuever_counter++

if (combat_manuever_counter >= 60){	
	combat_manuever_counter = 0
	if (_distance < _combat_manuever_distance){
		combat_manuever_counter = 0
		//check to see if being followed
		var _angle_difference = 0
		if(vector_sliding){
			_angle_difference = angle_difference(image_angle, ship_target.image_angle)
		}
		if(!vector_sliding){
			_angle_difference = angle_difference(direction, ship_target.image_angle)
		}
		if (abs(_angle_difference) < 30){
			follow = true
			joust = false
			strafe = false
		}
		if (abs(_angle_difference) > 140){
			joust = true
			follow = false
			strafe = false
		}
		if (abs(_angle_difference) >= 30 and abs(_angle_difference) <= 140){
			strafe = true
			joust = false
			follow = false
			strafe_direction = -sign(_angle_difference)
		}
		pursue = false
	}	
	if (_distance < 600 and !evade and !joust and !strafe and !follow){
		pursue = true
		seek = false
	}
	if (_distance > 300){
		pursue = false
		seek = true
	}
}



if (instance_exists(beacon_target)){
	target_x = beacon_target.x
	target_y = beacon_target.y
}

if (image_angle > 360){
	image_angle -= 360
}
scr_movement_manager(target_x, target_y, seek, flee, pursue, evade, follow, joust, strafe)
