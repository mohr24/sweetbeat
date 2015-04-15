/// DrawSpritePartitioned(sprite, subimage, lborder, tborder, rborder, bborder, x, y, width, height)

var sprite = argument0;
var subimage = argument1;
var lborder = argument2;
var tborder = argument3;
var rborder = argument4;
var bborder = argument5;
var _x = argument6;
var _y = argument7;
var width = argument8;
var height = argument9;

var xoffset = sprite_get_xoffset(sprite);
var yoffset = sprite_get_yoffset(sprite);
var total_width = sprite_get_width(sprite);
var total_height = sprite_get_height(sprite);

// recalculate _x and _y to top left
var scaled_xoffset = xoffset * (width / total_width);
var scaled_yoffset = yoffset * (height / total_height);
_x -= scaled_xoffset;
_y -= scaled_yoffset;

var right_border = total_width - rborder;
var bottom_border = total_height - bborder;
var tile_width = total_width - (rborder + lborder);
var tile_height = total_height - (bborder + tborder);
var h_tile = (width - (rborder + lborder)) / tile_width;
var v_tile = (height - (bborder + tborder)) / tile_height;
var x_max = _x+(width - rborder);
var y_max = _y+(height - bborder) 
var last_width = tile_width * frac(h_tile);
var last_height = tile_height * frac(v_tile);
h_tile = floor(h_tile);
v_tile = floor(v_tile);

// draw the top left
draw_sprite_part(sprite, subimage, 0, 0, lborder, tborder, _x, _y);
// draw the bottom left
draw_sprite_part(sprite, subimage, 0, bottom_border, lborder, bborder, _x, y_max);
// draw the top right
draw_sprite_part(sprite, subimage, right_border, 0, rborder, tborder, x_max, _y);
// draw the bottom right
draw_sprite_part(sprite, subimage, right_border, bottom_border, rborder, bborder, x_max, y_max);


var x_off = _x + lborder;
var y_off = _y + tborder;
// draw the top and bottom parts
for (var ix = 0; ix < h_tile; ix += 1)
{
    draw_sprite_part(sprite, subimage, lborder, 0, tile_width, tborder, x_off, _y);
    draw_sprite_part(sprite, subimage, lborder, bottom_border, tile_width, bborder, x_off, y_max); 
    x_off += tile_width;
}
// last pieces
draw_sprite_part(sprite, subimage, lborder, 0, last_width, tborder, x_off, _y);
draw_sprite_part(sprite, subimage, lborder, bottom_border, last_width, bborder, x_off, y_max);
// draw the left and right parts
for (var iy = 0; iy < v_tile; iy += 1)
{
    draw_sprite_part(sprite, subimage, 0, tborder, lborder, tile_height, _x, y_off);
    draw_sprite_part(sprite, subimage, right_border, tborder, rborder, tile_height, x_max, y_off);
    y_off += tile_height;
}
// last pieces
draw_sprite_part(sprite, subimage, 0, tborder, lborder, last_height, _x, y_off);
draw_sprite_part(sprite, subimage, right_border, tborder, rborder, last_height, x_max, y_off);
// draw everything in the middle

x_off = _x + lborder;
y_off = _y + tborder;
for (var ix = 0; ix < h_tile; ix += 1)
{
    for (var iy = 0; iy < v_tile; iy += 1)
    {
        draw_sprite_part(sprite, subimage, lborder, tborder, tile_width, tile_height, x_off, y_off);
        y_off += tile_height;
    }
    // bottom piece of column
    draw_sprite_part(sprite, subimage, lborder, tborder, tile_width, last_height, x_off, y_off);
    x_off += tile_width;
    y_off = _y + tborder;
}
// last column
for (var iy = 0; iy < v_tile; iy += 1)
{
    draw_sprite_part(sprite, subimage, lborder, tborder, last_width, tile_height, x_off, y_off);
    y_off += tile_height;
}
// last piece
draw_sprite_part(sprite, subimage, lborder, tborder, last_width, last_height, x_off, y_off);
