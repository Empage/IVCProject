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
    drawFigure(<0,0,0>, <90 ,0 ,20>, <90 ,0 ,-20>, <-90 ,0 ,-20>, <-90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, -<0,0,30>, -<0 ,0 ,30>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    rotate <0,180,0>
    translate <4, 0.75, -3.2>
}

object {
    drawFigure(<0,0,0>, <90 ,0 ,20>, <90 ,0 ,-20>, <-90 ,0 ,-20>, <-90 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,80>, <0 ,0 ,80>, -<0,0,30>, -<0 ,0 ,30>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    rotate <0,180,0>
    translate <3, 0.75, -3.2>
}


#switch (clock)
	/* move camera towards door */
	#range (0.0, 3.0)
		#local clk = clock/3;
		/* initial camera pos from animation 6 
			location <0, 2, -0.5>
			look_at <4.0, 1, -3>
		*/
		camera {
			location <
				0 + 3.2*clk, 
				2 - 0.5*clk, 
				-0.5 - 1*clk
			>
			look_at <
				4.0 - 0.8*clk, 
				1, 
				-3 + 5*clk
			>
		}

		object {
			sq_glass_door
			rotate <0, 70, 0>
			translate door_loc
		}
	#break
	/* move camera through door and turn around */
	#range (3.0, 7.0)
		#local clk = (clock-3)/4;

		camera {
			location <
				3.2 - 1*clk*clk, 
				1.5, 
				-1.5 + 4*clk
			>
			look_at <
				3.2, 
				1, 
				2 - 2*clk
			>
		}
		object {
			sq_glass_door
			rotate <0, 70, 0>
			translate door_loc
		}
	#break
	/* close door */
	#range (7.0,8.0)
		#local clk = clock-7;

		camera {
			location <2.2, 1.5, 2.5>
			look_at <3.2, 1.0, 0.0>
		}

		object {
			sq_glass_door
			rotate <0, 70, 0>
			rotate <0, -70*clk, 0>
			translate door_loc
		}
	#break
	/* */
	#range (8.0,11.0)
		#local clk = (clock-8)/3;

		camera {
			location <
				2.2 + 1*clk, 
				1.5 + 1*clk, 
				2.5 - 2*clk
			>
			look_at <
				3.2 + 1*clk, 
				1.0 - 0.6*clk, 
				0.0 + 4*clk
			>
		}
		/* ziel
		camera {
			location <3.2, 2.5, 0.5>
			look_at <4.2, 0.4, 4.0>
		} */
		object {
			sq_glass_door
			translate door_loc
		}
	#break
#end
