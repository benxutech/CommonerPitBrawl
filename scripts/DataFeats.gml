var feats = array_create(2);
feats[0] = ds_list_create();
feats[1] = ds_map_create();

// Read JSON, get JSON
file = file_text_open_read(working_directory + "\feats.json"); 
str = "";
while (true) {
    str += file_text_readln(file);
    if (file_text_eoln(file)) break;
}
decode = json_decode(str);
list = decode[? 'default'];

// Format JSON into list and map
for (i=0;i<ds_list_size(list);i++){
    objMap = list[|i];
    ds_list_add(feats[0], objMap[? 'name']);
    ds_map_add(feats[1], objMap[? 'name'], objMap[? 'description']);
}
file_text_close(file);

return feats;
