/// Called on a connect or disconnect of a client
{
    // get connect or disconnect (1=connect)
    var t = ds_map_find_value(async_load, "type");

    // Get the NEW socket ID, or the socket that's disconnecting
    var sock = ds_map_find_value(async_load, "socket");
    
    // Get the IP that the socket comes from
    var ip = ds_map_find_value(async_load, "ip");
    
    // Connecting?
    if( t==network_type_connect)
    {
        // add client to our list of connected clients
        ds_list_add( socketlist, sock );
        
        // Create a new player,       
        var inst = instance_create(0,0, objPlayerServer);
        inst.socketID = sock;
        inst.xx = 2+irandom(3);
        inst.yy = 2+irandom(1);
        
        // Give it an initiative
                // Move this elsewhere when personal stats are created
        var dice = RollDice(1,20);
        inst.initiative = dice+ inst.init_mod;
        ShowRoll(sock, dice, 'Your Initiative');

        // put this instance into a map, using the socket ID as the lookup
        ds_map_add( Clients, sock, inst );
        
        // insert into entities
        ds_list_add(entities, inst);
        
        
        
        // put into entity-initiative grid
        /*var h = ds_grid_height(entitiesInitiatives);
        show_debug_message(ds_grid_height(entitiesInitiatives))
        ds_grid_resize(entitiesInitiatives, 2, h);
        ds_grid_set(entitiesInitiatives, 0, h-1, inst);
        ds_grid_set(entitiesInitiatives, 1, h-1, inst.initiative);
        ds_grid_sort(entitiesInitiatives, 1, 0);*/
    }
    else
    {
        // disconnect a CLIENT. First find the player instance using the socket ID as a lookup
        var inst = ds_map_find_value(Clients, sock );
       
       // Delete the socket from out map, and kill the player instance
        ds_map_delete(Clients, sock );
        with(inst) { instance_destroy(); }
        
        // Also delete the socket from our global list of connected clients
        var index = ds_list_find_index( socketlist, sock );
        ds_list_delete(socketlist,index);
    }
    return t;
}


