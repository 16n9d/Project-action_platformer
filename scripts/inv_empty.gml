///inv_empty(x, y);
var xx, yy;
    xx = argument0;
    yy = argument1;

var del_item = sys_inventory.slot[# xx, yy];

sys_inventory.count[# xx, yy] = 0;
sys_inventory.slot[# xx, yy] = item.null;

return del_item;

