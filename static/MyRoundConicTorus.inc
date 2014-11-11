// This file is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
// To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/ or send a
// letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

// It is modified from:
// shapes3.inc by Friedrich A. Lohmueller, March-2013
#macro MyRoundConicTorus( C_distance_,// >0, vertical center distance of upper + lower torii
                          R_upper_,  // >0, upper radius up by <0,C_distance,0>
                          R_lower_,  // >0, lower radius on zero !!!
                          Border_R_, // max. = min(R_lower,R_upper)
                          Merge_On
                        ) //-------  looks in y+direction
//------------------------------------------------------------------
#local D = 0.000001; // just a little bit !!!
//------------------------------------------
#local C_distance = C_distance_; 
#local R_upper = R_upper_;
#local R_lower = R_lower_; 
#local Border_R = Border_R_; 
//------------------------------------------
#if (C_distance = 0) #local C_distance = D;
 #warning "\nMyRoundConicTorus() macro called with center distance = 0,\n center distance set to 0.000001 ! \n"
#end
#if (C_distance < 0) #local C_distance = abs(C_distance);
 #warning "\nMyRoundConicTorus() macro called with center distance < 0,\n center distance set to abs(center distance) ! \n"
#end

#if (Border_R < 0 ) #local Border_R = abs(  Border_R );
 #warning "\nMyRoundConicTorus() macro called with border radius < 0,\n border radius set to abs(border radius) ! \n"
#end
#if (Border_R = 0 ) #local Border_R = 0.01;
 #warning "\nMyRoundConicTorus() macro called with border radius = 0,\n border radius set to 0.001 ! \n"
#end
#if (Border_R >  min(R_lower,R_upper) ) #local Border_R = min(R_lower,R_upper)+D;
 #warning "\nMyRoundConicTorus() macro called with border radius > min(lower radius, upper radius),\n border radius set to  min(lower radius, upper radius) + 0.000001 ! \n"
#end


#if (R_upper = 0) #local R_upper =  0.002;
 #warning "\nMyRoundConicTorus() macro called with upper radius = 0,\n upper radius set to 0.002 ! \n"
#end
#if (R_upper < 0) #local R_upper = abs (R_upper);
 #warning "\nMyRoundConicTorus() macro called with upper radius < 0,\n upper radius set to  abs(upper radius) ! \n"
#end
#if (R_lower = 0) #local R_lower = 0.002;
 #warning "\nMyRoundConicTorus() macro called with lower radius = 0,\n lower radius set to 0.002 ! \n"
#end
#if (R_lower < 0) #local R_lower = abs (R_upper);
 #warning "\nMyRoundConicTorus() macro called with lower radius < 0,\n lower radius set to  abs(lower radius) ! \n"
#end
//---------------------------------------------------------------------------------------------------
// exchange upper and lower for construction if necessary (later they will changed back!)
#if ( (R_upper >= R_lower) & (C_distance>0)) #local Ro = R_upper; #local Ru = R_lower; #local Flag=0;
#else                                        #local Ro = R_lower; #local Ru = R_upper; #local Flag=1;
#end
//------------------------------------------------------
#local Side_Len   = sqrt(pow(C_distance,2) - pow( (Ro-Ru),2) );
#local Side_Angle = degrees( atan( (Ro-Ru)/ Side_Len) );


#if ( Merge_On = 1 ) union{
#else                merge{   #end
 // +z /-z border cylinder pending
 cylinder{< 0,-.10,-D>,<0,Side_Len,0>,Border_R translate<0,0,Ru> rotate< Side_Angle,0,0>}
 cylinder{< 0,-.10,-D>,<0,Side_Len,0>,Border_R translate<0,0,Ru> rotate< Side_Angle,0,0> scale<1,1,-1>}

intersection{ // +z box pending
 torus{ Ru, Border_R rotate<0,0,90> translate<0,0,0>}
 box{< -Border_R-D,0,-Ru-Border_R-D>,<Border_R+D,Ru+Border_R+D,Ru+Border_R+D> rotate< Side_Angle,0,0> inverse}
 box{< -Border_R-D,0,-Ru-Border_R-D>,<Border_R+D,Ru+Border_R+D,Ru+Border_R+D> rotate<-Side_Angle,0,0> inverse}
}// end inters

intersection{ // +z box pending
//union{
 torus{ Ro, Border_R rotate<0,0,90> translate<0,C_distance,0>}
 intersection{
 box{< -Border_R-D,-Ro-Border_R-D,-Ro-Border_R-D>,<Border_R+D,0,Ro+Border_R+D> rotate< Side_Angle,0,0> }
 box{< -Border_R-D,-Ro-Border_R-D,-Ro-Border_R-D>,<Border_R+D,0,Ro+Border_R+D> rotate<-Side_Angle,0,0> } 
 translate<0,C_distance,0> inverse}
}// end inters

//#end // of "#if ( Border_R > 0 )"
#if (Flag = 1) scale<1,-1,1> translate<0,C_distance,0> #end
rotate<0,90,0> // turn it in the xy-plane
 } //end of union

#end// of macro ---------------------------------------<<<  end of macro MyRoundConicTorus()
// -----------------------------------------------------------------------------------------
