$fn = 100;

module pen_holder() {
	difference() {
		translate([15, 0, 0]) cube( size = [40, 40, 6], center = true);
		translate([20, 0, 3]) cube( size = [18.2, 18.2, 4], center = true);
		translate([20, 0, 0]) cylinder(h=8, r=4.5, center = true);
	}
	translate([0, 0, 3]) {
		difference() {
			translate([0, 0, 14]) cube([10, 40, 28], center=true);
			rotate([0, 0, 90]) linear_extrude(28) polygon(points=[[-12,0],[12,0],[10,6],[-10,6]]);
		}
	}
}

pen_holder();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
