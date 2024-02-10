if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
	if(room == rmTitle) next_room(rmTutorial);
	if(room == rmTutorial) next_room(rm0);
	instance_destroy();
}