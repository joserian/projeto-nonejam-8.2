if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
	next_room(rm);
	instance_destroy();
}