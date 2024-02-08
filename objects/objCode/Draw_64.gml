var _x1, _y1, _x2, _y2, _sep;
_sep = 4;
_x1 = 0;
_y1 = display_get_gui_height()-24;
_x2 = _x1 + display_get_gui_width()/2;
_y2 = _y1 + 24;

draw_rectangle(_x1, _y1, _x2, _y2, false);

draw_set_color(c_black);
draw_set_font(fnt0);

var _sepText = 8;
var h = string(ceil(get_timer()/1000000) % 2 == 0 ? "_" : "");

draw_text(_x1 + _sepText, _y1, "/" + textCode + h);

draw_set_font(-1);
draw_set_color(-1);