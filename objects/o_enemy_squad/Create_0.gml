//Variables
target_squad = instance_find(o_player_squad, 0)

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
			visible = false
		}
		//temporary function to add some units
		 
		//
		grid_boxes[_k, 4] = _grid_box
		_k++
		}
}
for(i = 0; i<81; i++){
	//assign_recon_squares as a whole
	if (i = 0 or i = 4 or i = 8 or i = 36 or i = 44 or i = 72 or i = 76 or i = 80){
		with (grid_boxes[i, 4]){
			recon_square = true
			recon_direction = point_direction(other.x, other.y, x, y)
			switch(other.i){
				case 0:
					recon_distance_multiplier = .75
				break;
				case 4:
					recon_distance_multiplier = .85
				break;
				case 8:
					recon_distance_multiplier = 1
				break;
				case 36:
					recon_distance_multiplier = .5
				break;
				case 44:
					recon_distance_multiplier = 1
				break;
				case 72:
					recon_distance_multiplier = .75
				break;
				case 76:
					recon_distance_multiplier = .5
				break;
				case 80:
					recon_distance_multiplier = .85
				break;
			}
				
		}
	}
		
}

//fleet list
fleet = array_create(15, noone)
fleet_size = 0
create_fleet_counter = 20

state = squad.find_enemy
//testing only

