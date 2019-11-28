/// @description draw cards in the shop
#region shop GUI

var _shop_offset_x = (227/1280) * view_port_width * _scale
var _card_width = (166/1280) * view_port_width * _scale
var _card_offset_x = (122/1280) * view_port_width * _scale
var _card_offset_y = (51/768) * view_port_height * _scale
var _class_offset_x = (11/1280) * view_port_width * _scale
var _class_offset_y = (5/768) * view_port_height * _scale
var _origin_offset_x = (11/1280) * view_port_width * _scale
var _origin_offset_y = (25/768) * view_port_height * _scale
var _name_offset_x = (11/1280) * view_port_width * _scale
var _name_offset_y = (75/768) * view_port_height * _scale
var _cost_offset_x = (150/1280) * view_port_width * _scale
var _cost_offset_y = (4/768) * view_port_height * _scale
var _shop_offset_x = (227/1280) * view_port_width * _scale

var _shop_offset_y_top = (110/768) * view_port_height 
var _econ_text_offset_y = (138/768)*view_port_height 


i = 0

repeat(5){
	//draw the card if it exsists
	var _card = shop_slots[i, 2]
	if (_card != noone){
		draw_sprite_ext(_card.card_border, 0, shop_slots[i, 0], view_port_height - _shop_offset_y_top, 1, 1, 0, c_white, 1)
		draw_sprite_ext(_card.sprite_index, 0, shop_slots[i,0] + _card_offset_x, (view_port_height - _shop_offset_y_top)+_card_offset_y, _card.image_scale*_scale, _card.image_scale*_scale, 0, c_white, 1)
		//card text
		//origin
		draw_text_color(shop_slots[i, 0] + _origin_offset_x, view_port_height - _shop_offset_y_top +_origin_offset_y, _card.origin, c_white, c_white, c_white, c_white, 1)
		//class
		
		draw_text_color(shop_slots[i, 0] + _class_offset_x, view_port_height - _shop_offset_y_top +_class_offset_y, _card.ship_class, c_white, c_white, c_white, c_white, 1)
		//name
		draw_text_color(shop_slots[i, 0] + _name_offset_x, view_port_height - _shop_offset_y_top +_name_offset_y, _card.name, c_white, c_white, c_white, c_white, 1)
		//cost
		draw_text_color(shop_slots[i, 0] + _cost_offset_x, view_port_height - _shop_offset_y_top + _cost_offset_y, _card.cost, c_white, c_white, c_white, c_white, 1)
		
	}
	if (_card == noone){
		draw_sprite(s_card_placeholder, 0, shop_slots[i, 0], view_port_height - _shop_offset_y_top)
	}
	
	i++	
}
#endregion

#region Econ GUI
//Draw the econ assests, resources, energy
var _econ_asset_y = view_port_height -_econ_text_offset_y
//Energy
var energy_string = "Energy: " + string(energy_current) + "/" + string(energy_maximum)
draw_text_color(shop_slots[0,0], _econ_asset_y, energy_string, c_white, c_white, c_white, c_white, .9)

#endregion

