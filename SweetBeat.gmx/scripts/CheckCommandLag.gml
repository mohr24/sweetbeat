/// CheckCommandLag(command) --> returns true if command is activated next lag frame

return (obj_manager.command_lag_bitmask & (1 << argument0) != 0);
