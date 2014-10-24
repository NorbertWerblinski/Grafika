#include "colors.inc"
       
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <-1.2 , 1.2 ,-2.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0 , 3.0 ,0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
#declare Camera_5 = camera {/*ultra_wide_angle*/ angle 90 // lewo
                            location  <-3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
#declare Camera_6 = camera {/*ultra_wide_angle*/ angle 75      //tyl
                            location  <0.0 , 1.0 ,3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}   
#declare Camera_7 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <-2.0 , 2.5 ,3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
    
//--------------------------------------------------------------------------
//-----------------------------Deklaracje-----------------------------------
//--------------------------------------------------------------------------
#declare kolorZloty= rgb<.8,.4,.2> ;  
#declare kolorZielony=rgb<51/255,79/255,65/255>;     
//--------------------------------------------------------------------------
//-----------------------------Obiekty--------------------------------------
//--------------------------------------------------------------------------