/// @description buy a ship!
var _scale = view_port_width/1280

var selected_card_slot = -1
var _shop_offset_x = 227* _scale
var _shop_offset_x_far_side = 385* _scale
var _shop_offset_y_bottom = view_port_height - (8 * _scale)
var _shop_offset_y_top = view_port_height -(110 * _scale)
var _card_width = 158 *_scale

var _x = device_mouse_x_to_gui(0)
var _y = device_mouse_y_to_gui(0)

var _cycle_button_x_top_left = 183 * _scale
var _cycle_button_y_top_left = (view_port_height - 110)* _scale
var _cycle_button_x_bottom_right = 223 * _scale
var _cycle_button_y_bottom_right= (view_port_height - 70)* _scale



//check card slot 
i=0


repeat(5){
	var _top_x = _shop_offset_x + (_card_width*i)
	var _top_y = _shop_offset_y_top
	var _bot_x = _shop_offset_x_far_side + (_card_width*i)
	var _bot_y = _shop_offset_y_bottom
	if(point_in_rectangle(_x, _y, _top_x, _top_y, _bot_x, _bot_y)){
		selected_card_slot = i
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
if (point_in_rectangle(_x, _y,
_cycle_button_x_top_left, _cycle_button_y_top_left,
_cycle_button_x_bottom_right, _cycle_button_y_bottom_right)){
	scr_cycle_shop()
}