//inspired by http://www.joshuarenglish.com/cyclopedia/floor.html
#declare light_wood = pigment { P_WoodGrain7A color_map { M_Wood7A } }

#declare board_length = 1.5;
#declare board_width = 0.10;

box { <0, -.1, 0> <sq_field_x, 0, sq_field_z>
      pigment { light_wood 
                warp { repeat board_length*z offset 0.5*y } 
                warp { repeat board_width*x offset board_length*5/2*z } }
      normal { boxed
               slope_map { [ 0.5 <1,0> ] [1.0 <0,0> ] } 
               bump_size 0.1
               scale <board_width,1,board_length>
               warp { repeat board_length*z  } 
               warp { repeat board_width*x offset board_length/2*z } } }  
