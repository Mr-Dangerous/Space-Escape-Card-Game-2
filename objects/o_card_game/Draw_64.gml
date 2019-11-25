/// @description draw cards in the shop
#region shop GUI
var _card_width = 166
var _card_offset_x = 122
var _card_offset_y = 51
var _class_offset_x = 11
var _class_offset_y = 5
var _origin_offset_x = 11
var _origin_offset_y = 25
var _name_offset_x = 11
var _name_offset_y = 75
var _cost_offset_x = 142
var _cost_offset_y = 15
i = 0

repeat(5){
	//draw the card if it exsists
	var _card = shop_slots[i, 2]
	if (_card != noone){
		draw_sprite(_card.card_border, 0, 227 + (_card_width*i), view_port_height - 110)
		draw_sprite_ext(_card.sprite_index, 0, 227 + (_card_width*i) + _card_offset_x, (view_port_height - 110)+_card_offset_y, _card.image_scale, _card.image_scale, 0, c_white, 1)
		//card text
		//origin
		draw_text_color(227 + (_card_width*i) + _origin_offset_x, view_port_height - 110 +_origin_offset_y, _card.origin, c_white, c_white, c_white, c_white, 1)
		//class
		draw_text_color(227 + (_card_width*i) + _class_offset_x, view_port_height - 110 +_class_offset_y, _card.ship_class, c_white, c_white, c_white, c_white, 1)
		//name
		draw_text_color(227 + (_card_width*i) + _name_offset_x, view_port_height - 110 +_name_offset_y, _card.name, c_white, c_white, c_white, c_white, 1)
		//cost
		draw_text_color(227 + (_card_width*i) + _cost_offset_x, view_port_height - 110 +_cost_offset_y, _card.cost, c_white, c_white, c_white, c_white, 1)
		
	}
	if (_card == noone){
		draw_sprite(s_card_placeholder, 0, shop_slots[i, 0], view_port_height - 110)
	}
	
	i++	
}
#endregion

