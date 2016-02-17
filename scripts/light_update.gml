//draw onto the lightsurface created in light_init()
surface_set_target(lightsurface);

//clear the surface
draw_clear(c_black);

//set the alpha value
draw_set_alpha(alpha);

//draw a circle with the provided colors in the center of the surface.
//since the surface is (radius*2,radius*2) big, the center is (radius,radius)
draw_circle_color(radius,radius,radius,color,c_black,false);

//reseting the alpha value
draw_set_alpha(1);

//set the color to black
draw_set_color(c_black);

//making a temp object variable for the with loop.
var object;
object = id;
global.active_light = id;

//loop through all shadow casters
with(par_shadowcaster){

    if (distance_to_object(global.active_light) < global.active_light.radius) {   
        //begin drawing primitives, triangle strip, because then each point connects with every other point.
        draw_primitive_begin(pr_trianglestrip);
        
        //loop trhough all the casting points.
        for(i=0;i<cast_points;i+=1){
            /*
            searching for the relative position of the point on the light's surface.
            x+cast_x[i] means the absolute position of the point that we want to draw now.
            
            -object.x means we subtract the x position of the light.
            
            we add the object.radius, the radius of the light, because shadows cast from the center
                of the light, and not from the top left corner.
            */
            tempx = x+cast_x[i]-object.x+object.radius;
            
            //same for tempy
            tempy = y+cast_y[i]-object.y+object.radius;
            
            //the direction between the relative point and the center of the surface.
            //we add 180 to 'invert' the rotation.
            dir = point_direction(tempx,tempy,object.radius,object.radius)+180;
            
            //draw the first vertex.
            draw_vertex(tempx,tempy);
            
            //draw the second vertex, use lengthdir_x and lenghtdir_y to go radius*8 into the shadows direction.
            draw_vertex(tempx+lengthdir_x(object.radius*8,dir),tempy+lengthdir_y(object.radius*8,dir));
        }
        
        //now just one more to close the circle, this is exactly the same as above, so I won't add millions of comments
        tempx = x+cast_x[0]-object.x+object.radius;
        tempy = y+cast_y[0]-object.y+object.radius;
        dir = point_direction(tempx,tempy,object.radius,object.radius)+180;
        draw_vertex(tempx,tempy);
        draw_vertex(tempx+lengthdir_x(object.radius*8,dir),tempy+lengthdir_y(object.radius*8,dir));
        
        //end primitives
        draw_primitive_end();
    }
}

//reset the target surface;
surface_reset_target();
