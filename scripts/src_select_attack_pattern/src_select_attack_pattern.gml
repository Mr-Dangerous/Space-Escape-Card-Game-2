/*This script will select an attack pattern 
Attack patterns will take into account the two ships relative damage and
other factors.

This attack pattern will be put into the movement manager to control movement 
and attacks
*/

///@param target_ship
/*
var _target_ship = argument0

//THIS IS TEH RETURN VALUE
var _returned_behavior = ""
//determine if the enemy is wounded - be more agressive against wounded
//the lower the number the more likely the ship chosing behavior
//will be more agressive

var _enemy_damage_tick = round(_target_ship.max_armor/5)
var _enemy_armor_percentage = round(_target_ship.armor/_enemy_damage_tick)
var _aggression = _enemy_armor_percentage//5 if enemy full, 1 if enemy wounded
if (_target_ship.shields > 0){
	_aggression += 3//+3 if they have shields, urging caution
}
var _self_damage = round(armor/(max_armor/5))//-5 if my ship is full, 1 if very damaged
_aggression -= _self_damage
if (shields > 0){
	_aggression -= 3//-3 if my ship has sheilds, i can take some punishment
}
var _random_chance = irandom_range(-6, 6)//just general random chance, maybe pilot skill?
_aggression += _random_chance
//at the beginning of the fight, agression should be 0.  
//It can be as low as -14 (realistically -13) if my ship is full and yours is highly dmaaged
//It can be as low as +14 in the inverted scenario
var _random_seed = irandom(100)

switch (_agression){
	
	//highly aggressive_band
	case (_aggression <= -8):
		switch (_random_seed){
			case (_random_seed < 45):
				_returned_behavior = "highly aggressive"
			break;
			case (_random_seed >=45 and _random_seed < 75):
				_returned_behavior = "aggressive"
			break;
			case(_random_seed >=75 and _random_seed <= 95):
				_returned_behavior = "defensive"
			break;
			case(_random_seed > 95):
				_returned_behavior = "highly_defensive"
			break;			
		}
	break;
	//agresive band
	case (_aggression > -8 and _aggression < 0):
		switch (_random_seed){
			case (_random_seed < 25):
				_returned_behavior = "highly aggressive"
			break;
			case (_random_seed >=25 and _random_seed < 60):
				_returned_behavior = "aggressive"
			break;
			case(_random_seed >=60 and _random_seed <= 80):
				_returned_behavior = "defensive"
			break;
			case(_random_seed > 80):
				_returned_behavior = "highly_defensive"
			break;			
		}
	break;
	//defensive band
	case (_aggression >= 0 and _aggression < 8):
		switch (_random_seed){
			case (_random_seed < 25):
				_returned_behavior = "highly defensive"
			break;
			case (_random_seed >=25 and _random_seed < 60):
				_returned_behavior = "defensive"
			break;
			case(_random_seed >=60 and _random_seed <= 80):
				_returned_behavior = "aggressive"
			break;
			case(_random_seed > 80):
				_returned_behavior = "highly_aggresive"
			break;			
		}
	break;
	//highly defensive band
	case (_aggression >= 8):
		switch (_random_seed){
			case (_random_seed < 45):
				_returned_behavior = "highly defensive"
			break;
			case (_random_seed >=45 and _random_seed < 75):
				_returned_behavior = "defensive"
			break;
			case(_random_seed >=75 and _random_seed <= 95):
				_returned_behavior = "aggressive"
			break;
			case(_random_seed > 95):
				_returned_behavior = "highly_aggressive"
			break;			
		}
	break;
}
	
return _returned_behavior
*/