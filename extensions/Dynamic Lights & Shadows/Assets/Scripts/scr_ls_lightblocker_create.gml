/*
-------- Lightblocker Create Script
---- Here is the script that is used to instantiate a lightblocker

---- Arguments are:
-- x = "x position to be spawned"
-- y = "y position to be spawned"
-- cast_points_x = "A array with the x values of cast points"
-- cast_points_y = "A array with the y values of cast points"
*/

lightblocker_x = argument0;
lightblocker_y = argument1;

lightblocker = instance_create(lightblocker_x, lightblocker_y, obj_ls_lightblocker);

with(lightblocker) {
    cast_points_x = argument2;
    cast_points_y = argument3;
    
    shadow_from = false;
    
    visible = false;
}

return lightblocker;
