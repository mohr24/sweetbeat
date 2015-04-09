/// InstancePlaceList(list,x,y,obj)
var start_idx = ds_list_size(argument0);
while (true)
{
    var overlap = instance_place(argument1,argument2,argument3);
    if (overlap == noone)
        break;
    ds_list_add(argument0, overlap);
    instance_deactivate_object(overlap);
}
for (var i = start_idx; i < ds_list_size(argument0); i += 1)
    instance_activate_object(ds_list_find_value(argument0, i));
