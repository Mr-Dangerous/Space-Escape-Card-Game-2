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
///@param strafe_behavior

var target_x = argument0
var target_y = argument1
var seek_behavior = argument2
var flee_behavior = argument3
var pursue_behavior = argument4
var evade_behavior = argument5
var follow_behavior = argument6
var joust_behavior = argument7
var strafe_behavior = argument8



var _desired_ship_a_direction = 0

if (!joust_behavior or !strafe_behavior or speed < max_speed/2){
	vector_sliding = false
}

if(joust_behavior or strafe_behavior or evade_behavior or follow_behavior){
	pursue = false
}

_ship_target_x = target_x
_ship_target_y = target_y
_lead_distance = 0
_lead_target_x = target_x
_lead_target_y = target_y
_follow_target_x = target_x
_follow_target_y = target_y
target_direction = point_direction(x, y, target_x, target_y)
target_speed = 0
if (instance_exists(ship_target)){
	_lead_distance = ship_target.speed * 10
	target_direction = ship_target.direction
	_ship_target_x = ship_target.x
	_ship_target_y = ship_target.y
	_lead_target_x += lengthdir_x(_lead_distance, ship_target.direction)
	_lead_target_y += lengthdir_y(_lead_distance, ship_target.direction)
	_follow_target_x += lengthdir_x(_lead_distance, ship_target.direction - 180)
	_follow_target_y += lengthdir_y(_lead_distance, ship_target.direction - 180)
	
}
var _direction_to_path_target = point_direction(x, y, target_x, target_y)
var _direction_to_ship_target = point_direction(x, y, _ship_target_x, _ship_target_y)
var _direction_to_lead_target = point_direction(x, y, _lead_target_x, _lead_target_y)
var _direction_to_follow_target = point_direction(x, y, _follow_target_x, _follow_target_y)

var _target_point_distance = distance_to_point(target_x, target_y)
var _target_point_follow_distance = distance_to_point(_follow_target_x, _follow_target_y)
var _target_point_lead_distance = distance_to_point(_lead_target_x, _lead_target_y)


var _motion_to_add = 


if (seek_behavior){
	//seek makes a ship approach a point
	flee = false
	evade = false
	
	 _desired_ship_a_direction += _direction_to_path_target
	 var arrival_to_slow_down_radius = 50*max_speed
	 if (_target_point_distance > arrival_to_slow_down_radius){
		 _motion_to_add += acceleration_rate
	 } else {
		 if (!instance_exists(ship_target)) speed -= acceleration_rate
	 } 

}
if (flee_behavior){
	//flee makes a ship go opposite the point
	
	pursue = false
	_desired_ship_a_direction += _direction_to_path_target + 180
	_motion_to_add += acceleration_rate

}
if (pursue_behavior){
	//pursue makes a ship go to where a ship will be.
	
	
	_desired_ship_a_direction += _direction_to_lead_target
	_target_point_distance = _target_point_lead_distance
	_motion_to_add += acceleration_rate
	
			
		
		
}
if (evade_behavior){
	//evade makes a ship go away from where a ship will be
	_desired_ship_a_direction += _direction_to_lead_target + 180
	_target_point_distance = _target_point_lead_distance
	_motion_to_add += acceleration_rate
}

//there is a major error in the follow behavior
//when two ships follow one another, the ship int he front has no idea and doesn'tm break
if (follow_behavior){
	//follow is an attack behavior that is triggered when the enemy ship's angle is close to ship A
	var _follow_check_x = x + lengthdir_x(60, direction)
	var _follow_check_y = y + lengthdir_y(60, direction)
	var _follow_check_point_distance = point_distance(_follow_check_x, _follow_check_y, ship_target.x, ship_target.y)
	var _ship_check_distance = point_distance(x, y, ship_target.x, ship_target.y)
	var _following = false
	if (_follow_check_point_distance > _ship_check_distance){
		_following = !_following
	}
	if (_following){
		_desired_ship_a_direction += _direction_to_follow_target
		_target_point_distance = _target_point_follow_distance
		if (_target_point_distance < 100){
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
	if (!_following){
		strafe_direction = sign (angle_difference(direction, ship_target.direction))
		follow = false
		strafe = true
	}
}
if (joust_behavior){
	//joust is an attack behavior when two ships are close and apporaching head on
	if (speed < max_speed){
		_motion_to_add += acceleration_rate
	}
	turn_to_face_direction(_direction_to_ship_target)
	
	vector_sliding = true
	
}

if (strafe_behavior){
	//strafe is an attack behavior inbetween jousting and following
	if (vector_sliding = false){
		_desired_ship_a_direction += _direction_to_ship_target + (90*strafe_direction)
	}
	if (abs(angle_difference(direction, _desired_ship_a_direction) < 10) and speed > max_speed/2)
	{
		vector_sliding = true
	}
	if (vector_sliding = true){
		turn_to_face_direction(_direction_to_lead_target)
		/*if (abs(angle_difference(image_angle, ship_target.image_angle-180)<10)){
			strafe = false
			vector_sliding = false
			evade = true
		}*/
	}
}
	

//put ont he brakes if there are no behaviors assigned
if (seek = false and
	pursue = false and
	flee = false and
	pursue = false and
	evade = false and
	follow = false and
	joust = false and 
	!instance_exists(ship_target)){
		_desired_ship_a_direction = image_angle
		scr_apply_friction(acceleration_rate)
	} 
		

//check for arrival

//needs compelte rework!


if (!vector_sliding){
	turn_to_face_direction(_desired_ship_a_direction)
	direction = image_angle
	motion_add(direction, _motion_to_add)
}
	
//add motion
clamp(_motion_to_add, -acceleration_rate, acceleration_rate)

if (vector_sliding){
	motion_add(direction, _motion_to_add)
}

//limit speed
limit_speed()







