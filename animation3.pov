/* include all static parts */
#include "static/main_static.inc"

camera {
	location  <4.0, 1.7, 2.5>
	look_at   <6.4-0.8,1.15,3.5>
}

object {
	ball
	translate <0, hit_point, 0>
	/* rotate the same as the racket to have in the right position */
	rotate z * -70
	/* now translate it to the correct position, i.e. the racket base pos */
	translate <5.2, 1.15, 3.5 + 2 * sq_ball_r>
}

#switch (clock)
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
			/* I have to use clk/2 here, because I accidently did the 
		   	   curve sketching between 0 and 0.5 instead of 0 and 1	*/
			translate <
				5.2, 
				/* from 1.15 over 1.45 to 1.15 in 0.5 seconds */
				-4.8 * pow(clk/2,2) + 2.4 * clk/2 + 1.15, 
				/* from 3.5 to 2.8 in 0.5 seconds */
				11.2 * pow(clk/2,3) - 8.4 * pow(clk/2,2) + 3.5 
			>
		}
	#break
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
	#break
#end
