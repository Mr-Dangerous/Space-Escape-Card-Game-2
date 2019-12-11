#region Variable_definitions

#region General Sprite Resources
image_scale = .05
#endregion

#region Behavior
seek = false
flee = false
pursue = false
evade = false
follow = false
joust = false
strafe = false
#endregion

#region Ship information
ship_class = ""
ship_origin = ""
ship_subclass = ""
#endregion

#region Movement
turn_speed = 2
max_speed = 3
acceleration_rate = .05
pilot_reflexes = 10
vector_locked = false
combat_timing_counter = 0
formation_locked = false
movement_locked = false
dodge_chance = 0
#endregion

#region Armor and shield and movement Stats
armor = 0
max_armor = 0
shields = 0
max_shields = 0
reinforced_shields = false
armor_damage_reduction = 0
ship_ok = true
damage_partition_tick = max_armor/4
#endregion

#region Targeting
target_x = 0
target_y = 0
ship_target = noone
scout_beacon = noone
target_ship_team = 0 //resource
allied_ship_team = 0//resource
team_squad_type = 0//resource
enemy_squad_type = 0//resource 
scan_range= 600
can_attack = true
deploy = false
deploy_direction = 0
enemy_squad_target = noone
disengage_counter = 0
disengage_enemy = false
approach_enemy = false
#endregion

#region Weapon variables
//Weapon Variable Header
basic_attack_fire_rate = 100 //counts up
basic_attack_fire_rate_counter = 0
basic_attack_range = 0
basic_attack_number = 1 //1 per weapon
gimbal_fire_angle = 1
projectile_speed = 0

//Per Weapon
weapon_1_x_offset = 0
weapon_1_y_offset = 0
weapon_1_projectile_speed = 0
weapon_1_projectile_resource = 0 //resource
weapon_1_projectile_damage = 0
weapon_1_projectile_damage_type = ""
weapon_1_length_offset = 0
weapon_1_direction_offset = 0
weapon_1_projectile_flight_time = 0

#endregion

#region Exhaust variables
//1 per exhaust, refer to draw event
rocket_image_counter = 30
exhaust_type = 0//resource
//exhaust port header
exhaust_ports[0, 0] = 1 //number of exhaust ports
exhaust_ports[0, 1] = rocket_image_counter //rocket_image_counter_reset
//exhaust port 1
exhaust_ports[1, 0] = 0 //exhaust_distance_offset
exhaust_ports[1, 1] = 0 //exhaust_direction_offset = point_direction(-x, -y, 0, 0)

#endregion

#region Scouting variables
can_skirmish = false
scout_mission = false//to copy
recon = 0
recon_direction = 0
recon_distance_multiplier = 0
scout_range = 0
max_scout_range = 0
scout_beacon = noone
#endregion

#region Fleet and positioning info
squad_object = instance_nearest(x, y, team_squad_type)
assigned_defensive_grid_space = 0
#endregion
#endregion

image_xscale = image_scale
image_yscale = image_scale

if (team_squad_type = o_player_squad){
	state = ship.planning
}
if (team_squad_type = o_enemy_squad){
	state = ship.idle
}

#region basic attack
//header
//For each gun that shoots, use this.
basic_attack_array[0, 0] = basic_attack_number
if (allied_ship_team = o_player_ship){
	basic_attack_array[0, 1] = true
} else {
	basic_attack_array[0, 1] = false
}

basic_attack_range = weapon_1_projectile_speed * weapon_1_projectile_flight_time
var weapon_1_length_offset = point_distance(0, 0, (weapon_1_x_offset * image_scale), (weapon_1_y_offset * image_scale))
var weapon_1_direction_offset = point_direction(0, 0, (weapon_1_x_offset * image_scale), (weapon_1_y_offset* image_scale))

basic_attack_array[1, 0] = weapon_1_projectile_speed
basic_attack_array[1, 1] = weapon_1_projectile_resource
basic_attack_array[1, 2] = weapon_1_projectile_damage
basic_attack_array[1, 3] = weapon_1_projectile_damage_type
basic_attack_array[1, 4] = weapon_1_length_offset
basic_attack_array[1, 5] = weapon_1_direction_offset
basic_attack_array[1, 6] = weapon_1_projectile_flight_time
#endregion
