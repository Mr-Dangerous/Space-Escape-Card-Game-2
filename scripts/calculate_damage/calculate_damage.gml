///@param damage_type
///@param damage
///@param damaged_object
var damage_type = argument0
var damage = argument1
var damaged_object = argument2

damage_to_armor = 0
damage_to_shields = 0

switch(damage_type){
	case "light":
			
		if (damaged_object.shields > 0){
			if (damaged_object.reinforced_shields){
				damage_to_shields = round(damage * .1)
			} else {
				damage_to_shields = round(damage * .5)
			}
			damage_to_armor = round(damage * .1)
			
		}
		
		//damage_to_armor
		if (damaged_object.shields <= 0){
			damage_to_armor = damage
		}
		
	
	break;
	
	case "medium":
		
		if (damaged_object.shields > 0){
			if (damaged_object.reinforced_shields){
				damage_to_shields = round(damage * .3)
			} else {
				damage_to_shields = round(damage * .45)
			}
			damage_to_armor = round(damage * .30)
			
		}
		
		//damage_to_armor
		if (damaged_object.shields <= 0){
			damage_to_armor = damage
		}
	break;
	
	case "heavy":
		
		if (damaged_object.shields > 0){
			if (damaged_object.reinforced_shields){
				damage_to_shields = round(damage * .1)
			} else {
				damage_to_shields = round(damage * .25)
			}
			damage_to_armor = round(damage * .75)
			
		}
		
		//damage_to_armor
		if (damaged_object.shields <= 0){
			damage_to_armor = damage
		}
	break;
	//to be worked on later
	case "energy":
	
		if (damaged_object.shields > 0){
			if (damaged_object.reinforced_shields){
				damage_to_shields = round(damage * .5)
			} else {
			damage_to_shields = damage
			}
			damage_to_armor = 0
			
		}
		
		//damage_to_armor
		if (damaged_object.shields <= 0){
			damage_to_armor = damage * 0
		}
	break;
	//may change this to peircing later
	case "true":

		damage_to_armor = damage
		
	break;
}

damage[0] = damage_to_armor - damaged_object.armor_damage_reduction
damage[1] = damage_to_shields

return damage