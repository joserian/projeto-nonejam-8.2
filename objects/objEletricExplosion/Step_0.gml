var enemies = instance_place_list(x, y, objEnemyEntity, listEnemies, false);

if(enemies > 0) {
	for(var i = 0; i <= ds_list_size(listEnemies); i++) {	
		if(instance_exists(listEnemies[|i])) {
			with(listEnemies[|i]) {
				state = "idle";
				life -= 0.5;
			}
		}
	}
}