if (player_unit_assigned = noone){
	image_alpha = .6
} else {
	image_alpha = .3
}

draw_self()

if (recon_square){
	draw_sprite_ext(s_recon_grid_arrow, 0, x, y, 1, 1, recon_direction + image_angle, c_white, .5)	
}


	
