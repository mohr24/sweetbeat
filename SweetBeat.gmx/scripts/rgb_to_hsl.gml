/// rgb_to_hsl(color, use_gm_range [optional])
 
var r = color_get_red(argument[0])/255
var g = color_get_green(argument[0])/255
var b = color_get_blue(argument[0])/255

var _max = max(r, g, b), _min = min(r, g, b);
var h, s, l = (_max + _min) / 2;

if (_max = _min) 
    {h = 0; s = 0}
    else
    {
    var d = _max - _min;
    
    if l > 0.5
        {s = d / (2 - _max - _min)}
        else
        {s = d / (_max + _min)}
    
      switch (_max) 
      {
        case r: 
            h = (g - b) / d
            if g < b {h += 6} ; break;
        case g:
            h = (b - r) / d + 2; break;
        case b:
            h = (r - g) / d + 4; break;
      }

    h /= 6;
    }

var hsl;
    
if argument_count = 2 and argument[1] = true
    {
    hsl[0] = round(h*239)
    hsl[1] = round(s*240)
    hsl[2] = round(l*240)
    }
    else
    {  
    hsl[0] = round(h*360)
    hsl[1] = round(s*100)
    hsl[2] = round(l*100)
    }

return hsl