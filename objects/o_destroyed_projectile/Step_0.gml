
if(created = false){
	sprite_index = image_resource
	created = true
	image_index = starting_frame
	image_xscale = image_scale
	image_yscale = image_scale
}

if (image_speed > 0){
    {
    if image_index > image_number - 1 instance_destroy();
    }
}
