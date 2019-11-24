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
	instance_create_layer(x + _x_offset, y+_y_offset, "Above_UI", o_grid_box)
	
}


