var _dir = instance_exists(objPlayer) ? point_direction(x, y, objPlayer.x, objPlayer.y) : direction;

if(_dir >= 90 and _dir <= 270) {
	image_xscale = 1;
}else {
	image_xscale = -1;
}


var _x, _y;
_x = lengthdir_x(6, _dir-180);
_y = lengthdir_y(6, _dir-180);

cooldownShot--;

switch(state) {
	case enemyStates1.idle:
	sprite_index = sprEnemy1Idle;
	
	if(instance_exists(objPlayer) and point_distance(x, y, objPlayer.x, objPlayer.y) <= 50 and !place_meeting(x+_x, y+_y, objWall)) {
		state = enemyStates1.move_away;
	}
	
	if(instance_exists(objPlayer) and point_distance(x, y, objPlayer.x, objPlayer.y) <= 200 and cooldownShot <= 0) {
		state = enemyStates1.shot;
		image_index = 0;
	}
	
	break;
	
	case enemyStates1.move_away:
	if(cooldownShot <= 0) {
		state = enemyStates1.shot;
		image_index = 0;
	}
	sprite_index = sprEnemy1Run;
	
	if(!place_meeting(x+_x, y+_y, objWall)) {
		if(mp_grid_path(objGrid.mpGrid, path, x, y, x + _x, y + _y, true)) {
			path_start(path, spd, path_action_stop, false);
		}
	}else {
		state = enemyStates1.idle;
	}
	
	break;
	
	case enemyStates1.shot:
	sprite_index = sprEnemy1Shot;
	
	if(image_index >= image_number-1) {
		var _x = image_xscale == 1 ? bbox_left : bbox_right;
		var _y = y-5;
		var i = instance_create_layer(_x, _y, layer, objEnemy1Bullet);
		i.direction = _dir;
		i.image_angle = _dir;
		var s = instance_create_layer(_x, _y, layer, objEnemy1Smoke);
		s.image_xscale = image_xscale;
		state = enemyStates1.idle;
		cooldownShot = game_get_speed(gamespeed_fps) * 3;
	}
	
	break;
}

if(life <= 0) {
	instance_destroy();
}