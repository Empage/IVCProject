#local string_r		= 0.001;

#local string_texture = texture {
	pigment { 
		color rgb<0.7,0.7,0.7>
	}
	finish {phong 1}
	
}

/* the vertical strings */
cylinder {
	<0, -lower_r, 0>,
	<0, d_r1_r2 + upper_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.01, -lower_r, 0>,
	<-0.01, d_r1_r2 + upper_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.01, -lower_r, 0>,
	<0.01, d_r1_r2 + upper_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.02, -lower_r, 0>,
	<-0.02, d_r1_r2 + upper_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.02, -lower_r, 0>,
	<0.02, d_r1_r2 + upper_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.03, -lower_r, 0>,
	<-0.03, d_r1_r2 + upper_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.03, -lower_r, 0>,
	<0.03, d_r1_r2 + upper_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.04, -lower_r + border_r, 0>,
	<-0.04, d_r1_r2 + upper_r - border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.04, -lower_r + border_r, 0>,
	<0.04, d_r1_r2 + upper_r - border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.05, -lower_r + 7*border_r, 0>,
	<-0.05, d_r1_r2 + upper_r - 2*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.05, -lower_r + 7*border_r, 0>,
	<0.05, d_r1_r2 + upper_r - 2*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.06, -lower_r + 10*border_r, 0>,
	<-0.06, d_r1_r2 + upper_r - 3*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.06, -lower_r + 12*border_r, 0>,
	<0.06, d_r1_r2 + upper_r - 3*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.07, -lower_r + 15*border_r, 0>,
	<-0.07, d_r1_r2 + upper_r - 5*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.07, -lower_r + 15*border_r, 0>,
	<0.07, d_r1_r2 + upper_r - 5*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.08, -lower_r + 20*border_r, 0>,
	<-0.08, d_r1_r2 + upper_r - 6*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.08, -lower_r + 20*border_r, 0>,
	<0.08, d_r1_r2 + upper_r - 6*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.09, -lower_r + 25*border_r, 0>,
	<-0.09, d_r1_r2 + upper_r - 8*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.09, -lower_r + 25*border_r, 0>,
	<0.09, d_r1_r2 + upper_r - 8*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-0.10, -lower_r + 29*border_r, 0>,
	<-0.10, d_r1_r2 + upper_r - 12*border_r, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<0.10, -lower_r + 29*border_r, 0>,
	<0.10, d_r1_r2 + upper_r - 12*border_r, 0>
	string_r
	texture {string_texture}
}

/* the horizontal strings */
cylinder {
	<-lower_r + 3*border_r, -0.04, 0>,
	<lower_r  - 3*border_r, -0.04, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r + 2*border_r, -0.03, 0>,
	<lower_r  - 2*border_r, -0.03, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r + 1*border_r, -0.02, 0>,
	<lower_r  - 1*border_r, -0.02, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r + 0*border_r, -0.01, 0>,
	<lower_r  - 0*border_r, -0.01, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r + 0*border_r, 0, 0>,
	<lower_r  - 0*border_r, 0, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 1*border_r, 0.01, 0>,
	<lower_r  + 1*border_r, 0.01, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 3*border_r, 0.02, 0>,
	<lower_r  + 3*border_r, 0.02, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 4*border_r, 0.03, 0>,
	<lower_r  + 4*border_r, 0.03, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 5*border_r, 0.04, 0>,
	<lower_r  + 5*border_r, 0.04, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 6*border_r, 0.05, 0>,
	<lower_r  + 6*border_r, 0.05, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 7*border_r, 0.06, 0>,
	<lower_r  + 7*border_r, 0.06, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 8*border_r, 0.07, 0>,
	<lower_r  + 8*border_r, 0.07, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 8*border_r, 0.08, 0>,
	<lower_r  + 8*border_r, 0.08, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 9*border_r, 0.09, 0>,
	<lower_r  + 9*border_r, 0.09, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 10*border_r, 0.10, 0>,
	<lower_r  + 10*border_r, 0.10, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 10*border_r, 0.11, 0>,
	<lower_r  + 10*border_r, 0.11, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 11*border_r, 0.12, 0>,
	<lower_r  + 11*border_r, 0.12, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 12*border_r, 0.13, 0>,
	<lower_r  + 12*border_r, 0.13, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 12*border_r, 0.14, 0>,
	<lower_r  + 12*border_r, 0.14, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 12*border_r, 0.15, 0>,
	<lower_r  + 12*border_r, 0.15, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 12*border_r, 0.16, 0>,
	<lower_r  + 12*border_r, 0.16, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 12*border_r, 0.17, 0>,
	<lower_r  + 12*border_r, 0.17, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 11*border_r, 0.18, 0>,
	<lower_r  + 11*border_r, 0.18, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 9*border_r, 0.19, 0>,
	<lower_r  + 9*border_r, 0.19, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 8*border_r, 0.20, 0>,
	<lower_r  + 8*border_r, 0.20, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 7*border_r, 0.21, 0>,
	<lower_r  + 7*border_r, 0.21, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 6*border_r, 0.22, 0>,
	<lower_r  + 6*border_r, 0.22, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 4*border_r, 0.23, 0>,
	<lower_r  + 4*border_r, 0.23, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 2*border_r, 0.24, 0>,
	<lower_r  + 2*border_r, 0.24, 0>
	string_r
	texture {string_texture}
}
cylinder {
	<-lower_r - 1*border_r, 0.25, 0>,
	<lower_r  + 1*border_r, 0.25, 0>
	string_r
	texture {string_texture}
}
