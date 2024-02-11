var pausing_keys = keyboard_check_pressed(vk_escape)

if(pausing_keys or !global.textMode) {
	pause = false;
	
	if(sprite_exists(sprScreen)) {
		sprite_delete(sprScreen);
	}
	instance_activate_all();
	
	instance_destroy();
}
