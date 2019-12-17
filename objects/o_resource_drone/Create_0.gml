x_offset = (floor(irandom_range(-70, 70)/5))*5
y_offset = (floor(irandom_range(-70, 70)/5))*5
if (instance_exists(resource)){
	target_x = resource.x + x_offset
	target_y = resource.y + y_offset
}
gathering_movement_speed = random_range(.5, 2)
resource_gather_spin = choose (-1, 1)

deploy_counter = 120
state = drone.deploy
