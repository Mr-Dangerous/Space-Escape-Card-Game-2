///@description recycle shop/shuffle deck

//clear the shop slots and put the cards back into their books
//keep trukcing
/*	for (var i
	if (shop_slots[i, 1] != noone){
		book = shop_slots[i, 1][0, 1]
		for (var 
	}*/




for (var i = 0; i < 5; i++){
	var _card_look = ds_stack_top(current_deck)
	if (_card_look = noone){
		i = 0
		shuffle_deck()
		show_debug_message("deck shuffled!")
	}
	var _card = ds_stack_pop(current_deck)
	 
	shop_slots[i, 1] = _card  //card in the slot, or maybe the actual object

}
//create the instances that will go into the shop slots
var i = 0
repeat (5){
	
	var _ship = instance_create_layer(0, 0, "Ships", shop_slots[i, 1][0,0])
	
	shop_slots[i, 2] = _ship
	
	with (_ship){
		visible = false
		card_book = shop_slots[i, 1][0, 1] 
	}
	i++
}
