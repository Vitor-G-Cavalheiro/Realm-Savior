var _player = instance_nearest(x, y, obj_player)
if(!_player) {
	exit;
}
global.cmx = lerp(global.cmx, obj_player.x - global.cmw/2, .2);
global.cmy = lerp(global.cmy, obj_player.y - global.cmh/2, .2);

camera_set_view_pos(view_camera[0], global.cmx, global.cmy); 

if (shake_lenght != 0 ) {
	global.cmx += random_range(-shake_lenght, shake_lenght);
	global.cmy += random_range(-shake_lenght, shake_lenght);
}