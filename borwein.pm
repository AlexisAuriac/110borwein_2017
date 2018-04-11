use strict;
use warnings;

use constant {
	A => 0,
	B => 5000,
	M => 10000,
	H => (5000 - 0) / 10000,
	PI => 3.14159265358979,
};#CONSTANTS GIVEN IN THE SUBJECT

#GLOBAL
use constant N => $ARGV[0];

sub calc_borwein {
	my ($x) = @_;
	my $result = 1;

	if ($x == 0) {
		return $result;
	}
	for (my $k = 0 ; $k <= N ; ++$k) {
		$result *= sin($x / (2 * $k + 1)) / ($x / (2 * $k + 1));
	}
	return $result;
}

#FOR READABILITY
use constant FA => calc_borwein(A);
use constant FB => calc_borwein(B);

sub rectangles {
	my $result = 0;

	for (my $i = 0 ; $i < M ; ++$i) {
		$result += calc_borwein(A + $i * H);
	}
	$result *= H;
	print_result("Rectangles", $result, $result - PI / 2);
}

sub trapezoids {
	my $result = 0;

	for (my $i = 1 ; $i < M ; ++$i) {
		$result += calc_borwein(A + $i * H);
	}
	$result = H / 2 * (FA + FB + 2 * $result);
	print_result("Trapezoids", $result, $result - PI / 2);
}

sub simpson {
	my $res1 = 0;
	my $res2 = 0;
	my $final = 0;

	for (my $i = 1 ; $i < M ; ++$i) {
		$res1 += calc_borwein(A + $i * H);
	}
	for (my $i = 0 ; $i < M ; ++$i) {
		$res2 += calc_borwein(A + $i * H + H / 2);
	}
	$final = H / 6 * (FA + FB + 2 * $res1 + 4 * $res2);
	print_result("Simpson", $final, $final - (PI / 2));
}

sub print_result {
	my ($algo, $I, $diff) = @_;

	print "$algo:\n";
	print sprintf("I%d = %.10f\n", N, $I);
	print sprintf("diff = %.10f\n", $diff);
}

1;