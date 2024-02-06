if(global.spawnEnemy0) {
	if(mouse_check_button_pressed(mb_right)) {
		instance_create_layer(mouse_x, mouse_y, "Instances", objEnemy0);
	}
}

if(!instance_exists(objCode) and keyboard_check_pressed(ord("E"))) {
	instance_create_layer(mouse_x, mouse_y, "Instances", objCode);
}