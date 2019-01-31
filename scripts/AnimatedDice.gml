/// Create a dice animation and roll
// Arg0 = no. of dice
// Arg1 = dice size

result = RollDice(argument0,argument1);
d = instance_create(70+irandom(50), room_height + 40, objRoll);
d.result = result;

return result;

