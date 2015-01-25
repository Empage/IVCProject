/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"
#include "ball_trajectory2.inc"
#include "ball_trajectory3.inc"
#include "ball_trajectory_tmp.inc"

#include "static/figure.inc"

#local max_ball_speed = 42; /* m/s */

#debug concat("clock: ",str(clock, 0, 5),"\n")

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

#switch (clock)
	/* upper swing of the racket A */
	#range (0.0,0.3)
		#local clk = clock / 0.3;

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}
        
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
	/* the lower swing of the racket A */
	#range (0.3,0.6)
		/* clk shall range from 0 to 1 again */
		#local clk = (clock - 0.3) / 0.3;

		camera {
			location <
				2.8  + (b_loc.x - 2.8) * clk*clk, 
				3.5  + (b_loc.y - 3.5) * clk*clk, 
				-0.5 + (b_loc.z + 0.5) * clk*clk
			>
			look_at <
				3.2 + 0.329 * clk, 
				1.0 + 1.310 * clk, 
				5.0 + 4.744 * clk
			>
		}

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
			rotate <35, 10, 70>
			translate rB_loc
		}

		ball_trajectory_tmp(b_loc, max_ball_speed, 10, -20, clock-0.6)
		camera {
			location <x_val, y_val, z_val>
			look_at <3.529, 2.310, 9.744>
		}
	#break
	/* ball jumping back from wall */
	/* start at <3.529, 2.310, 9.744>, 
	 * gets hit by racket at <1.326, 0.932, 3.402> at clock = 0.98
	 */
	#range (0.75, 0.98)
		/* clk shall range from 0 to 1 again */
		#local clk = (clock - 0.75) / (0.98 - 0.75);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5>
		}

		//#debug concat("rB_loc = ",vstr(3, rB_loc,", ",0,3),"\n")
			   	
		/* racket B (left) */
		object {
			racket
			rotate <35, 10, 70>
			rotate y * (20 * clk - 20)
			translate rB_loc
			translate <0, 0.15 * clk - 0.15, 0.4 * clk - 0.4>
		}

		ball_trajectory_tmp(<3.529, 2.310, 9.744>, max_ball_speed * 2/3, -10, -20, clock-0.75)
		camera {
			location <x_val, y_val, z_val>
			look_at <1.326, 0.932, 3.402>
		}
	#break
	/* ball from racket B to wall */
	#range (0.98,1.567)
		#local clk = (clock - 0.980) / (1.567-0.980);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		object {
			racket
			rotate <0, 0, -70>
			translate <5.2 - 2*clk, 1.15, 3.5>
		}
		/* racket B (left) */
		object {
			racket
			rotate <35, 10, 70>
			translate rB_loc
		}
		ball_trajectory(<1.326, 0.932, 3.402>, max_ball_speed * 1/4, 15, 55, clock-0.98)
	#break
	#range (1.567,1.614)
		#local clk = (clock - 1.567) / (1.614-1.567);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		object {
			racket
			rotate <0, 0, -70>
			translate <3.2 + 0.3 * clk, 1.15, 3.5 + 0.3 * clk>
		}
		/* racket B (left) */
		object {
			racket
			rotate <35, 10, 70>
			translate rB_loc
		}
		ball_trajectory3(<6.375, 0.837, 9.355>, max_ball_speed * 1/5, 15, -55, 1, clock-1.567, clock-0.98, max_ball_speed * 1/4, 0.932)
	#break
	#range (1.614, 1.769)
		#local clk = (clock - 1.614) / (1.769-1.614);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		object {
			racket
			rotate <0, 0, -70>
			translate <3.5 + 1 * clk, 1.15, 3.8 + 1 * clk>
		}
		/* racket B (left) */
		object {
			racket
			rotate <35, 10, 70>
			translate rB_loc
		}
		ball_trajectory3(<6.052, 0.683, 9.736>, max_ball_speed * 1/6, 15, -55, -1, clock-1.614, clock-0.98, max_ball_speed * 1/4, 0.932)
	#break
	#range (1.769, 1.826)
//		#local clk = (clock - 0.980) / (1.567-0.980);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		object {
			racket
			rotate <0, 0, -70>
			translate <4.5, 1.15, 4.8>
		}
		/* racket B (left) */
		object {
			racket
			rotate <35, 10, 70>
			translate rB_loc
		}
		ball_trajectory2(<5.163, 0.023, 8.688>, max_ball_speed * 1/8, 3, -55, -1, clock-1.769)
	#break
	#range (1.826, 2.001)
		#local clk = (clock - 1.826) / (2.000-1.826);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		object {
			racket
			rotate <0, 0, -70>
			translate <4.5, 1.15, 4.8>
		}
		/* racket B (left) */
		object {
			racket
			rotate <35, 10, 70>
			translate rB_loc
		}

		object {
			ball
			translate <
				4.920 - 0.2 * clk, 
				0.023, 
				8.391 - 0.3 * clk
			>
		}
//		ball_trajectory2(<5.163, 0.023, 8.688>, max_ball_speed * 1/8, 3, -55, -1, clock-1.769)
	#break
#end
