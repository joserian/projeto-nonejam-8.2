camX = random_range(-force, force);
camY = random_range(-force, force);

camera_set_view_pos(view_camera[0], camX, camY);


if(time <= 0)  {
	instance_destroy();
}else {
	time --;
}