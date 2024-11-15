if (global.pause_game == true) {
	alarm[0]++;
	speed = 0;
	exit;
} else {
	speed = 2.5;
}

if alarm[0] <= 0 {
	instance_create_layer(x, y, "Glow", obj_spell_1_vfx);
	alarm[0] = 3;
}