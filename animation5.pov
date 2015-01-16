/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#include "static/figure.inc"

#local max_ball_speed = 42; /* m/s */

/* ball location: */
/* rotate the same as the racket to have in the right position */
/* and translate it to the correct position, i.e. the racket base pos */
#local b_loc = vrotate(<0, hit_point, 0>, <0, 0, -70>) + 
			   <5.2, 1.15, 3.5 + 2 * sq_ball_r>;
#local door_loc = <3.2 + sq_glass_door_width/2, 0, 0>;


object {
	racket
	/* initial position from animation3 */
	rotate <0, 0, -70>
	translate <5.2, 1.15, 3.5>
}
object {
	ball
	translate b_loc 
}

object {
    drawFigure(<0,0,0>, <-90 ,0 ,20>, <-90 ,0 ,-20>, <90 ,0 ,-20>, <90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    translate <2.9, 0.75, -3.2>
}

object {
    drawFigure(<0,0,0>, <-90 ,0 ,20>, <-90 ,0 ,-20>, <90 ,0 ,-20>, <90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    translate <4, 0.75, -3.2>
}


#switch (clock)
	/* TODO comment */
	#range (0.0,1.0)
		#local clk = clock;

		/* shall go from -8.5 to 2.2 */
		#local x_val = (2.2 + 8.5) * clk - 8.5;
		/*
		camera {
			location <
				2.2,
				1.7,
				-2.5
			>
			look_at <
				3.0,
				1.2,
				0.0
			>
		}
		*/
		camera {
			location <0.5, 2.7, 0.1>
			look_at <3.6, 1.2, 5.0>
		}

		object {
			sq_glass_door
			rotate <0, 70, 0>
			rotate <0, -70*clk, 0>
			translate door_loc
		}
	#break
#end
