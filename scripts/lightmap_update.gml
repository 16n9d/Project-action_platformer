//update all lights
with(par_lightsource){
    light_update();
}

//set the surface target
surface_set_target(lightmap);

//draw a black background
draw_clear(c_black);

//set the brightness
draw_set_alpha(brightness);

//set the color to white
draw_set_color(c_white);

//draw a white rectangle with the provided alpha value to create the ambiant light
draw_rectangle(0,0,surface_get_width(lightmap),surface_get_height(lightmap),false);

with(par_shadowcaster) {
    var i = instance_nearest(x, y, par_lightsource);

    draw_set_alpha(0.50);
    draw_rectangle_colour(x, y, x + sprite_width,y + sprite_height,c_white, c_white, c_white, c_white, false);
}
//reset the alpha value back to one
draw_set_alpha(1);

//set the blend mode to addictive blending, so the lights blend toghether nicely with multiple colors
draw_set_blend_mode(bm_add);

//draw the lights onto this surface
with(par_lightsource){
    light_draw();
}

//reset blend mode
draw_set_blend_mode(bm_normal);

//reset surface
surface_reset_target();
