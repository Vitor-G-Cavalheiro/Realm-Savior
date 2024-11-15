//Pausa o player
if (global.pause_game == true) {
	alarm[0]++;
	exit;
};

//Movimentação
right = keyboard_check(ord("D")) or keyboard_check(vk_right);
up = keyboard_check(ord("W")) or keyboard_check(vk_up);
left = keyboard_check(ord("A")) or keyboard_check(vk_left);
down = keyboard_check(ord("S"))  or keyboard_check(vk_down);

var _xx = right - left;
var _yy = down - up;

if(_xx != 0 or _yy != 0){
	dir = point_direction(x, y, x + _xx, y + _yy);
	hspd = lengthdir_x(spd, dir);
	vspd = lengthdir_y(spd, dir);
	
	x += hspd;
	y += vspd;
	
	
	//Animação virando para o lado
	if(_xx == 1 or _xx == -1) {
		image_xscale = _xx;
	}
}

//Modo Mira Automática
if(keyboard_check_pressed(ord("X"))) {
	automatic_enable = true;
	aim_enable = false;
	instance_destroy(obj_aim_player);
}

//Modo Mira Manual
if(keyboard_check_pressed(ord("Z"))) {
	automatic_enable = false;
	aim_enable = true;
	instance_create_layer(x, y, "Instances_1", obj_aim_player);
}

//Tiro Automático
if(automatic_enable) {
	//Tiro
	spell_1_cd--;

	if spell_1_cd <= 0 {
		var _enemy = instance_nearest(x, y, par_enemy);
		if distance_to_object(_enemy) <= range_spell_1{
			var _inst = instance_create_layer(x, y, "Glow", obj_spell_1);
			_inst.speed = 2.5;
			_inst.direction = point_direction(x, y, _enemy.x, _enemy.y);
			_inst.image_angle = point_direction(x, y, _enemy.x, _enemy.y);
	
			spell_1_cd = spell_1_timer;
		}
	}
}

//Morte
if global.hp <= 0 {
	instance_destroy();
}

//Tempo de Invunerabilidade
alarm[0]--;

//Animação de Invunerabilidade
alpha = lerp(alpha, 0, 0.1);