view_port_height = view_hport[0]
view_port_width = view_wport[0]
_scale = view_port_width/1280

i = 0
var _card_width = 166
repeat (5){
	
	shop_slots[i, 0] = ((227/1280)*view_port_width) + (_card_width*i) //x position
	shop_slots[i, 1] = noone  //card in the slot, or maybe the actual object
	shop_slots[i, 2] = noone //the actual object in the slot
	shop_slots[i, 3] = "" //the class of card- ship or spell
	shop_slots[i, 4] = false //locked state
	//visual check
	
	i++
}


hangar_slots = array_create(10, noone)


//create the deck
master_deck = array_create(30, noone)
current_deck = ds_stack_create()

//create card references to insert into the deck
iron_interceptor_book[0,0] = 30
iron_interceptor_book[0,1] = o_iron_interceptor_card
crystal_interceptor_book[0, 0] = 30
crystal_interceptor_book[0, 1] = o_crystal_interceptor_card
alien_interceptor_book[0, 0] = 30
alien_interceptor_book[0, 1] = o_alien_interceptor_card
solar_interceptor_book[0, 0] = 30
solar_interceptor_book[0, 1] = o_solar_interceptor_card
imperial_interceptor_book[0, 0] = 30
imperial_interceptor_book[0, 1] = o_imperial_interceptor_card
iron_frigate_book[0,0] = 5
iron_frigate_book[0, 1] = o_iron_frigate_card
generic_interceptor_book[0, 0] = 30
generic_interceptor_book[0, 1] = o_generic_interceptor

//create card references for spells
hyper_jump_book[0, 0] = 15
hyper_jump_book[0, 1] = o_hyper_jump_card
mining_drone_book[0, 0] = 6
mining_drone_book[0, 1] = o_mining_drone_card

//
level = 1

//assign books by level

level_0_ship_books[0] = generic_interceptor_book

level_1_ship_books[0] = iron_interceptor_book
level_1_ship_books[1] = crystal_interceptor_book
level_1_ship_books[3] = imperial_interceptor_book
level_1_ship_books[4] = alien_interceptor_book

level_1_spell_books[0] = mining_drone_book
level_1_spell_books[1] = hyper_jump_book


level_2_ship_books[0] = solar_interceptor_book

level_3_ship_books[0] = imperial_interceptor_book

level_4_ship_books[0] = crystal_interceptor_book


level_5_ship_books[0] = iron_frigate_book

books_by_level_array [0] = level_0_ship_books
books_by_level_array [1] = level_1_ship_books
books_by_level_array [2] = level_2_ship_books
books_by_level_array [3] = level_3_ship_books
books_by_level_array [4] = level_4_ship_books
books_by_level_array [5] = level_5_ship_books

shuffle_deck()
	













