if(keyboard_check_released(vk_enter)) {
	switch(textCode) {
		case "restart":
		room_restart();
		break;
		
		case "spawnenemy0":
		global.spawnEnemy0 = !global.spawnEnemy0;
		break;
	}
	
	keyboard_string = "";
	
	if(instance_exists(objPlayer)) {
		with(objPlayer) {
			state = statesPlayer.coded;
			image_index = 0;
		}
	}
	
	instance_destroy();
}

textCode = keyboard_string;
