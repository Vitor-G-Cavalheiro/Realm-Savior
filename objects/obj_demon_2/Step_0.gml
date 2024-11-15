event_inherited();

//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	exit;
}

//Andar até o player e fugir do mesmo
var _xx = obj_player.x;
var _yy = obj_player.y;
if(place_meeting(x, y, obj_aim_control)){
	if(x < obj_player.x){
		_xx = obj_player.x - range;
	} else if(x > obj_player.x) {
		_xx = obj_player.x + range;
	}
	if(y < obj_player.y) {
		_yy = obj_player.y - range;
	} else if(y > obj_player.y) {
		_yy = obj_player.y + range;
	}
}

var _dir = point_direction(x, y, _xx, _yy);

hspd = lengthdir_x(spd, _dir);
vspd = lengthdir_y(spd, _dir);

x += hspd;
y += vspd;

//Destroi a arma junto
if(hp < 0) {
	_gun = instance_nearest(x, y, par_guns);
	instance_destroy(_gun);
}