/*
-------- Lightblocker Create Extended Script
---- Here is the script that is used to instantiate a lightblocker, with addons

---- Arguments are:
-- x = "x position to be spawned"
-- y = "y position to be spawned"
-- cast_points_x = "A array with the x values of cast points"
-- cast_points_y = "A array with the y values of cast points"

-- shadow_from = "The id of the object that will be casting that light"

*/

lightblocker_x = argument0;
lightblocker_y = argument1;

lightblocker = instance_create(lightblocker_x , lightblocker_y, obj_ls_lightblocker);

with(lightblocker) {
    cast_points_x = argument2;
    cast_points_y = argument3;
    
    shadow_from = argument4;
    parent = argument5;
    
    visible = false;
}

return lightblocker;
