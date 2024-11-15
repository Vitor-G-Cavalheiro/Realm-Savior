//Invunerabilidade
if alarm[0] <= 0 {
	global.hp -= other.damage;
	alpha = 1;
	alarm[0] = 10;
	instance_create_depth(0, 0, 0, obj_hitstop);
	screen_shacke(10, 5);
}