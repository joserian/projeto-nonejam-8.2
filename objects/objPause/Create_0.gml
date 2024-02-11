
pause = true;

surf_screen = noone;
sprScreen = 0;

if(!surface_exists(surf_screen)) {
	var view_w = display_get_gui_width();
	var view_h = display_get_gui_height();
	surf_screen = surface_create(view_w, view_h);
		
	surface_set_target(surf_screen);
	draw_clear_alpha(c_black, 0);
	surface_copy(surf_screen, 0, 0, application_surface);
	sprScreen = sprite_create_from_surface(surf_screen, 0, 0, view_w, view_h, 0, 0, 0, 0);
		
	surface_reset_target();
		
	surface_free(surf_screen);
}


instance_deactivate_all(true);
instance_activate_object(objCode);
instance_activate_object(objPlayer);
instance_activate_object(objPaper);
instance_activate_object(objControl);

play_snd(sndMenu);