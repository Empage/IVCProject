/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"
#include "ball_trajectory2.inc"

#include "static/figure.inc"

#local max_ball_speed = 42; /* m/s */

#debug concat("clock: ",str(clock, 0, 5),"\n")

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

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

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
			rotate <0, 10, 70>
			rotate y * (20 * clk - 20)
			translate rB_loc
			translate <0, 0.15 * clk - 0.15, 0.4 * clk - 0.4>
		}

		ball_trajectory(<3.529, 2.310, 9.744>, max_ball_speed * 2/3, -10, -20, clock-0.75)
	#break
	/* ball from racket B to wall */
	#range (0.98,1.133)
		#local clk = (clock - 0.980) / (1.133-0.980);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		object {
			racket
			rotate <0, 0, -70>
			rotate y * (0 + 15*clk)
			translate <5.2, 1.15, 3.5>
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 10, 70>
			translate rB_loc
		}
		ball_trajectory(<1.326, 0.932, 3.402>, max_ball_speed, 10, 20, clock-0.98)
	#break
	/* ball from wall <3.524, 1.933, 9.730> back to racket A <5.554, 0.682, 3.884> */
	#range (1.133,1.345)
		#local clk = (clock - 1.133) / (1.345-1.133);

		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		/* calculate end position of base point (gripper) of racket A */
		/* first translate from gripper to hit point coords */
		#local rA_loc = <5.20, 1.15, 3.50> + vrotate(<0, hit_point, 0>, <0, 0, -70>); 
		/* then add the translation to hit the ball and transform back to gripper coords */
		#local rA_loc = <
				rA_loc.x + (5.554 - rA_loc.x)*clk*clk, 
				rA_loc.y + (0.682 - rA_loc.y)*clk*clk, 
				rA_loc.z + (3.884 - rA_loc.z)*clk*clk + sq_ball_r
			> - vrotate(<0, hit_point, 0>, <0, 0, -70>);

		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			rotate y * (15 - 15*clk*clk)
			translate rA_loc
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 10, 70>
			translate rB_loc
		}
		ball_trajectory(<3.524, 1.933, 9.730>, max_ball_speed * 2/3, -10, 20, clock-1.133)
	#break
	/* ball from racket A <5.554, 0.682, 3.884> to wall <3.514, 1.619, 9.757> */
	#range (1.345,1.487)
		camera {
			location <2.8, 3.5, -0.5>
			look_at <3.2, 1.0, 5>
		}

		/* calculate end position of base point (gripper) of racket A */
		#local rA_loc = <5.554, 0.682, 3.884 + sq_ball_r> 
						- vrotate(<0, hit_point, 0>, <0, 0, -70>);

		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			translate rA_loc
		}
		/* racket B (left) */
		object {
			racket
			rotate <0, 10, 70>
			translate rB_loc
		}
		ball_trajectory(<5.554, 0.682, 3.884>, max_ball_speed, 10, -20, clock-1.345)
	#break
	/* ball from wall <3.514, 1.619, 9.757> to floor <1.034, 0.031, 2.615> */
	#range (1.487, 1.746)
		#local clk = (clock - 1.487) / (1.746 - 1.487);
		camera {
			location <
				2.8 + 1*clk, 
				3.5, 
				-0.5 - 1*clk
			>
			look_at <
				3.2 - 1.5*clk, 
				1.0, 
				5 - 4*clk
			>
		}

		/* calculate end position of base point (gripper) of racket A */
		#local rA_loc = <5.554, 0.682, 3.884 + sq_ball_r> 
						- vrotate(<0, hit_point, 0>, <0, 0, -70>);

		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			translate rA_loc
		}

		/* calculate end position of base point (gripper) of racket B*/
		#local rB_loc = <
			1.326 - (1.326 - 0.431) * clk*clk, 
			0.932 - (0.932 - 0.742) * clk, 
			3.422 - (3.422 - 1.016) * clk*clk
		> - vrotate(<0, hit_point, 0>, <-35, 0, 70>);

		/* racket B (left) */
		object {
			racket
			rotate <0 - 50 * clk, 10, 70>
			translate rB_loc
		}
		ball_trajectory(<3.514, 1.619, 9.757>, max_ball_speed * 2/3, -10, -20, clock-1.487)
	#break
	/* from floor <1.034, 0.031, 2.615> to racket at <0.431, 0.742, 1.016> */
	#range (1.746, 1.830)
		#local clk = (clock - 1.746) / (1.830 - 1.746);
		camera {
		  location <3.8, 3.5, -1.5>
		  look_at <1.7, 1.0, 1>
		}

		/* calculate end position of base point (gripper) of racket A */
		#local rA_loc = <5.554, 0.682, 3.884 + sq_ball_r> 
						- vrotate(<0, hit_point, 0>, <0, 0, -70>);

		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			translate rA_loc
		}

		#local rB_loc = <0.431, 0.742, 1.016>
						- vrotate(<0, hit_point, 0>, <-35, 0, 70>);
		/* racket B (left) */
		object {
			racket
			rotate <-50 + 15*clk*clk, 10, 70>
			translate rB_loc
		}
		ball_trajectory2(<1.034, 0.031, 2.615>, max_ball_speed * 1/2, 25, -20, -1, clock-1.746)
	#break
	/* from racket at <0.431, 0.742, 1.016> to sidewall <0.017, 1.150, 1.904> */
	#range (1.830, 1.865)
		#local clk = (clock - 1.830) / (1.865 - 1.830);
		camera {
			location <3.8, 3.5, -1.5>
			look_at <
				1.7 + 0.5*clk, 
				1.0 + 0.5*clk, 
				1
			>
		}

		/* calculate end position of base point (gripper) of racket A */
		#local rA_loc = <5.554, 0.682, 3.884 + sq_ball_r> 
						- vrotate(<0, hit_point, 0>, <0, 0, -70>);

		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			translate rA_loc
		}

		#local rB_loc = <0.431, 0.742, 1.016>
						- vrotate(<0, hit_point, 0>, <-35, 0, 70>);
		/* racket B (left) */
		object {
			racket
			rotate <-35, 10, 70>
			translate rB_loc
		}
		ball_trajectory2(<0.431, 0.742, 1.016>, max_ball_speed * 2/3, 25, -25, 1, clock-1.830)
	#break
	/* from sidewall at <0.017, 1.150, 1.904> to mainwall at <3.665, 3.969, 9.726> */
	#range (1.865, 2.277)
		#local clk = (clock - 1.865) / (2.277 - 1.865);
		camera {
			location <3.8, 3.5, -1.5 + 1*clk>
			look_at <
				2.2 + 1*clk, 
				1.5,
				1.0 + 4*clk
			>
		}

		/* calculate end position of base point (gripper) of racket A */
		#local rA_loc = <5.554, 0.682, 3.884 + sq_ball_r> 
						- vrotate(<0, hit_point, 0>, <0, 0, -70>);

		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			translate rA_loc
		}

		#local rB_loc = <0.431, 0.742, 1.016>
						- vrotate(<0, hit_point, 0>, <-35, 0, 70>);
		/* racket B (left) */
		object {
			racket
			rotate <-35, 10, 70>
			translate rB_loc
		}
		ball_trajectory2(<0.017, 1.150, 1.904>, max_ball_speed * 1/2, 25, 25, 1, clock-1.865)
	#break
	/* from mainwall at <3.665, 3.969, 9.726> to */
	#range (2.277, 2.577)
//		#local clk = (clock - 1.830) / (1.830 - 1.865);
		camera {
		  location <3.8, 3.5, -0.5>
		  look_at <3.2, 1.5, 5>
		}

		/* calculate end position of base point (gripper) of racket A */
		#local rA_loc = <5.554, 0.682, 3.884 + sq_ball_r> 
						- vrotate(<0, hit_point, 0>, <0, 0, -70>);

		/* racket A (right) */
		object {
			racket
			rotate <0, 0, -70>
			translate rA_loc
		}

		#local rB_loc = <0.431, 0.742, 1.016>
						- vrotate(<0, hit_point, 0>, <-35, 0, 70>);
		/* racket B (left) */
		object {
			racket
			rotate <-35, 10, 70>
			translate rB_loc
		}
		ball_trajectory2(<3.665, 3.969, 9.726>, max_ball_speed * 1/3, 10, 25, -1, clock-2.277)
	#break
#end
