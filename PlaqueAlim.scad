module plaqueAlim(l=150, L=85, e=2) {
    color("blue") difference() {
        //plaque
        cube([l,L,e]);
        // Séparation
        translate([l/2,-0.1,e]) rotate([-90,0,0]) cylinder(d=2, h=L+0.2);
        //vis
        translate([5,5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        translate([l-5,5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        translate([5,L-5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        translate([l-5,L-5,-0.1]) cylinder(d=3, d2=7, h=e+0.2);
        // voltmetre
        v_l=45;
        v_L=25;
        translate([l/4-v_l/2,L-15-v_L,-0.1]) cube([v_l,v_L,e+0.2]);
        // -12V
        translate([l/2 + (l/2)/4, 4*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 2*(l/2)/4, 4*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 3*(l/2)/4, 4*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        // 12V
        translate([l/2 + (l/2)/4, 3*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 2*(l/2)/4, 3*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 3*(l/2)/4, 3*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        // 5V
        translate([l/2 + (l/2)/4, 2*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 2*(l/2)/4, 2*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 3*(l/2)/4, 2*L/5, -0.1]) cylinder(d=11, h=e+0.2);
        // 3.3V
        translate([l/2 + (l/2)/4, L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 2*(l/2)/4, L/5, -0.1]) cylinder(d=11, h=e+0.2);
        translate([l/2 + 3*(l/2)/4, L/5, -0.1]) cylinder(d=11, h=e+0.2);
        
        // LED
        translate([l/2, L-15, -0.1]) cylinder(d=6, h=e+0.2);
        
        //Interrupteur
        
    }
}

module cosses(l, L, e) {
    cosse_d=13;
    cosse_h=10;
    // -12V
    color("green") translate([l/2 + (l/2)/4, 4*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("green") translate([l/2 + 2*(l/2)/4, 4*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("black") translate([l/2 + 3*(l/2)/4, 4*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    // 12V
    color("red") translate([l/2 + (l/2)/4, 3*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("red") translate([l/2 + 2*(l/2)/4, 3*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("black") translate([l/2 + 3*(l/2)/4, 3*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    // 5V
    color("yellow") translate([l/2 + (l/2)/4, 2*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("yellow") translate([l/2 + 2*(l/2)/4, 2*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("black") translate([l/2 + 3*(l/2)/4, 2*L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    // 3.3V
    color("blue") translate([l/2 + (l/2)/4, L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("blue") translate([l/2 + 2*(l/2)/4, L/5, e]) cylinder(d=cosse_d, h=cosse_h);
    color("black") translate([l/2 + 3*(l/2)/4, L/5, e]) cylinder(d=cosse_d, h=cosse_h);
}

module plaqueAlimAll(l=150, L=85, e=2) {
    plaqueAlim(l,L,e);
    cosses(l,L,e);
}

plaqueAlimAll(170,130,5);