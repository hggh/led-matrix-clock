

module pcb() {
    translate([0, 1.049 -0.5, 0]) {
        cube([20.5, 11.3 +0.5, 1.7]);
    }
    translate([5.9, 0, 0]) {
        cube([8.699, 1.049, 1.7]);
    }
    
    // USB-C
    translate([5.9 - 0.25, 0, 1.6]) {
        cube([8.699 + 0.5, 7, 3.34]);
    }
    translate([0, 1.049, 0]) {
        translate([2.752, 7.750 + 0.5, -5]) {
            cylinder(d=2.2, h=10, $fn=190);
        }
        translate([17.752, 7.750 + 0.5, -5]) {
            cylinder(d=2.2, h=10, $fn=190);
        }
        
        // USB-C solder points
        translate([5.313, 0.45, -1]) {
            cube([1.3, 2, 3]);
        }
        translate([5.313, 4.271, -1]) {
            cube([1.3, 2, 3]);
        }
        translate([13.952, 0.45, -1]) {
            cube([1.3, 2, 3]);
        }
        translate([13.952, 4.271, -1]) {
            cube([1.3, 2, 3]);
        }
        
        //power connections
        translate([7.642, 7.270, -1]) {
            cube([5.2, 2, 3]);
        }
    }
}


difference() {
    union() {
        cube([35, 2, 15]);
        translate([(35-20.5)/2, 0, 1]) {
            cube([20.5, 12, 4]);
        }
        translate([0, 2, 2]) cube([7, 5, 10]);
        translate([35-7, 2, 2]) cube([7, 5, 10]);
    }
    translate([3.5, 0, 15/2]) {
        rotate([270, 0, 0]) cylinder(d=3.2, h=10, $fn=190);
        translate([0, 3, 0])
        rotate([270, 30, 0]) cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, h=4.1, $fn=6);
    }
    translate([35-3.5, 0, 15/2]) {
        rotate([270, 0, 0]) cylinder(d=3.2, h=10, $fn=190);
        translate([0, 3, 0])
        rotate([270, 30, 0]) cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, h=4.1, $fn=6);
    }
    translate([((35-20.5)/2), 0, (15-2.56)/2-2]) {
        pcb();
    }
}


translate([60, 0, 0]) {
    difference() {
        union() {
            cube([35, 12, 15]);
        }
        translate([7.5, -1, 1.5]) {
            cube([20, 200, 12]);
        }
        translate([3.5, 0, 15/2]) {
            rotate([270, 0, 0]) cylinder(d=3.2, h=200, $fn=190);
        }
        translate([35-3.5, 0, 15/2]) {
            rotate([270, 0, 0]) cylinder(d=3.2, h=200, $fn=190);
        }
    }
}
