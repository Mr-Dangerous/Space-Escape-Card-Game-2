var _view_port_height = view_hport[0]
var _view_port_width = view_wport[0]
draw_sprite(s_sector_map, 0,_view_port_width - 108,_view_port_height - 108)
if (player_location != -1){
	draw_sprite(s_player_location_dot, 0, _view_port_width - 208 + mini_map_sector_locations[player_location, 0], _view_port_height - 208 + mini_map_sector_locations[player_location, 1]) 
}