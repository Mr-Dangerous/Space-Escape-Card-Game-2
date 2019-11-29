
draw_sprite(s_sector_map, 0, view_wport[0] - 108, view_hport[0] - 108)
if (player_location != -1){
	draw_sprite(s_player_location_dot, 0, view_wport[0] - 208 + mini_map_sector_locations[player_location, 0], view_hport[0] - 208 + mini_map_sector_locations[player_location, 1]) 
}