//player input

key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv; 


if (place_meeting(x,y+1,parent_platform_obj))  and (key_jump)
{
		vsp = -7;
	
}

//wall jump
if (place_meeting(x+hsp,y,parent_platform_obj)) and (key_jump)
{
	vsp = -7;
	hsp = -3 * move;
}

//horizontal collision
if (place_meeting(x+hsp,y,parent_platform_obj))
{
	while (!place_meeting(x+sign(hsp),y,parent_platform_obj))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}	
x = x + hsp;


//vertical collision
if (place_meeting(x,y+vsp,parent_platform_obj))
{
	while (!place_meeting(x,y+sign(vsp)+1,parent_platform_obj))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}	

y = y + vsp;

if (hsp != 0 or vsp != 0) {
	sprite_index = player_right_running_1;
}
else {
	sprite_index = player_right_idle_1;
}
if (hsp < 0) image_xscale = -1;