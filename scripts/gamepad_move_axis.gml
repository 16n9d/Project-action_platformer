///gamepad_move_axis(xaxis, yaxis, thresh, spd);

var xaxis, yaxis, spd, thresh, magnd;
    xaxis  = argument0;
    yaxis  = argument1;
    thresh = argument2;
    magnd  = point_distance(0, 0, xaxis, yaxis);
    spd    = argument3;
    
//move the player if posible
if (magnd >= thresh) {
    x += xaxis * spd;
    y += yaxis * spd;
}

