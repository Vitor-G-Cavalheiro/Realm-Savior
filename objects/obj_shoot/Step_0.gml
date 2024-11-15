if (global.pause_game == true) {
	speed = 0;
	exit;
} else {
	speed = 2;
};

if alarm[0] <= 0 {
	instance_create_layer(x, y, "Glow", obj_gun_vfx);
	alarm[0] = 3;
}