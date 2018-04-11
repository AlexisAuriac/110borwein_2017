use strict;
use warnings;

sub help {
	print << 'END_HELP';
USAGE
	./110borwein n
DESCRIPTION
	n	constant defining the integral to be computed
END_HELP
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
	elsif (!($ARGV[0] =~ /^[0-9]+$/)) {
		print STDERR "Invalid argument: '@_'\n";
		return 84;
	}
	return (0);
}

1;