image_alpha = clamp(image_alpha - 0.01, 0, 1);

var _enemy = instance_nearest(x, y, par_enemy);
if (_enemy) {
	image_angle = point_direction(_enemy.x, _enemy.y, _enemy.x, _enemy.y);
}

if (image_alpha <= 0) {
	instance_destroy();
}