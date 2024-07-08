$fn = 250;

module Bolt() {
    color(c = [0.9,0.9,0.9])
    union() {
        cylinder(d=6.5, h=10.5, center=false);

        translate([0,0,10.5])
        cylinder(d2=5.8, d1=10.8,h=3.5);
    }
}

module Clamp() {
    color(c = [0.25, 0.25, 0.25]) 
    union() {
        difference() {
            rotate([0, -90, 0])
            linear_extrude(height = 19)
            polygon(points=[[0,0],[14,0],[14,11],[0,21]]);

            translate(v=[-9.5,6,-1])
            cylinder(d=6, h = 25);
        }
        translate(v=[-14,-7,1])
        cube([9,7,13]);
    }
    
}

module Target() {
    translate(v=[0,0,-9.5])
    Bolt();

    translate(v=[9.5,-6,-14])
    Clamp();
}

module Mount() {
    color([0.25,0.75,0.25])
    difference() {
        union() {
            translate(v=[-10.5,-5.5,-7])
            cube([21,15,12]);

            translate(v=[-4,-12.5,0])
            cube([8,7,5]);

            translate(v=[0,-9,5])
            cylinder(d=2,h=5);

            translate(v=[0,-9,10])
            cylinder(d=5,h=2);
        }

        #Target();

        translate(v=[0,0,1])
        cylinder(d=11.5, h=10);
    }
}   

Mount();