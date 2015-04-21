/// InCurrentView(x1,y1,x2,y2) -> bool

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var v_left = view_xview[view_current];
var v_right = v_left + view_wview[view_current];
var v_top = view_yview[view_current];
var v_bottom = v_top + view_hview[view_current];

return (v_left < x2 && v_right > x1 && v_top < y2 && v_bottom > y1);
