module plaqueAlim(l=150, L=85, e=2) {
    color("blue") difference() {
        //plaque
        cube([l,L,e]);
        //vis
        translate([5,5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        translate([l-5,5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        translate([5,L-5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        translate([l-5,L-5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        // voltmetre
        translate([10,10,-0.1]) cube([45,25,e+0.2]);
        
    }
}

plaqueAlim();