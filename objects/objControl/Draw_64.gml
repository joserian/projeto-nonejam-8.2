draw_sprite_ext(sprPlayerIcon, 0, 16, 16, 3, 3, 0, c_white, 1);
var _x1, _y1, _x2, _y2;
_x1 = 16 + sprite_get_width(sprPlayerIcon)*3 + 8;
_y1 = 24;

_y2 = _y1 + 16;

if(instance_exists(objPlayer)) {
	
	_x2 = _x1 + 3*objPlayer.life;
	draw_set_color(#9B1A0A);
	draw_rectangle(_x1, _y1, _x2, _y2, false);
	draw_set_color(c_black)
	draw_rectangle(_x1, _y1, _x2, _y2, true);
	draw_set_color(-1);
	
}

//draw_set_font(fnt0);
//draw_text(_x1, _y2+32, global.playerLifes);
for(var i = 0; i < global.playerLifes; i++) {
	draw_sprite_ext(sprLifeItem, 0, _x1+16 + i*sprite_get_width(sprLifeItem)*2, _y2+32, 2,2, 0, c_white, 1)
}

	
//draw_set_font(-1);