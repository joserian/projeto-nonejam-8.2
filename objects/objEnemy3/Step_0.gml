var _dir = instance_exists(objPlayer) ? point_direction(x, y, objPlayer.x, objPlayer.y) : direction;

if(_dir >= 90 and _dir <= 270) {
	image_xscale = 1;
}else {
	image_xscale = -1;
}


switch(state) {
	case "idle":
	sprite_index = sprEnemy3Idle;
	
	if(instance_exists(objPlayer) and point_distance(x, y, objPlayer.x, objPlayer.y) <= 200) {
		state = "run";
	}
	
	break;
	
	case "run":
	sprite_index = sprEnemy3Run;
	if(instance_exists(objPlayer)) {
		if(point_distance(x, y, objPlayer.x, objPlayer.y) >= 200) {
			state = "idle";
		}
		
		//if(mp_grid_path(objGrid.mpGrid, path, x, y, objPlayer.x, objPlayer.y, true)) {
			//path_start(path, spd, path_action_stop, false);
		//}
		mp_potential_step(objPlayer.x, objPlayer.y, spd, true);
		
		if(instance_place(x+lengthdir_x(spd, _dir), y+lengthdir_y(spd, _dir), objPlayer)) {
			state = "attack";
			image_index = 0;
			path_speed = 0;
			speed = 0;
		}
	}
	
	break;
	
	case "attack":
	sprite_index = sprEnemy3Attack;
	
	if(image_index >= (image_number)) {
		if(instance_place(x+lengthdir_x(spd, _dir), y+lengthdir_y(spd, _dir), objPlayer)) {
			state = "attack";
			image_index = 4;
			
		}else {
			state = "idle";
		}
	}
	break;
}