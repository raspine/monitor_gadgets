use <submodules/dotSCAD/src/rounded_cube.scad>;
// use <extender_mount.scad>

$fn = 100;
holder_width=60;
grip_height=15;
grip_width = 21.8;
step_angle = 10;

module screw_mount() {
	translate([grip_width/2+10, 0, 7]) {
	  rotate([90, 0, 0]) {
			difference() {
				cylinder(holder_width-20.6, r1=7, r2=7, center=true);
				cylinder(holder_width-20, r1=3, r2=3, center=true);
			}
		}
	}
	translate([grip_width/2+10, 18.9, 7]) {
		for(a = [0:step_angle:360]) {
			rotate([0, a, 0]) translate([0, 0, 5])
				cylinder(3.5, 1, 1, center=true);
		}
	}
	translate([grip_width/2+10, -18.9, 7]) {
		for(a = [0:step_angle:360]) {
			rotate([0, a, 0]) translate([0, 0, 5])
				cylinder(3.5, 1, 1, center=true);
		}
	}
}

module monitor_holder() {
	translate([0, 0, (grip_height+8)/2]) {
		difference() {
			rounded_cube( size = [grip_width+14, holder_width, grip_height+8], corner_r = 5, center = true);
			translate([-grip_width/2, -holder_width/2, -grip_height/2 + 4]) {
			  cube([grip_width, holder_width, grip_height]);
			}
		translate([grip_width/2+10, 0, -(grip_height+8)/2+7]) {
				rotate([90, 0, 0]) {
					cylinder(holder_width, r1=7, r2=7, center=true);
				}
			}
		}
	}
}

screw_mount();
monitor_holder();
// translate([32.4, 0, 15.2]) rotate([0, 180, 0]) extender_mount();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
