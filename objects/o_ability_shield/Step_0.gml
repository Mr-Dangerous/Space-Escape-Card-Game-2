
if (!instance_exists(targeted_ship)){
	instance_destroy()
}
if (created = false){
	previous_shields = targeted_ship.shields
	targeted_ship.shields += amount	
	
	if (targeted_ship.ship_class = "interceptor"){
		image_xscale = .5
		image_yscale = .5
	}
	if (targeted_ship.ship_class = "frigate"){
		image_xscale = 1.5
		image_yscale = 1.5
	}
	targeted_ship.ability_shield_active = true
	
	created=true
}
duration--

if (duration < 0){
	instance_destroy()
}
if (targeted_ship.shields <= previous_shields){
	instance_destroy()
}
x = targeted_ship.x
y = targeted_ship.y