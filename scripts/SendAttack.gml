/// Send a Dash to server
// arg0 = type (Attack or Bonus attack)
// arg1 = target xx
// arg2 = target yy
// arg3 = weapon
{
    buffer_seek(buff, buffer_seek_start, 0);

    buffer_write(buff, buffer_s16, ACTION_CMD );
    buffer_write(buff, buffer_string, argument0);
    buffer_write(buff, buffer_s16, argument1);
    buffer_write(buff, buffer_s16, argument2);
    buffer_write(buff, buffer_s16, argument3);

    // Send this to the server
    network_send_packet( client, buff, buffer_tell(buff) );
}

