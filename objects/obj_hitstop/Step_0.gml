tempo--;

//Enquanto o tempo não acabar desacelera o jogo
if (tempo > 0) 
{
	game_set_speed(velocidade, gamespeed_fps);
} else //Voltando a velocidade normal
{
	game_set_speed(60, gamespeed_fps);
	instance_destroy();
}