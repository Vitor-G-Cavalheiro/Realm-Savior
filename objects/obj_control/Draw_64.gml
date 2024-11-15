if (global.pause_game == true) {
	draw_set_alpha(0.7);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	right = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right);
	left = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left);
	
	card += right - left;
	card = clamp(card, 0, upgrade_num - 1);
	
	for (var i = 0; i < upgrade_num; i++) {
		var _sprh = sprite_get_height(spr_card_hud);
		var _buffer = 15;
		var _xx = display_get_gui_width()/2 - _sprh - _buffer;
		var _yy = display_get_gui_height()/2;
		
		var _y = upgrade_list[| i];
		var _sprite = upgrades_grid[# Upgrades.Sprite, _y];
		
		if (card == i) {
			upgrade_scale = 2;
			upgrade_alpha = 1;
			card_enter = _y;
		} else {
			upgrade_scale = 1.5;
			upgrade_alpha = 0.7;
		}
		draw_sprite_ext(spr_card_hud, _sprite, _xx + (_sprh + _buffer) * i, _yy, upgrade_scale, upgrade_scale, 0, c_white, upgrade_alpha);
	}
	
	if(keyboard_check_pressed(vk_enter)) {
		if(upgrade_avaliable > 0){
			ds_grid_active_power(obj_player.x, obj_player.y, card_enter);
			ds_grid_remove_power(upgrades_grid[# Upgrades.Name, card_enter]);
			upgrade_avaliable--;
			if(upgrade_num > upgrade_avaliable) {
				upgrade_num = upgrade_avaliable;
			}
		}	
			global.pause_game = false;
		}
	
		exit;
}

//HUDS
draw_sprite(spr_hp_hud, -1, 2, 2);
draw_sprite(spr_xp_hud, -1, 2, 9);

//Barras
draw_sprite_ext(spr_hp_bar, -1, 3, 3, global.hp/global.hp_max, 1, 0, c_white, 1);
draw_sprite_ext(spr_xp_bar, -1, 3, 10, global.xp/global.xp_max, 1, 0, c_white, 1);