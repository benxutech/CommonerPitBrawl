/// Send a Dash to server
// arg0 = target xx
// arg1 = target yy
// //arg2 = weapon
{
    buffer_seek(buff, buffer_seek_start, 0);

    buffer_write(buff, buffer_s16, ACTION_CMD );
    buffer_write(buff, buffer_string, 'Attack');
    buffer_write(buff, buffer_s16, argument0);
    buffer_write(buff, buffer_s16, argument1);

    // Send this to the server
    network_send_packet( client, buff, buffer_tell(buff) );
}

