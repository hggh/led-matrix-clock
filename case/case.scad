include <BOSL/constants.scad>
use <BOSL/shapes.scad>

$fn=190;

module back_holder() {
    difference() {
        cube([40, 8, 3]);
    
        translate([0, 0, 0]) {
            rotate([10, 0, 0]) color("green") cube([100, 100, 100]);
        }
    }
}

difference() {
    color("red") cuboid([94, 50, 59], fillet=22, 
        edges=EDGES_Y_ALL, align=V_ALLPOS);

    // Button top
    translate([(94/2-20), (50/2-5), -1]) {
        cube([40, 10, 20]);
    }
    
    translate([2, 2, 2]) {
        cuboid([94-4, 60, 59-4], fillet=22, 
        edges=EDGES_Y_ALL, align=V_ALLPOS);
    }
    
    translate([4, -1, 4]) {
        cuboid([94-8, 60, 59-8], fillet=19, 
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


// front inlay
translate([2, 60, 2]) {
    difference() {
        color("black") cuboid([90 -0.4, 2.2, 55-0.4], fillet=22, 
            edges=EDGES_Y_ALL, align=V_ALLPOS);
        translate([19.596, -1, 18.251]) {
            cube([50.8, 10, 18.6]);
        }
    }
    translate([32.506, 0, 4.749]) {
        rotate([90, 0, 0]) cylinder(d=3, h=25);
    }
    translate([57.506, 0, 4.749]) {
        rotate([90, 0, 0]) cylinder(d=3, h=25);
    }
}


// button
translate([100, 0, 0]) {
    difference() {
        color("red") cuboid([40 - 1.0, 10 - 1.0, 7], fillet=1, align=V_ALLPOS);
        translate([-1, -1, -1])cube([45, 20, 4]);
    }
    translate([-2, -2, 1.8]) {
        difference() {
            cube([40-1.0+4, 10-1.0+4, 1.2]);
            translate([10.83, 3.75, 0]) cube([5, 5, 2]);
            translate([26.670, 3.75, 0]) cube([5, 5, 2]);
        }
    }
}


            

