function next_room(_rm) {
	var f = instance_create_layer(0, 0, "Instances", objFade);
	f.rm = _rm;
	return f;
}

function window_resize(_width, _height) {
	global.windowWidth = _width;
	global.windowHeight = _height;
	
	view_xport[0] = 0;
	view_yport[0] = 0;
	
	camera_set_view_size(view_camera[0], 256, 144);
	
	if(window_get_width() != global.windowWidth or window_get_height() != global.windowHeight) {
		window_set_size(global.windowWidth, global.windowHeight);
		surface_resize(application_surface, global.windowWidth, global.windowHeight);
	}
	
}

global.windowHeight = -1;
global.windowWidth = -1;
window_resize(1024,576);


function screen_shake(_duration, _force) {
	var i = instance_create_layer(0, 0, "Effects", objScreenShake);
	i.time = _duration;
	i.force = _force;
}

function play_snd(_audio, _priority = 1) {
	if(!audio_is_playing(_audio)) audio_play_sound(_audio, _priority, 0);
}