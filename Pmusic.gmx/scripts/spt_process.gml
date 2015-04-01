///void spt_process(id,action)

var obj = argument0;
var action = argument1;

with (obj){
    switch (action){
    //for player
    case 0://move forward;
        //physics_apply_impulse(x,y,jump_force,0);    
        alarm[0] = 1;
        break;
    case 1://turn
        face_direction *= -1; 
        image_xscale *= -1;
    
        break;
    case 2://jump
        physics_apply_impulse(x,y,0,jump_force);
        break;
    case 3://dash
        physics_apply_impulse(x,y,image_xscale * move_force_x,jump_force);
        break;
    case 4:
        fb = instance_create(x,y,obj_fireball);
        with(fb){
            physics_apply_impulse(x,y,other.image_xscale * 100,0);
        }
        
        break;    
    }
}
