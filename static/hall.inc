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
/* glass wall of the court */
box {
	<0, 0, 0>
	<6.4, 3, -0.02>
	texture {sq_glass}
}
/* wall next to glass wall */
box {
	<0, 0, 0>
	<-8.6, 5.5, -0.02>
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
