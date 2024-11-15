//Funciona sem o player
var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	instance_destroy();
	exit;
}

spd = obj_player.spd;

x = obj_player.x;
y = obj_player.y;

//Acompanhar a Animação do Player
image_index = obj_player.image_index;