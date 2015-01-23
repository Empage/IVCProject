/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#include "ball_trajectory2.inc"

#include "ball_trajectory3.inc"

#include "static/figure.inc"

#local max_ball_speed = 42; /* m/s */

/* ball location: */
/* rotate the same as the racket to have in the right position */
/* and translate it to the correct position, i.e. the racket base pos */
#local b_loc = vrotate(<0, hit_point, 0>, <0, 0, -70>) + 
			   <5.2, 1.15, 3.5 + 2 * sq_ball_r>;
/* calculate end position of base point (gripper) of racket B*/
/* <1.809, 0.756, 3.442> */
#local rB_loc = <1.326, 0.932, 3.402 + 2 * sq_ball_r> 
			  - vrotate(<0, hit_point, 0>, <0, 0, 70>);

camera {
  location <2.8, 3.5, -0.5>
  look_at <3.2, 1.0, 5>
}

#switch (clock)
	/* upper swing of the racket */
	#range (0.0,0.3)
		#local clk = clock / 0.3;

        
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
			translate rB_loc  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
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
			translate rB_loc  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
		}

		object {
			ball
			translate b_loc
		}
	#break
	/* ball flying to the wall */
	/* start at b_loc, hits the wall at <3.529, 2.846, 9.625> */
	#range (0.6, 0.75)
	    #local clk = (clock - 0.6) / (0.75 - 0.6);
	    
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
			//translate rB_loc /* <1.809, 0.756, 3.442> */
			translate <1.809-0.7*clk, 0.756-0.03*clk, 3.442-0.6*clk>  - vrotate(<0, hit_point, 0>, <0, 0, 70>) // <1.135, 0.728, 2.864>
		}

		ball_trajectory(b_loc, max_ball_speed, 15, -20, clock-0.6)
	#break
    /* ball jumping back from wall */
	/* start at <3.529, 2.846, 9.625>, 
	 * gets hit by racket at <1.326, 0.932, 3.402> at clock = 1
	 */
	#range (0.75, 1.0)
		/* clk shall range from 0 to 1 again */
		#local clk = (clock - 0.75) / (1 - 0.75);

		object {
			racket
			rotate <0, 0, -70>
			translate <5.2, 1.15, 3.5> - vrotate(<0, hit_point, 0>, <0, 0, -70>)*clk
		}

		//#debug concat("rB_loc = ",vstr(3, rB_loc,", ",0,3),"\n")
			   	
		/* racket B (left) */
		object {
			racket
			rotate <15*clk, 10, 70>
			rotate y * (20 * clk - 20)
			translate <1.135, 0.728, 2.864>  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
			translate <0, 0.15 * clk - 0.15, 0.4 * clk - 0.4> //- vrotate(<0, hit_point, 0>, <0, 0, 70>)
		}

		ball_trajectory(<3.529, 2.846, 9.625>, max_ball_speed * 2/3, -15, -20, clock-0.75)
	#break
	
	//racketB to wall
	#range (1.0, 1.166)
	     #local clk = (clock - 1.0) / (1.166 - 1.0);
	     
	     object {
			racket
			rotate <15-15*clk, 0, -70>
			translate <5.2, 1.15, 3.5> - vrotate(<0, hit_point, 0>, <0, 0, -70>)
		}
		
		object {
			racket
			rotate <0, 10, 70>
			translate <1.135, 0.728, 2.864>  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
		}
		
		ball_trajectory2(<1.135, 0.728, 2.864>, max_ball_speed, 10, 25, 1, clock-1.0)
	#break
	
	//backwall to sidewall
	#range (1.166, 1.36)
	     #local clk = (clock - 1.166) / (1.36 - 1.166);
	     
	     object {
			racket
			rotate <-15*clk, 0, -70-(70*clk)>
			translate <5.2+0.643*clk, 1.15-0.7*clk, 3.5-0.35*clk> - vrotate(<0, hit_point, 0>, <0, 0, -70-(70*clk)>)  //<5.843, 0.44, 3.148>
		}
		
		object {
			racket
			rotate <0, 10, 70>
			translate <1.135+clk, 0.728, 2.864+clk>  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
		}
		
		ball_trajectory2(<4.087, 1.805, 9.744>, max_ball_speed * 2/3, -10, 25, -1, clock-1.166) // <4.08741, 1.80540, 9.74387>
	#break
	
	//sidewall to racketA
	#range (1.36, 1.42)
	     #local clk = (clock - 1.36) / (1.42 - 1.36);
	     
	     object {
			racket
			rotate <-15+20*clk, 0, -140>
			translate <5.843, 0.44, 3.148> - vrotate(<0, hit_point, 0>, <0, 0, -140>)
		}
		
		object {
			racket
			rotate <0, 10, 70>
			translate <2.135, 0.728, 3.864>  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
		}
		
		ball_trajectory2(<6.38, 0.679, 4.400>, max_ball_speed * 1/2, -10, -25, -1, clock-1.36) // <6.38, 0.679, 4.400>
	#break
	 
	// racketA to wall
	#range (1.42, 1.656)
	     #local clk = (clock - 1.42) / (1.656 - 1.42);
	     
	     object {
			racket
			rotate <5, 0, -140+(70*clk)>
			translate <5.843-2*clk, 0.44+0.3*clk, 3.148> - vrotate(<0, hit_point, 0>, <0, 0, -140+(70*clk)>)
		}
		
		object {
			racket
			rotate <0, 10, 70>
			translate <2.135+clk, 0.728, 3.864>  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
		}
		
		ball_trajectory2(<5.843, 0.44, 3.148>, max_ball_speed * 2/3, 5, 0, 1, clock-1.42) // <5.843, 0.44, 3.148>
	#break
	
    // racketA to wall
	#range (1.656, 2.1)
	     #local clk = (clock - 1.656) / (2.1 - 1.656);
	     
	     object {
			racket
			rotate <5, 0, -70>
			translate <3.843, 0.74, 3.148> - vrotate(<0, hit_point, 0>, <0, 0, -70>)
		}
		
		object {
			racket
			rotate <180*clk, 10, 70>
			translate <3.135+2*clk, 0.728, 3.864>  - vrotate(<0, hit_point, 0>, <0, 0, 70>)
		}
		
		ball_trajectory3(<5.843, 0.743, 9.731>, max_ball_speed * 1/2, 5, 0, -1, clock-1.656, clock-1.42, max_ball_speed * 2/3, 0.44) // <5.843, 0.743, 9.731>
	#break
	
#end