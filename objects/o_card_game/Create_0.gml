
view_port_height = view_get_hport(0)
i = 0
var _card_width = 166
repeat (5){
	
	shop_slots[i, 0] = 227 + (_card_width*i) //x position
	shop_slots[i, 1] = noone  //card in the slot, or maybe the actual object
	shop_slots[i, 2] = noone //the actual object i the slot
	//visual check
	
	i++
}

i = 0
repeat (10){
	hangar_slots[i] = noone
	i++
}



