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

if (InCurrentView(_x, _y, _x + width, _y + height))
{
    var v_left = view_xview[view_current];
    var v_right = v_left + view_wview[view_current];
    var v_top = view_yview[view_current];
    var v_bottom = v_top + view_hview[view_current];

    var lborder_start = 0;
    var tborder_start = 0;
    var rborder_start = total_width - rborder;
    var bborder_start = total_height - bborder;
    var center_border_width = rborder_start - lborder;
    var center_border_height = bborder_start - tborder;
    var center_x = _x + lborder;
    var center_y = _y + tborder;
    var center_width = width - (lborder + rborder);
    var center_height = height - (tborder + bborder);
    var far_x = center_x + center_width;
    var far_y = center_y + center_height;
    
    // draw the top left
    draw_sprite_part(sprite, subimage, lborder_start, tborder_start, lborder, tborder, _x, _y);
    // draw the bottom left
    draw_sprite_part(sprite, subimage, lborder_start, bborder_start, lborder, bborder, _x, far_y);
    // draw the top right
    draw_sprite_part(sprite, subimage, rborder_start, tborder_start, rborder, tborder, far_x, _y);
    // draw the bottom right
    draw_sprite_part(sprite, subimage, rborder_start, bborder_start, rborder, bborder, far_x, far_y);
    
    // draw the left column
    DrawSpriteTiledPart(sprite, subimage, _x, center_y, lborder, center_height, lborder_start, tborder, lborder, center_border_height);
    // draw the top row
    DrawSpriteTiledPart(sprite, subimage, center_x, _y, center_width, tborder, lborder, tborder_start, center_border_width, tborder);
    // draw the right column
    DrawSpriteTiledPart(sprite, subimage, far_x, center_y, rborder, center_height, rborder_start, tborder, rborder, center_border_height);
    // draw the bottom row
    DrawSpriteTiledPart(sprite, subimage, center_x, far_y, center_width, bborder, lborder, bborder_start, center_border_width, bborder);
    
    // draw all the middle stuff
    DrawSpriteTiledPart(sprite, subimage, center_x, center_y, center_width, center_height, lborder, tborder, center_border_width, center_border_height);
}
