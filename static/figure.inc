#include "colors.inc"
#include "static/shapes_lo.inc"

#declare figure_unit = 1.5;

#macro head(torsoTop, headAngle)
  sphere{ 0, 0.1*figure_unit
    pigment { Black }
    scale <1,1.3,1>
    translate 0.1*figure_unit*1.3*y
    rotate headAngle
    translate torsoTop
  }
#end

#macro torso(torsoTop, torsoBottom)
  cylinder {
    torsoTop,
    torsoBottom,
    0.05*figure_unit
    open
    pigment { Black }
  }
#end

#macro upperarm(shoulderJoint, elbow)
  cylinder {
    shoulderJoint,
    elbow,
    0.03*figure_unit
    open
    pigment { Black }
  }
#end

#macro forearm(elbow, hand)
  cylinder {
    elbow,
    hand,
    0.03*figure_unit
    open
    pigment { Black }
  }
#end

#macro upperleg(torsoBottom, knee)
  cylinder {
    torsoBottom,
    knee,
    0.03*figure_unit
    open
    pigment { Black }
  }
#end

#macro lowerleg(knee, foot)
  cylinder {
    knee, 
    foot,
    0.03*figure_unit
    open
    pigment { Black }
  }
#end

#macro umbrella(hand, grippoint, rotation, open_r)

  #declare uLength = figure_unit*0.5;
  #declare stick_r = 0.015*figure_unit;
  #declare grip_r = 0.06*uLength;
  #declare real_open = open_r/2*0.9+0.1;
  #declare pyramid_height = (uLength*2/3)-((uLength*2/3)*open_r*0.7);

  union{
    union{
      difference{
	object{ 
	  //Round_N_Pyramid (N, Wire_Radius, Pyramid_R1, Pyramid_R2, Pyramid_Height, Fill_On, Merge_On)
	  Round_N_Pyramid (12, 0.02 , uLength*real_open, 0, pyramid_height , 1, 0)
	  texture{ pigment{ color rgb <1,1,1>}
	    finish { ambient 0.1 diffuse 0.85 phong 1}
	  } // end of texture
	  scale <1,1,1>
	  translate (uLength*2/3-pyramid_height)*y
	}//end of object

	object{ 
	  //Round_N_Pyramid (N, Wire_Radius, Pyramid_R1, Pyramid_R2, Pyramid_Height, Fill_On, Merge_On)
	  Round_N_Pyramid (12, 0.02 , uLength*real_open-0.03*uLength, 0, pyramid_height-0.03*uLength , 1, 0)
	  texture{ pigment{ color rgb <1,1,1>}
	    finish { ambient 0.1 diffuse 0.85 phong 1}
	  } // end of texture
	  scale <1,1,1>
	  translate (uLength*2/3-pyramid_height)*y
	}//end of object
      }

      cylinder {
	uLength*2/3*y, 
	-uLength*1/3*y,
	stick_r
	open
	pigment { Red }
      }
      //lower-end of stick as origin
      translate uLength*1/3*y
      translate -grip_r*x  //match grip and stick
    }
    
    object{ 
      //Segment_of_Torus (R_major, R_minor, Segment_Angle)
      Segment_of_Torus (grip_r, stick_r, 180)
      pigment{ Red }
      rotate -90*x
    } // end of object ------------

    translate grip_r*y

    //grip point
    translate -grippoint*uLength*y
    rotate rotation 
    translate hand
  }
#end


#macro dbg(tt, vv)
  #debug concat ( tt, ": ", str(vv.x,9,4), ",", str(vv.y,9,4), ",", str(vv.z,9,4), chr(13), chr(10) )
#end


#macro drawFigure(bodyCenter, legAngleRight, legAngleLeft, kneeAngleRight, kneeAngleLeft, torsoAngle, 
  shoulderAngleRight, shoulderAngleLeft, elbowAngleRight, elbowAngleLeft, headAngle, umbrellaHand,
  umbrellaTranslate, umbrellaAngle, umbrellaOpen)
  
  #declare torsoLength = 0.8;
  #declare legLength = 0.4;
  #declare lowerLegLength = 0.4;
  #declare upperArmLength = 0.4;
  #declare lowerArmLength = 0.4;
  
  #declare torsoTop = vrotate(<0,torsoLength,0>,torsoAngle) + bodyCenter*y;
  #declare shoulderLeft = vrotate(<-0.05,torsoLength-0.05,0>,torsoAngle) + bodyCenter*<0,1,0>;
  #declare shoulderRight = vrotate(<0.05,torsoLength-0.05,0>,torsoAngle) + bodyCenter*<0,1,0>;
  #declare leftElbow = vrotate(<-upperArmLength,0,0>,shoulderAngleLeft+torsoAngle) + shoulderLeft;
  #declare rightElbow = vrotate(<upperArmLength,0,0>,shoulderAngleRight+torsoAngle) + shoulderRight;
  #declare leftHand = vrotate(<-lowerArmLength,0,0>,elbowAngleLeft+shoulderAngleLeft+torsoAngle) + leftElbow;
  #declare rightHand = vrotate(<lowerArmLength,0,0>,elbowAngleRight+shoulderAngleRight+torsoAngle) + rightElbow;

/*  
  dbg("bodyCenter", bodyCenter)
  dbg("torsoTop", torsoTop)
  dbg("shoulderLeft",shoulderLeft)
  dbg("shoulderRight",shoulderRight)
  dbg("leftElbow",leftElbow)
  dbg("rightElbow",rightElbow)
  dbg("leftHand",leftHand)
  dbg("rightHand",rightHand)
*/  
  
  //#declare leftKnee = vrotate(<0,-legLength,0>,legAngleLeft+torsoAngle) + bodyCenter*y;
  #declare leftKnee = vrotate(vrotate(vrotate(<0,-legLength,0>,
        <0,0,legAngleLeft.z>),
        <0,legAngleLeft.y,0>),
        <legAngleLeft.x,0,0>) + bodyCenter*y;
  //#declare rightKnee = vrotate(<0,-legLength,0>,legAngleRight+torsoAngle) + bodyCenter*y;
  #declare rightKnee = vrotate(vrotate(vrotate(<0,-legLength,0>,
        <0,0,legAngleRight.z>),
        <0,legAngleRight.y,0>),
        <legAngleRight.x,0,0>) + bodyCenter*y;
  //#declare leftFoot = vrotate(<0,-lowerLegLength,0>,kneeAngleLeft+legAngleLeft+torsoAngle) + leftKnee;
  #declare leftFoot = vrotate(vrotate(vrotate(<0,-lowerLegLength,0>,
        <0,0,kneeAngleLeft.z>+<0,0,legAngleLeft.z>),
        <0,kneeAngleLeft.y,0>+<0,legAngleLeft.y,0>),
        <kneeAngleLeft.x,0,0>+<legAngleLeft.x,0,0>) + leftKnee;
  //#declare rightFoot = vrotate(<0,-lowerLegLength,0>,kneeAngleRight+legAngleRight+torsoAngle) + rightKnee;
  #declare rightFoot = vrotate(vrotate(vrotate(<0,-lowerLegLength,0>,
        <0,0,kneeAngleRight.z>+<0,0,legAngleRight.z>),
        <0,kneeAngleRight.y,0>+<0,legAngleRight.y,0>),
        <kneeAngleRight.x,0,0>+<legAngleRight.x,0,0>) + rightKnee;
        
  
  union {
    torso(torsoTop,bodyCenter)
    upperarm(shoulderLeft, leftElbow)
    upperarm(shoulderRight, rightElbow)
    forearm(leftElbow, leftHand)
    forearm(rightElbow, rightHand)
    upperleg(bodyCenter+<-0.03*figure_unit, 0, 0>, leftKnee)
    upperleg(bodyCenter-<-0.03*figure_unit, 0, 0>, rightKnee)
    lowerleg(leftKnee, leftFoot)
    lowerleg(rightKnee, rightFoot)
    head(torsoTop, headAngle+torsoAngle)
    
    #switch (0)
      #case (strcmp(umbrellaHand,"right"))
	umbrella(rightHand + umbrellaTranslate, 0, umbrellaAngle, umbrellaOpen)
      #break
      #case (strcmp(umbrellaHand,"left"))
	umbrella(leftHand + umbrellaTranslate, 0, umbrellaAngle, umbrellaOpen)
      #break
    #end
		//no_shadow
  }
  
#end



  
