/* this macro calculates the trajectory of the ball.
 * It needs 
 *		the starting position (vector), 
 *		starting velocity,
 * 		vertical angle, 
 *		horizontal angle,
 *		flying direction of ball (1 to wall, -1 to glass)
 *		clock starting from 0 (unnormalized because of v_start and g)
 */
#macro ball_trajectory2(p_start, v_start, vert_angle, hori_angle, ball_direction, local_clock)

	#local x_val =  v_start*local_clock*sin(radians(hori_angle)) + p_start.x;
	#local y_val = v_start*local_clock*sin(radians(vert_angle)) - g/2 * pow(local_clock,2) + p_start.y;

	#if (ball_direction < 0)
		#local z_val = -v_start*local_clock*cos(radians(vert_angle)) + p_start.z;
	#else 
		#local z_val = v_start*local_clock*cos(radians(vert_angle)) + p_start.z;
	#end

	#debug concat("localclock: ",str(local_clock, 0, 5),"\n")
	#debug concat("x: ",str(x_val, 0, 5),"\n")
	#debug concat("y: ",str(y_val, 0, 5),"\n")
	#debug concat("z: ",str(z_val, 0, 5),"\n")

	object {
		ball
		translate <x_val, y_val, z_val>
	}

#end
