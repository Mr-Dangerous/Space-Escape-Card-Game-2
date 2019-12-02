/*This script will select an attack pattern 
Attack patterns will take into account the two ships relative damage and
other factors.

This attack pattern will be put into the movement manager to control movement 
and attacks
*/

///@param target_ship

var _target_ship = argument0


var _returned_behavior = ""
//determine if the enemy is wounded - be more agressive against wounded
//the lower the number the more likely the ship chosing behavior
//will be more agressive

var _enemy_damage_tick = round(_target_ship.max_armor/7)
var _enemy_armor_percentage = round(_target_ship.armor/_enemy_damage_tick)
var _agression = _enemy_armor_percentage//7 if enemy full, 1 if enemy wounded
if (_target_ship.shields > 0){
	_agression += 3//+3 if they have shields, urging caution
}
var _self_damage = round(armor/(max_armor/7))
_agression -= _self_damage
if (shields > 0){
	_agression -= 3
}
var _random_chance = irandom(6)
_agression += _random_chance

switch (_agression){
	
	

