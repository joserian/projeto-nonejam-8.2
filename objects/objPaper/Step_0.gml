

if(state == "in") {
	if(y != posInY) {
		y = lerp(y, posInY, .2);
		
	}
	if(y >= posInY-8) {
		image_index = 0;
	}
	
	if(keyboard_check_pressed(vk_space) or (position_meeting(mouse_x, mouse_y, id) and mouse_check_button_pressed(mb_left))) {
		state = "out";
		playerCall = true;
	}
	
	if(global.textMode) state = "out";
	
}else if(state = "out"){
	if(y != posOutY) {
		y = lerp(y, posOutY, .2);
		image_index = global.codesCollected;
	}
	
	if(!global.textMode and (keyboard_check_pressed(vk_space) or (position_meeting(mouse_x, mouse_y, id) and mouse_check_button_pressed(mb_left)))) {
		state = "in";
		playerCall = false;
	}
	
	if(global.textMode) playerCall = false;
	
	if(!global.textMode and !playerCall) state = "in";
}else {
	if(y != posOutY) {
		y = lerp(y, posOutY, .2);
		image_index = global.codesCollected;
	}
	
	if(global.textMode) {
		state = "out";
		alarm[0] = -1;
	}
}
