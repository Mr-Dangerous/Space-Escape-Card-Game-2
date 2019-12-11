/// @description Spawn a Fleet
show_debug_message("fleet created!")
var _k = 0
_fleet_1 = array_create(15, 0)
_fleet_1[0, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[0, 1] = grid_boxes[0, 4]

_fleet_1[1, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[1, 1] = grid_boxes[4, 4] //assigned grid space, count from top left

_fleet_1[2, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[2, 1] = grid_boxes[8, 4] //assigned grid space, count from top left

_fleet_1[3, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[3, 1] = grid_boxes[12, 4] //assigned grid space, count from top left

_fleet_1[4, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[4, 1] = grid_boxes[16, 4] //assigned grid space, count from top left

_fleet_1[5, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[5, 1] = grid_boxes[20, 4] //assigned grid space, count from top left

_fleet_1[6, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[6, 1] = grid_boxes[24, 4] //assigned grid space, count from top left

_fleet_1[6, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[6, 1] = grid_boxes[28, 4] //assigned grid space, count from top left

_fleet_1[7, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[7, 1] = grid_boxes[32, 4] //assigned grid space, count from top left

_fleet_1[8, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[8, 1] = grid_boxes[36, 4] //assigned grid space, count from top left

_fleet_1[9, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[9, 1] = grid_boxes[40, 4] //assigned grid space, count from top left

_fleet_1[10, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[10, 1] = grid_boxes[44, 4] //assigned grid space, count from top left

_fleet_1[11, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[11, 1] = grid_boxes[48, 4] //assigned grid space, count from top left

_fleet_1[12, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[12, 1] = grid_boxes[52, 4] //assigned grid space, count from top left

_fleet_1[13, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[13, 1] = grid_boxes[56, 4] //assigned grid space, count from top left

_fleet_1[14, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[14, 1] = grid_boxes[60, 4] //assigned grid space, count from top left

_fleet_1[15, 0] = o_alien_interceptor_enemy//unit type
_fleet_1[15, 1] = grid_boxes[64, 4] //assigned grid space, count from top left

var selected_fleet = _fleet_1

for (var i = 0; i < array_length_1d(selected_fleet); i++){
	if (fleet[i] = noone){
		var _grid_box_reference = selected_fleet[i, 1]
		if (_grid_box_reference.player_unit_assigned = noone){
			var _new_ship = instance_create_layer(_grid_box_reference.x, _grid_box_reference.y, "Ships", selected_fleet[i, 0])
			fleet[i] = _new_ship
			with(_grid_box_reference){
				player_unit_assigned = _new_ship
			}
			with (_new_ship){
				assigned_defensive_grid_space = _grid_box_reference
			}
			show_debug_message("ship created!")
		}
	}
	
}