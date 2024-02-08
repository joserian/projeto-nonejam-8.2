if(instance_exists(objPlayer)) {
	with(objPlayer) {
		if(image_index >= (image_number-1)) {
			instance_destroy(other);
		}
	}
	
	if(objPlayer.image_index >= 2) {
		//image_alpha = 1;
		
		var _list = ds_list_create();
		var _enemy = instance_place_list(x, y, objEnemyEntity, _list, false);
		
		if(_enemy > 0) {
			for(var i = 0; i <= ds_list_size(_list); i++) {
				with(_list[|i]) {
					life -= 10;
					timeHitFlash = 3;
					
				}
			}
		}
		ds_list_destroy(_list);
		
		instance_destroy();
		
	}//else {
		//image_alpha = .5;
	//}
}

