targetSocket = argument0;
resultTotal = argument1;
text = argument2;

// Regular position updates
var roll_buffer = buffer_create(512, buffer_grow, 1);

// Reset buffer to start 
buffer_seek(roll_buffer, buffer_seek_start, 0);

// Write client ID
buffer_write(roll_buffer, buffer_s16, targetSocket);

// Write packet type
buffer_write(roll_buffer, buffer_s16, 2);  // 'Roll' type

// Write result
buffer_write(roll_buffer, buffer_s16, resultTotal);

// Write text
buffer_write(roll_buffer, buffer_string, text);

// Get size
var buffer_size = buffer_tell(roll_buffer);

// Send data to client
network_send_packet(targetSocket, roll_buffer, buffer_size );

buffer_delete(roll_buffer);

