if(keyboard_check_released(vk_enter) and global.textMode) {
	switch(textCode) {
		case "restart":
		room_restart();
		global.textMode = false;
		textCode = "";
		break;
		
		/*case "spawn_skeleton0":
		global.spawnEnemy0 = !global.spawnEnemy0;
		break;
		
		case "spawn_skeleton1":
		global.spawnEnemy1 = !global.spawnEnemy1;
		break;*/
		
		case "create_gun":
		if(instance_exists(objPlayer)) objPlayer.gunMode = true;
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

if(((keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_escape)) and global.textMode == false) or (keyboard_check_pressed(vk_escape) and global.textMode)) {
	if(global.textMode) {
		global.textMode = false;
		textSaved = textCode;
		
	}else {
		global.textMode = true;
		keyboard_string = textSaved;
		
		if(!instance_exists(objPause)) instance_create_layer(0, 0, "Effects", objPause);
	}
}

if(global.textMode) {
	textCode = keyboard_string;
	while(string_width(keyboard_string) >= 441*display_get_gui_width()/1024) {
		keyboard_string = string_copy(textCode, 0, string_length(textCode)-1);
		textCode = keyboard_string;
	}
}
