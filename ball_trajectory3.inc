/* this macro calculates the trajectory of the ball.
 * It needs 
 *		the starting position (vector), 
 *		starting velocity,
 * 		vertical angle, 
 *		horizontal angle,
 *		flying direction of ball (1 to wall, -1 to glass),
 *		clock starting from 0 (unnormalized because of v_start and g),
 *		three old values for keeping the momentum in y direction: old_clock, old speed and initial y value of the hit
 */
#macro ball_trajectory3(p_start, v_start, vert_angle, hori_angle, ball_direction, local_clock, old_clock, old_v, old_y)

	#local x_val =  v_start*local_clock*sin(radians(hori_angle)) + p_start.x;
	#local y_val = old_v*old_clock*sin(radians(vert_angle)) - g/2 * pow(old_clock,2) + old_y;

	#if (ball_direction < 0)
		#local z_val = -v_start*local_clock*cos(radians(vert_angle)) + p_start.z;
	#else 
		#local z_val = v_start*local_clock*cos(radians(vert_angle)) + p_start.z;
	#end

	#debug concat("localclock: ",str(local_clock, 0, 5),"\n")
	#debug concat("x: ",str(x_val, 0, 5),"\n")
	#debug concat("y: ",str(y_val, 0, 5),"\n")
	#debug concat("z: ",str(z_val, 0, 5),"\n")

	#local current_slope = 
		tan(radians(vert_angle)) - g/(v_start * cos(radians(vert_angle))) * local_clock;
//	#debug concat("slope: ",str(current_slope, 0, 5),"\n")

	#local current_angle = degrees(atan(current_slope/1));
	#debug concat("current angle: ",str(current_angle, 0, 5),"\n")

	object {
		ball
		translate <x_val, y_val, z_val>
	}

#end
