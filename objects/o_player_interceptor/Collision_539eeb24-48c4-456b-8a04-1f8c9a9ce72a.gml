/// @description Insert description here
// You can write your code in this editor
if (other.player_attack = false and dodge_reset_counter = 0){
	var d100 = irandom_range(1, 100)
	if (d100 < dodge_chance){
		//execute dodge
		var direction_to_dodge = choose(other.direction + 90, other.direction - 90)
		speed = 0
		motion_add(direction_to_dodge, max_speed)
		show_debug_message("attack dodged")
		
		dodge_reset_counter = 100
	}
}