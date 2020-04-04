use <submodules/dotSCAD/src/rounded_cube.scad>;

$fn = 100;
holder_width=60;
step_angle = 10;

module extender_mount() {
	difference() {
		cube(size=[8, 40, 30], center=true);
		translate([2, 0, -13]) {
			rotate([0, 0, 90]) {
				linear_extrude(28) {
					polygon(points=[[-12,0],[12,0],[10,6],[-10,6]]);
				}
			}
		}
	}
}

module screw_mount() {
	translate([3, 0.2, 0]) {
		translate([8, 24.8, 8]) {
			rotate([90, 0, 0]) {
				difference() {
					cylinder(10, r1=7, r2=7, center=true);
					cylinder(10, r1=3, r2=3, center=true);
				}
			}
		}
		translate([8, 20.6, 8]) {
			for(a = [0:step_angle:360]) {
				rotate([0, a, 0]) translate([0, 0, 5])
					cylinder(3.5, 1, 1, center=true);
			}
		}
		translate([0.5, 24.8, 8]) {
		difference() {
			cube(size=[15, 10, 14], center=true);
			rotate([90, 0, 0]) {
				translate([7.5, 0, 0]) cylinder(10, r1=3, r2=3, center=true);
			}
			}
		}
	}
}
screw_mount();
translate([0, 0, 16]) rotate([180, 0, 0]) screw_mount();
extender_mount();

// vim: ts=2:sw=2:noet:commentstring=//\ %s

