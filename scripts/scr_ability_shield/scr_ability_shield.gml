///@param shield_amount
///@param duration
//target a nearby ship
shield_amount = argument0
shield_duration = argument1 //in frames
show_debug_message("spell_cast!")
spell_target_found = false
spell_target = noone
i = 1
while (spell_target_found = false){
	var second_nearest_ship = instance_nth_nearest(x, y, allied_ship_team, i)
	if (instance_exists(second_nearest_ship) and 
	distance_to_object(second_nearest_ship) < 200 and 
	second_nearest_ship.ability_shield_active = false){
		spell_target_found = true
		spell_target = second_nearest_ship
	}
	i++
	if (i = 15){
		spell_target_found = true
	}
}
if (instance_exists(spell_target)){
	var shield = instance_create_layer(spell_target.x, spell_target.y, "Projectiles", o_ability_shield)
	with (shield){
		targeted_ship = second_nearest_ship
		amount = other.shield_amount
		duration = other.shield_duration
		
	}
}