image_xscale = image_scale
image_yscale = image_scale
duration_counter++
if (duration_counter > 5){
	image_index = travel_frame
	image_speed = 0
}

if (duration_counter >= duration){
	instance_destroy()
}

with(projectile_leader){
	image_angle = other.image_angle
	x = other.x
	y = other.y
}
