/*
-------- Light Update Script
---- Here's the heart of the system. Shadows and lights are generated here.
-- Do not touch!
*/

var light;
light = id;

if(!surface_exists(lightsurface))
    lightsurface = surface_create(radius * 2, radius * 2);

surface_set_target(lightsurface);

draw_clear(c_black);
draw_set_alpha(alpha);

do_not_flicker = true;

if(flickering_level > 0 && _ls_shadow_flickering) {

    if(_ls_flickerings_by_fps == 0)
        _ls_flickerings_by_fps = (room_speed / _ls_flickerings_by_second) / _ls_lightmap_update_by_fps;

    if(flickerings_count >= _ls_flickerings_by_fps) {
        
        flickering_radius = radius + irandom_range(-flickering_level, 0);
        flickering_range = flickering_level / 30;
        
        flickering_x = x + choose(-flickering_range, 0, flickering_range);
        flickering_y = y + choose(-0.2, 0, 0.2);
        flickerings_count = 1;
        do_not_flicker = false;
    } else 
        flickerings_count++;
}

if(do_not_flicker) {
    flickering_radius = radius;
    flickering_x = x;
    flickering_y = y;
}

draw_circle_colour(radius, radius, flickering_radius, color, c_black, false);

draw_set_alpha(1);
draw_set_color(c_black);

if(_ls_use_lightblockers) {
    with(obj_ls_lightblocker) {
        if(distance_to_object(light) < light.radius) {
        
            if(shadow_from) {
                shadow_surface = surface_create(light.radius * 2, light.radius * 2);
                surface_set_target(shadow_surface);
                draw_clear(c_white);
                draw_set_alpha(light.alpha);
            }
                
            draw_primitive_begin(pr_trianglestrip);
            for(i = 0; i <= array_length_1d(cast_points_x); i++) {     
                if(i == array_length_1d(cast_points_x))
                    l = 0;
                else l = i;
                tempx = x + cast_points_x[l] - light.flickering_x + light.radius;
                tempy = y + cast_points_y[l] - light.flickering_y + light.radius;
                dir = point_direction(tempx, tempy, light.radius, light.radius) + 180;
                draw_vertex(tempx, tempy);
                draw_vertex(
                    tempx + lengthdir_x(light.radius * 8, dir), 
                    tempy + lengthdir_y(light.radius * 8, dir)
                );
            }
            draw_primitive_end();
            
            if(shadow_from) {
                tempx = shadow_from.x - light.flickering_x + light.radius;
                tempy = shadow_from.y - light.flickering_y + light.radius;
            
                draw_sprite_ext(
                    shadow_from.sprite_index,
                    shadow_from.image_index,
                    tempx,
                    tempy,
                    shadow_from.image_xscale,
                    shadow_from.image_yscale,
                    shadow_from.image_angle,
                    c_white,
                    1
                );
            
                surface_reset_target();
                surface_set_target(light.lightsurface);
                draw_set_blend_mode_ext(bm_dest_color, bm_zero);
                draw_surface(shadow_surface, 0, 0);
                draw_set_blend_mode(bm_normal);
                surface_free(shadow_surface);
            }
        }
    }
}

if(_ls_use_extralight) {
    draw_set_alpha(_ls_extralight_bright);
    draw_circle_color(radius, radius, flickering_radius, color, c_black, false);
}

surface_reset_target();
