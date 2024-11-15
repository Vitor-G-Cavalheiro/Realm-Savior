//Pausar Jogo
if (global.pause_game == true) {
	alarm[0]++;
	alarm[1]++;
	exit;
};

//Random Monstros
var _side_monster = irandom(1);

var _size = array_length(global.monster);
var _enemy = irandom_range(0, _size-1);

if alarm[0] <= 0 {
	if _side_monster == 0{
		var _xx = irandom_range(global.cmx, global.cmx + global.cmw);
		var _yy = choose(global.cmy - 16, global.cmy + global.cmh + 16);
	
		instance_create_layer(_xx, _yy, "Instances_1", array_get(global.monster, _enemy));
	} else{
		var _xx = choose(global.cmx - 16, global.cmx + global.cmw + 16);
		var _yy = irandom_range(global.cmx, global.cmx + global.cmw);
	
		instance_create_layer(_xx, _yy, "Instances_1", array_get(global.monster, _enemy));
	}
	alarm[0] = spawn_timer_monster;
}

//Random Nuvens
var _side_cloud = irandom(1);

if alarm[1] <= 0 {
	var _border = irandom_range(32, 96);
	
	var _xx = irandom_range(global.cmx, global.cmx + global.cmw);
	var _yy = irandom_range(global.cmx, global.cmx + global.cmw);
	
	if _yy < global.cmy + _border{
		_yy = global.cmy + global.cmh - _border;
	}
	if _yy > global.cmy + global.cmh -  _border{
		_yy = global.cmy + _border;
	}
	if _xx < global.cmx - _border{
		_xx = global.cmx + global.cmw + _border;
	}
	if _xx > global.cmx + global.cmw + _border{
	_xx = global.cmx - _border;
	}
	
	instance_create_layer(_xx, _yy, "Instances_1", obj_smoke_vfx);
	alarm[1] = spawn_timer_cloud;
}

//Interface Gráfica
display_set_gui_size(360, 180);

//Up Lvl
if (global.xp >= global.xp_max) {
	global.lvl++;
	instance_create_layer(obj_player.x, obj_player.y, "Instances_1", obj_lvl_up_vfx);
	global.xp = global.xp - global.xp_max;
	global.xp_max += 50;
	global.pause_game = true;
	
	global.hp_max += 5;
	global.hp = global.hp_max;
	
	spawn_timer_monster -= 12;
	
	upgrade_list = ds_list_create();
	repeat(upgrade_num) {
		randomize();
		var _upgrade = irandom(ds_grid_height(upgrades_grid) - 1);
		
		while(ds_list_find_index(upgrade_list, _upgrade) != -1) {
			_upgrade = irandom(ds_grid_height(upgrades_grid) - 1);
		}
		
		ds_list_add(upgrade_list, _upgrade);
	}
}

//Adicionando Inimigos
if (global.lvl == 2) {
	global.monster[1] = obj_demon_2;
}

if (global.lvl == 3) {
	global.monster[2] = obj_demon_3;
}

if (global.lvl == 4) {
	global.monster[3] = obj_demon_4;
}
