/// @description draw cards in the shop
#region shop GUI

_scale = view_port_width/1280

var _shop_offset_x = 227 * _scale
var _card_width = 166* _scale
var _card_offset_x = 122*_scale
var _card_offset_y = 51 * _scale
var _class_offset_x = 11 * _scale
var _class_offset_y = 5* _scale
var _origin_offset_x = 11* _scale
var _origin_offset_y = 25 * _scale
var _name_offset_x = 11* _scale
var _name_offset_y = 75 * _scale
var _cost_offset_x = 130 * _scale
var _cost_offset_y = 4 * _scale
var _shop_offset_x = 227* _scale

var _shop_offset_y_top = 110 * _scale


i = 0

repeat(5){
	//draw the card if it exsists
	var _card = shop_slots[i, 2]
	var _card_class = shop_slots[i, 3]
	if (_card != noone){
		if (_card_class = "ship"){
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
		if (_card_class = "spell"){
			//TODO
			draw_sprite_ext(_card.card_border, 0, shop_slots[i, 0], view_port_height - _shop_offset_y_top, 1, 1, 0, c_white, 1)
			//name
			draw_text_color(shop_slots[i, 0] + _name_offset_x, view_port_height - _shop_offset_y_top +_name_offset_y, _card.name, c_white, c_white, c_white, c_white, 1)
			//cost
			draw_text_color(shop_slots[i, 0] + _cost_offset_x, view_port_height - _shop_offset_y_top + _cost_offset_y, _card.cost, c_white, c_white, c_white, c_white, 1)
		}
	}
	if (_card == noone){
		draw_sprite(s_card_placeholder, 0, shop_slots[i, 0], view_port_height - _shop_offset_y_top)
	}
	
	i++	
}
#endregion

#region Econ GUI

var _econ_text_offset_y = 168 * _scale

//Draw the econ assests, resources, energy
var _econ_asset_y = view_port_height -_econ_text_offset_y
//Energy
draw_sprite_ext(s_window_original_2, 0, shop_slots[0, 0]+10, _econ_asset_y + 20, 1, 1, 0, c_white, 1)
var energy_string = "Energy: " + string(energy_current) + "/" + string(energy_maximum)
draw_text_color(shop_slots[0,0] + 30, _econ_asset_y, energy_string, c_white, c_white, c_white, c_white, .9)

var resource_string = "Resources: " + string(resources) 
draw_sprite_ext(s_window_original_2, 0, shop_slots[1, 0]+50, _econ_asset_y + 20, 1, 1, 0, c_white, 1)
draw_text_color(shop_slots[1,0] + 70, _econ_asset_y, resource_string, c_white, c_white, c_white, c_white, .9)


#region messages
message = ""
if (gathering_resources){
	message = "Gathering Resources"
}
if (engaging_enemy){
	message = "Engaging Enemy"
}

draw_sprite_ext(s_window_original_2, 0, shop_slots[3, 0]+10, _econ_asset_y + 20, 1.2, 1, 0, c_white, 1)
draw_text_ext_transformed_color(shop_slots[3, 0]+30, _econ_asset_y, message,20, 200, 1, 1, 0, c_red, c_red, c_red, c_red, 1)




//Draw the turn timer
var _turn_timer_offset_y = view_port_height - (114 * _scale)
//outerbar
draw_sprite_ext(s_turn_timer_outer, 0, shop_slots[0,0], _turn_timer_offset_y, 1, 1, 0, c_white, 1)
//inner bars
var timer_tick_duration = turn_length/49  //number of 16 pixel spaces in the bar
var time_passed = turn_length - turn_timer
var number_of_time_ticks = round(time_passed/timer_tick_duration)
for (var i = 0; i < number_of_time_ticks; i++){
	draw_sprite_ext(s_turn_timer_bar_inner, 0, (shop_slots[0,0]+18)+(i*16), _turn_timer_offset_y - 3, 1, 1, 0, c_white, 1)
}
#endregion

#region cycle_shop_button
var _cycle_button_x_offset = 223 * _scale
var _cycle_button_y_offset = view_port_height - (110 * _scale)

draw_sprite(s_button_refresh_resized, 0, _cycle_button_x_offset, _cycle_button_y_offset)
#endregion

#region upgrade_shop_button
var _upgrade_button_x_offset = 223 * _scale
var _upgrade_button_y_offset = view_port_height - (60 * _scale)

draw_sprite(s_button_upgrade_resized, 0, _upgrade_button_x_offset, _upgrade_button_y_offset)
#endregion

