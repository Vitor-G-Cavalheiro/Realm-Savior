if(global.pause_game == true) {
	spell_1_cd++;
} else {

}

//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	instance_destroy();
	exit;
}

//Andar até o player
depth = -y;

spd = obj_player.spd - .5;

if(!(x > obj_player.x + 8 and x < obj_player.x + 12 and y > obj_player.y - 12 and y < obj_player.y - 8)) {
	dir = point_direction(x, y, obj_player.x + 10, obj_player.y - 10);

	hspd = lengthdir_x(spd, dir);
	vspd = lengthdir_y(spd, dir);

	x += hspd;
	y += vspd;
}

//Tiro
spell_1_cd--;

if spell_1_cd <= 0 {
	var _enemy = instance_nearest(x, y, par_enemy);
	if distance_to_object(_enemy) <= range_spell_1{
		var _inst = instance_create_layer(x, y, "Glow", obj_spell_pet_1);
		_inst.speed = 2.5;
		_inst.direction = point_direction(x, y, _enemy.x, _enemy.y);
		_inst.image_angle = point_direction(x, y, _enemy.x, _enemy.y);
	
		spell_1_cd = spell_1_timer;
	}
}