for(var i = 0; i < array_length(enemies); i++) {
	var _e = instance_place(x, y, enemies[i])
	if(_e) {
		_e.life -= 30;
		instance_destroy();
		
	}
}