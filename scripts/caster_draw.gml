//begin drawing primitives
draw_primitive_begin(pr_linestrip);

draw_set_color(c_green);
draw_set_alpha(1);

//loop through all the casting points and add them to the primitives
for(i = 0; i < cast_points; i += 1){
    draw_vertex(x+cast_x[i],y+cast_y[i]);
}

//add one more to close the lines
draw_vertex(x+cast_x[0],y+cast_y[0]);

//end drawing primitives.
draw_primitive_end();

//loop through all the casting points and draw a little cirlce allround them.
for(i = 0; i < cast_points; i += 1){
    draw_circle(x+cast_x[i],y+cast_y[i],4,true);
}
