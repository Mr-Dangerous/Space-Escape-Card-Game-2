/// @description intitate travel to new sector

//energy check
var _player_object = instance_find(o_player_squad, 0)

if (card_game_controller.energy_current >= 5){
	

	_camera_x = camera_get_view_x(view_camera[0])
	_camera_y = camera_get_view_y(view_camera[0])
	_camera_object = instance_find(o_camera, 0)
	_camera_zoom = _camera_object.camera_zoom

	for (var i = 0; i < 24; i++){
		var _top_left_x_offset = mini_map_sector_locations[i, 0]
		var _top_left_y_offset = mini_map_sector_locations[i, 1]
		var _bottom_right_x_offset = mini_map_sector_locations[i, 2]
		var _bottom_right_y_offset = mini_map_sector_locations[i, 3]
	
		var _sector_left = _camera_x + (view_wport[0] - 208 + _top_left_x_offset)*_camera_zoom
		var _sector_right = _camera_x + (view_wport[0] - 208 +_bottom_right_x_offset)*_camera_zoom
		var _sector_top = _camera_y + (view_hport[0] - 208 + _top_left_y_offset)*_camera_zoom
		var _sector_bottom = _camera_y + (view_hport[0] - 208 + _bottom_right_y_offset)*_camera_zoom
	
		if (mouse_x >= _sector_left and mouse_x <= _sector_right){
			if (mouse_y >= _sector_top and mouse_y <= _sector_bottom){
				card_game_controller.energy_current-=5
				with (_player_object){
					target_sector = i
					
					
				}
			}
		}
	
	}
}
