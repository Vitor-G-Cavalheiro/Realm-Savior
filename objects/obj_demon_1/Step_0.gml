event_inherited();

//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	exit;
}

//Andar até o player
dir = point_direction(x, y, obj_player.x, obj_player.y);
hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);

x += hspd;
y += vspd;