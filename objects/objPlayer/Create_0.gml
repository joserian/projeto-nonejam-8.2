velh = 0;
velv = 0;
spd = 1;

enum statesPlayer {
	idle, 
	run,
	punch,
	coded
}

state = statesPlayer.idle;
hitBoxCreated = false;