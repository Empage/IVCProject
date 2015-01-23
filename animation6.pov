/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#include "static/figure.inc"
/*
camera {
			location <-3.5, 5, -7>
			look_at <-3.5, 1, 0>
		}
*/
/*		
camera {
			location <3, 1.7, 6>
			look_at <3, 1, 4>
		}
*/		           
		
		
#declare step_duration = 0.2;
#declare step_height = 0.5;
#declare step_length = 1;

#declare anim_clock = clock;
#declare step_clock = anim_clock/step_duration;
#declare pi_clock = step_clock * pi;
#declare normal_clock = step_clock - int(step_clock);

#declare left_start = 0;
#declare right_start = 0; // -step_length/2;

#macro Odd(a)
  #local o = true;
  #local i = int(a)/2;
  #if ( i = (int(i)) ) 
    #local o = false;
  #end
  o 
#end

#if (Odd(step_clock))
  #declare left_height = abs(sin(pi_clock)*step_height);
  #declare right_height = 0;
  #declare left_dist = (int(step_clock) - 1)*0.5 + normal_clock;
  #declare right_dist = (int(step_clock) +1)/2;
#else
  #declare left_height = 0;
  #declare right_height = abs(sin(pi_clock)*step_height);
  #declare left_dist = int(step_clock)*0.5; // change
  #declare right_dist = int(step_clock)*0.5 + normal_clock;
#end

#declare right_dist = (right_dist * step_length); //+ right_start;
#declare left_dist = (left_dist * step_length); //+ left_start;
#declare movement = (abs(right_dist+left_dist))/5;

//Player1
#switch (clock)
    #range (0.0,2.0)
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            translate <-7.2, 0.75, 1-movement>
        }
        camera {
			location <-4, 3, -4>
			look_at <-7.2, 1, 0>
		}
        #break

    #range (2.0,12.5)
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,90,0>
            translate <-7.2+movement-2, 0.75, -1>
        }
        camera {
			location <6, 3, -4>
			look_at <0, 1, 0>
		}
        #break
        
    #range (12.5, 14.3)
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,0,0>
            translate <3.3+((movement-12.5)/3), 0.75, -1-movement+12.5>
        }
        camera {
			location <0, 2, -0.5>
			look_at <4, 1, -3>
		}
        #break
    
    #range (14.3, 15.3)
        object {
            drawFigure(<0,0,0>, <(movement-14.3)*90,0 ,20>, <(movement-14.3)*90 ,0 ,-20>, <-(movement-14.3)*90 ,0 ,-20>, <-(movement-14.3)*90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, -<0,0,(movement-14.3)*30>, -<0 ,0 ,(movement-14.3)*30>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <4, 0.75, -2.8-(movement-14.3)*0.4>
        }
        camera {
			location <0, 2, -0.5>
			look_at <4, 1, -3>
		}
        #break
            
    #range (15.3, 16.5)
        object {
            drawFigure(<0,0,0>, <90 ,0 ,20>, <90 ,0 ,-20>, <-90 ,0 ,-20>, <-90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, -<0,0,30>, -<0 ,0 ,30>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <4, 0.75, -3.2>
        }
        camera {
			location <0, 2, -0.5>
			look_at <4, 1, -3>
		}
        #break
        
/*        
    #range (12.5, 14.5)    
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <3.3, 0.75, -1+movement-12.5>
        }
        camera {
			location <6, 3, -4>
			look_at <3.6, 1, 0>
		}
        #break
        
    #range (14.5, 18.0)    
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,135,0>
            translate <3.3+((movement-14.5)*3/4), 0.75, 1+((movement-14.5)*3/4)>
        }
        camera {
			location <6, 3, -4>
			look_at <3.6, 1, 0>
		}
        #break
        
    #range (18.0, 19.0)
        object {
            drawFigure(<0,0,0>, <0,0,20>, <0,0,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <6, 0.75, 3.6>
        }
        camera {
			location <6, 3, -4>
			look_at <3.6, 1, 0>
		}
        #break
*/
#end

//Player 2
#switch (clock)
    #range (0.0,3.0)
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            translate <-7.2, 0.75, 2-movement>
        }
        #break

    #range (3.0,13.5)
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,90,0>
            translate <-7.2+movement-3, 0.75, -1>
        }
        #break
        
    #range (13.5, 15.3)    
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,0,0>
            translate <3.3-((movement-13.5)/7), 0.75, -1-movement+13.5>
        }
        #break
        
    #range (15.3, 16.3)
        object {
            drawFigure(<0,0,0>, <(movement-15.3)*90 ,0 ,20>, <(movement-15.3)*90 ,0 ,-20>, <-(movement-15.3)*90 ,0 ,-20>, <-(movement-15.3)*90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, -<0,0,(movement-15.3)*30>, -<0 ,0 ,(movement-15.3)*30>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <3, 0.75, -2.8-(movement-15.3)*0.4>
        }
        #break
        
    #range (16.3, 16.5)
        object {
            drawFigure(<0,0,0>, <90 ,0 ,20>, <90 ,0 ,-20>, <-90 ,0 ,-20>, <-90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, -<0,0,30>, -<0 ,0 ,30>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <3, 0.75, -3.2>
        }
        #break
/*        
    #range (15.5, 17.0)    
        object {
            drawFigure(<0,0,0>, <right_height*20,right_dist*10,20>, <left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,270,0>
            translate <3.3-(movement-15.5), 0.75, 1>
        }
        #break
        
    #range (17.0, 19.0)
        object {
            drawFigure(<0,0,0>, <0,0,20>, <0,0,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <1.8, 0.75, 1>
        }
        #break
*/
#end
/* Endpositionen (sitzend)
object {
    drawFigure(<0,0,0>, <-90 ,0 ,20>, <-90 ,0 ,-20>, <90 ,0 ,-20>, <90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    translate <2.9, 0.75, -3.2>
}

object {
    drawFigure(<0,0,0>, <-90 ,0 ,20>, <-90 ,0 ,-20>, <90 ,0 ,-20>, <90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    translate <4, 0.75, -3.2>
}
*/