extender_len=180;

module extender() {
	translate([-extender_len/2, 0, 0]) rotate([90, 0, 90]) {
		linear_extrude(extender_len) polygon(points=[[-15,0],[15,0],[10,6],[-10,6]]);
	}
}

extender();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
