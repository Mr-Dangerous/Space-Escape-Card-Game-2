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

//needs to be restructed
//new method will be to shuffle each level of each book into a deck, and then 
//populate the new stack with a specific amount of cards.
//each level up will shuffle the deck.
/*
var ship_master_deck_by_level = array_create(30, 0)
//push 10 level 1 cards into the deck
var selected_card = 0
var _selected_card_level = 0

var card_level_distribution = scr_return_card_distribution_array(level)
var _r_seed = irandom(100)

for (i = 0; i < array_length_1d(card_level_distribution); i++){
	if (_r_seed > card_level_distribution[i]) _selected_card_level = i
}

var leveled_ship_books = books_by_level_array[_selected_card_level]

for (var i =0; i < 10; i++){
	var _random_seed = irandom(array_length_1d(leveled_ship_books)-1)
	var selected_book = leveled_ship_books[_random_seed]
	if (selected_book[0,0] <= 0){
		i--
		continue
	}
	selected_book[@ 0,0]--
	selected_card = selected_book[0, 1]
	
}
*/
/*
var level_1_ship_stack = ds_stack_create()
level_1_ship_master_deck[0] = 0
var _number_of_level_1_books = array_length_1d(level_1_ship_books)
for(var i = 0; i < _number_of_level_1_books; i++){
	var number_of_cards_in_book = level_1_ship_books[i, 0]
	for (var j = 0; j < number_of_cards_in_book; j++){
		ds_stack_push(level_1_ship_stack)
	}	
}
*/










