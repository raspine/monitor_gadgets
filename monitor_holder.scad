use <submodules/dotSCAD/src/rounded_cube.scad>;

$fn = 100;
// 'safe' settings
// angle: between -7 and 6
// grip_height: between 25 and 35
// grip_width: between 20 and 25
angle = -7;
grip_height=30;
grip_width = 24;

module monitor_holder() {
	translate([0, 0, 15]) {
		difference() {
			rounded_cube( size = [grip_width+10, 60, grip_height], corner_r = 5, center = true);
			translate([-grip_width/2, -30, -grip_height/2 + 5]) cube([grip_width, 60, grip_height]);
			translate([3, 0, 0]) rotate([0, angle, 0]) translate([-19, 0, -17]) rotate([0, 0, 90]) {
				linear_extrude(26) polygon(points=[[-15,0],[15,0],[10,6],[-10,6]]);
			}
		}
		translate([3, 0, 0]) rotate([0, angle, 0])
		difference() {
			translate([-24.7, -20, -17]) cube(size=[8, 40, 28]);
			translate([-19, 0, -17]) rotate([0, 0, 90]) linear_extrude(26) polygon(points=[[-15,0],[15,0],[10,6],[-10,6]]);
		}
	}
}

monitor_holder();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
