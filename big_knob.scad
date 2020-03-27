use <submodules/dotSCAD/src/rounded_extrude.scad>;
use <submodules/dotSCAD/src/rounded_cube.scad>;

$fn = 100;

circle_r = 20;
round_r = 8;

module smooth_stop() {
	rounded_extrude(circle_r * 2, round_r) circle(circle_r);
	translate([0, 0, round_r]) 
		cylinder(h = 5, r1 = circle_r + round_r, r2 = circle_r + round_r);
	translate([0, 0, 26]) mirror([0, 0, 1]) {
		rounded_extrude(circle_r * 2, round_r) circle(circle_r);
		translate([0, 0, round_r]) 
			cylinder(h = 5, r1 = circle_r + round_r, r2 = circle_r + round_r);
	}
}

module end_stop() {
	difference() {
		union() {
			rounded_extrude(circle_r * 2, round_r) circle(circle_r);
			translate([0, 0, 8]) cylinder(h = 2, r1 = circle_r + round_r, r2 = circle_r + round_r);
		}
	translate([0, 0, 4]) rotate([90, 0, 90])
		linear_extrude(2*circle_r) polygon(points=[[-12,0],[12,0],[10,6],[-10,6]]);
	}
}

module knob() {
translate([0, 0, 75]) rotate([0, 180, 0]) {
	smooth_stop();
	cylinder(h=65, r1=20, r2=20, center=false);
	translate([0, 0, 65]) end_stop();
	difference() {
		translate([14, 0, 70]) cube([28, 40, 10], center=true);
		translate([0, 0, 69]) rotate([90, 0, 90])
			linear_extrude(100) polygon(points=[[-12,0],[12,0],[10,6],[-10,6]]);
	}
	difference() {
		translate([0, 0, 65]) cylinder(h=10, r1=20, r2=20, center=false);
		translate([0, -20, 65]) cube([40, 40, 10]);
	}
	}
}

knob();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
