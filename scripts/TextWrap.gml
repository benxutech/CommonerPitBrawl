var maxWidth = argument0;
var wrapString = argument1;
var lines = 0;
var tStr = array_create(1);
tStr[0] = "";
for (var i=1; i<string_length(wrapString); i++) {
    tStr[lines] += string_char_at(wrapString, i);
    // Check if line has overfilled
    if (string_width(tStr[lines]) > maxWidth) {
        // Find the last Space in sentence. Use last if none is found
        var lastSpace = string_length(tStr[lines]);
        for (var o=lastSpace; o>0; o--) {
            if (string_char_at(tStr[lines], o) == " ") {
                lastSpace = o;
                break;
            }
        }
        // Insert newline at last space
        tStr[lines] = string_insert("#", tStr[lines], lastSpace);
        // Move onto next line, and initialise it
        lines += 1;
        tStr[lines] = "";
    }
}
// Compile split lines
var outStr = ""
for (var i=0; i<array_length_1d(tStr); i++) {
    outStr += tStr[i];
}

return outStr;
