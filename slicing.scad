// cut everything outside of sector
module slice(a, h=1, r=1, $fn=200, center=false) {
	difference() {
		children();
		difference() {
			cylinder(h, r=r, $fn=$fn, center=center);
			sector(a, h+2, r+1, $fn, center);
		}
	}
}

// sector of desired angle
module sector(a, h=1, r=1, $fn=200, center=false, align=false) {
	dz = center ? -h/2 : 0;
	da = align ? -a/2 : 0;
	rotate([0, 0, da])
	translate([0,0,dz])
	difference() {
		cylinder(h, r=r, $fn=$fn);
		rotate([0,0,a]) translate([-r, 0, -1]) cube([r*2, r, h+2]);
		rotate([0,0,180]) translate([-r, 0, -1]) cube([r*2, r, h+2]);
	}
}
