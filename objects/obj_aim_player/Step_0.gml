if (global.pause_game == true) {
	exit;
}

//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	exit;
}

//Acompanhar Mouse
x = mouse_x;
y = mouse_y;

depth = -y - 100;

//Toda a mecânica de tiro
var _shoot = mouse_check_button(mb_left);

spell_1_cd--;
if(_shoot and spell_1_cd <= 0 ) {
	var _inst = instance_create_layer(obj_player.x, obj_player.y, "Glow", obj_spell_1);
	_inst.speed = 2.5;
	_inst.direction = point_direction(obj_player.x, obj_player.y, x, y);
	_inst.image_angle = point_direction(obj_player.x, obj_player.y, x, y);
	
	spell_1_cd = spell_1_timer;
}