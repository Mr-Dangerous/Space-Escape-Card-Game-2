///@param player_level

var level = argument0

var level_array = array_create(6, 0)

//returns the breakpoint numbers
//level 0 is the basic ship array

switch(level){
	case 1:
		level_array[0] = 0 //40%
		level_array[1] = 40 //40%
		level_array[2] = 99 //19%
		level_array[3] = 100 //1%
		level_array[4] = -1 //functinoally impossible
		level_array[5] = -1 //functionally impossible
	break;
	case 2:
		level_array[0] = 0 //35%
		level_array[1] = 35 // 37%
		level_array[2] = 72 //18%
		level_array[3] =  90//10%
		level_array[4] = -1 //functinoally impossible
		level_array[5] = -1 //functionally impossible
	break;
	case 3:
		level_array[0] = 0 //30%
		level_array[1] = 30 // 35%
		level_array[2] = 65 //25%
		level_array[3] =  90//9%
		level_array[4] = 99 //1%
		level_array[5] = -1 //functionally impossible
	break;
	case 4:
		level_array[0] = 0 //20%
		level_array[1] = 20 // 32%
		level_array[2] = 52 //30%
		level_array[3] =  82//15%
		level_array[4] = 97 //3%
		level_array[5] = -1 //functionally impossible
	break;
	
	case 5:
		level_array[0] = 0 //13%
		level_array[1] = 13 // 27%
		level_array[2] = 40 //30%
		level_array[3] =  70//20%
		level_array[4] = 90 //9%
		level_array[5] = 99 //1%
	break;
	
	case 6:
		level_array[0] = 0 //5%
		level_array[1] = 5 // 20%
		level_array[2] = 25 //28%
		level_array[3] = 53//27%%
		level_array[4] = 80 //15%
		level_array[5] = 95 //5%
	break;
	
	case 7:
		level_array[0] = 0 //1%
		level_array[1] = 1 // 18%
		level_array[2] = 19 //24%
		level_array[3] = 43//30%%
		level_array[4] = 73 //20%
		level_array[5] = 93 //7%
	break;
	
	case 7:
		level_array[0] = -1 //functionally impossible
		level_array[1] = 0 // 16%
		level_array[2] = 16 //23%
		level_array[3] = 37//28%%
		level_array[4] = 67 //23%
		level_array[5] = 90 //10%
	break;
		
}
return level_array