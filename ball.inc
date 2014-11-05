/* since I want the reserved "clock" to always run normalised (between 0 and 1), I introduce a local my_clk in every file, where it is needed. It scales the clock to the locally needed value.   */
#local my_clk = 2*clock;

#local ball_y = 1.5;

#declare ball = sphere {
	<0.02, 0, 4.4>, 0.04
	texture {
		pigment {
			color Black
		}
	}
}
object {
	ball
	translate <
	clock * (sq_field_x - 0.02), 
	abs(ball_y * cos(clock * 2 * pi)), 
	0
	>
}

/*
#switch (my_clk)
	#range (0,1)
		#declare clk = my_clk;
		object {
			ball
			translate <
				0, 
				/* Newtons gravity function inversed, time scaled by clk */
				-g/2 * pow(clk * sqrt(ball_y * 2 / g),2), 
				0
			>
		}
	#break
	#range (1,2)
		/* clk shall range from 0 to 1 again */
		#declare clk = my_clk - 1;
		object {
			ball
			/* first translate the ball to the last location of latter case */
			translate -y*ball_y
			translate <
				0, 
				-g/2 * pow(clk * sqrt(ball_y * 2 / g),2), 
				0
			>
		}
	#break
#end
*/
