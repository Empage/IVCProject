#include "colors.inc"
#include "textures.inc"
#include "woods.inc"

/* gravity */
#declare g = 9.81;

/* squash numbers */
#declare sq_field_x = 6.4;
#declare sq_field_y1 = 4.57;
#declare sq_field_y2 = 2.13;
#declare sq_field_z = 9.75;

#declare sq_line_thickness = 0.05;
#declare inc_height = 0.0001;

#declare sq_serviceline_wall_y = 1.78;
#declare sq_serviceline_floor_z = 4.26;
#declare sq_tin_y = 0.43;
#declare sq_servicefield_x = 1.60;
#declare sq_servicefield_z = 2.61;

camera {
	location  <3.2, 1.8, -1> /* original */
//	location  <3.2, 1.8, 2>
//	look_at   <3.2, 1.5, 9.75> /* original */
	look_at   <sq_field_x/4 + clock * sq_field_x/2, 1.5, 4.3>
	//angle 20
}

light_source {
	<3.2, 10, -1>
    color White
}
light_source {
	<3.2, 0, 5>
    color White
}

#include "floor.inc"
#include "walls.inc"
#include "ball.inc"

//  plane {
//    y, -1
//    texture {
//      pigment {
//        checker
//        color rgb<0.5, 0, 0>
//        color rgb<0, 0.5, 0.5>
//      }
//      finish {
//        diffuse 0.4
//        ambient 0.2
//        phong 1
//        phong_size 100
//        reflection 0.25
//      }
//    }
//  }
//  torus {
//    1.5, 0.5
//    texture { Brown_Agate }
//    rotate <90, 160, 0>
//    translate <-1, 1, 3>
//  }
//  box {
//    <-1, -1, -1>, <1, 1, 1>
//    texture { DMFLightOak }
//    translate <2, 0, 2.3>
//  }
//  cone {
//    <0,1,0>, 0, <0,0,0>, 1
//    texture { PinkAlabaster }
//    scale <1, 3, 1>
//    translate <-2, -1, -1>
//  }
//  sphere {
//    <0,0,0>,1
//    texture { Sapphire_Agate }
//    translate <1.5, 0, -2>
//  }
//
