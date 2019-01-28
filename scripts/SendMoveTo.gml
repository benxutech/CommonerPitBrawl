/// Send a key "event" to the server
///
///  arg0 = x
///  arg1 = y
///
{
    // Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
    buffer_seek(buff, buffer_seek_start, 0);

    buffer_write(buff, buffer_s16, MOVE_CMD );
    buffer_write(buff, buffer_s16, argument0 );
    buffer_write(buff, buffer_s16, argument1 );

    // Send this to the server
    network_send_packet( client, buff, buffer_tell(buff) );
}



