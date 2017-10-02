use <PlaqueAlim.scad>;

L = 300;
l = 750;
H = 500;
e = 5;
cote_l=65;
porte_e = 10;
charnier_e=3;

blocPrise_L=220;
blocPrise_l=40;
blocPrise_h=35;

blocAlim_L=140;
blocAlim_l=150;
blocAlim_H=86;

blocFer_L=150;
blocFer_l=200;
blocFer_H=120;

module blocAlim() {
    color("grey") cube([blocAlim_L, blocAlim_l, blocAlim_H]);
}

module blocFer() {
    color("green") cube([blocFer_L, blocFer_l, blocFer_H]);
}

module blocPrise() {
    color("white") cube([blocPrise_h,blocPrise_l,blocPrise_L]);
}

module planche(x,y,z) {
    cube([x,y,z]);
    echo(text = str(x,"x",y,"x",z));
}

module box() {
    color("white") cube([190,280,40]);
}

module rangement() {
    //rangement
    translate([e,cote_l+max(blocAlim_l, blocFer_l),e]) planche(blocAlim_L, e,H-2*e);
    translate([e,cote_l,e+blocAlim_H]) planche(blocAlim_L, max(blocAlim_l, blocFer_l),e);
    translate([e,cote_l,2*e+blocAlim_H+blocFer_H]) planche(blocAlim_L, max(blocAlim_l, blocFer_l),e);
}

module frame() {
    echo(text = str("Frame"));
    //Bas
    echo(text = str("  Bas"));
    planche(L-porte_e,l,e);
    // Fond
    echo(text = str("  Fond"));
    translate([0,0,e]) planche(e,l,H-2*e);
    // Haut
    echo(text = str("  Haut"));
    translate([0,0,H-e]) planche(L,l,e);
    color("red") translate([L-(e+porte_e+charnier_e+cote_l),cote_l,H-2*e]) planche(cote_l-e,l-2*cote_l,e);
    // laterale
    echo(text = str("  Laterale"));
    translate([e,cote_l-e,e]) planche(L-3*e-2*porte_e-charnier_e, e,H-2*e);
    translate([e,l-(cote_l),e]) planche(L-3*e-2*porte_e-charnier_e, e,H-2*e);
    //renfort laterale
    echo(text = str("  renfort laterale"));
    color("red") translate([e,0,e]) planche(e,cote_l-e,H-2*e);
    color("red") translate([e,l-cote_l+e,e]) planche(e,cote_l-e,H-2*e);
    color("pink")translate([L-(2*e+2*porte_e+charnier_e),0,e]) planche(porte_e,cote_l, H-2*e);
    color("pink")translate([L-(2*e+2*porte_e+charnier_e),l-cote_l,e]) planche(porte_e,cote_l, H-2*e);

    //porte
    echo(text = str("  Portes"));
    color("pink")translate([L-porte_e,0,-porte_e+e]) planche(H-e-charnier_e,l,porte_e);
    //pieds
    echo(text = str("  Pieds"));
    color("red") translate([0,0,-e]) planche(cote_l-e, l,e);
    color("red") translate([L-(cote_l-e+porte_e),0,-e]) planche(cote_l-e, l,e);
}

module portesLaterales() {
    echo(text = str("Portes Laterales"));
    // portes laterales
    translate([2*e,0,e]) rotate([0,0,-45]) translate([charnier_e,0,0]) difference() {
        planche(L-(2*e+2*porte_e+2*charnier_e),e,H-2*e);
        translate([L-(2*e+2*porte_e+2*charnier_e)-50,e+0.1,H-2*e-50]) rotate([90,0,0]) cylinder(d=30, h=5.2);
    }
    translate([2*e,l-e,e]) rotate([0,0,45]) translate([charnier_e,0,0])  difference() {
        planche(L-(2*e+2*porte_e+2*charnier_e),e,H-2*e);
        translate([L-(2*e+2*porte_e+2*charnier_e)-50,e+0.1,H-2*e-50]) rotate([90,0,0]) cylinder(d=30, h=5.2);
    }
}

module portesFrontales() {
    echo(text = str("Portes Frontales"));
        //portes frontales
    translate([L-(e+porte_e),0,e+charnier_e]) rotate([0,0,-120]) {
        translate([e,0,0]) difference() {
            planche(e,l/2,H-(2*e+charnier_e));
            translate([-0.1,l/2-50,H-(2*e+charnier_e)-50]) rotate([0,90,0]) cylinder(d=30, h=5.2);
        }
        color("red") translate([0,0,0]) planche(e,cote_l,H-2*e-charnier_e);
    }
    translate([L-(e+porte_e),l,e+charnier_e]) rotate([0,0,120]) translate([0,-l/2,0])  {
        translate([e,0,0]) difference() {
            planche(e,l/2,H-(2*e+charnier_e));
            translate([-0.1,+50,H-(2*e+charnier_e)-50]) rotate([0,90,0]) cylinder(d=30, h=5.2);
        }
        color("red") translate([0,l/2-cote_l,0]) planche(e,cote_l,H-2*e-charnier_e);
    }
}

module all() {
    frame();
    portesLaterales();
    portesFrontales();
    translate([2*e,(cote_l-blocPrise_l)/2,(H-blocPrise_L)/2+e]) blocPrise();
    translate([e+40,cote_l,e]) blocAlim();
    translate([e+blocAlim_L+40+40,cote_l,e]) rotate([90,0,90]) plaqueAlimAll(150,85,2);
    
    translate([e,l-cote_l-blocFer_l,e]) blocFer();
    translate([e,cote_l,e+ 150]) box();
    translate([e,cote_l,2*e+ 190]) box();
    translate([e,cote_l,3*e+ 230]) box();
    translate([e,cote_l,4*e+ 270]) box();
    translate([e,cote_l,5*e+ 310]) box();
    translate([e,cote_l,6*e+ 350]) box();
    translate([e,cote_l,7*e+ 390]) box();
}

//frame();
all();