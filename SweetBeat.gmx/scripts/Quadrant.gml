/// Quadrant(objA,objB) -> B's relation to A
enum quadrant
{
    top,
    left,
    bottom,
    right
};

var objA = argument0;
var objB = argument1;

var dr = objA.bbox_right - objB.bbox_left;
var dl = objB.bbox_right - objA.bbox_left;
var db = objA.bbox_bottom - objB.bbox_top;
var dt = objB.bbox_bottom - objA.bbox_top;

var dmin = min(dr,dl,db,dt);
if (dmin == dr)
    return quadrant.right;
if (dmin == dl)
    return quadrant.left;
if (dmin == db)
    return quadrant.bottom;
if (dmin == dt)
    return quadrant.top;
