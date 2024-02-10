instance_create_layer(x, y, layer, objBlink);
global.codesCollected++;

if(instance_exists(objPaper)) {
	with(objPaper) {
		state = "reveal";
		alarm[0] = game_get_speed(gamespeed_fps) * 2;
	}
}

instance_destroy();