/// For use in ServerReceivedData
// Args: damage

var hit = argument0;
var dmg = argument1;

var atkX = buffer_read(buff, buffer_s16);
var atkY = buffer_read(buff, buffer_s16);
var tempList = ds_list_create();  // List of targets
var tempList2 = ds_list_create();  // List of hits
var logString = "Attacked.";
var attackerName = inst.name;

// Get targets
for (var i=0; i<ds_list_size(entities); i++) {
    var e = entities[|i];
    if (e.xx == atkX && e.yy == atkY) {
        ds_list_add(tempList, e);
        // Determine hit
        if (e.ac <= hit) {
            ds_list_add(tempList2, e);
        }
    }
}

// only do if there was anything to hit
if (ds_list_size(tempList) > 0) {
    // Deal damage
    logString = attackerName+" deals "+ string(dmg) +" DMG!";
    for (var i=0; i<ds_list_size(tempList2); i++) {
        tempList[|i].hp -= dmg;
    }
}

// Log misses
if (ds_list_size(tempList2) == 0) {
    logString = attackerName+" misses.";
}
if (ds_list_size(tempList) == 0) {
    logString = attackerName+" hits thin air.";
}


ds_list_destroy(tempList);
ds_list_destroy(tempList2);

// Send log
SendLog(logString);
