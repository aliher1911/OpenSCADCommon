// hollow cylinder
// r1 = outer radius
// r2 = inner radius
// r3 = outer radius other
// r4 = inner radius other
module ring(h, r1, r2, r3=-1, r4=-1, $fn, center=false) {
	difference() {
		r3_ = r3 == -1? r1 : r3;
		r4_ = r4 == -1? r2 : r4;
		cylinder(h, r1=r1, r2=r3_, $fn=$fn, center=center);
		translate([0, 0, -1])
			cylinder(h+2, r1=r2, r2=r4_, $fn=$fn, center=center);
	}
}

// r1 = outer radius
// r2 = inner radius
module doughnut(r1, r2, $fn) {
	thickness_r = (r1-r2) / 2;
	doughnut_r = r2 + thickness_r;
	rotate_extrude(convexity = 10, $fn=$fn)
		translate([doughnut_r, 0, 0])
			circle(r = thickness_r);
}

// ra = bolt radius
// rh = nut outer radius
// th = transition part length
module nut_hole(ra, rh, th=0, len=100, $fn) {
	union() {
		// head 
		cylinder(len, d=rh * 2, $fn=6);
		// transition
		if (th > 0) {
			translate([0, 0, -th]) cylinder(th, r2=rh, r1=ra, $fn=$fn);
		}
		// bolt
		rotate([180, 0, 0]) translate([0, 0, -th]) cylinder(len, d=ra*2, $fn=$fn);
	}
}

// ra = bolt radius
// rh = bolt head
// th = transition part length
module bolt_hole(ra, rh, th=0, len=100, $fn) {
	union() {
		// head 
		cylinder(len, d=rh * 2, $fn=$fn);
		// transition
		if (th > 0) {
			translate([0, 0, -th]) cylinder(th, r2=rh, r1=ra, $fn=$fn);
		}
		// bolt
		rotate([180, 0, 0]) translate([0, 0, -th]) cylinder(len, d=ra*2, $fn=$fn);
	}
}
