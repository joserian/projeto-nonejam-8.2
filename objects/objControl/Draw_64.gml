if(instance_exists(objPlayer)) draw_text(16, 16, objPlayer.life);

draw_sprite_ext(sprPlayerIcon, 0, 16, 16, 3, 3, 0, c_white, 1);

var _x1, _y1, _x2, _y2;
_x1 = 16 + sprite_get_width(sprPlayerIcon)*3 + 8;
_y1 = 24;
_x2 = _x1 + 3*objPlayer.life;
_y2 = _y1 + 16;

draw_set_color(#9B1A0A);
draw_rectangle(_x1, _y1, _x2, _y2, false);
draw_set_color(c_black)
draw_rectangle(_x1, _y1, _x2, _y2, true);
draw_set_color(-1);
