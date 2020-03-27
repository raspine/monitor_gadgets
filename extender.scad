extender_len=60;
margin=0.1;

module extender() {
	translate([-extender_len/2, 0, -0.2]) rotate([90, 0, 90]) {
		linear_extrude(extender_len)
		  polygon(points=[[-12+margin, margin],[11.9, margin],[10-margin, 6-margin],[-10+margin, 6-margin]]);
	}
	translate([0, 0, 0.7]) cube([extender_len-2*28, 40, 10], center=true);
}

extender();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
