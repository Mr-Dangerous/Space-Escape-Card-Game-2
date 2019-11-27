image_xscale = image_scale
image_yscale = image_scale
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




for(i = 0; i<81; i++){
	var _x_offset = grid_boxes[i, 0]
	var _y_offset = grid_boxes[i, 1]
	//Layer can change later
	var _grid_box = instance_create_layer(x + _x_offset, y+_y_offset, "Instances", o_grid_box)
	with(_grid_box){
		x_offset = _x_offset
		y_offset = _y_offset
	}
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
		
}

squad_ships = array_create(15, noone)

