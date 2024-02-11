if(!instance_exists(objEnemyEntity) and !instance_exists(objCodeItem)) {
	var i = instance_create_layer(x, y, layer, objNext);
	i.image_xscale = image_xscale;
	i.image_yscale = image_yscale;
	
	instance_create_layer(room_width-48, room_height/2, "Effects", objHandIcon);
	instance_destroy();
}