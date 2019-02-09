// Goes through player list and gets the instance whose turn it currently is
// arg0 = entity list 
// arg1 = index
// modulo the index by the length of the list, essentially making it loop


list = argument0;
size = ds_list_size(list);
//if (size < argument1) ind = argument1 mod size;
//else
 ind = argument1;
current = 0;
newList = ds_list_create();

        show_debug_message(size);
if (size != 0) {
    for (var i=0; i<size; i++) {
        val = ds_list_find_value(list, i);
        add = val.initiative;
        ds_list_add(newList,add);
    }
    // Sort
    ds_list_sort(newList,0);
    
    // Get object using # on list
    inst = ds_list_find_value(newList,ind);
    
    return inst;
}
else {
    return 0;
}

// delete list
ds_list_destroy(newList);
