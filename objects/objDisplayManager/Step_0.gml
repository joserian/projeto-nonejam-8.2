if(keyboard_check_pressed(vk_insert)) {
	resPos++;
	if(resPos >= resLen) {
		resPos = 0;
	}
	
	window_resize(resolutions[resPos, 0], resolutions[resPos, 1]);
}
