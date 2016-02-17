/*
-------- Lightmap Step Script
---- Here is the script that is used on step action of a lightmap object.
---- The lights will be called and every calculation starts from this point.
-- Do not touch!
*/

if(_ls_flickerings_by_fps == 0)
        _ls_lightmap_update_by_fps = room_speed / _ls_lightmap_update_by_second;
        
if(lightmap_update_count >= _ls_lightmap_update_by_fps && _ls_use_lightmap_update) {
    if(!surface_exists(lightmap)) {
        if(_ls_use_views) {
            lightmap = surface_create(view_wview[0], view_hview[0]);
        }
        else {
            lightmap = surface_create(room_width, room_height);
        }
    }
        
    with(obj_ls_light) {
        if(            
            x + radius >= view_xview[0] &&
            x - radius <= view_xview[0] + view_wview[0] &&
            y + radius >= view_yview[0] &&
            y - radius <= view_yview[0] + view_hview[0]
        )
            scr_ls_light_update();
    }
    
    surface_set_target(lightmap);
    
    draw_clear(c_black);
    draw_set_alpha(_ls_lightmap_brightness);
    draw_set_color(c_white);
    draw_rectangle(0, 0, surface_get_width(lightmap), surface_get_height(lightmap), false);
    
    draw_set_alpha(1);
    draw_set_blend_mode(bm_add);
    
    with(obj_ls_light) {
        if(            
            x + radius >= view_xview[0] &&
            x - radius <= view_xview[0] + view_wview[0] &&
            y + radius >= view_yview[0] &&
            y - radius <= view_yview[0] + view_hview[0]
        )
            scr_ls_light_draw();
        else if(!surface_exists(lightsurface))
            surface_free(lightsurface);
    }
    
    draw_set_blend_mode(bm_normal);
    
    surface_reset_target();
    lightmap_update_count = 1;
} else 
    lightmap_update_count++;
