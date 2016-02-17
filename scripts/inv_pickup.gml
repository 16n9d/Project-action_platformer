///inv_pickup(item, qty);
var item = argument0;
var qty  = argument1;

// Check for item in inventory
for (var yy = 0 ; yy < sys_inventory.height ; yy++) {
    for (var xx = 0; xx < sys_inventory.width ; xx++) {
        if (sys_inventory.slot[# xx, yy] == item) {
            if (sys_inventory.count[# xx, yy] < 9) {
                sys_inventory.count[# xx, yy] += qty;
                return true;
            } else {
                continue;
            }
        }
    }
}

// Check for an empty slot
for (var yy = 0 ; yy < sys_inventory.height ; yy++) {
    for (var xx = 0; xx < sys_inventory.width ; xx++) {  
        if (sys_inventory.slot[# xx, yy] == item.null) {
            sys_inventory.slot[# xx, yy] = item;
            sys_inventory.count[# xx, yy] += qty;
            return true;
        }
    }
}
