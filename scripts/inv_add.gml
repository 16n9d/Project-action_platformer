///inv_add(x, y, id, qty);
var xx, yy, ii, qty;
xx  = argument0;
yy  = argument1;
ii  = argument2;
qty = argument3;

// Get the item count
var i_count = sys_inventory.count[# xx, yy];

if (i_count == 0) {
    // Empty inventory, add item
    sys_inventory.slot[# xx, yy]   = ii;
    sys_inventory.count[# xx, yy] += qty;
    
    return true;    
} else if (i_count > 0) {
    // Check to add current item
    if (sys_inventory.slot[# xx, yy] == ii) {
        // Add one more
        sys_inventory.slot[# xx, yy]+= qty;
        return true
    } else {
        return false;
    }
} else {
    show_debug_message("Item count is less than 0");
}
