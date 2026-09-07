
//player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var move = key_right - key_left;

if (vsp != 0) {
	accel = 0.5
}
if (vsp == 0) {
	accel = 0.9
}

if (move != 0) {
	hsp += move * accel;
	hsp = clamp(hsp, -walksp, walksp);
} else {
	if (hsp > 0) hsp = max(0, hsp - fric);
	if (hsp < 0) hsp = min(0, hsp + fric);
}	
var touching_left = place_meeting(x - 1, y, parent_platform_obj) || place_meeting(x - 1, y, wall_obj);
var touching_right = place_meeting(x + 1, y, parent_platform_obj) || place_meeting(x + 1, y, wall_obj);
touching_no = !(touching_left || touching_right);
vsp = vsp + grv; 





//wall jump
if (place_meeting(x+hsp,y,wall_obj)) and (vsp > 0.3 or vsp <-0.3) and (key_jump)
{
	vsp = -7;
	hsp = -8 * move;
}

if (place_meeting(x,y+1,parent_platform_obj))  and (key_jump)
{
		vsp = -7;
	
}

//horizontal collision
if (place_meeting(x+hsp,y,parent_platform_obj))
{	
	while (!place_meeting(x+sign(hsp),y,parent_platform_obj))
	{
		x = x + sign(hsp);	
	}
	wall_slide = true;
	hsp = 0;
}	

x = x + hsp;


//vertical collision
if (place_meeting(x,y+vsp,parent_platform_obj))
{
	while (!place_meeting(x,y+sign(vsp),parent_platform_obj))
	{
		y = y + sign(vsp);
	}
	wall_slide = false;
	vsp = 0;
}	

y = y + vsp;

//sprite
if (hsp != 0 and vsp = 0 and wall_slide = false){
	sprite_index = player_right_running_1;
}
else if (vsp != 0 and touching_no = true){
	sprite_index = player_right_jump_2;
}
else if (wall_slide = true and touching_no = false){
	sprite_index = player_right_walljump_1;
}
else {
	sprite_index = player_right_idle_1;
}
if (hsp < 0) image_xscale = -1;
if (hsp > 0) image_xscale = 1;

