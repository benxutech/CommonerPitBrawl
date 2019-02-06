/// Create a dice animation and shows the result
// Arg0 = result to show
tx = argument0;
ty =  argument1;
result = argument2;
text = argument3;

d = instance_create(tx, ty, objRoll);
d.result = result;
d.text = text;

return result;

