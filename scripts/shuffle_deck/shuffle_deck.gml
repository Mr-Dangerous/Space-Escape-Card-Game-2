for (var _k = 0; _k < array_length_1d(master_deck); _k++){
//generate the level - eventually, will be a d100 roll
	randomize()
	var card_level = 1
	var card_seed = irandom_range(0, 4)//selects from the books that exsist
	var selected_book = noone
	//select the book
	switch(card_level){
		case 1:
			switch(card_seed){
				case 0: //iron interceptor
					selected_book = iron_interceptor_book
				break;
				case 1://crystal interceptor
					selected_book = crystal_interceptor_book
				break;
				case 2://solar interceptor
					selected_book = solar_interceptor_book
				break;
				case 3://imperial interceptor
					selected_book = imperial_interceptor_book
				break;
				case 4://alien interceptor
					selected_book = alien_interceptor_book
				break;
			}
		break;
	
		case 2:
			switch(card_seed){
				case 0:
			
				break;
			}
		break;
	
		case 3:
			switch(card_seed){
				case 0:
			
				break;
			}
		break;
	
		case 4:
			switch(card_seed){
				case 0:
			
				break;
			}
		break;
	
		case 5:
			switch(card_seed){
				case 0:
			
				break;
			}
		break;
	}

	//check to see if the book has any cards left
	var selected_card = array_create(2, noone)

	for(var i=0; i < array_length_1d(selected_book); i++){
		if (selected_book[i] != noone){
			selected_card[0, 0] = selected_book[i]
			selected_card[0, 1] = selected_book
			selected_book[@ i] = noone
			break;
		}
	}
	if (selected_card[0, 0] = noone){
		_k--
		break;
	}
	
	master_deck[@ _k] = selected_card
}

//copy the master deck into the stack
var master_deck_empty = false
var _master_deck_size = array_length_1d(master_deck)-1


while(!master_deck_empty){
	//put a random card from the deck into the stack
	valid_card_slot = false
	while(!valid_card_slot){
		var _random_card_position = irandom(_master_deck_size)
		if(master_deck[_random_card_position] != noone){
			var _card = master_deck[_random_card_position]
			ds_stack_push(current_deck, _card)
			master_deck[@ _random_card_position] = noone
			valid_card_slot = true
		}
	}
		//check to see if the deck is empty
	
	
	master_deck_empty = true
	var _i = 0
	repeat (_master_deck_size){
		if (master_deck[_i] != noone){
			master_deck_empty = false
			break;
		}
		_i++
	}

}