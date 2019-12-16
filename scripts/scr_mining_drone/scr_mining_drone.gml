show_debug_message("mining drones spell cast!")
var player_squad = instance_find(o_player_squad, 0)

if (player_squad.max_drones < 11){
	player_squad.max_drones += 1
	player_squad.drones += 1
}