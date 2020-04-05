use <submodules/dotSCAD/src/rounded_cube.scad>;

$fn = 100;
holder_width=60;
step_angle = 10;

module mount() {
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
	translate([3.5, -8.3, 0]) {
		translate([8, 24.8, 8.2]) {
			rotate([90, 0, 0]) {
				difference() {
					cylinder(7, r1=6.8, r2=6.8, center=true);
					cylinder(7, r1=3, r2=3, center=true);
				}
			}
		}
		translate([8, 22.1, 8.2]) {
			for(a = [0:step_angle:360]) {
				rotate([0, a, 0]) translate([0, 0, 4.8])
					cylinder(3.5, 1, 1, center=true);
			}
		}
		translate([4.5, 24.8, 8.2]) {
		difference() {
			translate([-0.25, 0, 0]) cube(size=[8, 7, 13.6], center=true);
				rotate([90, 0, 0]) {
					translate([3.5, 0, 0]) cylinder(10, r1=3, r2=3, center=true);
				}
			}
		}
	}
}

module extender_mount() {
	screw_mount();
	translate([0, 0, 16.4]) rotate([180, 0, 0]) screw_mount();
	mount();
}
extender_mount();

// vim: ts=2:sw=2:noet:commentstring=//\ %s

