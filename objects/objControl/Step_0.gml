if(global.spawnEnemy0) {
	if(mouse_check_button_pressed(mb_right)) {
		instance_create_layer(mouse_x, mouse_y, "Instances", objEnemy0);
	}
}