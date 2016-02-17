/*
-------- Light Create Extended Script
---- Like the normal create, but more.

---- Arguments are:
-- x = "x position to be spawned"
-- y = "y position to be spawned"
-- radius = "Half Size of the light, or distance to the center"
-- color = "The color of the light"
-- alpha = "The alpha of the light"

-- flickering_level = "how agressive will be the flickering"
*/

light_x = argument0;
light_y = argument1;

light = instance_create(light_x, light_y, obj_ls_light);

with(light) {
    radius = argument2;
    color = argument3;
    alpha = argument4;
    flickering_level = argument5;
    flickerings_count = 0;
    lightsurface = surface_create(radius * 2, radius * 2);
    visible = false;
}

return light;
