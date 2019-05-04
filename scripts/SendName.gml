// Send character data to server
// Arg0 = List, containing data //ordered according to objCharacter)
{
    // Buffer Start
    buffer_seek(buff, buffer_seek_start, 0);
    // Write the command, and the name into the buffer.
    buffer_write(buff, buffer_s16, NAME_CMD );
    // Write amount of data
    buffer_write(buff, buffer_s16, ds_list_size(argument0));

    var index = 0;
    buffer_write(buff, buffer_string, argument0[|index]); index++;
    buffer_write(buff, buffer_string, argument0[|index]); index++;
    buffer_write(buff, buffer_string, argument0[|index]); index++;
    buffer_write(buff, buffer_string, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    
    buffer_write(buff, buffer_s16, argument0[|index]); index++;
    buffer_write(buff, buffer_s16, argument0[|index]); index++;

/*
    // Write data as buffers
    for (var i=0; i<ds_list_size(argument0); i++) {
        buffer_write(buff, buffer_string, argument0[|i]);
    }    */

    // Send this to the server
    network_send_packet( client, buff, buffer_tell(buff) );
}


