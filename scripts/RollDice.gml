/// Rolls a # d #.
// Arg0 = amount of dice.
// Arg1 = dice size.

dice = argument0;
size = argument1;
total = 0;
repeat (dice) {
    total += irandom_range(1,size);
}
return total;

