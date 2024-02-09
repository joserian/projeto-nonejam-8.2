velh = 0;
velv = 0;
spd = 1;
life = 100;

hitBoxCreated = false;

enum statesPlayer {
	idle, 
	run,
	punch,
	coded,
	shot,
	eletric
}

state = statesPlayer.idle;

sprite = {
	idle : sprPlayerIdle,
	run : sprPlayerRun,
	punch : sprPlayerPunch,
	shot : sprPlayerGunShot,
	buff: sprPlayerGetBuff
}

gunMode = false;
cooldownGunMode = game_get_speed(gamespeed_fps) * 15;
cooldownShot = 0;

invincibleMode = false;
lifeBeforeInvicible = 100;
cooldownInvMode = game_get_speed(gamespeed_fps) * 10;

eletricMode = false;

spawnPac = false;

#macro attack0 (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(ord("K")))
#macro attack0_hold (mouse_check_button(mb_left) xor keyboard_check(ord("K")))
#macro attack1 (mouse_check_button_pressed(mb_right) or keyboard_check_pressed(ord("L")))
#macro attack1_hold (mouse_check_button(mb_right) xor keyboard_check(ord("L")))
attack0Handle = statesPlayer.punch;
attack1Handle = statesPlayer.punch;

timeHitFlash = 0;