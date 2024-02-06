if(state == "in") {
	if(y != posInY) {
		y = lerp(y, posInY, .2);
	}
	
	if(position_meeting(mouse_x, mouse_y, id) and mouse_check_button_pressed(mb_left)) {
		state = "out";
	}
	
}else {
	if(y != posOutY) {
		y = lerp(y, posOutY, .2);
	}
	
	if(position_meeting(mouse_x, mouse_y, id) and mouse_check_button_pressed(mb_left)) {
		state = "in";
	}
}