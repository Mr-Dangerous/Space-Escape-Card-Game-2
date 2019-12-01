view_port_height = view_hport[0]
view_port_width = view_wport[0]
_scale = view_port_width/1280

i = 0
var _card_width = 166
repeat (5){
	
	shop_slots[i, 0] = ((227/1280)*view_port_width) + (_card_width*i) //x position
	shop_slots[i, 1] = noone  //card in the slot, or maybe the actual object
	shop_slots[i, 2] = noone //the actual object in the slot
	//visual check
	
	i++
}

i = 0
repeat (10){
	hangar_slots[i] = noone
	i++
}



