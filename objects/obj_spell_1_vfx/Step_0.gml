image_xscale = scale;
image_yscale = scale;

scale -= .1;

var _vfx = instance_nearest(x, y, par_shoot);
if (_vfx) {
	image_angle = point_direction(x, y, _vfx.x, _vfx.y);
}

if scale <= 0 {
	instance_destroy();
}