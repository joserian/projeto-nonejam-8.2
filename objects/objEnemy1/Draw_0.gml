draw_self();

if(timeHitFlash > 0) {
	
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	gpu_set_fog(false, c_white, 0, 0);
	timeHitFlash --;
}
