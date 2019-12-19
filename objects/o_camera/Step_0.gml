/*==========================================================
Code needs development to zoon out or zoom back in on command.

Currently, on freeform scrolling


==========================================================*/
if (locked_camera_zoom > max_zoom){
	locked_camera_zoom = max_zoom
}

if (battle_camera = true){
	state = camera.battle
	battle_camera = false
}

var view_x_position = camera_get_view_x(view_camera[0])
var view_y_position = camera_get_view_y(view_camera[0])
var view_width = camera_get_view_width(view_camera[0])
var view_height = camera_get_view_height(view_camera[0])

switch(state){
	//scrolling handling
	case camera.free_look:
	camera_moving_x = false
	camera_moving_y = false
	var _mouse_x = device_mouse_x_to_gui(0)
	var _mouse_y = device_mouse_y_to_gui(0)
	
	camera_set_view_size(view_camera[0], base_camera_width*locked_camera_zoom, base_camera_height*locked_camera_zoom)
	
	var _gui_width = display_get_gui_width()
	var _gui_height = display_get_gui_height()
	scroll_direction_h = ""
	scroll_direction_v = ""
	if (_mouse_x < 64){
		scroll_timer_h++
		scroll_direction_h = "left"
	}
	
	if (_gui_width - 64 < _mouse_x){
		scroll_timer_h++
		scroll_direction_h = "right"
	}
	if (_mouse_y <64){
		scroll_timer_v++
		scroll_direction_v = "top"
	}
	if (_gui_height - 64 < _mouse_y){
		scroll_timer_v++
		scroll_direction_v = "bottom"
	}


	//scroll left
	if (scroll_direction_h = "left"){
		camera_speed_x += -1
		if (8 < _mouse_x){
			camera_speed_x += -1
			fast_camera = true
		}
		camera_moving_x = true
	}

	//scroll right
	if (scroll_direction_h = "right"){
		camera_speed_x += 1
		if (_gui_width - 8 < _mouse_x){
			camera_speed_x += 1
			fast_camera = true
		}
		camera_moving_x = true
	}
	//scroll up
	if (scroll_direction_v = "top"){
		camera_speed_y += -1
		if (8 < _mouse_y){
			camera_speed_y += -1
			fast_camera = true
		}
		camera_moving_y = true
	}
	//scroll down
	if (scroll_direction_v = "bottom"){
		camera_speed_y += 1
		if (_gui_height - 8 < _mouse_y){
			camera_speed_y += 1
			fast_camera = true
		}
		camera_moving_y = true
	}

	if (camera_moving_x = false){
		camera_speed_x = 0
	}
	if (camera_moving_y = false){
		camera_speed_y = 0
	}


	if (fast_camera = true){
		max_camera_speed = 10
	}

	if (abs(camera_speed_x)>max_camera_speed){
		camera_speed_x = max_camera_speed*sign(camera_speed_x)
	}
	if (abs(camera_speed_y)>max_camera_speed){
		camera_speed_y = max_camera_speed*sign(camera_speed_y)
	}


	//move the camera


	camera_x = camera_get_view_x(view_camera[0])
	camera_y = camera_get_view_y(view_camera[0])
	//prevent the camera from leaving the room
	if ((camera_x + camera_speed_x) < (-view_width/2) or (camera_x + camera_speed_x) > room_width-(view_width)){
		camera_speed_x = 0
	}
	if ((camera_y + camera_speed_y) < 0 or (camera_y + camera_speed_y) > room_height-view_height){
		camera_speed_y = 0
	}
	//camera set position
	camera_set_view_pos(view_camera[0], camera_x+camera_speed_x, camera_y+camera_speed_y)
	
	//reset variables
	fast_camera = false
	max_camera_speed = 4
	break;
	
	case camera.locked:
	//this might be renamed later to planning camera.
	//The whole planing screen must be visible within the GUI!
	camera_zoom = locked_camera_zoom
	camera_set_view_size(view_camera[0],base_camera_width * camera_zoom, base_camera_height * camera_zoom)
	
	//_camera_x = upper_left_grid_box.x -(view_width/2) + 400
	//_camera_y = upper_left_grid_box.y -48
	var _player_squad = instance_find(o_player_squad, 0)
	_camera_x = _player_squad.x - (view_width/2)
	_camera_y = _player_squad.y - (view_height/2) + 75
	camera_set_view_pos(view_camera[0], _camera_x, _camera_y)
	
	//check edges to see if player is attempting to scroll
	var _mouse_x = device_mouse_x_to_gui(0)
	var _mouse_y = device_mouse_y_to_gui(0)
	
	var _gui_width = display_get_gui_width()
	var _gui_height = display_get_gui_height()
	scroll_direction_h = ""
	scroll_direction_v = ""
	if (_mouse_x <64){
		scroll_timer_h++
		scroll_direction_h = "left"
	}
	
	if (_gui_width - 64 < _mouse_x){
		scroll_timer_h++
		scroll_direction_h = "right"
	}
	if (_mouse_y <64){
		scroll_timer_v++
		scroll_direction_v = "bottom"
	}
	if (_gui_height - 64 < _mouse_y){
		scroll_timer_v++
		scroll_direction_v = "top"
	}
	if (scroll_direction_h = ""){
		scroll_timer_h = 0
	}
	if (scroll_direction_v = ""){
		scroll_timer_v = 0
	}
	if (scroll_timer_h >= 120 or scroll_timer_v >= 120){
		state = camera.free_look
		scroll_direction_h = 0
		scroll_timer_v = 0
		show_debug_message("camera.free_look")
	}
	
	break;
	
	case camera.battle:
	var _player_squad = instance_find(o_player_squad, 0)
	var _enemy_squad = instance_nearest(_player_squad.x, _player_squad.y, o_enemy_squad)
	var x_difference = abs (_player_squad.x - _enemy_squad.x)
	var y_difference = abs (_player_squad.y - _enemy_squad.y)
	var left_unit = 0
	var top_unit = 0
	if(_player_squad.x < _enemy_squad.x){
		left_unit = _player_squad
	} else {
		left_unit = _enemy_squad
	}
	if(_player_squad.y < _enemy_squad.y){
		top_unit = _player_squad
	} else {
		top_unit = _enemy_squad
	}
	var x_ratio = x_difference/780
	var y_ratio = y_difference/786
	
	var _center_camera_x = abs((_player_squad.x + _enemy_squad.x)/2) 
	var _center_camera_y = _player_squad.y//thats the offset height to avoid the shop
	
	camera_set_view_size(view_camera[0], base_camera_width*x_ratio, base_camera_height*x_ratio)
	camera_set_view_pos(view_camera[0], _center_camera_x - (base_camera_width*x_ratio)/2, _center_camera_y - ((base_camera_height*x_ratio) / 2))
	
	break;
	
	
	
		
	
	
	case camera.all_encompassing:
		var _squad_object = instance_find(o_player_squad, 0)
		var _furthest_left_player_unit_x = _squad_object.x
		var _furthest_right_player_unit_x = _squad_object.x
		var _furthest_up_player_unit_y = _squad_object.y
		var _furthest_down_player_unit_y = _squad_object.y
		
		
		var _squad_array = _squad_object.squad_ships
		
		var end_of_array = false
		//determine the furthest units
		var _i=0
		while (end_of_array = false){
			var ship_object = _squad_array[_i]
			if (!instance_exists(ship_object)){
				end_of_array = true
				break;
			}
			if (ship_object.x < _furthest_left_player_unit_x){
				_furthest_left_player_unit_x = ship_object.x
			}
			if (ship_object.x > _furthest_right_player_unit_x){
				_furthest_right_player_unit_x = ship_object.x
			}
			if (ship_object.y > _furthest_down_player_unit_y){
				_furthest_down_player_unit_y = ship_object.y
			}
			if (ship_object.y < _furthest_up_player_unit_y){
				_furthest_up_player_unit_y = ship_object.y
			}
			_i++
		}
		
		zoom_x = ((_furthest_right_player_unit_x + (200* camera_zoom)) - (_furthest_left_player_unit_x -(200*camera_zoom)))/base_camera_width
		zoom_y = ((_furthest_down_player_unit_y + (200*camera_zoom)) - (_furthest_up_player_unit_y - (200*camera_zoom)))/base_camera_height
		if (zoom_x > 1 or zoom_y > 1){
			if (zoom_x > zoom_y)camera_zoom = zoom_x
			if (zoom_x < zoom_y)camera_zoom = zoom_y
		}
		
		camera_set_view_size(view_camera[0],((base_camera_width+220)*zoom_x), ((base_camera_height + 200)*zoom_x))
		
		_camera_x = _furthest_left_player_unit_x - (220*camera_zoom)
		_camera_y = _furthest_up_player_unit_y- (100*camera_zoom) //- (camera_get_view_height(view_camera[0])/2)
		camera_set_view_pos(view_camera[0], _camera_x, _camera_y)
	
		
	break;
}

//backgroun handling = might need to all change later!

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);

var parallax_lay_id = layer_get_id("Parallax_Background");
var parallax_back_id = layer_background_get_id(parallax_lay_id);

layer_background_xscale(back_id, background_scale*locked_camera_zoom)
layer_background_yscale(back_id, background_scale*locked_camera_zoom)
layer_background_alpha(back_id, .6)
layer_background_xscale(parallax_back_id, locked_camera_zoom)
layer_background_yscale(parallax_back_id, locked_camera_zoom)


layer_x("Background", camera_get_view_x(view_camera[0]))
layer_y("Background", camera_get_view_y(view_camera[0]))

layer_x("Parallax_Background", (camera_get_view_x(view_camera[0]) * .95)-80)
layer_y("Parallax_Background", camera_get_view_y(view_camera[0]) * .95)

