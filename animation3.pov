/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#local max_ball_speed = 42; /* m/s */

/* ball location: */
/* rotate the same as the racket to have in the right position */
/* and translate it to the correct position, i.e. the racket base pos */
#local b_loc = vrotate(<0, hit_point, 0>, <0, 0, -70>) + 
			   <5.2, 1.15, 3.5 + 2 * sq_ball_r>;

camera {
	location  <3.0, 1.7, 0.3>
	look_at   <3.7,1.15,4.5>
}

/* look at tribune */
/*
camera {
	location  <2.0, 1.7, 4>
	look_at   <1,1.15,-3.5>
}
*/

#switch (clock)
	/* the upper swing of the racket */
	#range (0,0.5)
		#local clk = clock * 2;

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
		object {
			ball
			translate b_loc 
		}
	#break
	/* the lower swing of the racket */
	#range (0.5,1)
		/* clk shall range from 0 to 1 again */
		#local clk = clock * 2 - 1;

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

		object {
			ball
			translate b_loc
		}
	#break
	/* ball flying to the wall */
	/* start at b_loc, hits the wall at <3.529, 2.310, 9.744> */
	#range (1, 1.150)
		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5>
		}

		ball_trajectory(b_loc, max_ball_speed, 10, -20, clock-1)
	#break
	/* ball jumping back from wall */
	/* start at <3.529, 2.310, 9.744>, hits the wall at TODO */
	#range (1.150, 1.4)
		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5>
		}

		ball_trajectory(<3.529, 2.310, 9.744>, max_ball_speed * 2/3, -10, -20, clock-1.150)
	#break
#end
