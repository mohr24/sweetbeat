/// DrawSpriteTiledPart(sprite, subimage, x, y, width, height, x_part, y_part, w_part, h_part)

var sprite = argument0;
var subimage = argument1;
var _x = argument2;
var _y = argument3;
var width = argument4;
var height = argument5;
var x_part = argument6;
var y_part = argument7;
var w_part = argument8;
var h_part = argument9;

if (InCurrentView(_x, _y, _x + width, _y + height))
{
    var v_left = view_xview[view_current];
    var v_right = v_left + view_wview[view_current];
    var v_top = view_yview[view_current];
    var v_bottom = v_top + view_hview[view_current];
    
    if (v_left > _x)
    {
        var shift = floor((v_left - _x) / w_part) * w_part;
        _x += shift;
        width -= shift;
    }
    if (v_top > _y)
    {
        var shift = floor((v_top - _y) / h_part) * h_part;
        _y += shift;
        height -= shift;
    }

    width = min(width, v_right - _x);
    height = min(height, v_bottom - _y);
    var h_tile = width / w_part;
    var v_tile = height / h_part;
    
    var last_width = w_part * frac(h_tile);
    var last_height = h_part * frac(v_tile);
    
    h_tile = floor(h_tile);
    v_tile = floor(v_tile);
    
    var x_off = _x;
    var y_off = _y;
    repeat(h_tile)
    {
        repeat(v_tile)
        {
            draw_sprite_part(sprite,subimage,x_part,y_part,w_part,h_part,x_off,y_off);
            y_off += h_part;
        }
        // last piece of column
        draw_sprite_part(sprite,subimage,x_part,y_part,w_part,last_height,x_off,y_off);
        y_off = _y;
        x_off += w_part;
    }
    // last column
    repeat(v_tile)
    {
        draw_sprite_part(sprite,subimage,x_part,y_part,last_width,h_part,x_off,y_off);
        y_off += h_part;
    }
    // last piece
    draw_sprite_part(sprite,subimage,x_part,y_part,last_width,last_height,x_off,y_off);
}
