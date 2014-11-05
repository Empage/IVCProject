//inspired by http://www.joshuarenglish.com/cyclopedia/floor.html
#declare light_wood = pigment { P_WoodGrain7A color_map { M_Wood7A } }

#declare board_length = 1.5;
#declare board_width = 0.10;

/* service line on the floor */
box {
	<0, inc_height, sq_serviceline_floor_z>, 
	<sq_field_x, -0.1, sq_serviceline_floor_z + sq_line_thickness>
	texture {
		pigment {
			color Red
		}
	}
}
/* middle line on the floor */
box {
	<sq_field_x/2 - sq_line_thickness/2, inc_height, 0>, 
	<sq_field_x/2 + sq_line_thickness/2, -0.1, sq_serviceline_floor_z>
	texture {
		pigment {
			color Red
		}
	}
}
/* left service field missing line in x direction */
box {
	<0, inc_height, sq_servicefield_z>, 
	<sq_servicefield_x, -0.1, sq_servicefield_z + sq_line_thickness>
	texture {
		pigment {
			color Red
		}
	}
}
/* left service field missing line in z direction */
box {
	<sq_servicefield_x, inc_height, sq_servicefield_z>, 
	<sq_servicefield_x + sq_line_thickness, -0.1, sq_serviceline_floor_z>
	texture {
		pigment {
			color Red
		}
	}
}
/* right service field missing line in x direction */
box {
	<sq_field_x - sq_servicefield_x, inc_height, sq_servicefield_z>, 
	<sq_field_x, -0.1, sq_servicefield_z + sq_line_thickness>
	texture {
		pigment {
			color Red
		}
	}
}
/* right service field missing line in z direction */
box {
	<sq_field_x - sq_servicefield_x, inc_height, sq_servicefield_z>, 
	<sq_field_x - sq_servicefield_x - sq_line_thickness, -0.1, sq_serviceline_floor_z>
	texture {
		pigment {
			color Red
		}
	}
}
/* the wooden floor */
box { <0, -.1, 0> <sq_field_x, 0, sq_field_z>
	pigment { light_wood 
		warp { repeat board_length*z offset 0.5*y } 
		warp { repeat board_width*x offset board_length*5/2*z } 
	}
	normal { boxed
		slope_map { [ 0.5 <1,0> ] [1.0 <0,0> ] } 
		bump_size 0.1
			scale <board_width,1,board_length>
			warp { repeat board_length*z  } 
		warp { repeat board_width*x offset board_length/2*z } 
	}
}  
