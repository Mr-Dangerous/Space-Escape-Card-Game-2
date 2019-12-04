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
///@param target_x
///@param target_y
///@param seek_behavior
///@param flee_behavior
///@param pursue_behavior
///@param evade_behavior
///@param follow_behavior
///@param joust_behavior

var target_x = argument0
var target_y = argument1
var seek_behavior = argument2
var flee_behavior = argument3
var pursue_behavior = argument4
var evade_behavior = argument5
var follow_behavior = argument6
var joust_behavior_ = argument7


var _ship_a_direction = direction
var _desired_ship_a_direction = 0


_lead_distance = 0
_lead_target_x = target_x
_lead_target_y = target_y
_follow_target_x = target_x
_follow_target_y = target_y
target_direction = direction
target_speed = 0
if (instance_exists(ship_target)){
	_lead_distance = ship_target.speed * 40
	target_direction = ship_target.direction
	_lead_target_x += lengthdir_x(_lead_distance, ship_target.direction)
	_lead_target_y += lengthdir_y(_lead_distance, ship_target.direction)
	_follow_target_x += lengthdir_x(_lead_distance, ship_target.direction - 180)
	_follow_target_y += lengthdir_y(_lead_distance, ship_target.direction - 180)
}
var _direction_to_target = point_direction(x, y, target_x, target_y)
var _direction_to_lead_target = point_direction(x, y, _lead_target_x, _lead_target_y)
var _direction_to_follow_target = point_direction(x, y, _follow_target_x, _follow_target_y)

var _target_point_distance = distance_to_point(target_x, target_y)
var _target_point_follow_distance = distance_to_point(_follow_target_x, _follow_target_y)
var _target_point_lead_distance = distance_to_point(_lead_target_x, _lead_target_y)



var _arrival_slow_down_radius = 10
var _motion_to_add = 0


if (seek_behavior){
	 _desired_ship_a_direction += _direction_to_target
	 _motion_to_add += acceleration_rate

}
if (flee_behavior){
	_desired_ship_a_direction += _direction_to_target + 180
	_motion_to_add += acceleration_rate

}
if (pursue_behavior){
	_desired_ship_a_direction += _direction_to_lead_target
	_target_point_distance = _target_point_lead_distance
	_motion_to_add += acceleration_rate
}
if (evade_behavior){
	_desired_ship_a_direction += _direction_to_lead_target + 180
	_target_point_distance = _target_point_lead_distance
	_motion_to_add += acceleration_rate
}
if (follow_behavior){
	_desired_ship_a_direction += _direction_to_follow_target
	_target_point_distance = _target_point_follow_distance
	if (distance_to_point(_follow_target_x, _follow_target_y) < 100){
		if (speed > target_speed){
			speed -=.1
			if (speed < target_speed){
				speed = target_speed
			}
		}
	} else {
	_motion_to_add += acceleration_rate
	}
}
if (joust){
	if (speed < max_speed){
		_motion_to_add += acceleration_rate
	}
	turn_to_face_direction(_direction_to_target)
	
	vector_sliding = true
	if (distance_to_object(ship_target) > 75 * max_speed){
		joust = false
		vector_sliding = false
	}
}

//put ont he brakes if there are no behaviors assigned
if (seek = false and
	pursue = false and
	flee = false and
	pursue = false and
	evade = false and
	follow = false and
	joust = false){
		_desired_ship_a_direction = image_angle
		scr_apply_friction(acceleration_rate)
	}

//check for arrival

//needs compelte rework!


if (!vector_sliding){
	turn_to_face_direction(_desired_ship_a_direction)
	direction = image_angle
}
	
//add motion
clamp(_motion_to_add, 0, acceleration_rate)
if (!vector_sliding){
	motion_add(image_angle, _motion_to_add)
}
if (vector_sliding){
	motion_add(direction, _motion_to_add)
}

//limit speed
limit_speed()







