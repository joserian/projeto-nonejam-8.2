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
	
}

if((keyboard_check_pressed(ord("E")) and global.textMode == false) or (keyboard_check_pressed(vk_escape) and global.textMode)) {
	if(global.textMode) {
		global.textMode = false;
		textSaved = textCode;
	}else {
		global.textMode = true;
		keyboard_string = textSaved;
	}
}

if(global.textMode) textCode = keyboard_string;
