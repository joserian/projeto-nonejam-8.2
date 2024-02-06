if(instance_exists(objPlayer)) {
	with(objPlayer) {
		if(image_index >= (image_number-1)) {
			instance_destroy(other);
		}
	}
	
	if(objPlayer.image_index >= 2) {
		image_alpha = 1;
		
		var _enemy = instance_place(x, y, objEnemy0);

		if(_enemy) {
			_enemy.life -= 20;
			instance_destroy();
		}
	}else {
		image_alpha = .5;
	}
}

