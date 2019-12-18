for (var _k = 0; _k < array_length_1d(master_deck); _k++){
//generate the level - eventually, will be a d100 roll
	randomize()
	var card_level = 1
	var card_seed = irandom(7)//selects from the books that exist
	var selected_book = 0
	var card_class = ""
	var selected_card = array_create(2, 0)

	//select the book
	switch(card_level){
		case 1:
			switch(card_seed){
				case 0: //iron interceptor
					selected_book = iron_interceptor_book
					card_class = "ship"
				break;
				case 1://crystal interceptor
					selected_book = crystal_interceptor_book
					card_class = "ship"
				break;
				case 2://solar interceptor
					selected_book = solar_interceptor_book
					card_class = "ship"
				break;
				case 3://imperial interceptor
					selected_book = imperial_interceptor_book
					card_class = "ship"
				break;
				case 4://alien interceptor
					selected_book = alien_interceptor_book
					card_class = "ship"
				break;
				case 5://hyper_jump
					selected_book = hyper_jump_book
					card_class = "spell"
				break;
				case 6: //mining drone
					selected_book = mining_drone_book
					card_class = "spell"
				break;
				case 7:  //iron frigate - temporary
					selected_book = iron_frigate_book
					card_class = "ship"
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
	if (selected_book[0, 0] <= 0){
		_k--
		
		continue
	}

	
	selected_card[0, 0] = selected_book[0, 1] //add the object
	selected_card[0, 1] = selected_book // give a reference to the book
	selected_card[0, 2] = card_class // attach the card class for future reference

	
	
	master_deck[@ _k] = selected_card
	selected_book[@ 0, 0]--
	
	selected_book = noone
}

//shuffle master deck into stack data structure
repeat(70){
	var random_number_1 = irandom(29)
	var random_number_2 = irandom(29)

	while (random_number_1 = random_number_2){
		random_number_2 = irandom(29)
	}
	var card_1 = master_deck[random_number_1]
	var card_2 = master_deck[random_number_2]

	master_deck[@ random_number_1] = card_2
	master_deck[@ random_number_2] = card_1
}

for(var i = 0; i < array_length_1d(master_deck); i++){
	ds_stack_push(current_deck, master_deck[i])
}