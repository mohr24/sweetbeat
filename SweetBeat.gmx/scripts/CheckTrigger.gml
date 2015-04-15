/// CheckTrigger(key) -> boolean

if (is_undefined(argument0))   // undefined is a never-trigger value
    return false;
var ret = ds_map_find_value(obj_trigger_manager.trigger_map,argument0);
if (is_undefined(ret))
    return false;
return ret;
