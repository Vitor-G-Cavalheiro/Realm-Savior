event_inherited();

//Pausa mundo
if(global.pause_game == true) {
	spd = 0;
} else {
	spd = 0.3;
}

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

//Tiro
shoot_cd--;

if (shoot_cd <= 0) {
	var _player = instance_nearest(x, y, obj_player);
	if distance_to_object(_player) <= range_shoot {
		var _inst = instance_create_layer(x, y, "Glow", obj_shoot);
		_inst.speed = 2;
		_inst.direction = point_direction(x, y, _player.x, _player.y);
		_inst.image_angle = point_direction(x, y, _player.x, _player.y);
		if(shoots < 2) {
			shoot_cd = 10;
			shoots++;
		} else {
			shoot_cd = shoot_timer;
			shoots = 0;
		}
		
	}
}