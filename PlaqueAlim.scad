difference() {
    //plaque
    cube([150,85,2]);
    //vis
    translate([5,5,-0.1]) cylinder(d=3, D=10, h=2.2); 
    // voltmetre
    translate([10,10,-0.1]) cube([45,25,2.2]);
    
}
