/// DrawSpriteTiled(sprite, subimage, x, y, width, height)

var sprite = argument0;
var subimage = argument1;
var _x = argument2;
var _y = argument3;
var width = argument4;
var height = argument5;

var total_width = sprite_get_width(sprite);
var total_height = sprite_get_height(sprite);
var xoffset = sprite_get_xoffset(sprite);
var yoffset = sprite_get_yoffset(sprite);

var h_tile = width / total_width;
var v_tile = height / total_height;

// recalculate _x and _y to top left
// draw_sprite_part uses x,y as top left while draw_sprite uses it at xoffset yoffset
var scaled_xoffset = xoffset * h_tile;
var scaled_yoffset = yoffset * v_tile;
_x -= scaled_xoffset;
_y -= scaled_yoffset;

DrawSpriteTiledPart(sprite, subimage, _x, _y, width, height, 0, 0, total_width, total_height);
