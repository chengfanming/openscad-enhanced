
module test001()
{
	function r_from_dia(d) = d / 2;

	module rotcy(rot, r, h) {
		rotate(90, rot) cylinder(r = r, h = h, center = true);
	}

	difference() {
		sphere(r = r_from_dia(size));
		rotcy([0  0 0], cy_r, cy_h);
		rotcy([1  0 0], cy_r, cy_h);
		rotcy([ 0 1 0], cy_r, cy_h);
	}

	size = 50;
	hole = 25;

	cy_r = r_from_dia(hole);
	cy_h = r_from_dia(size * 2.5);
}

module test002()
{
	intersection() {
		difference() {
			union() {
				cube([30 30 30], center = true);
				translate([0 0 -25])
					cube([15 15 50], center = true);
			}
			union() {
				cube([50 10 10], center = true);
				cube([10 50 10], center = true);
				cube([10 10 50], center = true);
			}
		}
		translate([0 0 5])
			cylinder(h = 50, r1 = 20, r2 = 5, center = true);
	}
}

module test003()
{
	difference() {
		union() {
			cube([30 30 30], center = true);
			cube([40 15 15], center = true);
			cube([15 40 15], center = true);
			cube([15 15 40], center = true);
		}
		union() {
			cube([50 10 10], center = true);
			cube([10 50 10], center = true);
			cube([10 10 50], center = true);
		}
	}
}

module test004()
{
	difference() {
		cube(30, center = true);
		sphere(20);
	}
}

module test005()
{
	translate([0 0 -120]) {
		difference() {
			cylinder(h = 50, r = 100);
			translate([0 0 10]) cylinder(h = 50, r = 80);
			translate([100 0 35]) cube(50, center = true);
		}
		for (i = [0:5]) {
			echo(360*i/6, sin(360*i/6)*80, cos(360*i/6)*80);
			translate([sin(360*i/6)*80, cos(360*i/6)*80, 0 ])
				cylinder(h = 200, r=10);
		}
		translate([0 0 200])
			cylinder(h = 80, r1 = 120, r2 = 0);
	}
}

test001();

