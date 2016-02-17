/*
-------- Light Create Script
---- Here is the script that is used to instantiate a light

---- Arguments are:
-- x = "x position to be spawned"
-- y = "y position to be spawned"
-- radius = "Half Size of the light, or distance to the center"
-- color = "The color of the light"
-- alpha = "The alpha of the light"
*/

light_x = argument0;
light_y = argument1;

light = instance_create(light_x, light_y, obj_ls_light);

with(light) {
    radius = argument2;
    color = argument3;
    alpha = argument4;
    lightsurface = surface_create(radius * 2, radius * 2);
    flickering_level = 0;
    flickerings_count = 0;
    visible = false;
    follow = argument5;
}

return light;
