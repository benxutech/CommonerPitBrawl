// Clientside. Adds an entry to the log.
// Input: string
var log = objLog;
var pos = 0;
//if (ds_list_size(log.items) != 0) pos = ds_list_size(log.items)-1;
ds_list_insert(log.items, pos, argument0);
