/// hue_to_rgb(p, q, t)

var p = argument0;
var q = argument1;
var t = argument2;

if (t < 0) t += 1;
if (t > 1) t -= 1;
if (t < 1/6) return (p + (q - p) * 6 * t);
if (t < 1/2) return q;
if (t < 2/3) return (p + (q - p) * (2/3 - t) * 6);

return p;