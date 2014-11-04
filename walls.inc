/* serviceline on back wall */
box {
	<0, sq_serviceline_wall_y, sq_field_z - inc_height>, 
	<sq_field_x, sq_serviceline_wall_y + sq_line_thickness, sq_field_z + 0.1>
	texture {
		pigment {
			color Red
		}
	}
}
/* upper line on back wall */
box {
	<0, sq_field_y1, sq_field_z - inc_height>, 
	<sq_field_x, sq_field_y1 + sq_line_thickness, sq_field_z + 0.1>
	texture {
		pigment {
			color Red
		}
	}
}
/* tin line on back wall */
box {
	<0, sq_tin_y - sq_line_thickness, sq_field_z - 0.01>, //it is 1cm in front of wall
	<sq_field_x, sq_tin_y, sq_field_z + 0.1>
	texture {
		pigment {
			color Red
		}
	}
}
/* rest of the tin */
box {
	<0, 0, sq_field_z - 0.01>, //it is 1cm in front of wall
	<sq_field_x, sq_tin_y - sq_line_thickness, sq_field_z + 0.1>
	texture {
		pigment {
			color <0.7, 0.7, 0.7>
		}
	}
}
/* back wall */
box {
	<0, 0, sq_field_z>, <sq_field_x, sq_field_y1 + 0.2, sq_field_z + 0.1>
	texture {
		pigment {
			color White
		}
	}
}
/*************/
/* line on left wall */
/* calculate the needed length through pythagoras */
#local line_length = sqrt(pow(sq_field_z,2) + pow(sq_field_y1 - sq_field_y2,2));
#local wall_line = box {
	<0, 0, 0>, 
	<inc_height, sq_line_thickness, line_length>
	texture {
		pigment {
			color Red
		}
	}
	rotate x*-degrees(atan((sq_field_y1 - sq_field_y2) / sq_field_z))
	translate y*sq_field_y2
//	#debug concat("atan is:",str(atan((sq_field_y1 - sq_field_y2) / sq_field_z), 0, 5),"\n")
}
wall_line

/* left wall */
box {
	<0, 0, 0>, <-0.1, sq_field_y1 + 0.2, sq_field_z>
	texture {
		pigment {
			color White
		}
	}
}
/*************/
/* line on the right wall */
object {
	wall_line
	translate x*(sq_field_x - inc_height)
}
/* right wall */
box {
	<sq_field_x, 0, 0>, <sq_field_x + 0.1, sq_field_y1 + 0.2, sq_field_z>
	texture {
		pigment {
			color White
		}
	}
}
