//Movimentação para o lado
x += spd;

//Tempo
alarm[0]--;

if (alarm[0] <= 0) {
	instance_destroy();
}