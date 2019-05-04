

count = argument0;
player_buffer = argument1;
//move_type = argument2;

// Regular position updates
global.player_buffer = player_buffer;

// Reset buffer to start - Networking ALWAYS reads from the START of the buffer
buffer_seek(player_buffer, buffer_seek_start, 0);

// Client ID
buffer_write(global.player_buffer, buffer_s16, 0 );  // This is dummy for now

// Buffer type
buffer_write(player_buffer, buffer_s16, 1 );

// Total number of entity
buffer_write(player_buffer, buffer_u32, global.entityCount );

// All attached players
with(objPlayerServer)
{
    buffer_write(global.player_buffer, buffer_s16, xx );
    buffer_write(global.player_buffer, buffer_s16, yy );
    buffer_write(global.player_buffer, buffer_s16, sprite_index );
    buffer_write(global.player_buffer, buffer_s16, image_index );
    buffer_write(global.player_buffer, buffer_s16, socketID );
    buffer_write(global.player_buffer, buffer_s16, id );
    buffer_write(global.player_buffer, buffer_string, name );
    buffer_write(global.player_buffer, buffer_s16, moveType );
    buffer_write(global.player_buffer, buffer_s16, initiative );
    buffer_write(global.player_buffer, buffer_s16, movement);
    buffer_write(global.player_buffer, buffer_s16, action[0]);
    buffer_write(global.player_buffer, buffer_s16, action[1]);
    buffer_write(global.player_buffer, buffer_s16, action[2]);
    buffer_write(global.player_buffer, buffer_s16, die);
    buffer_write(global.player_buffer, buffer_s16, turn);
    buffer_write(global.player_buffer, buffer_s16, hp);
    buffer_write(global.player_buffer, buffer_s16, maxHp);
    
    // write actions amount
    buffer_write(global.player_buffer, buffer_s16, ds_list_size(actions));
    // write actions
    for (var i=0; i<ds_list_size(actions); i++) {
        buffer_write(global.player_buffer, buffer_string, actions[|i]);
    }
    // write bonus amount
    buffer_write(global.player_buffer, buffer_s16, ds_list_size(bonusActions));
    // write bonus
    for (var i=0; i<ds_list_size(bonusActions); i++) {
        buffer_write(global.player_buffer, buffer_string, bonusActions[|i]);
    }
    // write free amount
    buffer_write(global.player_buffer, buffer_s16, ds_list_size(freeActions));
    // write free
    for (var i=0; i<ds_list_size(freeActions); i++) {
        buffer_write(global.player_buffer, buffer_string, freeActions[|i]);
    }
    //no reaction send yet
}

var buffer_size = buffer_tell(player_buffer);
    
// Now send all data... to all clients
for(i=0;i<count;i++)
{   
    // Get the player's instance, so we can get it's id
    var sock = ds_list_find_value(socketlist,i);
    var inst = ds_map_find_value(Clients, sock);
    
    // Write the players ID at the start
    buffer_seek(player_buffer, buffer_seek_start, 0);
    buffer_write(global.player_buffer, buffer_s16, inst.socketID );

    // Send data to client
    network_send_packet( sock,player_buffer, buffer_size );
}
