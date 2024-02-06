if(place_meeting(x + velh, y, objWall)) {
	while(!place_meeting(x + sign(velh), y, objWall)) {
		x += sign(velh);
	}
	
	velh = 0;
}

x += velh;

if(place_meeting(x, y + velv, objWall)) {
	while(!place_meeting(x, y + sign(velv), objWall)) {
		y += sign(velv);
	}
	
	velv = 0;
}

y += velv;