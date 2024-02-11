if(!touched) {
	var i = next_room(rmFinal);
	i.spd_al = .005;
	
	play_snd(sndVictory);
	touched = true;
}

other.velh = 0;
other.velv = 0;
objPlayer.state = statesPlayer.idle;
if(instance_exists(objEnemyEntity)) objEnemyEntity.state = "idle";