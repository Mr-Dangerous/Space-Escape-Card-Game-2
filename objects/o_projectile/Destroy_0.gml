instance_destroy(projectile_leader)
destroyed_projectile_effect = instance_create_layer(x, y, "Projectiles", o_destroyed_projectile)

with (destroyed_projectile_effect){
	image_resource = other.projectile_image_resource
	starting_frame = other.destroy_frame
	image_scale = other.image_scale
	image_angle = other.image_angle
}
