/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#local max_ball_speed = 42; /* m/s */

/* ball location: */
/* rotate the same as the racket to have in the right position */
/* and translate it to the correct position, i.e. the racket base pos */
#local b_loc = vrotate(<0, hit_point, 0>, <0, 0, -70>) + 
			   <5.2, 1.15, 3.5 + 2 * sq_ball_r>;

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

#switch (clock)
	/* camera moves from <-8.5, 1.7, -1.5> to <2.2, 1.7, -1.5> */
	#range (0.0,3.0)
		#local clk = clock / 3;

		/* shall go from -8.5 to 2.2 */
		#local x_val = (2.2 + 8.5) * clk - 8.5;
		camera {
			location <
				x_val,
				1.7,
				-1.5
			>
			look_at <
				x_val + 1,
				1.6,
				0.5 * sin(2 * pi * 1.25 * clk) - 1.5
			>
		}
	#break
	/* camera flies over glass from <2.2, 1.7, -1.5> to <3.2, 2.5, 0.5> */
	#range (3.0,5.0)
		/* clk shall range from 0 to 1 again */
		#local clk = (clock - 3) / 2;
		
		/* shall linearly go from 2.2 to 3.2 */
		#local x_val_loc = clk + 2.2;
		/* shall go from 1.7 up to 3.5 over the glass and then down to 2.5 */
		#local y_val_loc = -3280/441 * pow(clk,3) + 2972/441 * pow(clk,2) 
					 + 472/315 * clk + 1.7;
		 /* shall go from -1.5 to 0.5 */
		#local z_val_loc = (0.5 + 1.5) * clk - 1.5;

		/* from <3.2, 1.6, -1> to <4.2, 0.4, 4> */
		#local x_val_look = 0;
		#local y_val_look = 0;
		#local z_val_look = 0;
		camera {
			location <x_val_loc, y_val_loc, z_val_loc>
			look_at <
				x_val_loc + 1,
				y_val_loc - 0.1 - 2*clk,
				z_val_loc + 0.5 + 3*clk
			>
		}

	#break
	/* TODO comment */
	#range (5.0,6.0)
		camera {
			location <3.2, 2.5, 0.5>
			look_at <4.2, 0.4, 4.0>
		}
	#break
#end
