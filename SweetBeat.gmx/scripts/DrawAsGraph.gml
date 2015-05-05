/// DrawAsGraph(x, y, start_value, bar_width, bar_height, list)
var _x = argument0;
var _y = argument1;
var start_value = argument2;
var bar_width = argument3;
var bar_height = argument4;
var list = argument5;

var prev_value = start_value - 1;
var prev_count = 0;
for (var i = 0; i < ds_list_size(list); i++)
{
    var value = ds_list_find_value(list,i);
    if (value != prev_value && prev_value >= start_value)
    {
        draw_rectangle( _x + bar_width*(prev_value - start_value),
                        _y - bar_height*prev_count,
                        _x + bar_width*(prev_value + 1 - start_value),
                        _y,
                        false);
        prev_count = 0;
    }
    prev_count++;
    prev_value = value;
}
draw_rectangle( _x + bar_width*(prev_value - start_value),
                _y - bar_height*prev_count,
                _x + bar_width*(prev_value + 1 - start_value),
                _y,
                false);
