//Pausa os Inimigos
if (global.pause_game == true) {
	alarm[0]++;
	par_enemy.spd = 0;
	exit;
} else {
	par_enemy.spd = .5;
}

//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	exit;
}

//Profundidade
depth = -y;

//Spawn Aleatório fora do campo de visão
var _border = 64;

if y < global.cmy - _border{
	y = global.cmy + global.cmh + _border;
}

if y > global.cmy + global.cmh +  _border{
	y = global.cmy - _border;
}

if x < global.cmx - _border{
	x = global.cmx + global.cmw + _border;
}

if x > global.cmx + global.cmw + _border{
	x = global.cmx - _border;
}

//Morte inimigo
if hp <= 0 {
	instance_destroy();
	instance_create_layer(x, y, "Instances_1", obj_kill_vfx);
	repeat(3){
		var _xx = irandom_range(-10, 10);
		var _yy = irandom_range(-10, 10);
		instance_create_layer(x + _xx,y + _yy, "Instances_1", obj_xp);
	}
}

//Efeito de Tomar Dano
alpha = lerp(alpha, 0, 0.1);

//Pegadas
alarm[0]--;

if (alarm[0] <= 0) {
	instance_create_layer(x, y, "Instances_1", obj_foot_demon_vfx);
	alarm[0] = 60;
}

//Invunerabilidade da Espada
alarm[1]--;

//Girar para o player
if(x > obj_player.x) {
	image_xscale = -1;
} else {
	image_xscale = 1;
}