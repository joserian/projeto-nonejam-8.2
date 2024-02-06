


switch(state) {
	case enemyStates.idle:
	sprite_index = sprEnemy0Idle;
	if(instance_exists(objPlayer) and point_distance(x, y, objPlayer.x, objPlayer.y) <= 150) {
		state = enemyStates.run;
	}
	
	break;
	
	case enemyStates.run:
	if(instance_exists(objPlayer) and point_distance(x, y, objPlayer.x, objPlayer.y) >= 150) {
		state = enemyStates.idle;
	}
	
	sprite_index = sprEnemy0Run;
	if(mp_grid_path(objGrid.mpGrid, path, x, y, objPlayer.x, objPlayer.y, true)) {
		path_start(path, spd, path_action_stop, false);
	}
	
	if(instance_exists(objPlayer) and instance_place(x, y, objPlayer)) {
		state = enemyStates.punch;
		image_index = 0;
		path_speed = 0;
	}
	
	break;
	
	case enemyStates.punch:
	sprite_index = punchEnd == false ? sprEnemy0Punch : sprEnemy0Idle;
	
	if(image_index >= (image_number) and !punchEnd) {
		punchEnd = true;
		alarm[0] = 30;
	}
	break;
}


var _dir = point_direction(x, y, objPlayer.x, objPlayer.y);
if(_dir >= 90 and _dir <= 270) {
	image_xscale = 1;
}else {
	image_xscale = -1;
}

if(life <= 0) {
	instance_destroy();
}