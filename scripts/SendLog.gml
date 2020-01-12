// input: string
var text = argument0;

var log_buffer = buffer_create(256, buffer_grow, 1);

// Reset buffer to start 
buffer_seek(log_buffer, buffer_seek_start, 0);

// Write client ID
buffer_write(log_buffer, buffer_s16, 0);  // placeholder ID

// Write packet type
buffer_write(log_buffer, buffer_s16, 3); 

// Write text
buffer_write(log_buffer, buffer_string, text);

// Get size
var buffer_size = buffer_tell(log_buffer);

// Send data to all clients
var count = ds_list_size(socketlist);
for(i=0; i<count; i++)
{   
    // Get the player's instance, so we can get it's id
    var sock = ds_list_find_value(socketlist, i);
    // Send data to client
    network_send_packet(sock, log_buffer, buffer_size);
}

buffer_delete(log_buffer);

