use <submodules/dotSCAD/src/rounded_cube.scad>;

$fn = 100;

module pen_holder() {
	difference() {
		rounded_cube( size = [90, 126, 30], corner_r = 5, center = true);
		translate([-43, 37, -10]) cube([100, 22, 20]);
		translate([-43, 13, -10]) cube([100, 22, 20]);
		translate([-43, -11, -10]) cube([100, 22, 20]);
		translate([-43, -35, -10]) cube([100, 22, 20]);
		translate([-43, -59, -10]) cube([100, 22, 20]);
	}
	translate([0, 0, 15]) {
		difference() {
			translate([0, 0, 14]) cube([10, 40, 28], center=true);
			rotate([0, 0, 90]) linear_extrude(28) polygon(points=[[-12,0],[12,0],[10,6],[-10,6]]);
		}
	}
}

pen_holder();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
