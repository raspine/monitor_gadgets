use <submodules/dotSCAD/src/rounded_cube.scad>;

$fn = 100;

module pen_holder() {
	difference() {
		rounded_cube( size = [100, 102, 30], corner_r = 5, center = true);
		translate([-47, 25, -10]) cube([100, 22, 20]);
		translate([-47, 1, -10]) cube([100, 22, 20]);
		translate([-47, -23, -10]) cube([100, 22, 20]);
		translate([-47, -47, -10]) cube([100, 22, 20]);
	}
	translate([0, 0, 15]) rotate([0, 0, 90]) linear_extrude(26) polygon(points=[[-15,0],[15,0],[10,6],[-10,6]]);
}

pen_holder();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
