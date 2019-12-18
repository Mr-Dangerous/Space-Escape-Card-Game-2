/// @description drag ship to a new square
if (state = ship.planning or state = ship.repositioning){
	var ship_copy = instance_create_layer(mouse_x, mouse_y, "Above_UI", o_ship_reposition_copy)
	with (ship_copy){
		sprite_index = other.sprite_index
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
		image_angle = other.image_angle
		ship_reference = other
		assigned_grid_space = other.assigned_defensive_grid_space
	}
}