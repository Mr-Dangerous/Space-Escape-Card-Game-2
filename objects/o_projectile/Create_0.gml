projectile_leader = instance_create_layer(x, y, "Projectiles", o_projectile_leader)
with (projectile_leader){
	player_attack = other.player_attack
}

image_xscale = image_scale
image_yscale = image_scale