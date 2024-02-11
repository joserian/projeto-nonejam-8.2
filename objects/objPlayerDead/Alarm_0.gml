if(global.playerLifes > 0) {
	instance_create_layer(x, y, layer, objPlayer);
	play_snd(sndPlayerRevive);
	instance_destroy();
}else {
	next_room(rmGameOver);
	if(instance_exists(objCode)) instance_destroy(objCode);
	if(instance_exists(objControl)) instance_destroy(objControl);
	if(instance_exists(objPaper)) instance_destroy(objPaper);
}