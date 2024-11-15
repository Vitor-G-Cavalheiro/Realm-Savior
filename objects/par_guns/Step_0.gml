if (global.pause_game == true) {
	lenght = 0;
	exit;
} else {
	lenght = 35;
}

depth = -enemy.y;

//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	exit;
}

//Mira no Player
dir = point_direction(enemy.x, enemy.y, obj_player.x, obj_player.y);

image_xscale = -1;
image_angle = dir;

if(x > obj_player.x)  {
	image_yscale = -1;
} else {
	image_yscale = 1;
}

x = enemy.x + lengthdir_x(lenght, dir);
y = enemy.y + lengthdir_y(lenght, dir);