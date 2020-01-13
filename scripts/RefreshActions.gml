ds_list_clear(actions);
ds_list_clear(bonusActions);
ds_list_clear(freeActions);

// Add actions
// Add basic actions
if (action[0] > 0) {
    ds_list_add(actions, "Attack","Dash","Dodge");
}
if (action[1] > 0) {
    ds_list_add(bonusActions, "Bonus attack");
}
if (action[2] > 0) {
    ds_list_add(freeActions, "Test2");
}
