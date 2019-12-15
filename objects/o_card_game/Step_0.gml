//advance the energy coutner if you have less than max energy
if (energy_current < energy_maximum){
	energy_counter++
}
//give a point of energy when the counter reaches the tick
if (energy_counter >= energy_tick){
	energy_current++
	energy_counter = 0
}


//advance the turn
if (game_paused = false){
	turn_timer--
}

if (turn_timer = 0){
	turn_timer = turn_length
	scr_change_turn()
}
show_debug_message(turn_timer)