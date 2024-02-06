path = path_add();
spd = .5;

enum enemyStates {
	idle,
	run,
	punch
}
state = enemyStates.idle;


punchEnd = false;

life = 100;

hitBox = noone;
