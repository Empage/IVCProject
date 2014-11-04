#local clk = 2*clock;
#local clk2 = clk - 1;

#local ball_y = 1.5;

#declare ball = sphere {
	<0.02, ball_y, 4.4>, 0.04
	texture {
		pigment {
			color Black
		}
	}
}

#if (clk <= 1)
	object {
		ball
		translate <
			clock * (sq_field_x - 0.02), 
			-g/2 * pow(clk * sqrt(ball_y * 2 / g),2), 
			0
		>
	}
#else
	object {
		ball
		translate -y*ball_y
		translate <
			clock * (sq_field_x - 0.02), 
			g/2 * pow(clk2 * sqrt(ball_y * 2 / g),2), 
			0
		>
	}
#end
