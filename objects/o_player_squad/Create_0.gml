x_offset = -400 //should allow for 9 squares of grid boxes
y_offset = -400
spacing = 100


grid_boxes[0, 0] = 0
grid_boxes[0, 1] = 0

var _k = 0
for (i = 0; i < 9; i++){
	for (j = 0; j < 9; j++){
		grid_boxes[_k, 0] = x_offset + (j*spacing)
		grid_boxes[_k, 1] = y_offset + (i*spacing)
		_k++
		}
}
//assign the idle directions and the recon sqaures
recon_squares[0] = -1 //value indicates a square that is a recon square, to be looped later
player_spawn_side = game_setup_controller.spawn_side
switch (player_spawn_side){
	case "top left corner":
		idle_direction = 315
	break;
	
	case "top edge":
		idle_direction = 270
	break;
	
	case "top right corner":
		idle_direction = 225
	break;
	
	case "left edge":
		idle_direction = 0
	
	break;
	
	case "right edge":
		idle_direction = 180
	break;
	
	case "bottom left corner":
		idle_direction = 45
	break;
	
	case "bottom edge":
		idle_direction = 90
	break;
	
	case "bottom right edge":
		idle_direction = 135
	break;	
}




for(i = 0; i<81; i++){
	var _x_offset = grid_boxes[i, 0]
	var _y_offset = grid_boxes[i, 1]
	//Layer can change later
	var _grid_box = instance_create_layer(x + _x_offset, y+_y_offset, "Instances", o_grid_box)
	//assign the camera the x and y coordinates of
	//the edges of the plannign area
	if (i = 0){
		with(_camera){
			upper_left_grid_box = _grid_box
		}
	}
	if (i = 80){
		with(_camera){
			bottom_right_grid_box = _grid_box
		}
	}
	//assign_recon_squares as a whole
	if(i<10 or i%9=0 or (i+1)%9 = 0 or i > 72){
		var p_dir = point_direction(x, y, _grid_box.x, _grid_box.y)
		with (_grid_box){
			recon_square = true
			recon_direction = p_dir
		
		}
	}
		
}

squad_ships = array_create(15, noone)

