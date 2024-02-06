if(state == "fade in") {
	if(alpha < 1) {
		alpha += spd_al;
	}else {
		state = "fade out";
		room = rm
	}
}else {
	if(alpha > 0) {
		alpha -= spd_al;
	}else {
		instance_destroy();
	}
}