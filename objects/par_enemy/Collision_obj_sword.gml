if (alarm[1] <= 0) {
	//Resetando o Dano
	alarm[1] = 120;
	
	//Tomar Dano
	hp -= damage;
	
	var _dano = instance_create_layer(x, y, "Instances_1", obj_popup);
	obj_popup.damage_draw = other.damage;
	
	//Se Empurrar
	var _push = 10;
	
	if(x < obj_player.x) {
		var _xx = -x;
	} else if(x > obj_player.x) {
		var _xx = x;
	}
	
	if(y < obj_player.y) {
		var _yy = -y;
	} else if(y > obj_player.y) {
		var _yy = y;
	}

	var _dir = point_direction(x, y, _xx, _yy);
	var _hspd = lengthdir_x(_push, _dir);
	var _vspd = lengthdir_y(_push, _dir);

	x += _hspd;
	y += _vspd;
}