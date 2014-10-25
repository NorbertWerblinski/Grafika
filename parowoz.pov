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
                            location  <3.0 , 1.0 , 0>
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
                            location  <-2.0 , 2.5 ,-3.0>
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
//---------------------------- Deklaracje------ ----------------------------
//--------------------------------------------------------------------------
#declare kolorZloty= rgb<.8,.4,.2> ;  
#declare kolorZielony=rgb<50/255,65/255,42/255>;    
#declare kolorCzarny=rgb<15/255,10/255,10/255>;
//--------------------------------------------------------------------------
//---------------------------- Lokomotywa ----------------------------------
//--------------------------------------------------------------------------

#declare lokomotywa=union{
//----------------------------------------------------------------                                                                                                                        
//---------------------------OSIE---------------------------------
//----------------------------------------------------------------       
#declare kolo=union{
    object{ Supertorus( .5, 0.05, // Radius_Major, Radius_Minor,                       //obrecz
                        1.00, 0.45, // Major_Control, Minor_Control,
                       0.001, 1.50) // Accuracy, Max_Gradient)
            
            texture{ pigment{kolorZloty}
                     finish { phong 1 } 
                   } // end of texture
            scale <1,1,1> 
            rotate<90,0,0> 
    
            
          } //----------------------------------------------------    
    cylinder { <0,0,0>,<0,0,.05>,0.1                                                         //piasta
               texture { pigment { kolorZloty}
                       //normal  { bumps 0.5 scale 0.005}  
                         finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                       } // end of texture
               scale <1,1,1> rotate<0,0,0> translate<0,0,-0.025>
             } // end of cylinder  ------------------------------------  
                                                                                                //szprychy
    #for (i,0, 360, 15)
            
    cylinder { <0,0,0>,<0,.5,0>, 0.02 
    
               texture { pigment { Red }
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
               texture { pigment { kolorCzarny}
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
translate<0.5,0,0>} 
object{os
translate<2.2,0,0>}     }

object {osie
scale <.5,.5,.5> translate<0,.25,0>} 
                                                           
                                                           
//----------------------------------------------------------------                                                                                                                        
//----------------------Przednie zawieszenie---------------------- 
//----------------------------------------------------------------   
#declare silownikMaly=union{
    object{
            cylinder { <-.15,0,0>,<0,0,0>, 0.06
                       texture { pigment { kolorZloty}
                                 finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                               } // end of texture
                       scale <1,1,1> rotate<0,0,0> 
            } // end of cylinder  ------------------------------------     

    }  
    box { <-.05, 0.00, -.05>,< .05, .15, .05>   

      texture { pigment{ kolorZloty}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture

      scale <1,1,1> rotate<0,0,0> translate<0,0,0> translate<-.08,.03,0> 
    } // end of box --------------------------------------
    
       
}
box { <-.92,0,-0.05>,< -1.08, 0.4, -.45>   

      texture { pigment{kolorCzarny}
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture

      scale <1,1,1> rotate<0,0,0> translate<0,.15,0> 
    } // end of box -------------------------------------- 
difference {
    box { <-1,0,-0.00>,< -1.4, 0.05, -.5>   
    
          texture { pigment{kolorZloty}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.28,0> 
        } // end of box --------------------------------------     
    cylinder { <0,0,0>,<0,.5,0>, 0.2 
    
               texture { pigment { kolorZloty}
                       //normal  { bumps 0.5 scale <0.005,0.25,0.005>}
                         finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                       } // end of texture
    
               scale <1,1,1> rotate<0,0,0> translate<-1.15,0,.1>
             } // end of cylinder -------------------------------------   
    box { <-.5,0,-0.00>,< -1.15, 1, -.1>   
        
              texture { pigment{kolorZloty}
                        finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                      } // end of texture
        
              scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
            } // end of box --------------------------------------  
     cylinder { <0,0,-.6>,<0,.5,-.6>, 0.2 
    
               texture { pigment {kolorZloty }
                       //normal  { bumps 0.5 scale <0.005,0.25,0.005>}
                         finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                       } // end of texture
    
               scale <1,1,1> rotate<0,0,0> translate<-1.15,0,0>
             } // end of cylinder -------------------------------------   
    box { <-.5,0,-0.6>,< -1.15, 1, -.4>   
        
              texture { pigment{kolorZloty}
                        finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                      } // end of texture
        
              scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
            } // end of box --------------------------------------         
}   
box { <-.6,.1,-0.1>,< -1.3, 0.3, -.4>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
        } // end of box --------------------------------------     
             
object{silownikMaly translate<-.92,.15,-.5>}   
object{silownikMaly translate<-.92,.15,0>}   
//----------------------------------------------------------------                                                                                                                        
//---------------------------Plug--------------------------------- 
//---------------------------------------------------------------- 

cylinder { <0,0,0>,<0,0,-.5>,0.02 
           texture { pigment { kolorZloty}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,.3,0>
         } // end of cylinder  ------------------------------------
cylinder { <0,0,.03>,<0,0,-.5>,0.02 
           texture { pigment { kolorZloty}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,45,0> translate<-1.4,0.05,.1>
         } // end of cylinder  ------------------------------------
cylinder { <0,0,-.5>,<0,0,.03>,0.02 
           texture { pigment { kolorZloty}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,135,0> translate<-1.4,0.05,-.6>  
         } // end of cylinder  ------------------------------------ 

#for (i,0,4)
cylinder { <0,.3,-.25*i/5>,<-.35*i/5,.05,.1-.35*i/5>,0.02 
           texture { pigment { kolorZloty}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,0,0>  
         } // end of cylinder  ------------------------------------ 
#end 
cylinder { <0,.3,-.25>,<-.35,.05,-.25>,0.02 
           texture { pigment { kolorZloty}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,0,0>  
         } // end of cylinder  ------------------------------------ 

#for (i,0,4)
cylinder { <0,.3,-.5+.25*i/5>,<-.35*i/5,.05,-.6+.35*i/5>,0.02 
           texture { pigment { kolorZloty}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,0,0>  
         } // end of cylinder  ------------------------------------ 
#end  
//----------------------------------------------------------------                                                                                                                        
//-------------------------Silnik--------------------------------- 
//----------------------------------------------------------------  
cylinder { <-.9,0,0>,<1.1,0,0>, 0.220
           texture { pigment { kolorZielony}
                   //normal  { bumps 0.5 scale <0.25, 0.005,0.005>}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.24>
} // end of cylinder  ------------------------------------
cylinder { <-.9,0,0>,<-1.1,0,0>, 0.220
           texture { pigment { kolorCzarny}
                   //normal  { bumps 0.5 scale <0.25, 0.005,0.005>}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.24>
} // end of cylinder  ------------------------------------ 
//----------------------------------------------------------------                                                                                                                        
//-------------------------Pomost--------------------------------- 
//----------------------------------------------------------------      
difference{
box { <-.7, 0.00, -.55>,< 1.6, .015, .05>   

      texture { pigment{ kolorZielony}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture

      scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } 
box { <1,.3,-0.10>,< 1.7, 0.7, -0.40>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
}
//----------------------------------------------------------------                                                                                                                        
//-------------------------Kabina--------------------------------- 
//----------------------------------------------------------------    
#declare bokKabiny=// CSG difference, subtract intersections of shapes 2...N from Shape1
    difference {
    box { <1, 0.5, .015>,< 1.6, .0, 0>   
    
          texture { pigment{kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------
    box { <1.35, 0.45, .02>,< 1.55, .2, -.005>   
    
          texture { pigment{ kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------
    box { <1.05, 0.45, .02>,< 1.25, .2, -.005>   
    
          texture { pigment{ kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------
}   
#declare przodKabiny=// CSG difference, subtract intersections of shapes 2...N from Shape1
    difference {  
    box { <1.0, 0.5, -.55>,< 1.01, .0, 0.05>   
    
          texture { pigment{ kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------
    box { <.95, 0.45, -.52>,< 1.2, .05, -.43>   
    
          texture { pigment{ kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------    
    box { <.95, 0.45, 0.02>,< 1.2, .05, -.07>   
    
          texture { pigment{ kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------   
        box { <.95, 0.45, -.4>,< 1.2, .30, -.27>   
    
          texture { pigment{ kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------    
    box { <.95, 0.45, -.23>,< 1.2, .30, -.10>   
    
          texture { pigment{ kolorZielony}  
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------
}  
#declare dach=box { <.98, .5, -.57>,< 1.65, .52, .07>   

      texture { pigment{kolorZielony}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture

      scale <1,1,1> rotate<0,0,0> translate<0,.6,0> 
    } // end of box --------------------------------------
object{bokKabiny translate<0,0,.05>}
object{bokKabiny translate<0,0,-.55> } 
object{przodKabiny}  
object{dach}   
//----------------------------------------------------------------                                                                                                                        
//--------------------------Tyl----------------------------------- 
//----------------------------------------------------------------
difference {
box { <1.595,.3,-0.55>,< 1.6, 0.6, 0.05>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
box { <1,.3,-0.10>,< 1.7, 0.7, -0.40>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}    
}
//----------------------------------------------------------------                                                                                                                        
//----------------------Tylne zawieszenie---------------------- 
//---------------------------------------------------------------- 
difference {
box { <-.1,.1,-0.07>,< 1.6, 0.6, -.43>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
box { <1,.3,-0.10>,< 1.7, 0.7, -0.40>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
}
//----------------------------------------------------------------                                                                                                                        
//----------------------------Tlok-------------------------------- 
//---------------------------------------------------------------- 
#declare tlok=difference {

box { <0,.1,.1>,< -.6, 0.4, -.6>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}      
box { <1,0,.2>,< -.05, 0.35, -.7>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
box { <-.55,0,.2>,< -.7, 0.35, -.7>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  }
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
box { <-0.1,.15,.2>,< -.5, 0.2, -.7>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
} 
box { <-0.1,.25,.2>,< -.5, 0.35, -.7>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}
box { <0,0,.05>,< -.6, 0.35, -.55>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}   
}    
object{tlok translate<-.1,0,0>} 


//----------------------------------------------------------------                                                                                                                        
//-----------------------Koooooooniec-----------------------------   
//---------------------------------------------------------------- 
   
}    
//----------------------------------------------------------------   
//-----------------------Prezentacja------------------------------ 
//---------------------------------------------------------------- 

object{lokomotywa rotate y*360*clock}       
//object{lokomotywa translate<0,0,.22>}