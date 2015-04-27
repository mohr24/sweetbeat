/// CheckSequenceAt(sequence, counter, fpb, fpm, [opt]command_tripple_map)

var sequence = argument[0];
var counter = argument[1];
var fpb = argument[2];
var fpm = argument[3];
var command_tripple_map = undefined;
if (argument_count == 5)
    command_tripple_map = argument[4];
    
var command_bitmask = 0;

for (var index = 0; index < array_length_1d(sequence); index += 1)
{
    var pair = sequence[index];
    var time = pair[0];
    var action = pair[1];
    
    if (((counter - 1)/fpb <= time && counter/fpb > time)
    || ((counter + fpm - 1)/fpb <= time && (counter + fpm)/fpb > time))
    {   
        command_bitmask = command_bitmask | (1 << action);
        if (array_length_1d(pair) == 3 && !is_undefined(command_tripple_map))
        {
            var extra = pair[2];
            ds_map_add(command_tripple_map,action,extra);
        }
    }
}

return command_bitmask;
