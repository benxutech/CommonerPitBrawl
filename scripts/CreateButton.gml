// TBD: 2 types of button, Big (menu), Small (which just manage to fit the text)

var i, arg;
for (i = 0; i < 6; i += 1;) {
    if argument_count > i {
        arg[i] = argument[i]
    }
    else {
        arg[i] = -1;
    }
}

sprite = sprButton;
if (arg[5] == 1) {
    sprite = sprButtonAction;
}

var b = instance_create(arg[1],arg[2],objButton);
b.owner = arg[0];
b.label = arg[3];
b.trigger = arg[4];
b.sprite_index = sprite;

return b;
