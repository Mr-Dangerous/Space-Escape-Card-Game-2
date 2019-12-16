x_offset = (floor(irandom_range(-70, 70)/5))*5
y_offset = (floor(irandom_range(-70, 70)/5))*5
if (instance_exists(resource)){
	target_x = resource.x + x_offset
	target_y = resource.y + y_offset
}

deploy_counter = 120
state = drone.deploy
