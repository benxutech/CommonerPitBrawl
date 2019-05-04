/// Send a Dash to server
//
{
    buffer_seek(buff, buffer_seek_start, 0);

    buffer_write(buff, buffer_s16, ACTION_CMD );
    buffer_write(buff, buffer_string, 'Dash');

    // Send this to the server
    network_send_packet( client, buff, buffer_tell(buff) );
}

