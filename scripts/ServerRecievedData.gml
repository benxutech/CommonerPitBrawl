/// Read incoming data to the server from a connected socket
{  
    // get the buffer the data resides in
    var buff = ds_map_find_value(async_load, "buffer");
    
    // read ythe command 
    var cmd = buffer_read(buff, buffer_s16 );

    // Get the socket ID - this is the CLIENT socket ID. We can use this as a "key" for this client
    var sock = ds_map_find_value(async_load, "id");
    // Look up the client details
    var inst = ds_map_find_value(Clients, sock );

    var out = 0; // returned value
    
    // Is this a KEY command?
    if( cmd==KEY_CMD ) {
        // Read the key that was sent
        var key = buffer_read(buff, buffer_s16 );
        // And it's up/down state
        var updown = buffer_read(buff, buffer_s16 );
    
        // translate keypress into an index for our player array.
        if( key==vk_left ) {
            key=LEFT_KEY;
        }
        else if( key==vk_right ) {
            key=RIGHT_KEY;
        }
         
        // translate updown into a bool for the player array       
        if( updown==0 ){
            inst.keys[key] = false;
        }else{
            inst.keys[key] = true;
        }
    }
    // Is this a NAME command?
    else if( cmd==NAME_CMD ) {
        // Set the client "name"
        inst.name = buffer_read(buff, buffer_string );    
    }
    else if( cmd==PING_CMD ) {
        // keep alive - ignore it
    }
    else if( cmd==MOVE_CMD ) {
        var go_xx = buffer_read(buff, buffer_s16 );
        var go_yy = buffer_read(buff, buffer_s16 );
        var go_moveType = buffer_read(buff, buffer_s16 );
        
        if (inst.movement > 0) {
            inst.xx = go_xx;
            inst.yy = go_yy;
            inst.movement = 0;
            inst.moveType = go_moveType;
        }
    }
    else if( cmd==TURN_CMD ) {
        // take away turns from everyone
        
        
        var h = ds_list_size(entities)-1;//ds_grid_height(entitiesInitiatives);
        if (initiativeIndex < h) initiativeIndex += 1;
        else initiativeIndex = 0;
            show_debug_message(initiativeIndex);
        
        var instNext = entities[| initiativeIndex];//ds_grid_get(entitiesInitiatives, 0, initiativeIndex);
        GiveEntityTurn(socketlist,Clients,instNext);
    }
    return cmd;
    
}


