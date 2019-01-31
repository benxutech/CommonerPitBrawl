xx = argument0;
yy = argument1;

real_x = xx*GRID_SIZE;
real_y = yy*GRID_SIZE;

out[0] = real_x-real_y;
out[1] = (real_y+real_x)*VERT_RATIO;

return out;
