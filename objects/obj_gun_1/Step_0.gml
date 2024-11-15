event_inherited();

//Tiro
shoot_cd--;

if shoot_cd <= 0 {
	if distance_to_object(obj_player) <= range_shoot {
		var _inst = instance_create_layer(x, y, "Glow", obj_shoot);
		_inst.speed = 2;
		_inst.direction = point_direction(x, y, obj_player.x, obj_player.y);
		_inst.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
	
		shoot_cd = shoot_timer;
	}
}

