if((keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)) and next_room(rm)) {
	instance_destroy();
}