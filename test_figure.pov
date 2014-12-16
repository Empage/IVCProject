#include "colors.inc"
#include "static/figure.inc"
/* include all static parts */
#include "static/main_static.inc"
camera {
    location  <3.2, 1.8, 6>
    look_at <3.2, 1.8, 10>
    //location <0, 2, -5>
    //look_at <0, 2, 0>
    //location <3, 2, -1>
    //look_at <0, 1.5, 0>
}
/*light_source { <0, 10, -10> color White }*/

object {
  drawFigure(<0,0,0>, <0 ,0 ,10>, <0 ,0 ,-10>, <0 ,0 ,-10>, <0 ,0 ,10>, <0 ,0 ,0>, -<0 ,0 ,40>, <0 ,0 ,40>, <0 ,0 ,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
  translate <3.2, 0.9, 9.7>
}