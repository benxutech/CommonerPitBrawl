/// Read a JSON and output a list and map
file = file_text_open_read(working_directory + "\feats.json"); 
str = "";
while (true) {
    str += file_text_readln(file);
    if (file_text_eoln(file)) break;
}
decode = json_decode(str);
list = decode[? 'default'];
for (i=0;i<ds_list_size(list);i++){
objMap = list[|i];
show_debug_message(objMap[? 'name'])
show_debug_message(objMap[? 'description'])
show_debug_message(objMap[? 'effect_id'])
}
file_text_close(file);

            // does not work
