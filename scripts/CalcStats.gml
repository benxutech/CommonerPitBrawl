str_mod = floor((str-10)/2);
dex_mod = floor((dex-10)/2);
con_mod = floor((con-10)/2);
int_mod = floor((int-10)/2);
wis_mod = floor((wis-10)/2);
cha_mod = floor((cha-10)/2);

maxHp = hit_dice_size+con_mod;
if (hp > maxHp) hp = maxHp;
