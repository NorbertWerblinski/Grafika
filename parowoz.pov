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
#include "shapes3.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0 , 1 ,-4>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , -.5>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0 , 3.0 ,-.25>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 90 // lewo
                            location  <-3.0 , 2 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>} 
#declare Camera_5 = camera {/*ultra_wide_angle*/ angle 75      //tyl
                            location  <0.0 , 1.0 ,3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}   
#declare Camera_6 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <-1.5 , 1.5 ,-2.5>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_6}
// sun ---------------------------------------------------------------------
light_source{<-1500,2500,2500> color White}   
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
#declare kolorZloty= rgb<204/255,93/255,43/255> ;  
#declare kolorZielony=rgb<50/255,65/255,42/255>;    
#declare kolorCzarny=rgb<15/255,10/255,10/255>;  
#declare kolorRozowy=rgb<205/255,50/255,50/255>;
//--------------------------------------------------------------------------
//---------------------------- Lokomotywa ----------------------------------
//--------------------------------------------------------------------------

#declare lokomotywa=union{
//----------------------------------------------------------------                                                                                                                        
//---------------------------OSIE---------------------------------
//----------------------------------------------------------------       
#declare kolo=union{

difference{object{ Rounded_Tube_AB( <0,0,0>, // Point_A
                         <0,0,-0.05>, // Point_A
                         0.57, // tube radius outside
                         0.45, // tube inner radius 
                         0.02, // border radius 
                         1, // 0 = union, 1 = merge for transparent materials 
                       ) //--------------------------------------------------  
        texture{ Gold_Metal                              
               } 
        scale <1,1,1> 
        rotate<0,0,0> 
        translate<0,0,0>                 
      } 
object{ Rounded_Tube_AB( <0,0,-.02>, // Point_A
                         <0,0,-0.1>, // Point_A
                         0.60, // tube radius outside
                         0.52, // tube inner radius 
                         0.02, // border radius 
                         1, // 0 = union, 1 = merge for transparent materials 
                       ) //--------------------------------------------------  
        texture{ pigment { Red }
                 finish  { phong 0.5 reflection{ 0.00 metallic 0.00} }                              
               } 
        scale <1,1,1> 
        rotate<0,0,0> 
        translate<0,0,0>                 
      } 
      }
    cylinder { <0,0,0>,<0,0,.05>,0.1                                                         //piasta
               texture {Gold_Metal
                       } // end of texture
               scale <1,1,1> rotate<0,0,0> translate<0,0,-0.025>
             } // end of cylinder  ------------------------------------  
                                                                                                //szprychy
    #for (i,0, 360, 30)
            
    difference{cylinder { <0,0,0>,<0,.5,0>, 0.02 
    
               texture { pigment { Red }
                       //normal  { bumps 0.5 scale <0.005,0.25,0.005>}
                         finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                       } // end of texture
    
               scale <1,1,1> rotate<0,0,i> translate<0,0,-0.005>
    }          
    box{<-1,-1,-0.0235><1,1,-1>
     texture {Gold_Metal} 
     }
    }          
    #end     
}  

#declare os= union{
    object{kolo translate<0,0,-1>} 
    object{kolo rotate<0,180,0> }      
    cylinder { <0,0,0.03>,<0,0,-1.03>,0.05 
               texture { pigment { Red}
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
                       texture { Gold_Metal
                               } // end of texture
                       scale <1,1,1> rotate<0,0,0> 
            } // end of cylinder  ------------------------------------     

    }  
    box { <-.05, 0.00, -.05>,< .05, .15, .05>   

      texture { Gold_Metal
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
    
          texture { Gold_Metal
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.28,0> 
        } // end of box --------------------------------------     
    cylinder { <0,0,0>,<0,.5,0>, 0.2 
    
               texture { Gold_Metal
                       } // end of texture
    
               scale <1,1,1> rotate<0,0,0> translate<-1.15,0,.1>
             } // end of cylinder -------------------------------------   
    box { <-.5,0,-0.00>,< -1.15, 1, -.1>   
        
              texture { Gold_Metal
                      } // end of texture
        
              scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
            } // end of box --------------------------------------  
     cylinder { <0,0,-.6>,<0,.5,-.6>, 0.2 
    
               texture { Gold_Metal
                       } // end of texture
    
               scale <1,1,1> rotate<0,0,0> translate<-1.15,0,0>
             } // end of cylinder -------------------------------------   
    box { <-.5,0,-0.6>,< -1.15, 1, -.4>   
        
              texture { Gold_Metal
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
cylinder { <0,0,0>,<0,.15,0>, 0.02 

           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.37,.32,-.48>
} 
cylinder { <0,0,0>,<0,.15,0>, 0.02 

           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.37,.32,-.02>
}   
cylinder { <0,.15,0>,<.32,.3,0>, 0.02 

           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.37,.32,-.48>
} 
cylinder { <0,.15,0>,<.32,.3,0>, 0.02 

           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.37,.32,-.02>
}
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal
                } 
          scale<1,1,1>  rotate<0,0,0>  translate<-1.37,.47,-.48> 
}
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal
                } 
          scale<1,1,1>  rotate<0,0,0>  translate<-1.37,.47,-.02> 
} 
cylinder { <.36,.3,.02>,<.36,.3,-.48>, 0.05 

           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.37,.32,-.02>
}
//----------------------------------------------------------------                                                                                                                        
//---------------------------Plug--------------------------------- 
//---------------------------------------------------------------- 

cylinder { <0,0,0>,<0,0,-.5>,0.02 
           texture { Gold_Metal
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,.3,0>
         } // end of cylinder  ------------------------------------
cylinder { <0,0,.03>,<0,0,-.5>,0.02 
           texture { Gold_Metal
                   } // end of texture
           scale <1,1,1> rotate<0,45,0> translate<-1.4,0.05,.1>
         } // end of cylinder  ------------------------------------
cylinder { <0,0,-.5>,<0,0,.03>,0.02 
           texture { Gold_Metal
                   } // end of texture
           scale <1,1,1> rotate<0,135,0> translate<-1.4,0.05,-.6>  
         } // end of cylinder  ------------------------------------ 

#for (i,0,4)
cylinder { <0,.3,-.25*i/5>,<-.35*i/5,.05,.1-.35*i/5>,0.02 
           texture { Gold_Metal
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,0,0>  
         } // end of cylinder  ------------------------------------ 
#end 
cylinder { <0,.3,-.25>,<-.35,.05,-.25>,0.02 
           texture { Gold_Metal
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,0,0>  
         } // end of cylinder  ------------------------------------ 

#for (i,0,4)
cylinder { <0,.3,-.5+.25*i/5>,<-.35*i/5,.05,-.6+.35*i/5>,0.02 
           texture { Gold_Metal
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<-1.4,0,0>  
         } // end of cylinder  ------------------------------------ 
#end  
//----------------------------------------------------------------                                                                                                                        
//-------------------------Silnik--------------------------------- 
//----------------------------------------------------------------  
cylinder { <-.9,0,0>,<1.1,0,0>, 0.220
           texture { pigment { kolorZielony} 
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}
cylinder { <.5,0,0>,<1.1,0,0>, 0.250
           texture { pigment { kolorZielony} 
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
} 
torus { .22,0.01 
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<0,0,90> translate<.3,.6,-.25>
      }  
torus { .25,0.01 
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<0,0,90> translate<.5,.6,-.25>
      }
torus { .25,0.01 
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<0,0,90> translate<1,.6,-.25>
      }            
torus { .22,0.01 
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<0,0,90> translate<-.9,.6,-.25>
      }
torus { .22,0.01 
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<0,0,90> translate<-.3,.6,-.25>
      }  
cone { <.3,0,0>,0.22,<.5,0,0>,.25

       texture { pigment { kolorZielony} 
                 finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
               } // end of texture

       scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>         
} 

cylinder { <-.9,0,0>,<1.0,0,0>, 0.220
           texture { pigment { kolorZielony}
                   //normal  { bumps 0.5 scale <0.25, 0.005,0.005>}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}
cylinder { <-.9,0,0>,<-1.1,0,0>, 0.220
           texture { pigment { kolorCzarny}
                   //normal  { bumps 0.5 scale <0.25, 0.005,0.005>}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}
cylinder { <-.9,0,0>,<-1.125,0,0>, 0.20
           texture { pigment { kolorCzarny} 
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}
cylinder { <-.9,0,0>,<-1.15,0,0>, 0.18
           texture { pigment { kolorCzarny}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}    
cylinder { <-.9,0,0>,<-1.175,0,0>, 0.16
           texture { pigment { kolorCzarny}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}
cylinder { <-.9,0,0>,<-1.2,0,0>, 0.14
           texture { pigment { kolorCzarny}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}  
cylinder { <-.9,0,0>,<-1.25,0,0>, 0.12
           texture { pigment { kolorCzarny}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.6,-.25>
}   
torus { .1,0.02  rotate<0,0,0>
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<0,0,90> translate<-1.25,.6,-.25>
}            
sphere { <0,0,0>, 0.07

        texture { Gold_Metal
                } 
          scale<1,1,1>  rotate<0,0,0>  translate<-1.22,.6,-.25> 
}  
box { <0,0,0>,< .5,.025, -.2>   
      texture { pigment{ color kolorCzarny}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } 
      scale <1,1,1> rotate<0,0,0> translate<-1.4,.80,-.15>  
} 
cylinder { <0,0,-0.5>,<0,0,-.45>,0.03 
           texture { pigment {kolorZielony}
 
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-.85,.77,0>
}
cylinder { <0,0,-0.5>,<0,0,-.45>,0.03 
           texture { pigment { kolorZielony}
 
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<.2,.77,0>
}    
cylinder { <0,0,-.05>,<0,0,-.45>,0.03 
           texture { pigment { kolorZielony}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<.9,.77,0>
}  

cylinder { <0,0,0>,<0,0,-.5>,0.02
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-.85,.77,0>
}
cylinder { <0,0,0>,<0,0,-.5>,0.02
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<.2,.77,0>
}    
cylinder { <0,0,0>,<0,0,-.5>,0.02 
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<.9,.77,0>
} 
cylinder { <-1,0,0>,<1,0,0>, 0.02
           texture { Gold_Metal 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.77,-.5>
         }   
cylinder { <-1,0,0>,<1,0,0>, 0.02
           texture { Gold_Metal 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.77,0>
         }          
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal 
                } 
          scale<1,1,1>  rotate<0,0,0>  translate<-1,.77,-.5> 
       } 
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal 
                } 
          scale<1,1,1>  rotate<0,0,0>  translate<-1,.77,0> 
       }        

 
//----------------------------------------------------------------                                                                                                                        
//--------------------------Lampa--------------------------------- 
//---------------------------------------------------------------- 
box { <0,0,0>,< .2,.025, -.2>   
      texture { pigment{ kolorRozowy}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } 
      scale <1,1,1> rotate<0,0,0> translate<-1.4,.825,-.15>  
} 
difference{  
box { <0,0,0>,< .18,.2, -.18>   
      texture { pigment{ kolorRozowy}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } 
      scale <1,1,1> rotate<0,0,0> translate<-1.4,.85,-.16>  
}   
box { <0,-1,0>,< .2,1, -.2>   
      texture { pigment{  kolorRozowy}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } 
      scale <1,1,1> rotate<0,0,2> translate<-1.25,.85,-.15>  
}
}  
cylinder { <.36,.3,0>,<.36,.3,-.1>, 0.05 

           texture { pigment { kolorRozowy}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.7,.8,-.2>
} 
box { <0,0,0>,< .09,.1, -.1>   
      texture { pigment{ kolorRozowy}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } 
      scale <1,1,1> rotate<0,0,2> translate<-1.38,1.0,-.2>  
}
cylinder { <0,0,0>,<-.03,0,0>, 0.07
           texture { pigment { kolorRozowy}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.4,.95,-.25>
} 
torus { .05,0.01  rotate<0,0,0>
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<0,0,90> translate<-1.43,.95,-.25>
}            
sphere { <0,0,0>, 0.03

        texture { Gold_Metal
                } 
          scale<1,1,1>  rotate<0,0,0>  translate<-1.43,.95,-.25>
}    
//----------------------------------------------------------------                                                                                                                        
//--------------------------Komin #1------------------------------ 
//---------------------------------------------------------------- 
cylinder { <0,0,0>,<0,.2,0>, 0.06 

           texture { pigment { kolorCzarny }
                       finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   }
           scale <1,1,1> rotate<0,0,0> translate<-1.,.8,-.25>
}
cone { <0,.2,0>,0.06 ,<0,.5,0>,.22 

       texture { pigment{ kolorCzarny}
                 finish { phong 1 reflection{ 0.00 metallic 0.00} } 
               }
       scale <1,1,1> rotate<0,0,0> translate<-1.,.8,-.25>  
}
torus { .22,0.01 
        texture { pigment{ kolorCzarny}
                 finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                }
        scale <1,1,1> rotate<0,0,0> translate<-1.,1.3,-.25> 
        }
cylinder { <0,0,0>,<0,.1,0>, 0.22

           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<-1.,1.3,-.25>
}
torus { .22,0.01 
        texture {Gold_Metal}
        scale <1,1,1> rotate<0,0,0> translate<-1.,1.4,-.25> 
        }
cone { <0,.55,0>,.1,<0,.5,0>,.22 

       texture { Gold_Metal
               }
       scale <1,1,1> rotate<0,0,0> translate<-1.,.9,-.25>  
}                 
//----------------------------------------------------------------                                                                                                                        
//--------------------------Komin #2------------------------------ 
//---------------------------------------------------------------- 
cylinder { <0,0,0>,<0,.1,0>, 0.15 

           texture { pigment { kolorZielony }
                       finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   }
           scale <1,1,1> rotate<0,0,0> translate<-0,.75,-.25>
}       
cone { <0,0,0>,.15,<0,.05,0>,.13

       texture { Gold_Metal
               }
       scale <1,1,1> rotate<0,0,0> translate<-0,.85,-.25> 
} 
cylinder { <0,0,0>,<0,.2,0>, 0.13 

           texture { Gold_Metal
                   }
           scale <1,1,1> rotate<0,0,0> translate<-0,.85,-.25>
} 
sphere { <0,0,0>, 0.13 

        texture { Gold_Metal
                }

          scale<1,1,1>  rotate<0,0,0>  translate<-0,1.05,-.25> 
}
torus { .13,0.02 
        texture { Gold_Metal
                } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<-0,1.05,-.25>
}             
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal
                }
          scale<1,1,1>  rotate<0,0,0>  translate<-0,1.18,-.25> 
}
//----------------------------------------------------------------                                                                                                                        
//--------------------------Komin #3------------------------------ 
//----------------------------------------------------------------  
cylinder { <0,0,0>,<0,.1,0>, 0.15 

           texture { pigment { kolorZielony }
                       finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   }
           scale <1,1,1> rotate<0,0,0> translate<.75,.75,-.25>
}       
cone { <0,0,0>,.15,<0,.05,0>,.13

       texture { Gold_Metal
               }
       scale <1,1,1> rotate<0,0,0> translate<.75,.85,-.25> 
} 
cylinder { <0,0,0>,<0,.25,0>, 0.13 

           texture { Gold_Metal
                   }
           scale <1,1,1> rotate<0,0,0> translate<.75,.85,-.25>
} 
sphere { <0,0,0>, 0.13 

        texture { Gold_Metal
                }

          scale<1,1,1>  rotate<0,0,0>  translate<.75,1.05,-.25> 
}
torus { .13,0.02 
        texture { Gold_Metal
                } // end of texture
        scale <1,1,1> rotate<0,0,0> translate<.75,1.1,-.25>
}             
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal
                }

          scale<1,1,1>  rotate<0,0,0>  translate<.75,1.23,-.25> 
}
cone { <0,-.1,0>,0.08,<0,.05,0>,0
           texture { Gold_Metal
                   }
           scale <1,1,1> rotate<0,0,0> translate<.75,1.2,-.25>
} 
//----------------------------------------------------------------                                                                                                                        
//--------------------------Dzwonek------------------------------ 
//---------------------------------------------------------------- 
#declare dzwonek=union{
object{ Paraboloid_X
        clipped_by { box {<0,-1.5,-1.5>,<1.0, 1.5,1.5>} }  
        texture { Gold_Metal
                }
        scale <.2,.1,0.1> rotate<0,0,-90> translate<0,.3,0.0>
} 
cylinder { <0,-.1,0>,<0,.3,0>, 0.02 

           texture { Gold_Metal
                   }

           scale <1,1,1> rotate<0,0,0> translate<0,0,-.15>
} 
sphere { <0,0,0>, 0.02

        texture { Gold_Metal
                } 

          scale<1,1,1>  rotate<0,0,0>  translate<0,0.3,-.15>  
} 
cylinder { <0,-.1,0>,<0,.3,0>, 0.02 

           texture {Gold_Metal
                   } // end of texture

           scale <1,1,1> rotate<0,0,0> translate<0,0,.15>
}
sphere { <0,0,0>, 0.02

        texture { Gold_Metal
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0,0.3,.15>  
}
sphere { <0,0,0>, 0.05

        texture {Gold_Metal
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0,0.3,0>  
}
cylinder { <0,.1,0>,<0,.4,0>, 0.01 

           texture { Gold_Metal
                   } // end of texture

           scale <1,1,1> rotate<0,0,0> translate<0,0,>
}
sphere { <0,0,0>, 0.03

        texture {Gold_Metal
                } 

          scale<1,1,1>  rotate<0,0,0>  translate<0,0.1,0>  
} 
cylinder { <0,0,-.15>,<0,0,.15>,0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<0,.3,0>
} 
}
object{dzwonek scale <.75,.75,.75> rotate<0,0,0> translate<-.6,.77,-.25>}                                                             

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
#declare bokKabiny=
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
cylinder { <0,0,0>,<.5,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.05,1.05,-.55>
         } 
cylinder { <0,0,0>,<.5,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.05,1.05,.06>
         }
cylinder { <0,0,0>,<.5,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.05,.8,-.55>
         } 
cylinder { <0,0,0>,<.5,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.05,.8,.06>
         } 
cylinder { <0,0,0>,<.4,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.1,.75,-.55>
         } 
cylinder { <0,0,0>,<.4,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.1,.75,.06>
         }
cylinder { <0,0,0>,<.4,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.1,.63,-.55>
         } 
cylinder { <0,0,0>,<.4,0,0>, 0.01
           texture { Gold_Metal
                   } 
           scale <1,1,1> rotate<0,0,0> translate<1.1,.63,.06>
         }               
difference{torus { .06,.01
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<90,0,0> 
}   
box{<0,-1,-1>,<1,1,1>
    texture { Gold_Metal}
    }
   translate<1.1,.687,-.55>
} 
difference{torus { .06,.01
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<90,0,0> 
}   
box{<0,-1,-1>,<1,1,1>
    texture { Gold_Metal}
    }
   translate<1.1,.687,.06>
}
difference{torus { .06,.01
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<90,0,0> 
}   
box{<-1,-1,-1>,<0,1,1>
    texture { Gold_Metal}
    }
   translate<1.5,.687,-.55>
}
difference{torus { .06,.01
        texture { Gold_Metal
                } 
        scale <1,1,1> rotate<90,0,0> 
}   
box{<-1,-1,-1>,<0,1,1>
    texture { Gold_Metal}
    }
   translate<1.5,.687,0.06>
}
text { ttf "arial.ttf", "114", 0.02, 0.0 // thickness, offset

       texture{ Gold_Metal
              } // end of texture

       scale<1,1.25,1>*0.1
       rotate<0,180,0>
       translate<1.38,.65,0.067>
      } 
text { ttf "arial.ttf", "114", 0.02, 0.0 // thickness, offset

       texture{ Gold_Metal
              } // end of texture

       scale<1,1.25,1>*0.1
       translate<1.24,.65,-.557>
      }
   
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
box { <1,.5,-0.10>,< 1.7, 0.7, -0.40>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}    
} 
box { <1.6,.49,-0.55>,< 2, 0.5, 0.05>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}
box { <1.8,.49,-.55>,< 2, 0.65, -.54>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}
box { <1.6,.49,0.04>,< 2, 0.65, 0.05>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
box { <1.99,.49,-0.55>,< 2, 0.65, 0.05>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
} 
difference{
box { <1.6,.1,-.55>,< 1.8, 0.50, -.58>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
box { <1.61,.1,-.551>,< 1.79, 0.50, -.59>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}
} 
#for(i,1,5)
box { <1.61,0,-.55>,< 1.79, 0.01, -.58>   
    
          texture { pigment{kolorCzarny}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,.1*i,0> 
}   
#end
//----------------------------------------------------------------                                                                                                                        
//----------------------Tylne zawieszenie---------------------- 
//---------------------------------------------------------------- 
difference{
box { <-.1,.1,-0.07>,< 1.6, 0.6, -.43>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
box { <1,.5,-0.10>,< 1.7, 0.7, -0.40>   
    
          texture { pigment{kolorZielony}
                    finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture
    
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}  
}  
object{ Segment_of_CylinderRing( .32, // major radius,
                                 0.31, // minor radius,  
                                 .6, // height H,
                                 -180  // angle (in degrees)  
                               ) //-----------------------------------------
        texture{ pigment{ kolorZielony} 
                 finish { phong 1}
               } // end of texture 
        scale <1,1,1> rotate<-90,0,0> translate<.25,.25,.05>
      } 
object{ Segment_of_CylinderRing( .32, // major radius,
                                 0.31, // minor radius,  
                                 .6, // height H,
                                 -180  // angle (in degrees)  
                               ) //-----------------------------------------
        texture{ pigment{ kolorZielony} 
                 finish { phong 1}
               } // end of texture 
        scale <1,1,1> rotate<-90,0,0> translate<1.1,.25,.05>
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
#declare popychacz=difference{box { <0,0,.0>,< .95, 0.1, -.01>   
    
          texture { Gold_Metal
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}     
box{<.01,0.01,-.009><.19,.09,-.02>
    texture{pigment {kolorCzarny}
    finish{phong 1}
    } translate<0,0,0> 
} 
box{<.01,0.01,-.008><.19,.09,-.02>
    texture{pigment {kolorCzarny}
    finish{phong 1}
    } 
    translate <.75,0,0>
}

box { <.2,0,.01>,< .75, 0.03, -.02>   
    
          texture { Gold_Metal
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
} 
box { <.2,0.6,.01>,< .75, 0.07, -.02>   
    
          texture { Gold_Metal
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}
box{<.19,0.04,-.009><.78,.06,-.02>
    texture{pigment {kolorCzarny}
    finish{phong 1}  
    translate<0,0,0> 
    } 
    
} 
}
#declare popychacz2=difference{box { <0,0,.0>,< .95, 0.1, -.01>   
    
          texture { Gold_Metal
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}     
box{<.01,0.01,-.009><.44,.09,-.02>
    texture{pigment {kolorCzarny}
    finish{phong 1}
    } translate<0,0,0> 
} 
box{<.01,0.01,-.008><.19,.09,-.02>
    texture{pigment {kolorCzarny}
    finish{phong 1}
    } 
    translate <.75,0,0>
}

box { <.45,0,.01>,< .75, 0.03, -.02>   
    
          texture { Gold_Metal
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
} 
box { <.45,0.6,.01>,< .75, 0.07, -.02>   
    
          texture { Gold_Metal
                  } 
          scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
}
box{<.19,0.04,-.009><.78,.06,-.02>
    texture{pigment {kolorCzarny}
    finish{phong 1}  
    translate<0,0,0> 
    }   
} 
}
object{popychacz scale<1.1,1,1> translate<.25,.25,-.55>}
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal
                } // end of texture
          scale<1,1,1>  rotate<0,0,0>  translate<1.2,.3,-.57>  
       }  
object{popychacz rotate<0,180,0> scale<1.1,0,0> translate<1.3,.25,0.05>} 
sphere { <0,0,0>, 0.02 

        texture { Gold_Metal
                } // end of texture
          scale<1,1,1>  rotate<0,0,0>  translate<1.2,.3,.07>  
       } 
object{popychacz2 scale<.8,1,1> rotate<0,0,13> translate<-.30,.08,-.56>}  
sphere { <0,0,0>, 0.02

        texture { Gold_Metal
                } // end of texture
          scale<1,1,1>  rotate<0,0,0>  translate<.37,.29,-.57>  
       } 
  
object{popychacz2 scale<.8,1,1> rotate<0,180,193> translate<-.32,.18,0.06>} 
sphere { <0,0,0>, 0.02

        texture { Gold_Metal}
          scale<1,1,1>  rotate<0,0,0>  translate<.37,.29,.07>  
       }   
difference{sphere { <0,0,0>, 0.06
        texture { Gold_Metal }

       } 
box{<-1,-1,0>,<1,1,1>
   texture{Gold_Metal}
     } 
     translate<-.25,0.15,-.6>
 }      
difference{sphere { <0,0,0>, 0.06

        texture { Gold_Metal
                } 
          scale<1,1,1>  rotate<0,0,0>    
       }
box{<-1,-1,0>,<1,1,1>
   texture{Gold_Metal}
     } 
     rotate<0,180,0> translate<-.25,0.15,.1>
 }      
//----------------------------------------------------------------                                                                                                                        
//-----------------------Koooooooniec-----------------------------   
//---------------------------------------------------------------- 
   
}    
//----------------------------------------------------------------   
//-----------------------Prezentacja------------------------------ 
//---------------------------------------------------------------- 

object{lokomotywa rotate y*360*clock}       
//object{lokomotywa translate<0,0,.22>}