for (var i = 0; i< 5; i++){
		//reference the object in the slot  //references the locked state
	if (shop_slots[i, 1] != noone and shop_slots[i, 4] = false){
		var _card = shop_slots[i, 1]
		var book = _card[0, 1]
		var book_size = array_length_1d(book)
		for (var k = 0; k < book_size; k++){
			if (book[k] = noone){
				book[@ k] = _card[0,0]
				break;
			}
		}
		
		var _current_card = shop_slots [i, 2]
		instance_destroy(_current_card)
		show_debug_message("shop_slot_cleared")
		shop_slots[@ i, 1] = noone
		shop_slots[@ i, 2] = noone
		shop_slots[@ i, 3] = ""
		shop_slots[@ i, 4] = false//unlocked
	}
}





for (var i = 0; i < 5; i++){
	var _card_look = ds_stack_top(current_deck)
	if (_card_look = undefined){
		i = 0
		shuffle_deck()
		show_debug_message("deck shuffled!")
	}
	var _card = ds_stack_pop(current_deck)
	 
	shop_slots[@ i, 1] = _card  //card in the slot, or maybe the actual object
	//create the instances that will go into the shop slots

	var _book = _card[0, 1]
	var _ship_to_create = _card[0, 0]
	var _card_class = _card[0, 2]
	var _ship = instance_create_layer(0, 0, "Ships", _ship_to_create)
	shop_slots[@ i, 2] = _ship
	shop_slots[@ i, 3] = _card_class
	with (_ship){
		visible = false
		card_book = _book
	
	}
}