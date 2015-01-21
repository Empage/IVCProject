#declare sq_glass =
texture{
  pigment{ rgbf<0.98,0.98,0.98,0.8>}
  finish { diffuse 0.1
           reflection 0.1
           specular 0.8
           roughness 0.0003
           phong 1
           phong_size 400}
}

#declare sq_glass_door_width = 0.8;
#declare sq_glass_door = merge {
	box {
		<0.0, 0.01, 0.0>
		<-sq_glass_door_width, 1.99, -0.02>
		//	texture {pigment {color Red}}
		texture {sq_glass}
	}
	box {
		<-0.02, 0.5, 0.0>
		<0.01, 0.6, -0.02>
		texture {pigment {color Gray}}
	}
	box {
		<-0.02, 1.7, 0.0>
		<0.01, 1.8, -0.02>
		texture {pigment {color Gray}}
	}
	box {
		<-sq_glass_door_width, 0.01, 0.01>
		<-sq_glass_door_width + 0.02, 1.99, -0.03>
		texture {pigment {color Gray}}

	}
}

/* bounding box around everything */
box {
	<-8.6, -0.01, -8>
	<6.41, 5.5, 9.76>
	texture {
		pigment {
			color White
		}
	}
}
/*
/* glass wall of the court */
difference {
	box {
		<0, 0, 0>
		<6.4, 3, -0.02>
		texture {sq_glass}
	}
	/* room for the glass door which is 80cm wide */
	box {
		<3.2-sq_glass_door_width/2, 0.01, 0.01>
		<3.2+sq_glass_door_width/2, 2.0, -0.03>
	}
	texture {sq_glass}
}
*/
/* wall next to squash court */
difference {
	box {
		<0, 0, 0>
		<-8.6, 5.5, -0.1>
	}
	/* door in that wall */
	box {
		<-7.6, 0, 0.01>
		<-6.8, 2, -0.11>
	}
	texture {
		pigment {
			color White
		}
	}
}
/* the tribune */
box {
	<-8.6, 0, -3>
	<6.4, 0.7, -3.5>
	texture {
		pigment {
			color White
		}
	}
}
box {
	<-8.6, 0, -3.5>
	<6.4, 1.4, -4>
	texture {
		pigment {
			color White
		}
	}
}
box {
	<-8.6, 0, -4>
	<6.4, 2.1, -4.5>
	texture {
		pigment {
			color White
		}
	}
}
box {
	<-8.6, 0, -4.5>
	<6.4, 2.8, -5>
	texture {
		pigment {
			color White
		}
	}
}
