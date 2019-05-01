var feats = array_create(2);
feats[0] = ds_list_create();
feats[1] = ds_map_create();

ds_list_add(feats[0], 'Wealthy', 'Swift', 'Tactician', 'Enduring');

ds_map_add(feats[1], 'Wealthy', 'Start each match with an extra 20 gp.');
ds_map_add(feats[1], 'Swift', 'Gain 10ft to your base movement speed.');
ds_map_add(feats[1], 'Tactician', 'Gain +5 to all your initiative rolls.');
ds_map_add(feats[1], 'Enduring', 'Gain an extra 5 max HP and 1 AC.');

return feats;
