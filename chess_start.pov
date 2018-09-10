#include "colors.inc"
#include "metals.inc"
#include "woods.inc"
#include "textures.inc"
#include "glass.inc"
#include "stones.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc" 
#include "golds.inc"       

    
//=====================================================================
//                              Camera & Light Source
//===================================================================== 
camera {
//   location <3.75-8*cos(2*pi*clock), 5, 2.25-8*(sin(2*pi*clock))>  
   location<-9,15,-20>
   look_at <3,1,7.25>
}
light_source {< 5, 7, 26> color Orange}

                                                        
//=====================================================================
//                      Horizontal Plane & Background Objects
//=====================================================================                    
                                                            
/* Horizontal Plane */
plane{ <0,1,0>, -0.012  // tiling pattern in the xz plane  

                texture{ T_Wood12    
                finish { phong 2 } 
                rotate<0,0,0> scale 3 translate<0,0,0>
              } // end of texture 


  }    
  
  
     
/*Center backgrouund*/     
box{<35,20,35> <-17.5,0,30> 
    
    pigment
    {    
        color White  
        //brick      
        //color Gray,          
        //color Gold           
       // brick_size <2,1,1>   
       // mortar     0.2  
         
    }
         
    }
    
    

/*Right background*/     
box{<35,20,35> <25,0,-6.5>
    pigment{ //brick      
             color White          
             //color Gold           
             //brick_size <2,1,1>   
             //mortar     0.2  
           }
    }
    
/*Left background*/     
box{<35,20,35> <25,0,-6.5>
    pigment{ //brick      
             color White          
             //color Gold           
             //brick_size <2,1,1>   
             //mortar     0.2  
           }
           translate <-50,0,0>
    }    
    
//rear non visible wall - glass shadow is casted on to this wall.
//Mirror above fireplace show glass and bookshelf shadows.   
//**DISCLAIMER** THIS WALL IN NO WAY LINES UP WITH ANYTHING! ONLY FOR THE PURPOSE OF THE MIRROR. 
box{<35,20,35> <-17.5,0,30> 
    
    pigment
    {    
        //color Red  
        //brick      
        //color Gray,          
        //color Gold           
       // brick_size <2,1,1>   
       // mortar     0.2  

            image_map {
                jpeg "wallpaper.jpg"
                map_type 0
                interpolate 2
                once
              }
         }
      scale <30,25,0> rotate<0,0,0> translate <15,0,-100> 
    }
     
                       
    
       
//Fireplace object
box { <-8.00, 0.00, 0.00>,< 8.00, 12.00, 0.00>   

       pigment{
            image_map {
                jpeg "fireplace.jpg"
                map_type 0
                interpolate 2
                once
              }
         }
      scale <15,15,14> rotate<0,0,0> translate<-2,-0.5,29.9999> 
    } // end of box --------------------------------------      

//mirror object
#declare mirror = box { <-1.00, 0.00, 0.00>,< 3.00, 12.00, 0.00>  
      material{   //-----------------------------------------------------------
        texture { pigment{ rgbf <0.98, 0.98, 0.98, 0.9> }
                  finish { diffuse 0.1 reflection 3  
                          specular 0.1 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
        interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
      } // end of material ----------------------------------------------------
       //scale <3,3,3> rotate<0,0,0> translate<2.5,12.5,30>
   }      
    
//bookshelf object
box { <-8.00, 0.00, 0.00>,< 8.00, 11.00, 0.00>   

       pigment{
            image_map {
                jpeg "bookshelf.jpg"
                map_type 0
                interpolate 2
                once
              }
         }
      scale <30,20,5> rotate<0,90,0> translate<20,0,22.75> 
      
      //translate<7.5,5.85,10>
    } // end of box --------------------------------------       
    
//=====================================================================
//                          Chess Board
//=====================================================================       
/* Chess Board */
box{ <9.75,5.7,8.25> <-2.25,5.4,-3.75> 
    pigment{
        checker pigment{
        rgb<0,0,0>},
        pigment{rgb<0.9,0.8,0.8>} 
        scale<1.5,0,1.5> translate<0.75,0,0.75>} 
} 


//=====================================================================
//                          Table Top
//=====================================================================
//table top 
cylinder { <0,0,0>,<0,0.7,0>, 15 

                texture{ T_Wood14
                normal { wood 0.1 scale 0.1 turbulence 0.01}
                finish { 
                    phong 1     
                    ambient .2 
                    specular 0.1 
                    roughness .001
                    reflection 0
                    } 
                rotate<30,0,100> scale 0.5
              } // end of texture 

           scale <1,1,1> rotate<0,0,0> translate<4,4.95,3>
         }   
          
//=====================================================================
//                          Table Legs
//=====================================================================
///sor front left leg
sor{  7, // # of points,  list of <x,y> points, spline rotates around y-axis 
     <0.00,0.00> 
     <0.12,0.00> 
     <0.62,0.54> 
     <0.21,0.83> 
     <0.19,2.70> 
     <0.29,2.71> 
     <0.46,1.53>
      texture{ T_Wood14
                normal { wood 0.1 scale 0.1 turbulence 0.01}
                finish { 
                    phong 1     
                    ambient .2 
                    specular 0.1 
                    roughness .001
                    reflection 0
                    } // end of texture 
                    }
     scale 2.7  rotate<0,0,0> translate<-6.27,-2,-6.85>
   } // end of sor ---------------------------------------------------------------------

///sor front right leg
sor{  7, // # of points,  list of <x,y> points, spline rotates around y-axis 
     <0.00,0.00> 
     <0.12,0.00> 
     <0.62,0.54> 
     <0.21,0.83> 
     <0.19,2.70> 
     <0.29,2.71> 
     <0.46,1.53>
      texture{ T_Wood14
                normal { wood 0.1 scale 0.1 turbulence 0.01}
                finish { 
                    phong 1     
                    ambient .2 
                    specular 0.1 
                    roughness .001
                    reflection 0
                    } // end of texture 
                    }
     scale 2.7  rotate<0,0,0> translate<7.5,-2,-8.5>
   } // end of sor ---------------------------------------------------------------------
  
///sor rear left leg
sor{  7, // # of points,  list of <x,y> points, spline rotates around y-axis 
     <0.00,0.00> 
     <0.12,0.00> 
     <0.62,0.54> 
     <0.21,0.83> 
     <0.19,2.70> 
     <0.29,2.71> 
     <0.46,1.53>
      texture{ T_Wood14
                normal { wood 0.1 scale 0.1 turbulence 0.01}
                finish { 
                    phong 1     
                    ambient .2 
                    specular 0.1 
                    roughness .001
                    reflection 0
                    } // end of texture 
                    }
     scale 2.7  rotate<0,0,0> translate<-6.2,-2,12>
   } // end of sor ---------------------------------------------------------------------

///sor rear right leg
sor{  7, // # of points,  list of <x,y> points, spline rotates around y-axis 
     <0.00,0.00> 
     <0.12,0.00> 
     <0.62,0.54> 
     <0.21,0.83> 
     <0.19,2.70> 
     <0.29,2.71> 
     <0.46,1.53>
      texture{ T_Wood14
                normal { wood 0.1 scale 0.1 turbulence 0.01}
                finish { 
                    phong 1     
                    ambient .2 
                    specular 0.1 
                    roughness .001
                    reflection 0
                    } // end of texture 
                    }
     scale 2.7  rotate<0,0,0> translate<7.75,-2,13.2>
   } // end of sor ---------------------------------------------------------------------
          
          
//======================================================================
//                              Ash Tray & Cigar
//======================================================================          
//ashtray                       
#declare ashtray = lathe { cubic_spline 8,
  <-1,0>,<0,0>, <2,0>, <2,2>, <3,2>, <3,1>,<0,1>,<-1,1>
   
   texture{
      pigment{ rgbf <0.98, 0.98, 0.98, 0.9> }
                  finish { diffuse 0.1 reflection 2  
                          specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
        interior{ ior 1.5 caustics 0.5
    }    
   }
                    
//cigar
  cylinder {
    <0, 1, 0>,     // Center of one end
    <1, 2, 3>,     // Center of other end
    0.5            // Radius
    open           // Remove end caps
    texture{ T_Wood2     
         finish { phong 1 } 
         rotate<0,0,0> scale 0.5 translate<0,0,0>
         } // end of texture 
         translate<2,5.7,-9>
          rotate <0,0,0>
 
    
  } 

//cigarFire  
#declare cigarFire=density{
  spherical
  turbulence 0.1 lambda 3
  density_map {
    [.01 rgb 0]
    [.01 rgb <1,0,0>]
    [1/4 rgb <1,.5,0>]
    [2/4 rgb <1,1,0>]
    [3/4 rgb <1,1,1>]
  }
}

sphere { 0,2 hollow no_shadow
  texture { pigment { rgbt 1 } }
  interior {
    media { emission 2 absorption 2
      density { cigarFire }
    }
  }
  translate<2,5.8,-9>
}


//cigarSmoke
 sphere
 { 0,1.5 pigment { rgbt 1 } hollow
   interior
   { media
     { absorption 15
       density
       { spherical density_map
         { [0 rgb 0]
           [0.5 rgb 0]
           [0.7 rgb .5]
           [1 rgb 1]
         }
         scale 1/2
         warp { turbulence 0.5 }
         scale 2
       }
     }
   }
   scale <0.1,10,-1> translate <2,5.8,-9>
 }

//======================================================================
//                               Glasses
//====================================================================== 
// A simple water glass made with a difference:
#declare glass=
difference
{ cone { <0,0,0>,1,<0,3.5,0>,1.2 }
  cone { <0,.1,0>,.9,<0,3.5,0>,1.1 }
  texture { Glass }
}

#declare glassWithWater=
union
{ object { glass }
  intersection
  { cone { <0,.1,0>,.9,<0,5.1,0>,1.1 }
    plane { y,2 }
    scale .999
    texture { Water }
  }
}  
     
//======================================================================
//                               Key
//======================================================================   
 #declare gold_key = union {
        //ring of key
        torus {
                0.5, 0.1
                translate <0, 0.1, 0>
        }
        //long bar of key
        cylinder {
                <0.5, 0.1, 0>, <3-0.1*0.4, 0.1, 0>, 0.1
        }
         //boxes represent the cut of key
        box {
                <2.1, 0+0.02, -0.5>
                <2.3, 0.2-0.02, 0>
        }
        box {
                <2.3, 0+0.02, -0.3>
                <2.5, 0.2-0.02, 0>
        }
        box {
                <2.5, 0+0.02, -0.4>
                <2.7, 0.2-0.02, 0>
        }

	    material {    
	        texture{ Polished_Brass
                   finish { phong 1}
            }
	    } 
}  

//silver key
#declare silver_key = union {
        //ring of key
        torus {
                0.5, 0.1
                translate <0, 0.1, 0>
        }
        //long bar of key
        cylinder {
                <0.5, 0.1, 0>, <3-0.1*0.4, 0.1, 0>, 0.1
        }
         //boxes represent the cut of key
        box {
                <2.1, 0+0.02, -0.5>
                <2.3, 0.2-0.02, 0>
        }
        box {
                <2.3, 0+0.02, -0.3>
                <2.5, 0.2-0.02, 0>
        }
        box {
                <2.5, 0+0.02, -0.4>
                <2.7, 0.2-0.02, 0>
        }

	    material {    
	        texture{ Polished_Chrome
                   finish { phong 1}
            }
	    } 
	     scale <1,1,1> rotate<0,180,0>
} 

 //======================================================================
//                             KeyRing
//=======================================================================
//house keyring  GOLD
// base
prism { -1.00 ,1.00 , 6
       <-1.00, 0.00>,  // first point
       < 1.00, 0.00>, 
       < 1.00, 1.00>, 
       < 0.00, 2.00>, 
       <-1.00, 1.00>, 
       <-1.00, 0.00>   // last point = first point!!!!
       rotate<-90,0,0> scale<1,1,-1> //turns prism in z direction! Don't change this line! 
       texture { T_Chrome_1A finish { phong 1}} 
       scale <0.50,0.50,0.50>       
       rotate <0,-30,0> 
       translate <-4.5,6.5,-9> 
     } 

// house roof
prism { -1.10 ,1.10 , 7
       <-1.05, 0.95>,  // first point
       < 0.00, 2.00>,  
       < 1.05, 0.95>, 
       < 1.05, 1.00>, 
       < 0.00, 2.05>, 
       <-1.05, 1.00>, 
       <-1.05, 0.95>  // last point = first point!!!!
       rotate<-90,0,0> scale<1,1,-1> //turns prism in z direction! Don't change this line! 
       texture { T_Chrome_1C finish { phong 1}}
       scale <0.50,0.50,0.50>       
       rotate <0,-30,0> 
       translate <-4.5, 6.5,-9> 
     } 

 torus { 0.35,0.05 
        texture { T_Chrome_1A finish { phong 1}} 
        scale <1,1,1> rotate<0,0,0> translate<-4.5,5.7,-7>
      }              


//keyring SILVER
sphere { <0,0,0>, 1.25  
         scale<0.5,0.125,0.5>
         
         texture { pigment{ color rgb< 1.0, 0.0, 0.2>}
                   normal { ripples 2.5 scale 0.07}
                   finish { phong 1 reflection{ 0.30 metallic 0.20} } 
                 } // end of texture
         rotate<0,0,0>  translate<7.5,5.85,10>  
       }  // end of sphere --------------------------------------------------  
       
torus { 0.35,0.05 
        texture { T_Chrome_1A finish { phong 1}} 
        scale <1,1,1> rotate<0,0,0> translate<7,5.75,10>
      }  
 //======================================================================
//                              Coin Body
//======================================================================
//creates an instance of a coin, this is then used and modified in each specific coin object  
         #declare COIN_BODY = union {

        difference {
                cylinder {
                        <0, 0, -0.1>, <0, 0, 0.1>, 1 
                        texture{pigment{color Gold *3.0}}
                }
        
                cylinder {
                        <0, 0, -0.2>, <0, 0, -0.077>, 0.88 
                }
        
                cylinder {
                        <0, 0, 0.2>, <0, 0, 0.077>, 0.88 
                }
                
                #declare n=0;
                
                #while(n<48)
                        cylinder {
                                <0, 0, -0.3>, <0, 0, 0.3>, 0.04 
                                translate <0, 1.03, 0>
                                rotate <0, 0, n*360/48>
                        }
                        
                
                        #declare n=n+1;
                #end
        
        }

        text {
                ttf "times.ttf" "E" 0.2, 0 
                texture { pigment{color Gold *5.0}}
                scale 0.25
                rotate <0, 0, 0>
                translate <0.08, 0.65, -0.1>
        }

        text {
                ttf "times.ttf" "2009" 0.2, 0
                texture { pigment{color Gold *5.0}}
                scale 0.25
                rotate <0, 0, 0>
                //translate <0.12, -0.75, -0.1>  
                translate <-0.30, -0.75, -0.1>
        }
}           
//======================================================================
//                              Gold Pieces
//======================================================================   
//2euroGoldKing
#declare gold_king = union {
   object {
          COIN_BODY
   }
        
   text {
        ttf "times.ttf" "2" 0.2, 0 
        texture {  pigment{color Gold *5.0}}
        scale 1
        rotate <0, 0, 0>
        translate <-0.20, -0.25, -0.1>
   }
        
        
   texture{   pigment{color Gold *1.2}
   }
        
   translate <0, 1, 0>
}        
  
//1 Euro Coin (Queen)  
#declare gold_queen = union {
   object {
          COIN_BODY
   }
        
   text {
        ttf "times.ttf" "1" 0.2, 0 
        texture {  pigment{color Gold *5.0}}
        scale 1
        rotate <0, 0, 0>
        translate <-0.10, -0.25, -0.1>
   }
        
        
   texture{   pigment{color Gold *1.2}
   }
        
   translate <0, 1, 0>
}
  
//50centGoldBishops         
#declare gold_bishop = union {
   object {
          COIN_BODY
   }
        
   text {
        ttf "times.ttf" "50" 0.2, 0 
        texture {  pigment{color Gold *5.0}}
        scale 0.75
        rotate <0, 0, 0>
        translate <-0.30, -0.25, -0.1>
   }
        
        
   texture{   pigment{color Gold *1.2}
   }
        
   translate <0, 1, 0>
}  
  
//20centGoldKnights  
#declare gold_knight = union {
   object {
          COIN_BODY
   }
        
   text {
        ttf "times.ttf" "20" 0.2, 0 
        texture {  pigment{color Gold *5.0}}
        scale 0.75
        rotate <0, 0, 0>
        translate <-0.35, -0.25, -0.1>
   }
        
        
   texture{   pigment{color Gold *1.2}
   }
        
   translate <0, 1, 0>
}      

//10centGoldRook         
#declare gold_rook = union {
   object {
          COIN_BODY
   }
        
   text {
        ttf "times.ttf" "10" 0.2, 0 
        texture {  pigment{color Gold *5.0}}
        scale 0.75
        rotate <0, 0, 0>
        translate <-0.35, -0.25, -0.1>
   }
        
        
   texture{   pigment{color Gold *1.2}
   }
        
   translate <0, 1, 0>
}          
//5centGoldPawns
 #declare gold_pawn = union {
        object {
                COIN_BODY
        }
        
        text {
                ttf "times.ttf" "5" 0.2, 0   
                texture {  pigment{color Gold *5.0}}
                scale 1
                rotate <0, 0, 0>
                translate <-0.20, -0.25, -0.1>
        }
        
        
         texture{ pigment{color Gold *1.2}
                   
            }
        
        translate <0, 1, 0>
       }        
 
//==========================================================================
//                            Silver Pieces 
//========================================================================== 

//2euroSilverKing         
 #declare silver_king = union {
   object {
          COIN_BODY
   }
        
   text {
        ttf "times.ttf" "2" 0.2, 0   
        texture{ pigment { color Silver *2.5 }}
        scale 1        
        rotate <0, 0, 0>
        translate <-0.25, -0.25, -0.1>
   }
        
        
   texture{   pigment{color Silver *1.2}
   }
        
   translate <0, 1, 0>
}        
//1EuroSilverQueen
#declare silver_queen = union {
   object {
        COIN_BODY
   }  
   
   text {
        ttf "times.ttf" "1" 0.2, 0   
        texture{ pigment { color Silver *2.5 }}
        scale 1        
        rotate <0, 0, 0>
        translate <-0.25, -0.25, -0.1>
   }
       
   texture{ pigment{
    color Silver * 1.2
   }
   }
        
   translate <0, 1, 0>
}             

//50centSilverBishops         
#declare silver_bishop = union {
   object {
        COIN_BODY
   }  
   
   text {
        ttf "times.ttf" "50" 0.2, 0   
        texture{ pigment { color Silver *2.5 }}
        scale 0.75       
        rotate <0, 0, 0>
        translate <-0.35, -0.25, -0.1>
   }
       
   texture{ pigment{
    color Silver * 1.2
   }
   }
        
   translate <0, 1, 0>
} 
//20centSilverdKnights  
#declare silver_knight = union {
   object {
        COIN_BODY
   }  
   
   text {
        ttf "times.ttf" "20" 0.2, 0   
        texture{ pigment { color Silver *2.5 }}
        scale 0.75     
        rotate <0, 0, 0>
        translate <-0.35, -0.25, -0.1>
   }
       
   texture{ pigment{
    color Silver * 1.2
   }
   }
        
   translate <0, 1, 0>
} 
//10centSilverRooks
#declare silver_rook = union {
   object {
        COIN_BODY
   }  
   
  text {
        ttf "times.ttf" "10" 0.2, 0   
        texture{ pigment { color Silver *2.5 }}
        scale 0.75        
        rotate <0, 0, 0>
        translate <-0.25, -0.25, -0.1>
   } 
       
   texture{ pigment{
    color Silver * 1.2
   }
   }
        
   translate <0, 1, 0>
} 

//5centGoldPawns
#declare silver_pawn = union {
   object {
          COIN_BODY
   }
        
   text {
        ttf "times.ttf" "5" 0.2, 0   
        texture{ pigment { color Silver *2.5 }}
        scale 1        
        rotate <0, 0, 0>
        translate <-0.35, -0.25, -0.1>
   }
   texture{ pigment{color Silver * 1.2}}
        
    translate <0, 1, 0>
}
//==========================================================================
//                            Display - Gold Pieces
//==========================================================================  
/* Display Chess set */
//gold backrow
object{gold_king scale <0.60, 0.60, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,1.5>}
object{gold_queen scale <0.55, 0.55, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,3>}  
object{gold_bishop scale <0.525, 0.525, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,0>}
object{gold_bishop scale <0.525, 0.525, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,4.5>}
object{gold_knight scale <0.45, 0.45, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,-1.5>}
object{gold_knight scale <0.45, 0.45, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,6>}
object{gold_rook scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,7.5>}
object{gold_rook scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <-1.5,5.8,-3>}

//gold pawns
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,-3>}   
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,-1.5>}
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,0>}
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,1.5>}
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,3>}
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,4.5>}
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,6>}    
object{gold_pawn  scale <0.35, 0.35, 0.4> rotate <0, 7, 0> translate <0,5.8,7.5>}  

//==========================================================================
//                            Display - Silver Pieces
//========================================================================== 
//silver backrow
object{silver_king scale <0.60, 0.60, 0.4> rotate <0, 7, 0> translate <9,5.8,1.5>}
object{silver_queen scale <0.55, 0.55, 0.4> rotate <0, 7, 0> translate <9,5.8,3>}
object{silver_bishop scale <0.525, 0.525, 0.4> rotate <0, 7, 0> translate <9,5.8,4.5>}
object{silver_bishop scale <0.525, 0.525, 0.4> rotate <0, 7, 0> translate <9,5.8,0>}
object{silver_knight scale <0.45, 0.45, 0.4> rotate <0, 7, 0> translate <9,5.8,-1.5>}
object{silver_knight scale <0.45, 0.45, 0.4> rotate <0, 7, 0> translate <9,5.8,6>}
object{silver_rook scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <9,5.8,7.5>}
object{silver_rook scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <9,5.8,-3>}

//silver pawns
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,-3>}   
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,-1.5>}
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,0>}
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,1.5>}
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,3>}
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,4.5>}
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,6>}    
object{silver_pawn  scale <0.40, 0.40, 0.4> rotate <0, 7, 0> translate <7.5,5.8,7.5>}

//==========================================================================
//                            Display - Miscellaneous
//==========================================================================
object{ashtray translate <2,5.2,-9>}

//left glass
object{glassWithWater rotate <0,0,0> translate <-6,5.7,7>}
//right glass
object{glassWithWater rotate <0,0,0> translate <10,5.7,-6>} 
 
//gold left key
object{gold_key rotate <0, 7, 0> translate <-5,5.8,-7>} 
//gold right key
object{gold_key rotate <180, 270, 0> translate <-5.5,5.8,-7>}

//right silver key
object{silver_key rotate <0, 7, 0> translate <6,5.8,10>}
//left silver key
object{silver_key rotate <180, 90, 0> translate <6.5,5.8,10>}   

object{mirror scale <3,3,3> rotate<0,0,0> translate<2.25,12.5,28.9999>}

