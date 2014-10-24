#include "colors.inc"
       
       
// komentarze dodawane w stylu jêzyka C++
// do ka¿dego obiektu mo¿na u¿yæ: translate, rotate, scale
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
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
                            location  <0.0 , 1.0 ,-3.0>
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
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
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
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#declare kolo=union{
    object{ Supertorus( .5, 0.05, // Radius_Major, Radius_Minor,                       //obrecz
                        1.00, 0.45, // Major_Control, Minor_Control,
                       0.001, 1.50) // Accuracy, Max_Gradient)
            
            texture{ pigment{ color rgb<.8,.4,.2>}
                     finish { phong 1 } 
                   } // end of texture
            scale <1,1,1> 
            rotate<90,0,0> 
    
            
          } //----------------------------------------------------    
    cylinder { <0,0,0>,<0,0,.05>,0.1                                                         //piasta
               texture { pigment { color rgb<.0,.0,.0>}
                       //normal  { bumps 0.5 scale 0.005}  
                         finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                       } // end of texture
               scale <1,1,1> rotate<0,0,0> translate<0,0,-0.025>
             } // end of cylinder  ------------------------------------  
                                                                                                //szprychy
    #for (i,0, 360, 15)
            
    cylinder { <0,0,0>,<0,.5,0>, 0.02 
    
               texture { pigment { color rgb<1,0,0> }
                       //normal  { bumps 0.5 scale <0.005,0.25,0.005>}
                         finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                       } // end of texture
    
               scale <1,1,1> rotate<0,0,i> translate<0,0,-0.005>
    } // end of cylinder -------------------------------------            
    #end     
}    

#declare os= union{
    object{kolo translate<0,0,-1>} 
    object{kolo}
    cylinder { <0,0,0>,<0,0,-1>,0.05 
               texture { pigment { color rgb<0,0,0>}
                       //normal  { bumps 0.5 scale 0.005}  
                         finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                       } // end of texture
               scale <1,1,1> rotate<0,0,0> translate<0,0,0>
             } // end of cylinder  ------------------------------------
                      
}
  
#declare osie=union{
object{os   
translate<-3,-.5,0>
scale <.5,.5,0>}    
object{os
translate<-5,-.5,0>
scale <.5,.5,0>}  
object{os
translate<.5,0,0>} 
object{os
translate<2.5,0,0>}     }

object {osie
scale <.5,.5,.5> translate<0,.25,0> rotate y*360*clock}