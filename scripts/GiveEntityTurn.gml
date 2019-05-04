/// Removes turn from all entities and gives turn to one entity
// refreshes it's actions too
// arg0 = socketlist
// arg1 = client instance map
// arg2 = entity

var list = argument0;
var map = argument1;
var count = ds_list_size(list);
var ent = argument2;
for (var i=0;i<count;i++) {
    var tempSock = list[| i];
    var tempInst = ds_map_find_value(map, tempSock);
    tempInst.turn = 0;
}

ent.movement = 30;
ent.action[0] = 1;
ent.action[1] = 1;
ent.action[2] = 1;
ent.turn = 1;

with (ent) { RefreshActions(); }

