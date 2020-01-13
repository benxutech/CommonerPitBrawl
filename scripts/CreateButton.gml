// 3 types of button, Big (menu), thin (which just manages to fit the text), Action (square)
// owner, x, y, label, trigger, type/style
var i, arg;
for (i = 0; i < 6; i += 1;) {
    if argument_count > i {
        arg[i] = argument[i];
    }
    else {
        arg[i] = -1;
    }
}

var sprite = sprButton;
if (arg[5] == 1) {
    sprite = sprButtonThin;
}
if (arg[5] == 2) {
    sprite = sprButtonActionLong;
}
if (arg[5] == 3) {
    sprite = sprButtonTiny;
}

var b = instance_create(arg[1],arg[2],objButton);
b.owner = arg[0];
b.label = arg[3];
b.trigger = arg[4];
b.sprite_index = sprite;

return b;
