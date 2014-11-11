#include "static/MyRoundConicTorus.inc"
cylinder {
	<0, 0, 0>, <0, 0.41, 0>, 0.01
	texture{ pigment{ color rgb<1,1,1>}}
	translate<2.2,0.8,4>
}


#local scaling_x	= 1.4;
#local upper_r		= 0.11;
#local lower_r		= 0.051;
#local border_r		= 0.005;
#local d_r1_r2		= 0.16;
#local grip_height	= 0.27;
#local d_grip_net	= 0.08;

union { 
	object {
		MyRoundConicTorus( 
			0.15, // >0, vertical center distance of the upper and lower torii
			upper_r, // >0, upper radius up by <0,C_distance,0>
			lower_r, // >0,  lower radius on zero !!!
			border_r, // border radius, // max. = min(lower radius, upper radius)
			0 // Merge_On
		)
		texture{ pigment{ color rgb<1,1,1>}
			finish { phong 1}
		}
		translate <-.003, grip_height + lower_r + 0.05, 0>
	}
	/* the grip stick */
	cylinder {
		<0, 0, 0>
		<0, grip_height, 0>
		0.0075
		texture{ pigment{ color rgb<1,1,1>}
			finish { phong 1}
		}
	}
	/* the grip itself */
	cylinder {
		<0, 0, 0>
		<0, 4/7 * grip_height, 0>
		0.017
		pigment {Black}
	}
	translate <3.2, 1.2, 4>
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
