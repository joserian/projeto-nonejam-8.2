var _dir = instance_exists(objPlayer) ? point_direction(x, y, objPlayer.x, objPlayer.y) : direction;

if(_dir >= 90 and _dir <= 270) {
	image_xscale = 1;
}else {
	image_xscale = -1;
}

switch(state) {
	case "idle":
	sprite_index = sprEnemy0Idle;
	if(instance_exists(objPlayer) and point_distance(x, y, objPlayer.x, objPlayer.y) <= 150) {
		state = "run";
	}
	
	break;
	
	case "run":
	sprite_index = sprEnemy0Run;
	
	if(instance_exists(objPlayer)) {
		
		
		
		if(point_distance(x, y, objPlayer.x, objPlayer.y) >= 150) {
			state = "idle";
		}
		
		//if(mp_grid_path(objGrid.mpGrid, path, x, y, objPlayer.x, objPlayer.y, true)) {
			//path_start(path, spd, path_action_stop, false);

		//}
		mp_potential_step(objPlayer.x, objPlayer.y, spd, true);
		//mp_potential_path_object(path, objPlayer.x, objPlayer.y,spd, 4, objWall);
		//path_start(path, spd, path_action_stop, false);
		
		if(place_meeting(x+spd*image_xscale*(-1), y, objPlayer)) {
			state = "punch";
			image_index = 0;
			path_speed = 0;
			speed = 0;
		}
	}else {
		state = "idle";
	}
	break;
	
	case "punch":
	if(hitBox == noone and image_index >= 3 and sprite_index == sprEnemy0Punch) {
		
		hitBox = instance_create_layer(x, y-sprite_height/2, layer, objEnemy0HitBox);
		play_snd(sndEnemy3Punch);
	}else {
	
		with(hitBox) {
			x = other.image_xscale == 1 ? other.bbox_left : other.bbox_right;
			y = other.y-other.sprite_height/2;
		}
	}
	
	sprite_index = punchEnd == false ? sprEnemy0Punch : sprEnemy0Idle;
	
	if(image_index >= (image_number) and !punchEnd) {
		if(hitBox != noone) {
			instance_destroy(hitBox);
			hitBox = noone;
		}
		punchEnd = true;
		alarm[0] = 30;
	}
	break;
}


if(life <= 0) {
	instance_destroy();
}