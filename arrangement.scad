// place child turning them radially around center
// n - number
// r - distance
module radial_array(n, r, rotate=true) {
	da = 360/n;
	da_ = rotate ? 0 : -da;
	for(i=[0:n-1]) {
		rotate([0, 0, i * da])
			translate([r, 0, 0])
				rotate([0, 0, i * da_])
					children();
	}
}
