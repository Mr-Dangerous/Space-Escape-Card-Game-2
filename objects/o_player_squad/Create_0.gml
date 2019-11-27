image_xscale = image_scale
image_yscale = image_scale
x_offset = -400 //should allow for 9 squares of grid boxes
y_offset = -400
spacing = 100


grid_boxes[0, 0] = 0//relative x
grid_boxes[0, 1] = 0//relatie y
grid_boxes[0, 2] = 0//relative direction to box from capital ship
grid_boxes[0, 3] = 0//length to the box from capital shop
grid_boxes[0, 4] = noone//actual grid_Box pointer

var _k = 0
for (i = 0; i < 9; i++){
	for (j = 0; j < 9; j++){
		grid_boxes[_k, 0] = x_offset + (j*spacing)
		grid_boxes[_k, 1] = y_offset + (i*spacing)
		grid_boxes[_k, 2] = point_direction(x, y, x+x_offset + (j*spacing), y+y_offset + (i*spacing))
		grid_boxes[_k, 3] = point_distance(x, y, x+x_offset + (j*spacing), y+y_offset + (i*spacing))
		var _grid_box = instance_create_layer(x + grid_boxes[_k, 0], y+grid_boxes[_k, 1], "Instances", o_grid_box)
		with(_grid_box){
			x_offset = other.x_offset
			y_offset = other.x_offset
			
			
		}
		grid_boxes[_k, 4] = _grid_box
		_k++
		}
}




for(i = 0; i<81; i++){

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

//testing only
