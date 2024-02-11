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
	if(instance_exists(objPlayer) and point_distance(x, y, objPlayer.x, objPlayer.y) <= 200) {
		
		//if(mp_grid_path(objGrid.mpGrid, path, x, y, objPlayer.x, objPlayer.y, true)) {
			//path_start(path, spd, path_action_stop, false);
		//}
		mp_potential_step(objPlayer.x, objPlayer.y, spd, true);
		
		if(place_meeting(x+spd*image_xscale*(-1), y, objPlayer)) {
			state = "attack";
			image_index = 0;
			path_speed = 0;
			speed = 0;
		}
	}else {
		state = "idle";
	}
	
	break;
	
	case "attack":
	sprite_index = sprEnemy3Attack;
	
	if(hitBox == noone and image_index >= 6) {
		hitBox = instance_create_layer(x, y, layer, objEnemy3HitBox);
		hitBox.image_xscale = image_xscale;
	}
	
	if(image_index == 6) {
		screen_shake(10, 1);
		play_snd(sndEnemy3Punch);
	}
	
	if(image_index >= (image_number)) {
		if(instance_exists(hitBox)) {
			instance_destroy(hitBox);
		}
		hitBox = noone;
		
		attackCount--;
		
		if(attackCount <= 0) {
			state = "sleep";
			
			alarm[0] = game_get_speed(gamespeed_fps)*3;
			break;
		}
		
		if(place_meeting(x+spd*image_xscale*(-1), y, objPlayer)) {
			image_index = 4;
			
		}else {
			state = "idle";
			
		}
	}
	break;
	
	case "sleep":
	sprite_index = sprEnemy3Idle;
	
	
	break;
	
	/*case "move_away":
	sprite_index = sprEnemy3Run;
	if(instance_exists(objPlayer)) {
		var _x = x + lengthdir_x(20, point_direction(x, y, objPlayer.x, objPlayer.y)-180);
		var _y = y + lengthdir_y(20, point_direction(x, y, objPlayer.x, objPlayer.y)-180);
		mp_potential_step(_x, _y, spd, false);
	}
	
	alarm[1] = 1;
	break;*/
}

if(life <= 0) {
	instance_destroy();
}