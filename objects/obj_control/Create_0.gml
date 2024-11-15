//Randomiza as coisas
randomize();

spawn_timer_monster = 2 * room_speed;
spawn_timer_cloud = 0.5 * room_speed;

//Xp e Hp
global.hp = 10;
global.hp_max = 10;

global.xp = 0;
global.xp_max = 100;
global.lvl = 1;

//Pausar TUDO
global.pause_game = false;

//Upgrades
upgrade_num = 3;
upgrade_alpha = 1;
upgrade_scale = 1.5;
upgrade_avaliable = 3;

//Array de Monstros
global.monster = [];
global.monster[0] = obj_demon_1;

//Seletor de Cartas
card = 0;
card_enter = 0;

//Grid upgrades
upgrades_grid = ds_grid_create(3, 0);

enum Upgrades{
	Name,
	Object,
	Sprite,
	Lenght
}

ds_grid_add_upgrade("Asas", obj_wings, 0);
ds_grid_add_upgrade("Pet", obj_pet_1, 1);
ds_grid_add_upgrade("Espada", obj_sword, 2);