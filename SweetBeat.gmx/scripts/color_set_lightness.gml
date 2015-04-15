/// color_set_lightness(color, amount, use_gm_range [optional])

/// amount: value from 0 - 100 [or 0 - 240]

var _rgb, _hsl;
var use_gm_range, _max;

if argument_count = 3 and argument[2] = true
    {use_gm_range = true
    _max = 240}
    else
    {use_gm_range = false
    _max = 100}

_hsl = rgb_to_hsl(argument[0], use_gm_range)

_hsl[2] = clamp(argument[1],0,_max)

_rgb = make_color_hsl(_hsl[0],_hsl[1],_hsl[2], use_gm_range)

return _rgb