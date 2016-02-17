/*
-------- Light Draw Script
---- Draw the resulting light on the lightmap
-- Do not touch!
*/
if(surface_exists(lightsurface)) {
    if(_ls_use_views) {
        draw_surface(lightsurface, x - radius - view_xview[0], y - radius - view_yview[0]);
    }
    else {
        draw_surface(lightsurface, x - radius, y - radius);
    }
}
