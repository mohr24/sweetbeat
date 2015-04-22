/// SetTrigger(key, true / false)

if (!is_undefined(argument0))   // undefined is no trigger value
    ds_map_replace(obj_trigger_manager.trigger_map, argument0, argument1);