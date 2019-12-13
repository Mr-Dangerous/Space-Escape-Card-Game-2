#region Variable_definitions

#region General Sprite Resources
image_scale = .088
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
ship_class = "interceptor"
ship_origin = "Iron Fleet"
ship_subclass = "Recon"
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
dodge_chance = 10
#endregion

#region Armor and shield and movement Stats
armor = 200
max_armor = 200
shields = 100
max_shields = 100
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
target_ship_team = o_enemy_ship //resource
allied_ship_team = o_player_ship//resource
team_squad_type = o_player_squad//resource
enemy_squad_type = o_enemy_squad
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
basic_attack_fire_rate = 10 //counts up
basic_attack_fire_rate_counter = 0
basic_attack_range = 150
basic_attack_number = 2 //1 per weapon
gimbal_fire_angle = 1


//Per Weapon
//weapon 1
weapon_1_x_offset = 45
weapon_1_y_offset = -121
weapon_1_projectile_speed = 10
weapon_1_projectile_resource = o_ballistic_bullet //resource
weapon_1_projectile_damage = 10
weapon_1_projectile_damage_type = "light"
weapon_1_length_offset = point_distance(0, 0, (weapon_1_x_offset * image_scale), (weapon_1_y_offset * image_scale))
weapon_1_direction_offset = point_direction(0, 0, (weapon_1_x_offset * image_scale), (weapon_1_y_offset* image_scale))
weapon_1_projectile_flight_time = 200

//weapon 2
weapon_2_x_offset = 45
weapon_2_y_offset = 121
weapon_2_projectile_speed = 10
weapon_2_projectile_resource = o_ballistic_bullet //resource
weapon_2_projectile_damage = 10
weapon_2_projectile_damage_type = "light"
weapon_2_length_offset = point_distance(0, 0, (weapon_2_x_offset * image_scale), (weapon_2_y_offset * image_scale))
weapon_2_direction_offset = point_direction(0, 0, (weapon_2_x_offset * image_scale), (weapon_2_y_offset* image_scale))
weapon_2_projectile_flight_time = 200

//weapon_footer (variables that need other variables to function)
projectile_speed = weapon_1_projectile_speed

#endregion

#region Exhaust variables
//1 per exhaust, refer to draw event
rocket_image_counter = 30
exhaust_type = s_rocket_exhaust_original//resource
//exhaust port header
exhaust_ports[0, 0] = 1 //number of exhaust ports
exhaust_ports[0, 1] = rocket_image_counter //rocket_image_counter_reset
//exhaust port 1
exhaust_ports[1, 0] = -317 //exhaust_distance_offset
exhaust_ports[1, 1] = 0 //exhaust_firection_offset



#endregion

#region Scouting variables
can_skirmish = false
scout_mission = false
recon = 0
recon_direction = 0
recon_distance_multiplier = 0
scout_range = 0
max_scout_range = 700
scout_beacon = noone
#endregion

#region Fleet and positioning info
squad_object = instance_nearest(x, y, team_squad_type)
assigned_defensive_grid_space = 0
#endregion
#endregion

image_xscale = image_scale
image_yscale = image_scale

state = ship.planning



#region basic attack
//header
//For each gun that shoots, use this.
basic_attack_array[0, 0] = basic_attack_number
if (allied_ship_team = o_player_ship){
	basic_attack_array[0, 1] = true
} else {
	basic_attack_array[0, 1] = false
}


basic_attack_array[1, 0] = weapon_1_projectile_speed
basic_attack_array[1, 1] = weapon_1_projectile_resource
basic_attack_array[1, 2] = weapon_1_projectile_damage
basic_attack_array[1, 3] = weapon_1_projectile_damage_type
basic_attack_array[1, 4] = weapon_1_length_offset
basic_attack_array[1, 5] = weapon_1_direction_offset
basic_attack_array[1, 6] = weapon_1_projectile_flight_time

basic_attack_array[2, 0] = weapon_2_projectile_speed
basic_attack_array[2, 1] = weapon_2_projectile_resource
basic_attack_array[2, 2] = weapon_2_projectile_damage
basic_attack_array[2, 3] = weapon_2_projectile_damage_type
basic_attack_array[2, 4] = weapon_2_length_offset
basic_attack_array[2, 5] = weapon_2_direction_offset
basic_attack_array[2, 6] = weapon_2_projectile_flight_time
#endregion
