function screen_shacke(_val1, _val2){
	with(obj_camera) {
		shake_lenght = _val1;
		shake_time = _val2;
		alarm[0] = shake_time;
	}
}