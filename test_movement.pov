/* include all static parts */
#include "static/main_static.inc"

#include "ball_trajectory.inc"

#include "static/figure.inc"

camera {
			location <0, 1.7, 5>
			look_at <3.2, 1, 5>
		}
/*		
camera {
			location <3, 1.7, 6>
			look_at <3, 1, 4>
		}
*/		           
/*		
object {
    drawFigure(<0,0,0>, <0,0,20>, <0,0,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    translate <3, 0.75, 3.2>
}		
*/		
		
		
#declare step_duration = 0.2;
#declare step_height = 0.5;
#declare step_length = 1;

#declare anim_clock = clock;
#declare step_clock = anim_clock/step_duration;
#declare pi_clock = step_clock * pi;
#declare normal_clock = step_clock - int(step_clock);

#declare left_start = 0;
#declare right_start = 0; // -step_length/2;

#macro Odd(a)
  #local o = true;
  #local i = int(a)/2;
  #if ( i = (int(i)) ) 
    #local o = false;
  #end
  o 
#end

#if (Odd(step_clock))
  #declare left_height = abs(sin(pi_clock)*step_height);
  #declare right_height = 0;
  #declare left_dist = (int(step_clock) - 1)*0.5 + normal_clock;
  #declare right_dist = (int(step_clock) +1)/2;
#else
  #declare left_height = 0;
  #declare right_height = abs(sin(pi_clock)*step_height);
  #declare left_dist = int(step_clock)*0.5; // change
  #declare right_dist = int(step_clock)*0.5 + normal_clock;
#end

#declare right_dist = (right_dist * step_length); //+ right_start;
#declare left_dist = (left_dist * step_length); //+ left_start;
#declare movement = (abs(right_dist+left_dist))/5;

object {
    drawFigure(<0,0,0>, <-right_height*20,right_dist*10,20>, <-left_height*20,left_dist*10,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    translate <3, 0.75, 3.2+movement>
}
/*
#debug concat ("Distanz: ", vstr(3, movement,", ",0,3),"\n")
#debug concat ("clock: ", vstr(3, clock,", ",0,3),"\n")
#debug concat ("step_clock: ", vstr(3, step_clock,", ",0,3),"\n")
#debug concat ("normal_clock: ", vstr(3, normal_clock,", ",0,3),"\n")
#debug concat ("anim_clock: ", vstr(3, anim_clock,", ",0,3),"\n") 
*/
//(wert0 + clock * diff) * cos(clock * pi)
/*
object {
    drawFigure(<0,0,0>, <(clock * 25*1) * cos(clock * pi) ,0 ,20>, <(clock * -25*1) * cos(clock * pi) ,0 ,-20>, <0 ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
    translate <3, 0.75, 3.2+clock*0.5>
} 
*/
/*
#switch(clock)
//hinteres bein nach hinten anwinkeln
    #range (0.0,0.333)
//        if(clock <= 0.333):
            object {
                drawFigure(<0,0,0>, <(clock * 25*1) * cos(clock * pi) ,0 ,20>, <(clock * -25*1) * cos(clock * pi) ,0 ,-20>, <0 ,0 ,-20>, <(clock*3*(30*1))*((cos(clock*3*pi+pi)+1)/2) ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
                translate <3, 0.75, 3.2+clock*0.5>
            }
            #break*/
/*
            self.kneeAngleBack[0] = (self.kneeAngleBack0 + clock * 3 * (-30*self.step_w - self.kneeAngleBack0))*((cos(clock*3*pi+pi)+1)/2) //sin(clock*3*(pi/2))
            self.kneeAngleFront[0] = 0
*/
//hinteres bein lansam nach vorne strecken
/*    #range (0.333,1)
//        if((clock > 0.333) and (clock <= 1)):
             object {
                drawFigure(<0,0,0>, <(clock * 25*1) * cos(clock * pi) ,0 ,20>, <(clock * -25*1) * cos(clock * pi) ,0 ,-20>, <0 ,0 ,-20>, <(30*1)*cos((clock-0.333)*1.5*(pi/2)) ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
                translate <3, 0.75, 3.2+clock*0.5>
             }
             #break
*/
/*
            self.kneeAngleBack[0] =                                                                                     (-30*self.step_w)*cos((clock-0.333)*1.5*(pi/2))
            self.kneeAngleFront[0] = 0
*/
//hinteres bein nach hinten anwinkeln
/*    #range (1,1.333)
//        if((clock > 1) and (clock <= 1.333)):
             object {
                drawFigure(<0,0,0>, <(25*1) * cos(clock * pi) ,0 ,20>, <(-25*1) * cos(clock * pi) ,0 ,-20>, <(30*1)*((cos((clock-1)*3*pi+pi)+1)/2) ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
                translate <3, 0.75, 3.2+clock*0.5>
             }
             #break

            self.kneeAngleFront[0] = (-30*self.step_w)*((cos((clock-1)*3*pi+pi)+1)/2)#sin(clock-1*3*(pi/2))
            self.kneeAngleBack[0] = 0

//hinteres bein lansam nach vorne strecken
    #range (1.333,2)
//        if(clock > 1.333):
            object {
                drawFigure(<0,0,0>, <(25*1) * cos(clock * pi) ,0 ,20>, <(-25*1) * cos(clock * pi) ,0 ,-20>,<(30*1)*cos((clock-1.333)*1.5*(pi/2)) ,0 ,-20>, <0 ,0 ,20>, <0 ,0 ,0>, -<0 ,0 ,50>, <0 ,0 ,40>, <0,0,0>, <0 ,0 ,0>, <0 ,0 ,0>, "none", <0 ,0 ,0>, <0 ,0 ,0>, 1)
                translate <3, 0.75, 3.2+clock*0.5>
            }
            #break

            self.kneeAngleFront[0] = (-30*self.step_w)*cos((clock-1.333)*1.5*(pi/2))
            self.kneeAngleBack[0] = 0
*/
//#end