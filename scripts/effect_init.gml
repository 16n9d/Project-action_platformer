///effect_init(type, duration, force, angle);
var type, dur, f, ang;
    type = argument0;
    dur  = argument1;
    f    = argument2;
    ang  = argument3;

switch(type) {
    case SCREENSHAKE:
        with(obj_player) {
            cam.shake    = true;
            cam.duration = dur;
            cam.force    = f;
            cam.angle     = ang;
        }
    break;
}

