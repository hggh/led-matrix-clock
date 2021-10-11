include <BOSL/constants.scad>
use <BOSL/shapes.scad>

$fn=190;

module back_holder() {
    difference() {
        cube([40, 8, 3]);
    
        translate([0, 0, 0]) {
            rotate([10, 0, 0]) cube([100, 100, 100]);
        }
    }
}

difference() {
    color("yellow") cuboid([94, 50, 59], fillet=22, 
        edges=EDGES_Y_ALL, align=V_ALLPOS);
    
    translate([2, 2, 2]) {
        cuboid([94-4, 60, 59-4], fillet=22, 
        edges=EDGES_Y_ALL, align=V_ALLPOS);
    }
    
    translate([4, -1, 4]) {
        cuboid([94-8, 60, 59-8], fillet=17, 
        edges=EDGES_Y_ALL, align=V_ALLPOS);
    }
}

// back holder
translate([27, 50-2-8-2, 2]) {
    back_holder();
}

translate([27+40, 50-2-8-2, 59-2]) {
    rotate([ 0, 180, 0])back_holder();
}


//translate([11, 10, 10]) cube([63, 9, 41]);


/*
difference() {
    translate([2, 2, 2]) {
        color("black") cuboid([94-4, 2, 59-4], fillet=22, 
        edges=EDGES_Y_ALL, align=V_ALLPOS);
    }
    
    
}
translate([21.596,1, 20.251]) {
        color("green") cube([50.8, 10, 18.5]);
}
*/





            
            

