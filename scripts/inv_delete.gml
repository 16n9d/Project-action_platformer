///inv_delete(x, y, amount);
var xx, yy, ii;
    xx = argument0;
    yy = argument1;
    ii = argument2;    

var i_count = sys_inventory.count[# xx, yy];

if (i_count > 0) {
    sys_inventory.count[# xx, yy]-= ii;
    
    // Get access to the removed item
    var del_item = sys_inventory.slot[# xx, yy];
    
    // Check for last item
    if (i_count == ii) {
        // Set item to null
        sys_inventory.slot[# xx, yy] = item.null;
    }
    
    return del_item;
} else if (i_count == 0) {
    return item.null;
}
