use strict;
use warnings;

sub help {
	print << 'END_HELP';
USAGE
	./110borwein n
DESCRIPTION
	n constant defining the integral to be computed
END_HELP
}

sub is_integer {
	my ($arg) = @_;
	my $i = 0;

	if (substr($arg, 0, 1) eq "-") {
		$arg = substr($arg, 1, length($arg) - 1);
	}
	if (!($arg =~ /^[0-9]+$/)) {
		print STDERR "Invalid argument: '@_'\n";
		return 0;
	}
	return 1;
}

sub parse_arg {
	if (scalar @ARGV < 1) {
		print STDERR "Not enough arguments\n";
		return 84;
	}
	elsif (scalar @ARGV > 1) {
		print STDERR "Too much arguments\n";
		return 84;
	}
	elsif (scalar @ARGV == 1 and $ARGV[0] eq "-h") {
		help();
		exit(0);
	}
	elsif (!is_integer($ARGV[0])) {
		return 84;
	}
	return (0);
}

1;