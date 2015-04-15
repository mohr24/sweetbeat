/// make_color_hsl(h, s, l, use_gm_range [optional])

var h, s, l;

if argument_count = 4 and argument[3] = true
    {
    h = argument[0]/239;
    s = argument[1]/240;
    l = argument[2]/240;
    }
    else
    {
    h = argument[0]/360;
    s = argument[1]/100;
    l = argument[2]/100;
    }
    

var r, g, b;
 
if (s = 0) 
    {r = l; g = l; b = l}
    else
    { 
    var q;
    if l < 0.5
        {q = l * (1 + s)}
        else
        {q = l + s - l * s}   

    var p = 2 * l - q;
 
    r = hue_to_rgb(p, q, h + 1/3);
    g = hue_to_rgb(p, q, h);
    b = hue_to_rgb(p, q, h - 1/3);
    }

  
return make_color_rgb(round(r * 255),round(g * 255),round(b * 255))