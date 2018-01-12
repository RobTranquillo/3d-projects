//Farben
hauswand = "Snow";
kuechenboden = "Gray";
fussboden = "#443333";
holzbalken = "PaleGreen";
holzlatten = "ForestGreen";
OSB3BodenPlatten = "SpringGreen";

//Raum
/**/
Fussboden();
Podest();
Kuechenboden();
Fensterwand();
Kuehlschrankwand();
Eingangswand();
Saulen();

module Podest(){
  color("green",1)
  {
    Wandbalken();
    Fuesse();
    Kopfbalken();
    Kopfquertraeger();
    Bodentraeger2();
  }
  Fussbodenplatten();
  Stepup();

  module Kopfquertraeger()
  {   //https://www.hornbach.de/shop/Latte-24x48x2000-mm-Fichte-Tanne/1000664/artikel.html
    module traeger(x){
      translate([x,0,0])
      cube([100,2000,100]);
    }
    translate([0,-2000,1352])
    {
      traeger(385);
      traeger(385+1390);
      traeger(385+1390+525);
    }

    //oberer Podestteil
    translate([0,-2000,1352])
    {
      traeger(2300);
      traeger(3552);
    }
  }

  module Kopfbalken(){ //https://www.hornbach.de/shop/Brettschichtholz-100x100x3250-mm-Fichte-SI-sichtbarer-Einbau/5955297/artikel.html
    translate([0,0,1352])
    {
      //K1
      translate([-10,-2000,0]) cube([2400,100,100],false);
      //K2
      //translate([2000,0,0]) cube([2000,100,100],false);
      //K3
      translate([2400,-2000,0]) cube([1275,100,100],false);
    }
  }


  module Fuesse(){
    //2* 100x100x3000mm NSI
    //Rest: 2*1000mm
    //https://www.hornbach.de/shop/Brettschichtholz-100x100x3250-mm-Fichte-SI-sichtbarer-Einbau/5955297/artikel.html

    translate([385,-2000,0])
    {
      cube([100,100,1352],false);
      translate([1275,0,0])
        cube([100,100,1352],false);
      translate([1275+645,0,0])
        cube([100,100,1352],false);
      translate([1275+645+1275,0,0])
        cube([100,100,1352],false);
    }
  }

  module Wandbalken(){
    //2* 100x120x3000mm NSI
    //Rest: 2*1000mm
    //https://www.hornbach.de/shop/Brettschichtholz-100x120x3000-mm-Fichte-NSI-nicht-sichtbarer-Einbau/1006844/artikel.html
    color(holzbalken,1){
    translate([385,-120,1252])
      cube([1490,100,100],false);
    //oberer Podestteil
    translate([2300,-100, 1252]) cube([1350,100,100],false);
    }
  }

  module Fussbodenplatten()
  {
    module OSB3Platte(x){ //https://www.hornbach.de/shop/OSB3-Platte-15x1250x2500-mm-ungeschliffen/3397975/artikel.html
      color(OSB3BodenPlatten,0.4)
      translate([x,0,0])
      cube([600,2000,27]);
    }
    translate([0,-2000,1480]){
      OSB3Platte(0);
      OSB3Platte(600);
      OSB3Platte(1200);
      OSB3Platte(1800);
    }
    translate([0,-2000,1480]){
      color(OSB3BodenPlatten,0.4)
      OSB3Platte(2400);
      OSB3Platte(3000);
    }
  }

  module Bodentraeger2()
  {
    translate([0,-2000,1450])
    {
      for(i=[0:600:2000]) {
        translate([0,i,0])
        cube([1900,48,24]);
      }
      for(i=[50:600:2000]) {
        translate([1800,i,0])
        cube([600,48,24]);
      }
    }
    translate([2300,-2000,1450])
    {
      for(i=[0:600:2000]) {
        translate([0,i,0])
        cube([1350,48,24]);
      }
    }
  }

  module Stepup(){
    translate([500,-2120,0]){
      cube([100,100,560]);
      translate([1500,0,0])
      cube([100,100,560]);
      translate([0,-1000,0])
      cube([100,100,560]);
      translate([1500,-1000,0])
      cube([100,100,560]);

      color("yellow",0.3)
      translate([0,-1000,560])
      cube([1600,1100,12]);
    }
    translate([0,-2120,0]){
      h = 900;
      cube([100,100,h]);
      translate([400,0,0])
      cube([100,100,h]);
      translate([0,-1000,0])
      cube([100,100,h]);
      translate([400,-1000,0])
      cube([100,100,h]);

      color("yellow",0.3)
      translate([0,-1000,h])
      cube([500,1100,12]);
    }
  }
}


module Saulen(){
  /*
  -----------------
  |S1    S2     S3|
  |               |
  |               |
  |S4    S5     S6|
  =======---=======
  */
  //Säule S6
  color(hauswand,1){
  translate([5900,-260,0])
    cube([1300,260,3300],false);
  }
}

module Kuehlschrankwand(){
 color(hauswand,1)
  translate([0,0,0])
    cube([7200,500,3400],false);

  //Kühler
  color("AliceBlue",1)
  translate([4300,-710,0])
    cube([600,610,2100],false);
  translate([4900,-710,0])
    cube([1000,610,750],false);
}

module Eingangswand(){
  color(hauswand,1){
  translate([7200,-4000,0])
    cube([100,4000,3300],false);
  }
}

module Fensterwand(){
  color(hauswand,1){
    translate([-100,-4000,1350])
      cube([100,4000,2000],false);
    translate([-250,-4000,1215])
      rotate([0,45,0])
        cube([300,4000,300],false);
    translate([-300,-4000,0])
      cube([500,4000,1215],false);
    }
}

module Fussboden(){
  color(fussboden,1)
  polygon([[0,0], [3480,0], [3480,-4020], [7500,-4020],
           [8000,-8000], [0,-8000]]);
}

module Kuechenboden(){
  color(kuechenboden,1)
  translate([3500,-4000,0])
  cube([4000,4000,10],false);
}
