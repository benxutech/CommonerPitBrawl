// objCharacter id, type of reroll (1 currently)
var char = argument0;
var type = argument1;

var numbers = ds_list_create();
ds_list_add(numbers, 12+irandom(1));
ds_list_add(numbers, 11+irandom(1));
ds_list_add(numbers, 8+irandom(3));
ds_list_add(numbers, 8+irandom(3));
ds_list_add(numbers, 8+irandom(2));
ds_list_add(numbers, 8+irandom(2));
ds_list_shuffle(numbers);

var varNames = array_create(6);
var i = 0;
varNames[i] = 'str';
i++;
varNames[i] = 'dex';
i++;
varNames[i] = 'con';
i++;
varNames[i] = 'int';
i++;
varNames[i] = 'wis';
i++;
varNames[i] = 'cha';

for (var i=0; i<6; i++) {
    variable_instance_set(char, varNames[i], numbers[| i]);
}

ds_list_destroy(numbers);


