/* include all static parts */
#include "static/main_static.inc"

/* since I want the reserved "clock" to always run normalised (between 0 and 1), I introduce a local my_clk in every file, where it is needed. It scales the clock to the locally needed value.   */
#local my_clk = 2*clock;

#local ball_y = 1.5;

#switch (my_clk)
	#range (0,1)
		#declare clk = my_clk;
		camera {
			location  <3.2, 1.8, -1> /* original */
			look_at   <sq_field_x/4 + clk * sq_field_x/2, 1.5, 4.3>
		}

		object {
			ball
			translate <
			clk * (sq_field_x - sq_ball_r) + sq_ball_r, 
			abs(ball_y * cos(clk * 2 * pi)), 
			4.3
			>
		}
	#break
	#range (1,2)
		/* clk shall range from 0 to 1 again */
		#declare clk = my_clk - 1;
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
