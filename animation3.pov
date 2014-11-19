/* include all static parts */
#include "static/main_static.inc"

camera {
	location  <4.0, 1.7, 2.5>
	look_at   <6.4-0.8,1.15,3.5>
}

object {
	ball
	translate <3.2, 1+hit_point, 9.5>
}

#switch (clock)
	#range (0,1)
		#local clk = clock;

		object {
			racket
			rotate <
				0, 
				0, 
				-70
			>
			translate <
				5.2, 
				1.15, 
				3.5
			>
		}
	#break
	#range (1,2)
		/* clk shall range from 0 to 1 again */
		#local clk = clock - 1;
		#debug concat("clk: ",str(clk, 0, 5),"\n")
		camera {
			location  <3.2, 1.8, -1> /* original */
			look_at   <3* sq_field_x/4 - clk * sq_field_x/2, 1.5, 4.3>
		}

		object {
			ball
			translate <
			-clk * (sq_field_x - sq_ball_r) + sq_field_x - sq_ball_r, 
			abs(ball_y * cos(clk * 2 * pi)), 
			4.3
			>
		}
	#break
#end
