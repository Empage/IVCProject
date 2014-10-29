/* red line on back wall */
box {
	<0, sq_aufschlaglinie_y, sq_field_z>, 
	<sq_field_x, sq_aufschlaglinie_y+0.05, sq_field_z + 0.1>
	texture {
		pigment {
			color Red
		}
	}
}
/* back wall */
box {
	<0, 0, sq_field_z>, <sq_field_x, sq_field_y1, sq_field_z + 0.1>
	texture {
		pigment {
			color White
		}
	}
}
/* left wall */
box {
	<0, 0, 0>, <-0.1, sq_field_y1, sq_field_z>
	texture {
		pigment {
			color White
		}
	}
}
/* right wall */
box {
	<sq_field_x, 0, 0>, <sq_field_x + 0.1, sq_field_y1, sq_field_z>
	texture {
		pigment {
			color White
		}
	}
}
