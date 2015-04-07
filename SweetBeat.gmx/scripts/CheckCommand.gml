/// CheckCommand(command) --> returns true if command is activated this frame

return (obj_manager.command_bitmask & (1 << argument0) != 0);