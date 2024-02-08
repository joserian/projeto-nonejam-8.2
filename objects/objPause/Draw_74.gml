if(pause) {
	draw_sprite_ext(sprScreen, 0, 0, 0, 1, 1, 0, c_white, 1);
	draw_set_color(c_black);
	draw_set_alpha(.3);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
	draw_set_color(-1);
	
	with(objPlayer) {
	draw_sprite_ext(sprite_index, image_index, x*display_get_gui_width()/256, y*display_get_gui_height()/144, image_xscale*display_get_gui_width()/256, image_yscale*display_get_gui_height()/144, image_angle, image_blend, image_alpha);
	}
	with(objPaper) {
	draw_sprite_ext(sprite_index, image_index, x*display_get_gui_width()/256, y*display_get_gui_height()/144, image_xscale*display_get_gui_width()/256, image_yscale*display_get_gui_height()/144, image_angle, image_blend, image_alpha);
	}
	
	
	
}