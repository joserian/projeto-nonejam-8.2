if(instance_exists(objPlayer)) {
	var _myWidth = sprite_width/2;
	x = objPlayer.image_xscale == 1 ? objPlayer.bbox_right + _myWidth : objPlayer.bbox_left - _myWidth;
	y = objPlayer.y - objPlayer.sprite_height/2;
}else {
	instance_destroy();
}
