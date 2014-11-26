#include "static/MyRoundConicTorus.inc"

#local scaling_x	= 1.4;
#local upper_r		= 0.11;
#local lower_r		= 0.051;
#local border_r		= 0.005;
#local d_r1_r2		= 0.15;
#local grip_height	= 0.27;
#local d_grip_net	= 0.08;
#local grip_r		= 0.017;

/* offset from grip to ideal hit point of ball to use for animation of ball hitting */
#declare hit_point = grip_height + d_grip_net + lower_r + d_r1_r2 - upper_r/3;

#local racket_texture = texture {
	pigment { 
		cylindrical frequency 35 turbulence 0.5
		color_map {
			[0.0 color rgb <0.2, 1, 0>]
			[1.5 color Yellow]
		}
		rotate <30,0,50>
	}
	finish {
		phong 1
		phong_size 40
	}
}
#local grip_texture = texture {
	pigment {
		leopard scale 0.0017  turbulence 0
		color_map{
			[0.0 color rgb <0,0,0>]
			[0.5 color rgb <0,0,0>]
			[1.0 color rgb <1,0,0>]
		}
	}
	finish {
		phong 0.1
		phong_size 100
	}
}

#declare racket = union { 
	union {
		object {
			MyRoundConicTorus( 
				d_r1_r2, // >0, vertical center distance of the upper and lower torii
				upper_r, // >0, upper radius up by <0,C_distance,0>
				lower_r, // >0,  lower radius on zero !!!
				border_r, // border radius, // max. = min(lower radius, upper radius)
				0 // Merge_On
			)
			texture {racket_texture}
		}

		/* draw all the strings into the racket */
		#include "static/racket_strings.inc"

		translate <0, grip_height + lower_r + 0.05, 0>
	}
	/* the grip stick */
	cylinder {
		/* 0.1 starting point, so that it does not show through the grip */
		<0, 0.1, 0>
		<0, grip_height, 0>
		0.0075
		texture {racket_texture}
	}
	/* the grip itself */
	cylinder {
		<0, 0, 0>
		<0, 4/7 * grip_height, 0>
		grip_r
		texture {grip_texture}
	}
	/* to get a nice transition from grip to grip stick */
	torus {
		2/3 * grip_r
		1/3 * grip_r
		texture {grip_texture}
		translate <0, 4/7 * grip_height, 0>
	}
	/* a sphere combining grip stick and upper part */
	sphere {
		<0, grip_height - 2*border_r, 0>
		3 * border_r
		texture {racket_texture}
		scale <1, 1, 0.7>
	}
}

/*
#local scaling_x	= 1.4;
#local upper_r		= 0.105 / scaling_x;
#local lower_r		= 0.065;
#local border_r		= 0.005;
#local d_r1_r2		= 0.16;
#local grip_height	= 0.27;
#local d_grip_net	= 0.08;

/* the whole racket has its origin in the lowest part of the gripper */
union {
	union {
		/* half torus displaying the upper part of the racket */
		difference {
			torus {
				upper_r /* major radius */
				border_r /* border radius */
				pigment {Blue}
				rotate <90, 0, 0>
			}
			box {
				<-upper_r, -upper_r/3, -0.1>,
				<upper_r, -upper_r - border_r, 0.1>
			}
			scale <scaling_x, 1, 1>
			translate <0, upper_r + d_r1_r2, 0>
		}
		/* half torus displaying the lower part of the racket */
		difference {
			torus {
				lower_r /* major radius */
				border_r /* border radius */
				pigment {Blue}
				rotate <90, 0, 0>
			}
			box {
				<-lower_r - 0.1, -lower_r/3, -0.1>,
				<lower_r + 0.1, lower_r + border_r, 0.1>
			}
			//		scale <scaling_x, 1, 1>
			translate <0, lower_r, 0>
		}
		translate <0, grip_height + d_grip_net, 0>
	}

	/* tilted cylinders */
	#local length_tc = sqrt(pow(upper_r * scaling_x, 2) + pow(d_grip_net + upper_r + d_r1_r2, 2));
	cylinder {
		<0, 0, 0>
		<0, length_tc-0.02, 0>
		0.0075
		pigment {Blue}
		rotate z * degrees(asin(upper_r * scaling_x / length_tc))
		translate <0, grip_height, 0>
	}

	/* the grip stick */
	cylinder {
		<0, 0, 0>
		<0, grip_height, 0>
		0.0075
		pigment {Blue}
	}
	translate <3.2,1.2,4>
}
*/
