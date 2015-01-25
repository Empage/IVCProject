/* include all static parts */
#include "static/main_static.inc"

#local door_loc = <3.2 + sq_glass_door_width/2, 0, 0>;
object {
	sq_glass_door
	translate door_loc
}

camera {
	location <3.2, 1.5, 0.3>
	look_at <3.2, 1.0, 4>
}

object {
	 racket
	 rotate <0,0,-40>
	 translate <3.05, 0.7, 2>
}

object {
	 racket
	 rotate <0,0,40>
	 translate <3.35, 0.7, 2>
}
