
i = 0

repeat (5){
	
	//define the object that goes in the card
	//the source for this instance will be accomplished via a script later\
	var _card = 0
	var _random_seed = irandom(1)
	switch (_random_seed){
		case 0:
			_card = o_iron_interceptor_card
		break;
		
		case 1:
			_card = o_crystal_interceptor_card
		break;
	}
	shop_slots[i, 1] = _card  //card in the slot, or maybe the actual object
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
