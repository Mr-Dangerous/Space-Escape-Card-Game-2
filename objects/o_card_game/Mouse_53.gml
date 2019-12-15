/// @description buy a ship!

var selected_card_slot = -1
var camera_x = camera_get_view_x(view_camera[0])
var camera_y = camera_get_view_y(view_camera[0])
var _camera_controller = instance_find(o_camera, 0)
var _camera_zoom = _camera_controller.camera_zoom
var _shop_offset_x = (227/1280) * view_port_width * _scale
var _shop_offset_x_far_side = (385/1280) * view_port_width * _scale
var _shop_offset_y_bottom = (8/768) * view_port_height 
var _shop_offset_y_top = (110/768) * view_port_height
var _card_width = (158/1280) * view_port_width *_scale

var _cycle_button_x_top_left = ((183/1280) * view_port_width) * _scale
var _cycle_button_y_top_left = ((view_port_height - (110/768)) * view_port_height) * _scale
var _cycle_button_x_bottom_right = ((223/1280) * view_port_width) * _scale
var _cycle_button_y_bottom_right= ((view_port_height - (70/768) * view_port_height)) * _scale


_view_port_height = camera_get_view_height(view_camera[0])
//check card slot 
i=0

repeat(5){
if (mouse_x >= ((_shop_offset_x*_camera_zoom) + camera_x + (_card_width*i*_camera_zoom)) and mouse_x <= ((_shop_offset_x_far_side*_camera_zoom) + camera_x + (_card_width*i*_camera_zoom))){
	if (mouse_y <= _view_port_height - (_shop_offset_y_bottom*_camera_zoom) + camera_y and mouse_y >= _view_port_height -(_shop_offset_y_top*_camera_zoom) + camera_y){
		selected_card_slot = i
		}
	}
	i++
}

//will do more checks, such as if there is hangar space or not, btu for now...

if (selected_card_slot != -1){
	if (shop_slots[selected_card_slot, 2] != noone 
	and shop_slots[selected_card_slot, 3] = "ship"
	and resources >= shop_slots[selected_card_slot, 2].cost){
		var purchased_ship = shop_slots[selected_card_slot, 2]
		//scan hangar slots for an open slot
		resources -= shop_slots[selected_card_slot, 2].cost
		show_debug_message(resources)
		selected_hangar_slot = -1
		for (j = 0; j < 10; j++){
			if (hangar_slots[j] = noone){
				selected_hangar_slot = j
				j = 10
			}
		}
		if (selected_hangar_slot != -1){
		
			with(purchased_ship){
				state = card.in_hangar
				hangar_slot = other.selected_hangar_slot
				show_debug_message("ship in hangar!")
				//assign hnagar x and y
				
			}
			hangar_slots[selected_hangar_slot] = purchased_ship
			//clear data in the shop IF purchased (remeber to nest this later!)
			shop_slots[selected_card_slot, 1] = noone
			shop_slots[selected_card_slot, 2] = noone
			shop_slots[selected_card_slot, 3] = ""
			shop_slots[selected_card_slot, 4] = false
		}
	}
	if (shop_slots[selected_card_slot, 2] != noone 
	and shop_slots[selected_card_slot, 3] = "spell"
	and energy_current >= shop_slots[selected_card_slot, 2].cost){
		//cast spell
		energy_current -= shop_slots[selected_card_slot, 2].cost
		show_debug_message("spell cast")
		//clear the shop
		shop_slots[selected_card_slot, 1] = noone
		shop_slots[selected_card_slot, 2] = noone
		shop_slots[selected_card_slot, 3] = ""
		shop_slots[selected_card_slot, 4] = false
	}
}

//cycle button
//not working in zoomed out mode!  TODO
if (point_in_rectangle(mouse_x - camera_x, mouse_y - camera_y,
_cycle_button_x_top_left*_camera_zoom, _cycle_button_y_top_left*_camera_zoom,
_cycle_button_x_bottom_right*_camera_zoom, _cycle_button_y_bottom_right*_camera_zoom)){
	scr_cycle_shop()
}