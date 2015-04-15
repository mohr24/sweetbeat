/// color_get_hsl_lightness(color, use_gm_range [optional])

var _hsl;
var use_gm_range;

if argument_count = 2 and argument[1] = true
    {use_gm_range = true}
    else
    {use_gm_range = false}

_hsl = rgb_to_hsl(argument[0], use_gm_range)

return _hsl[2]
