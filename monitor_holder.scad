use <submodules/dotSCAD/src/rounded_cube.scad>;

$fn = 100;
angle = -18;
grip_height=15;
grip_width = 21.8;

module monitor_holder() {
	translate([0, 0, 15]) {
		difference() {
			rounded_cube( size = [grip_width+14, 60, grip_height+10], corner_r = 5, center = true);
			translate([-grip_width/2+1, -30, -grip_height/2 + 5]) cube([grip_width, 60, grip_height]);
			translate([1, 0, 12]) rotate([0, angle, 0]) translate([-18.7, 0, -27]) rotate([0, 0, 90]) {
				linear_extrude(40) polygon(points=[[-12,0],[12,0],[10,6],[-10,6]]);
			}
		}
		translate([1, 0, 12]) rotate([0, angle, 0])
		difference() {
			translate([-24.7, -20, -17]) cube(size=[8, 40, 30]);
			#translate([-18.7, 0, -17]) rotate([0, 0, 90]) linear_extrude(28) polygon(points=[[-12,0],[12,0],[10,6],[-10,6]]);
		}
	}
}

monitor_holder();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
