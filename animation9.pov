/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#include "ball_trajectory2.inc"

#include "ball_trajectory3.inc"

#include "static/figure.inc"

#local door_loc = <3.2 + sq_glass_door_width/2, 0, 0>;
object {
	sq_glass_door
	translate door_loc
}

//RacketA
object {
	racket
	rotate <0, 0, -70>
	translate <5.2, 1.15, 3.5>
}
	
//RacketB
#local rB_loc = <1.326, 0.932, 3.402 + 2 * sq_ball_r> 
			  - vrotate(<0, hit_point, 0>, <0, 0, 70>);
object {
	racket
	rotate <0, 0, 70>
	translate rB_loc  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
}

#switch (clock)

    #range (0.0, 1.0)
        #local clk = clock;
        camera {
            location <2.8+(0.2*clk), 3.5, -0.5>
            look_at <3.2-(3.2*clk), 1.0, 5-(5*clk)>
        }
    #break
    
    #range (1.0, 2.0)
        #local clk = clock - 1.0;
        camera {
            location <3.0+(0.2*clk), 3.5, -0.5>
            look_at <3.2*clk, 1.0, -(3*clk)>
        }
        
        object {
            drawFigure(<0,0,0>, <0,0,20>, <0,0,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, <0 ,0 ,-50 * pow(clk,2) + 50 * clk + 50>, -<0 ,0 ,-50 * pow(clk,2) + 50 * clk + 50>, <0,0,50 * pow(clk,2) - 50 * clk + 40>, -<0 ,0 ,50 * pow(clk,2) - 50 * clk + 40>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <3, 0.75, -2.8>   
        }
        
        object {
            drawFigure(<0,0,0>, <0,0,20>, <0,0,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, <0 ,0 ,-50 * pow(clk,2) + 50 * clk + 45>, -<0 ,0 ,-50 * pow(clk,2) + 50 * clk + 45>, <0,0,50 * pow(clk,2) - 50 * clk + 45>, -<0 ,0 ,50 * pow(clk,2) - 50 * clk + 45>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <4, 0.75, -2.8>
        }
    #break
    
    #range (2.0, 3.0)
        #local clk = clock - 2.0;
        camera {
            location <3.2, 3.5, -0.5>
            look_at <3.2, 1.0, -3>
        }
        
        object {
            drawFigure(<0,0,0>, <0,0,20>, <0,0,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, <0 ,0 ,-50 * pow(clk,2) + 50 * clk + 50>, -<0 ,0 ,-50 * pow(clk,2) + 50 * clk + 50>, <0,0,50 * pow(clk,2) - 50 * clk + 40>, -<0 ,0 ,50 * pow(clk,2) - 50 * clk + 40>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <3, 0.75, -2.8>   
        }
        
        object {
            drawFigure(<0,0,0>, <0,0,20>, <0,0,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, <0 ,0 ,-50 * pow(clk,2) + 50 * clk + 45>, -<0 ,0 ,-50 * pow(clk,2) + 50 * clk + 45>, <0,0,50 * pow(clk,2) - 50 * clk + 45>, -<0 ,0 ,50 * pow(clk,2) - 50 * clk + 45>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            rotate <0,180,0>
            translate <4, 0.75, -2.8>
        }
    #break
#end
/*
camera {
            location <3.2, 3.5, -0.5>
            look_at <3.2, 1.0, -3>
        }*/
