/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#include "static/figure.inc"

#local max_ball_speed = 42; /* m/s */

#local door_loc = <3.2 + sq_glass_door_width/2, 0, 0>;
object {
	sq_glass_door
	translate door_loc
}

/* ball location: */
/* rotate the same as the racket to have in the right position */
/* and translate it to the correct position, i.e. the racket base pos */
#local b_loc = vrotate(<0, hit_point, 0>, <0, 0, -70>) + 
			   <5.2, 1.15, 3.5 + 2 * sq_ball_r>;
/* calculate end position of base point (gripper) of racket B*/
/* <1.809, 0.756, 3.442> */
#local rB_loc = <1.326, 0.932, 3.402 + 2 * sq_ball_r> 
			  - vrotate(<0, hit_point, 0>, <0, 0, 70>);


/* last camera pos from animation4 */
/*
camera {
	location <3.2, 2.5, 0.5>
	look_at <4.2, 0.4, 4.0>
}
*/
camera {
	location <3.2, 2.5, 0.5>
	look_at <(3.0 - 4.2) * clock/1.42 + 4.2, (1.4 - 0.4) * clock/1.42 + 0.4, 4.0>
}

#switch (clock)
	/* the upper swing of the racket */
	#range (0.0,0.3)
		#local clk = clock / 0.3;
/*		
		// TODO: calculate correct angle for the elbow, so the arm matches the end of the racket
		#local elbow = <0.0, 
				0.0,
				30>;      //<0 ,0 ,30>
	    dbg("elbow", elbow)
        object {
            drawFigure(<0,0,0>, <0 ,0 ,20>, <0 ,0 ,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, elbow, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
            //translate <3.2, 0.9, 9.7>
            translate <4.6,0.8,3.5>
        }
*/
        
		object {
			racket
			rotate <
				0, 
				0,
				-70
			>
			/* use the z-rotated racket and y-rotate it from 0 to 30 degress */
			rotate y * (-60 * pow(clk,3) + 90 * pow(clk,2))
			/* parameter through curve sketching: we want a smooth transition */
			translate <
				5.2, 
				/* from 1.15 over 1.45 to 1.15 in 0.5 seconds */
				-1.2 * pow(clk,2) + 1.2 * clk + 1.15, 
				/* from 3.5 to 2.8 in 0.5 seconds */
				1.4 * pow(clk,3) - 2.1 * pow(clk,2) + 3.5 
			>
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 0, 70>
			translate rB_loc
		}
		object {
			ball
			translate b_loc 
		}
	#break
	/* the lower swing of the racket */
	#range (0.3,0.6)
		/* clk shall range from 0 to 1 again */
		#local clk = (clock - 0.3) / 0.3;

		object {
			racket
			rotate <
				0, 
				0, 
				-70
			>
			/* use the z-rotated racket and y-rotate it from 30 to 0 degress */
			rotate y * (-29 * pow(clk,2) + 30)
			/* parameter through curve sketching: we want a smooth transition */
			translate <
				5.2, 
				/* from 1.15 over 1 to 1.15 in 1 second */
				0.6 * pow(clk,2) - 0.6 * clk + 1.15, 
				/* from 2.8 to 3.5 in 1 second quadratically */
				0.7 * pow(clk,2) + 2.8
			>
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 0, 70>
			translate rB_loc
		}

		object {
			ball
			translate b_loc
		}
	#break
	/* ball flying to the wall */
	/* start at b_loc, hits the wall at <3.529, 2.310, 9.744> */
	#range (0.6, 0.75)
		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5>
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 0, 70>
			translate rB_loc
		}

		ball_trajectory(b_loc, max_ball_speed, 10, -20, clock-0.6)
	#break
	/* ball jumping back from wall */
	/* start at <3.529, 2.310, 9.744>, 
	 * gets hit by racket at <1.326, 0.932, 3.402> at clock = 0.98
	 */
	#range (0.75, 0.98)
		/* clk shall range from 0 to 1 again */
		#local clk = (clock - 0.75) / (0.98 - 0.75);

		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5>
		}

		//#debug concat("rB_loc = ",vstr(3, rB_loc,", ",0,3),"\n")
			   	
		/* racket B (left) */
		object {
			racket
			rotate <0, 10, 70>
			rotate y * (20 * clk - 20)
			translate rB_loc
			translate <0, 0.15 * clk - 0.15, 0.4 * clk - 0.4>
		}

		ball_trajectory(<3.529, 2.310, 9.744>, max_ball_speed * 2/3, -10, -20, clock-0.75)
	#break
	/* ball from racket B to wall */
	#range (0.98,1.133)
		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5>
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 10, 70>
			translate rB_loc
		}
		ball_trajectory(<1.326, 0.932, 3.402>, max_ball_speed, 10, 0, clock-0.98)
	#break
	/* ball from wall to ground (after hit from racket B) */
	/* hits ground at <1.326, 0.041, 1.485> at clock 1.432 */
	#range (1.133,1.432)
		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5>
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 10, 70>
			translate rB_loc
		}
		ball_trajectory(<1.326, 1.933, 9.730>, max_ball_speed * 2/3, -10, 0, clock-1.133)
	#break
#end
