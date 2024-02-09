if(!place_meeting(x+spd*image_xscale*(-1), y, objPlayer)) {
	state = "run";
}else {
	image_index = 0;
}

punchEnd = false;