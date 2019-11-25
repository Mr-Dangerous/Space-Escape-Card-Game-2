
i = 0

repeat (5){
	
	//define the object that goes in the card
	//the source for this instance will be accomplished via a script later\
	shop_slots[i, 1] = o_iron_interceptor_card  //card in the slot, or maybe the actual object
	i++
}
//create the instances that will go into the shop slots
i = 0
repeat (5){
	var _ship = instance_create_layer(0, 0, "Ships", shop_slots[i, 1])
	
	shop_slots[i, 2] = _ship
	
	with (_ship){
		visible = false
	}
	i++
}
