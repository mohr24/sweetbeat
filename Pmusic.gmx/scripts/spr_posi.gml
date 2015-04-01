///int spt_match(action[],action_step[],input[],input_step[],tolerent)

//

var action = argument0;
var action_step = argument1;
var input = argument2;
var input_step = argument3;
var tolerent = argument4;

var action_cnt = action[0];
var input_cnt = input[0];

if (action_cnt < input_cnt){
    //return false;
    input_cnt = action_cnt;
}
if (action[1] != input[1]){return 0;}

for (var i=2;i<=action_cnt;i++){
    var d1 = action_step[i] - action_step[i-1];
    var d2 = input_step[i] - input_step[i-1];

    if (action[i] != input[i] or abs(d1-d2)/d1 > tolerent){return i-1;}
}
/*
for (var i=2;i<=action_cnt;i++){
    var d1 = action_step[i] - action_step[i-1];
    var d2 = input_step[i] - input_step[i-1];
    if (abs(d1-d2)/d1 > tolerent){
        return false;
    }
}*/
return action_cnt;
