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
/* squash ball radius */
#declare sq_ball_r = 0.02;

#declare sq_line_thickness = 0.05;
#declare inc_height = 0.0001;

#declare sq_serviceline_wall_y = 1.78;
#declare sq_serviceline_floor_z = 4.26;
#declare sq_tin_y = 0.43;
#declare sq_servicefield_x = 1.60;
#declare sq_servicefield_z = 2.61;


light_source {
	<3.2, 10, -1>
    color White
}
light_source {
	<3.2, 0, 5>
    color White
}

#include "static/floor.inc"
#include "static/walls.inc"
#include "static/ball.inc"
#include "static/racket.inc"
