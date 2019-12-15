for (var _k = 0; _k < array_length_1d(master_deck); _k++){
//generate the level - eventually, will be a d100 roll
	randomize()
	var card_level = 1
	var card_seed = irandom(5)//selects from the books that exist
	var selected_book = noone
	var card_class = ""
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
				case 5://alien interceptor
					selected_book = hyper_jump_book
					card_class = "spell"
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
	var selected_card = array_create(3, noone)

	for(var i=0; i < array_length_1d(selected_book); i++){
		if (selected_book[i] != noone){
			selected_card[0, 0] = selected_book[i]
			selected_card[0, 1] = selected_book
			selected_card[0, 2] = card_class
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