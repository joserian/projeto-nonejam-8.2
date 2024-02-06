var _right, _left, _up, _down;

_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));

var _velh, _velv;
var _spdLerp = .6;

if(_right xor _left or _up xor _down) {
	var keyDir = point_direction(0, 0, (_right - _left), (_down - _up));
	_velh = lengthdir_x(spd, keyDir);
	_velv = lengthdir_y(spd, keyDir);
	
	velh = lerp(velh, _velh, _spdLerp);
	velv = lerp(velv, _velv, _spdLerp);
}else {
	velh = lerp(velh, 0, _spdLerp);
	velv = lerp(velv, 0, _spdLerp);
}

if((keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)) and state != statesPlayer.punch) {
	state = statesPlayer.punch;

	image_index = 0;
}

if(velh != 0) image_xscale = sign(velh);

switch(state) {
	case statesPlayer.idle:
	sprite_index = sprPlayerIdle;
	
	if(velh != 0 or velv != 0) {
		state = statesPlayer.run;
	}
	break;
	
	case statesPlayer.run:
	sprite_index = sprPlayerRun;
	
	if(abs(velh) <= .2 and abs(velv) <= .2) {
		state = statesPlayer.idle;
		velh = 0;
		velv = 0;
	}
	
	break;
	
	case statesPlayer.punch:
	if(!hitBoxCreated) {
		instance_create_layer(x, y-sprite_height/2, layer, objPlayerHitBox);
		hitBoxCreated = true;
	}
	
	velh = 0;
	velv = 0;
	sprite_index = sprPlayerPunch;
	
	
	if(image_index >= image_number-1) {
		state = statesPlayer.idle;
		hitBoxCreated = false;
	}
	break;
	
	case statesPlayer.coded:
	sprite_index = sprPlayerGetBuff;
	
	if(image_index >= image_number-1) {
		state = statesPlayer.idle;
	}
	break;
	
}


if(!instance_exists(objCode) and keyboard_check_pressed(ord("E"))) {
	instance_create_layer(mouse_x, mouse_y, "Instances", objCode);
}