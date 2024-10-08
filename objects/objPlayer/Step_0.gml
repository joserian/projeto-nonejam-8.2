var _right, _left, _up, _down;

_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));

var _velh, _velv;
var _spdLerp = .6;

if(!global.textMode) {
	if((_right xor _left or _up xor _down)) {
		var keyDir = point_direction(0, 0, (_right - _left), (_down - _up));
		_velh = lengthdir_x(spd, keyDir);
		_velv = lengthdir_y(spd, keyDir);
	
		velh = lerp(velh, _velh, _spdLerp);
		velv = lerp(velv, _velv, _spdLerp);
	}else {
		velh = lerp(velh, 0, _spdLerp);
		velv = lerp(velv, 0, _spdLerp);
	}

	if(gunMode) {
		attack0Handle = statesPlayer.shot;
	
		sprite.idle = sprPlayerGunIdle;
		sprite.run = sprPlayerGunRun;
	
		cooldownGunMode--;
		if(cooldownGunMode <= 0) {
			gunMode = false;
			cooldownGunMode = game_get_speed(gamespeed_fps) * 15;
			sprite.idle = sprPlayerIdle;
			sprite.run = sprPlayerRun;
			attack0Handle = statesPlayer.punch;
			instance_create_layer(x, y-sprite_height/2, "Effects", objBlink);
			play_snd(sndLostPowerUp);
		}
	}
	
	if(invincibleMode) {
		image_blend = c_yellow;
		life = lifeBeforeInvicible;
		
		cooldownInvMode--;
		
		if(cooldownInvMode <= 0) {
			cooldownInvMode = game_get_speed(gamespeed_fps) * 10;
			invincibleMode = false;
			image_blend = c_white;
			life = lifeBeforeInvicible;
			
			instance_create_layer(x, y-sprite_height/2, "Effects", objBlink);
			play_snd(sndLostPowerUp);
		}
	}
	
	if(eletricMode) {
		velh = 0;
		velv = 0;
		
		instance_create_layer(x, y-sprite_height/2, "Instances", objEletricExplosion);
		image_index = 0;
		state = statesPlayer.eletric;
		eletricMode = false;
	}
	
	if(spawnPac) {
		instance_create_layer(-32, y-sprite_height/2, layer, objPac);
		spawnPac = false;
	}
	
	if(attack0 and state != attack0Handle) {
		state = attack0Handle;
	
		image_index = 0;
	}else if(attack1 and state != attack1Handle) {
		state = attack1Handle;
	
		image_index = 0;
	}
}else {
	velh = lerp(velh, 0, _spdLerp);
	velv = lerp(velv, 0, _spdLerp);
}

if(velh != 0) image_xscale = sign(velh);

if(cooldownShot >= 0) cooldownShot --;

switch(state) {
	case statesPlayer.idle:
	sprite_index = sprite.idle;
	
	if(velh != 0 or velv != 0) {
		state = statesPlayer.run;
	}
	break;
	
	case statesPlayer.run:
	sprite_index = sprite.run;
	
	if(abs(velh) <= .2 and abs(velv) <= .2) {
		state = statesPlayer.idle;
		velh = 0;
		velv = 0;
		
	}
	if(!audio_is_playing(sndPlayerFootStep)) audio_play_sound(sndPlayerFootStep, .6, 0, .5)
	
	break;
	
	case statesPlayer.punch:
	if(!hitBoxCreated) {
		instance_create_layer(x, y-sprite_height/2, layer, objPlayerHitBox);
		hitBoxCreated = true;
		play_snd(sndPlayerPunch);
	}
	
	velh = 0;
	velv = 0;
	sprite_index = sprite.punch;
	
	
	if(image_index >= image_number-1) {
		state = statesPlayer.idle;
		hitBoxCreated = false;
	}
	break;
	
	case statesPlayer.shot:
	velh = 0;
	velv = 0;
	sprite_index = sprite.shot;
	
	if(cooldownShot <= 0) {
		var _x = image_xscale == 1 ? bbox_right+sprite_get_width(sprPlayerGunBullet)/2 : bbox_left-sprite_get_width(sprPlayerGunBullet)/2;
		var _y = y-sprite_height/2
		var i = instance_create_layer(_x, _y, layer, objPlayerGunShot);
		i.direction = image_xscale == 1 ? 0 : 180;
		var s = instance_create_layer(_x, _y, "Effects", objEnemy1Smoke);
		s.image_xscale = -image_xscale;
		
		screen_shake(10, .2);
		
		cooldownShot = 10;
	}
	
	if(!attack0_hold or !gunMode) {
		state = statesPlayer.idle;
	}
	
	break;
	
	case statesPlayer.eletric:
	velh = 0;
	velv = 0;
	sprite_index = sprite.eletric;
	
	if(image_index >= image_number-1) {
		state = statesPlayer.idle;
	}
	
	break;
	
}

if(life <= 0) {
	instance_destroy();
	instance_create_layer(x, y, layer, objPlayerDead);
}