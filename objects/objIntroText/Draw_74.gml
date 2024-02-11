draw_set_font(fnt0);

if(textCount < string_length(text[textIndex])) {
	textCount = !keyboard_check_pressed(vk_enter) and !keyboard_check_pressed(vk_space) and !mouse_check_button_pressed(mb_left) ? textCount+.7 : string_length(text[textIndex]);
	textCopy = string_copy(text[textIndex], 0, textCount);
}else {
	if(keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)) {
		if(textIndex < array_length(text)-1) {
			textIndex++;
			textCount = 0;
		}else {
			next_room(rmTitle);
		}
	}
}

var h = ceil(get_timer()/1000000) % 2 == 0 and textCount >= string_length(text[textIndex]) ? "_" : " ";
var _x1, _y1;
_x1 = display_get_gui_width()/4;
_y1 = display_get_gui_height()/2-32;

draw_text_ext(_x1, _y1, textCopy + h , -1, string_width_ext(textCopy + h, -1, display_get_gui_width()/2));


draw_set_font(-1);