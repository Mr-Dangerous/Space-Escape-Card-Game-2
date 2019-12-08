//lead_target_stuff later
///@param basic attack array SEE FUNCTION

var _basic_attack_array = argument0

var _basic_attack_number = _basic_attack_array[0, 0]
var _basic_attack_team = _basic_attack_array[0, 1]

var _i = 1
repeat(_basic_attack_number){
	gun_offset_length = basic_attack_array[_i, 4]
	gun_offset_direction = image_angle + basic_attack_array[_i, 5]
	gun_offset_x = x+lengthdir_x(gun_offset_length, gun_offset_direction)
	gun_offset_y = y+lengthdir_y(gun_offset_length, gun_offset_direction)
	var _projectile = instance_create_layer(gun_offset_x, gun_offset_y, "Projectiles", _basic_attack_array[_i, 1])
	with (_projectile){
		duration = _basic_attack_array[0, 6]
		image_scale = other.image_scale
		image_angle = other.image_angle
		direction = image_angle
		speed = _basic_attack_array[_i, 0]
		projectile_resource = _basic_attack_array[_i, 1]
		projectile_image_resource = object_get_sprite(_basic_attack_array[_i, 1])
		damage = _basic_attack_array[_i, 2]
		player_attack = _basic_attack_team
		damage_type = _basic_attack_array[_i, 3]
	}
	_i++
}



