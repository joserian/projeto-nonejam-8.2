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

//var i = instance_create_layer(x, y, layer, objEnemy0Collision);
//i.follow = id;