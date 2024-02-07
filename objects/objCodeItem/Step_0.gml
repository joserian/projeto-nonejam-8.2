timeSwitch --;

if(timeSwitch <= 0) {
	state = !state;
	timeSwitch = game_get_speed(gamespeed_fps)/1.5;
}

if(state) {
	y = lerp(y, ystart-ySizeTraj, spd);
}else {
	y = lerp(y, ystart+ySizeTraj, spd);
}
/*if(state == "up" and y >= yStart - ySizeTraj) {
	y = lerp(y, yStart - ySizeTraj, spd);
}else {
	state = "down";
}

if(state == "down" and y <= yStart + ySizeTraj) {
	y = lerp(y, yStart + ySizeTraj, spd);
}else {
	state = "up";
}