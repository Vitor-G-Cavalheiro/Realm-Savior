vspeed -= 0.01;
image_alpha -= 0.02;
alarm[0]--;

depth = -y-10;

if (alarm[0] <= 0) {
	instance_destroy();
}