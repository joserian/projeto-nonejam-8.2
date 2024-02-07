life = 100;
path = path_add();
spd = .4;

enum enemyStates1 {
	idle,
	move_away,
	shot
}

state = enemyStates.idle;
cooldownShot = 0;