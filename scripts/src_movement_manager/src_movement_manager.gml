/*==============================HEADER============================================================
Welcome to the movement manager!

The movement manager will take in binary inputs of desired behavior, and then 
use the objects to create fluid movement.

To make everything nice and simple, this script will be run at the very end of the 
ship object to make it all super clean!

Foir purpose of coment sections, the ship calling the instance will be refered to as Ship A.
The target ship will be refered to as ship b

Ship A = self
Ship B - ship_target
===============================Good Luck==================================================*/

///@param seek_behavior
///@param flee_behavior
///@param pursue_behavior
///@param evade_behavior
///@param target_x
///@param target_y
var target_x = argument0
var target_y = argument1
var seek_behavior = argument2
var flee_behavior = argument3
var pursue_behavior = argument4
var evade_behavior = argument5
var follow_behavior = argument6
var joust_behavior_ argument7


var _ship_a_direction = direction
var _desired_ship_a_direction = 0

var _lead_distance = ship_target + (ship_target.speed * 30)
var _lead_target_x = lengthdir_x(_lead_distance, ship_target.direction)
var _lead_target_y = lengthdir_y(_lead_distance, ship_target.direction)
var _follow_target_x = lengthdir_x(_lead_distance, ship_target.direction - 180)
var _follow_target_y = lengthdir_y(_lead_distance, ship_target.direction - 180)

var _direction_to_target = point_direction(x, y, target_x, target_y)
var _direction_to_lead_target = point_direction(x, y, _lead_target_x, _lead_target_y)
var _direction_to_follow_target = point_direction(x, y, _follow_target_x, _follow_target_y)

var _target_point_ship = distance_to_point(x, y, target_x, target_y)
var _target_point_follow_distance = distance_to_point(x, y, _follow_target_x, _follow_target_y)
var _target_point_lead_distance = distance_to_point(x, y, _lead_target_x, _lead_target_y)


var _arrival_slow_down_radius = 500
var _motion = 0


if (seek_behavior){
	 _desired_ship_a_direction += _direction_to_target
	 
}
if (flee_behavior){
	_desired_ship_a_direction -= _direction_to_target
}
if (pursue_behavior){
	_desired_ship_a_direction += _direction_to_lead_target
}
if (evade_behavior){
	_desired_ship_a_direction -= _direction_to_lead_target
}
if (follow_behavior){
	_desired_ship_a_direction += _direction_to_follow_target
}




