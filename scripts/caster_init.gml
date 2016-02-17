//total number of points in the casting procces. 4 means we define 4 points.(obviously.)
cast_points = 4;

//first point, top left corner
cast_x[0]=-sprite_xoffset;
cast_y[0]=-sprite_yoffset;
 
//second point, top right corner
cast_x[1]=-sprite_xoffset+sprite_width;
cast_y[1]=-sprite_yoffset;
 
//third point, down right corner
cast_x[2]=-sprite_xoffset+sprite_width;
cast_y[2]=-sprite_yoffset+sprite_height;
 
//fourth point, down left corner
cast_x[3]=-sprite_xoffset;
cast_y[3]=-sprite_yoffset+sprite_height;
