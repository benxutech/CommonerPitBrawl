xx = argument0;
yy = argument1;/*
gridSize = argument2;
vertRatio = argument3;*/

real_x = xx*global.gridSize;
real_y = yy*global.gridSize;

out[0] = real_x-real_y;
out[1] = (real_y+real_x)*global.vertRatio;

return out;
