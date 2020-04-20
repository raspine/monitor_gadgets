// extender_len excludes chamfered attachments of 28+28mm
extender_len=4;
margin=0.1;

module extender() {
	translate([-(extender_len+56)/2, 0, -0.2]) rotate([90, 0, 90]) {
		linear_extrude(extender_len+56)
		  polygon(points=[[-12+margin, margin],[11.9, margin],[10-margin, 6-margin],[-10+margin, 6-margin]]);
	}
	translate([0, 0, 0.7]) cube([(extender_len+56)-2*28, 40, 10], center=true);
}

translate([0, 0, 6]) rotate([0, 180, 0]) extender();

// vim: ts=2:sw=2:noet:commentstring=//\ %s
