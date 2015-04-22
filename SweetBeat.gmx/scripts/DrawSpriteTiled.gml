/// DrawSpriteTiled(sprite,subimage,x,y,width,height)

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

if (InCurrentView(_x, _y, _x + width, _y + height))
{
    if (v_left > _x)
    {
        var shift = floor((v_left - _x) / total_width) * total_width;
        _x += shift;
        width -= shift;
    }
    if (v_top > _y)
    {
        var shift = floor((v_top - _y) / total_height) * total_height;
        _y += shift;
        height -= shift;
    }

    width = min(width, v_right - _x);
    height = min(height, v_bottom - _y);
    h_tile = width / total_width;
    v_tile = height / total_height;
    
    var last_width = total_width * frac(h_tile);
    var last_height = total_height * frac(v_tile);
    
    h_tile = floor(h_tile);
    v_tile = floor(v_tile);
    
    var x_off = _x;
    var y_off = _y;
    repeat(h_tile)
    {
        repeat(v_tile)
        {
            draw_sprite(sprite,subimage,x_off+xoffset,y_off+yoffset);
            y_off += total_height;
        }
        // last piece of column
        draw_sprite_part(sprite,subimage,0,0,total_width,last_height,x_off,y_off);
        y_off = _y;
        x_off += total_width;
    }
    // last column
    repeat(v_tile)
    {
        draw_sprite_part(sprite,subimage,0,0,last_width,total_height,x_off,y_off);
        y_off += total_height;
    }
    // last piece
    draw_sprite_part(sprite,subimage,0,0,last_width,last_height,x_off,y_off);
}