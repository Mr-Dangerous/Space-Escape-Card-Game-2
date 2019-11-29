mini_map_sector_locations = [0, 0] //top_left_x
mini_map_sector_locations = [0, 1] //top_left_y
mini_map_sector_locations = [0, 2] //bottom right x
mini_map_sector_locations = [0, 3] //bottom right y

_k = 0
for (i = 0; i < 5; i++){//i = y
	for (j=0; j<5; j++){//j = x
		mini_map_sector_locations[_k, 0] = 45 + (25*j)
		mini_map_sector_locations[_k, 1] = 45 + (25*i) 
		mini_map_sector_locations[_k, 2] = 54 + (25*j)
		mini_map_sector_locations[_k, 3] = 54 + (25*i)
		_k++
	}
}
