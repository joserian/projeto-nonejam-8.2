var _dir = instance_exists(objPlayer) ? point_direction(x, y, objPlayer.x, objPlayer.y) : direction;

if(_dir >= 90 and _dir <= 270) {
	image_xscale = 1;
}else {
	image_xscale = -1;
}

attackCount = 3;

if(instance_place(x+lengthdir_x(spd, _dir), y+lengthdir_y(spd, _dir), objPlayer)) {
	state = "attack";
	image_index = 0;
	path_speed = 0;
	speed = 0;
			
}else {
	state = "idle";
}
