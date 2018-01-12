//Kanal
/*
 * Anleitung:
 * 1) Trassenboden, Trassendeckel und Trassenwände sägen
 * 2) 6 Steckdosenlöcher bohren
 * 3) 8 Fußblöcke anschrauben
 * 4) Seiten
 */

module Trasse(){
  translate ([0,0,0])     cube([1600, 120, 16]); //Trassenboden
  translate ([0,0,66])    cube([1600, 120, 16]); //Trassendeckel
  translate ([0,-16,0])   cube([1600, 16, 150]); //Trassenwand
  translate ([0,120,0])   cube([1600, 16, 150]); //Trassenwand

  translate ([200,20,86]) rotate([-90,0,0]) Steckdose(8,space=80);

  translate ([100,0,-50])   cube([50, 30, 50]); //Fuss
  translate ([100,90,-50])   cube([50, 30, 50]); //Fuss
  translate ([800,0,-50])   cube([50, 30, 50]); //Fuss
  translate ([800,90,-50])   cube([50, 30, 50]); //Fuss
  translate ([1450,0,-50])   cube([50, 30, 50]); //Fuss
  translate ([1450,90,-50])   cube([50, 30, 50]); //Fuss
}


module Tisch(){
  color("gray"){
    translate ([0,0,800]) cube([1600, 850, 20]);
    //Beine
    translate ([50,50,0]) cube([50,50,800]);
    translate ([1550,50,0]) cube([50,50,800]);
    translate ([1550,750,0]) cube([50,50,800]);
    translate ([50,750,0]) cube([50,50,800]);
  }
}

//Steckdose( xfach=1, ausrichtung="vert"); //wieviele Dosen und ausrichtung
module Steckdose(xfach=1, horz=true, space=0){
  le = 80;
  h=le*xfach;
  b=le;

  for( i=[1:1:xfach] ){
    if(horz) translate([le*(i-1)+space*(i-1),0,0]) eineDose();
    else translate([0,0,le+space*(i-1)+space*(i-1)]) eineDose();
  }


  module eineDose(){
    difference(){
      h=le;
      b=le*xfach;
      cube([80,5,80]);

      translate([0,55,0]) {
        union(){
          translate([40,-52,40]) rotate([90,0,0])  cylinder(15,35,35);
          translate([25,-20,40]) rotate([90,0,0])  cylinder(55,5,5);
          translate([53,-20,40]) rotate([90,0,0])  cylinder(55,5,5);
        }
      }
    }
  }
}

Tisch();
translate([0,400,870]) Trasse();
