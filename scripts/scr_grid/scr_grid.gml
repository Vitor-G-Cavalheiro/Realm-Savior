// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function ds_grid_add_row(){
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);	
}
 
function ds_grid_add_upgrade(_name, _object, _sprite){
	var _grid = upgrades_grid;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = _name;
	_grid[# 1, _y] = _object;
	_grid[# 2, _y] = _sprite;
}

function ds_grid_active_power(_xx, _yy, _card){
	var _grid = upgrades_grid;
	instance_create_layer(_xx, _yy, "Instances_1", upgrades_grid[# Upgrades.Object, _card]);
}

function ds_grid_remove_power(_name){
	var _grid = upgrades_grid;
	var _height = ds_grid_height(_grid);
	var _width = ds_grid_width(_grid);
	
	row = ds_grid_value_y(_grid, 0, 0, 0, _height - 1, _name);

	ds_grid_set_grid_region(_grid, _grid, 0, row + 1, _width - 1, _height - 1, 0, row);

	ds_grid_resize(_grid, _width, _height - 1);
}