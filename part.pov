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
                            location  <0 , 1 ,-3.0>
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
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 90 // lewo
                            location  <-3.0 , 1 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
#declare Camera_5 = camera {/*ultra_wide_angle*/ angle 75      //tyl
                            location  <0.0 , 1.0 ,3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}   
#declare Camera_6 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <-2.0 , 1.5 ,2>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_6}
// sun ---------------------------------------------------------------------
light_source{<-1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <1.0,1.0,1.0>]
                                   [0.30 rgb <0.0,0.1,1.0>]
                                   [0.70 rgb <0.0,0.1,1.0>]
                                   [1.00 rgb <1.0,1.0,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   50
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8}
// ground ------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ color rgb <0.825,0.57,0.35>}
                normal { bumps 0.75 scale 0.025  }
                finish { phong 0.1 } 
              } // end of texture
     } // end of plane           
//--------------------------------------------------------------------------
//-----------------------------Deklaracje-----------------------------------
//--------------------------------------------------------------------------
#declare kolorZloty= rgb<.8,.4,.2> ;  
#declare kolorZielony=rgb<51/255,79/255,65/255>;  
#declare kolorCzarny=rgb<15/255,10/255,10/255>;   
//--------------------------------------------------------------------------
//-----------------------------Obiekty--------------------------------------
//--------------------------------------------------------------------------  



