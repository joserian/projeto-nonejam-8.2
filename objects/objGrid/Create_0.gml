gridSize = 16;
gridWidth = room_width/gridSize;
gridHeight = room_height/gridSize;

mpGrid = mp_grid_create(-16, -16, gridWidth, gridHeight, gridSize, gridSize);
mp_grid_add_instances(mpGrid, objWall, false);