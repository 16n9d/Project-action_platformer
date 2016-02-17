/*
-------- Lightmap Draw
---- Here is the script that is used to draw the lightmap on the screen.
-- Do not touch!
*/

if(surface_exists(lightmap)) {

    draw_set_blend_mode_ext(bm_dest_color, bm_zero);
    
    if(_ls_use_views) {
        draw_surface(lightmap, view_xview[0], view_yview[0]);
    } else {
        draw_surface(lightmap, 0, 0);
    }
    draw_set_blend_mode(bm_normal);
}
