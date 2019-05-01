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
        inst.xx = 1+irandom(2);
        inst.yy = 1+irandom(1);
        
        // Give it an initiative
                // Move this elsewhere when personal stats are created
        var dice = RollDice(1,20);
        inst.initiative = dice+ inst.init_mod;
        ShowRoll(sock, dice, 'Your Initiative');

        // put this instance into a map, using the socket ID as the lookup
        ds_map_add( Clients, sock, inst );
        
        // insert into entities
        ds_list_add(entities, inst);
        
        // If it's the only player, then give it the turn
        show_debug_message(ds_list_size(socketlist));
        if (ds_list_size(socketlist) == 1) {
            GiveEntityTurn(socketlist,Clients,inst);
        }
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
        
        // delete from entities
    }
    return t;
}


