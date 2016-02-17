///lightmap_draw(x, y);
//set the blend mode to multiply, search for tutorials on this, the explanation is to long.
draw_set_blend_mode_ext(bm_dest_color,bm_zero);

//draw the surface onto the screen.
draw_surface(lightmap,0,0);

//reset the blend mode
draw_set_blend_mode(bm_normal);
