if (global.pause_game == true) {
	alarm[0]++;
	lenght = 0;
	exit;
} else {
	lenght = 35;
}

//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	instance_destroy();
	exit;
}

if alarm[0] <= 0 {
	instance_create_layer(x, y, "Instances_1", obj_sword_1_vfx);
	obj_sword_1_vfx.image_angle = image_angle;
	alarm[0] = 3;
}

dir += 5;
image_angle += 5;

x = obj_player.x + lengthdir_x(lenght, dir);
y = obj_player.y + lengthdir_y(lenght, dir);