move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x = move_x * move_speed;
if place_meeting(x, y+2, obj_ground)
{
	move_y = 0;

	if keyboard_check(vk_space) move_y = -jump_speed;
}
else if move_y < 10
{
	move_y += 1;
}

move_and_collide(move_x, move_y, obj_ground, 4, 0, 0, move_speed, -1);

if move_x != 0 
{
	image_xscale = sign(move_x);
}

if move_x > 0 sprite_index = player_right_running_1;
if move_x < 0 sprite_index = player_right_running_1;
if move_x = 0 sprite_index = player_right_idle_1;
if move_y > 0 sprite_index = player_right_jump_2;
if move_y < 0 sprite_index = player_right_jump_2;

if (move_x > 0) and (move_y = 0) {
        image_xscale = 1;
    } else if (move_x < 0) {
        image_xscale = -1;
	}
	
if (move_y != 0) and (move_x > 0) {
	    image_xscale = 1;
	} else if (move_x < 0) {
		image_xscale = -1;
	}
	