///entity_hp_mod(obj, amount);
obj = argument0;
qty = argument1;   

obj.hp_goal   += qty;
obj.hdam_goal += qty;

if (qty < 0) { 
    obj.dmg_sum += abs(qty);
}

