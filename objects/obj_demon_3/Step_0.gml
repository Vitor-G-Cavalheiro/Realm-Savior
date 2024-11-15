event_inherited();

//Pausa mundo
if(global.pause_game == true) {
	spd = 0;
} else {
	spd = 1.5;
}

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

//Não spwanar pegadas
alarm[0]+= 2;