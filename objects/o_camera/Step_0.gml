/*==========================================================
Code needs development to zoon out or zoom back in on command.

Currently, on freeform scrolling


==========================================================*/
var view_x_position = camera_get_view_x(view_camera[0])
var view_y_position = camera_get_view_y(view_camera[0])
var view_width = camera_get_view_width(view_camera[0])
var view_height = camera_get_view_height(view_camera[0])

switch(state){
	//scrolling handling
	case camera.free_look:
	camera_moving_x = false
	camera_moving_y = false

	//scroll left
	if ((mouse_x) < view_x_position+64){
		camera_speed_x += -1
		if ((mouse_x) < view_x_position+8){
			camera_speed_x += -1
			fast_camera = true
		}
		camera_moving_x = true
	}

	//scroll right
	if ((mouse_x) > view_x_position+view_width-64){
		camera_speed_x += 1
		if ((mouse_x) > view_x_position+view_width-8){
			camera_speed_x += 1
			fast_camera = true
		}
		camera_moving_x = true
	}
	//scroll up
	if ((mouse_y) < view_y_position+64){
		camera_speed_y += -1
		if ((mouse_y) < view_y_position+8){
			camera_speed_y += -1
			fast_camera = true
		}
		camera_moving_y = true
	}
	//scroll down
	if ((mouse_y) > view_y_position+view_height-64){
		camera_speed_y += 1
		if ((mouse_y) > view_y_position+view_height-8){
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
	if ((camera_x + camera_speed_x) < 0 or (camera_x + camera_speed_x) > room_width-view_width){
		camera_speed_x = 0
	}
	if ((camera_y + camera_speed_y) < 0 or (camera_y + camera_speed_y) > room_height-view_height){
		camera_speed_y = 0
	}

	camera_set_view_pos(view_camera[0], camera_x+camera_speed_x, camera_y+camera_speed_y)

	fast_camera = false
	max_camera_speed = 4
	break;
	
	case camera.locked:
	//this might be renamed later to planning camera.
	//The whole planing screen must be visible within the GUI!
	camera_zoom = 1.58
	camera_set_view_size(view_camera[0],base_camera_width * camera_zoom, base_camera_height * camera_zoom)
	
	_camera_x = upper_left_grid_box.x -(view_width/2) + 400
	_camera_y = upper_left_grid_box.y -48
	camera_set_view_pos(view_camera[0], _camera_x, _camera_y)
	
	
	
		
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
		
		zoom_x = ((_furthest_right_player_unit_x +200) - (_furthest_left_player_unit_x -200))/base_camera_width
		zoom_y = ((_furthest_down_player_unit_y + 200) - (_furthest_up_player_unit_y - 200))/base_camera_height
		if (zoom_x > 1 or zoom_y > 1){
			if (zoom_x > zoom_y)camera_zoom = zoom_x
			if (zoom_x < zoom_y)camera_zoom = zoom_y
		}
		
		camera_set_view_size(view_camera[0],((base_camera_width+220)*camera_zoom), ((base_camera_height + 200)*camera_zoom))
		
		_camera_x = _squad_object.x - (camera_get_view_width(view_camera[0])/2)
		_camera_y = _squad_object.y - 450 //- (camera_get_view_height(view_camera[0])/2)
		camera_set_view_pos(view_camera[0], _camera_x, _camera_y)
	
		
	break;
}

//backgroun handling = might need to all change later!

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);

var parallax_lay_id = layer_get_id("Parallax_Background");
var parallax_back_id = layer_background_get_id(parallax_lay_id);

layer_background_xscale(back_id, camera_zoom)
layer_background_yscale(back_id, camera_zoom)
layer_background_xscale(parallax_back_id, camera_zoom)
layer_background_yscale(parallax_back_id, camera_zoom)

layer_x("Background", camera_get_view_x(view_camera[0]))
layer_y("Background", camera_get_view_y(view_camera[0])-400)

layer_x("Parallax_Background", camera_get_view_x(view_camera[0]) * .95)
layer_y("Parallax_Background", camera_get_view_y(view_camera[0]) * .95)

show_debug_message(mouse_y)