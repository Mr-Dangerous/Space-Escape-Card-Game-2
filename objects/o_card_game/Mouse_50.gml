/// @description buy a ship!

var selected_card_slot = -1
var camera_x = camera_get_view_x(view_camera[0])
var camera_y = camera_get_view_y(view_camera[0])

//check card slot 
i=0
var _card_width = 158
repeat(5){
if (mouse_x >= 227 + camera_x + (_card_width*i) and mouse_x <= 385 + camera_x + (_card_width*i)){
	if (mouse_y <= view_port_height - 8 + camera_y and mouse_y >= view_port_height -110 + camera_y){
		selected_card_slot = i
		}
	}
	i++
}

//will do more checks, such as if there is hangar space or not, btu for now...

if (selected_card_slot != -1){
	if (shop_slots[selected_card_slot, 2] != noone){
		var purchased_ship = shop_slots[selected_card_slot, 2]
		//scan hangar slots for an open slot
		selected_hangar_slot = -1
		for (j = 0; j < 10; j++){
			if (hangar_slots[j] = noone){
				selected_hangar_slot = j
				j = 10
			}
		}
		if (selected_hangar_slot != -1){
		
			with(purchased_ship){
				state = ship.in_hangar
				hangar_slot = other.selected_hangar_slot
				show_debug_message("ship in hangar!")
			}
			hangar_slots[selected_hangar_slot] = purchased_ship
			//clear data in the shop IF purchased (remeber to nest this later!)
			shop_slots[selected_card_slot, 1] = noone
			shop_slots[selected_card_slot, 2] = noone
		}
	}
	
	
	
}