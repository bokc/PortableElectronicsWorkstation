L = 300;
l = 750;
H = 500;
e = 7;
cote_l=65;
porte_e = 12;


module planche(x,y,z) {
    cube([x,y,z]);
}

module all() {
    planche(L,l,e);
    translate([0,0,e]) planche(e,l,H-2*e);
    translate([0,0,H-e]) planche(L,l,e);
    translate([e,cote_l+e,e]) planche(L-2*e-porte_e, e,H-2*e);
    translate([e,l-(cote_l+e),e]) planche(L-2*e-porte_e, e,H-2*e);
}

all();