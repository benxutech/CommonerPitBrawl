/// Send a move "event" to the server
///
///  arg0 = xx
///  arg1 = yy
///  arg2 = move type (0 = instant, 1 = walk)
///
{
    // Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
    buffer_seek(buff, buffer_seek_start, 0);

    buffer_write(buff, buffer_s16, MOVE_CMD );
    buffer_write(buff, buffer_s16, argument0 );
    buffer_write(buff, buffer_s16, argument1 );
    buffer_write(buff, buffer_s16, argument2 );

    // Send this to the server
    network_send_packet( client, buff, buffer_tell(buff) );
}



