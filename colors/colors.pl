#!/usr/bin/perl
# display colors

# first the system ones:
my @colors=split(/,/,"black,red,green,brown,blue,purple,cyan,light gray,dark gray,light red,light green,yellow,light blue,light purple,light cyan,white");
print "System colors:\n";
for ($color = 0; $color < 16; $color++) {
    print "\n" if ($color == 8);
    if (($color == 7) || ($color >= 10)){
         print "\x1b[0;30m";
    } else {
         print "\x1b[1;37m";
    }
    my $c = sprintf "%03d", $color;
    $c .= "($colors[$color])           ";
    $c =~ s/^(.{17}).*$/$1/;
    print "\x1b[48;5;${color}m$c ";
}
print "\x1b[0m\n\n";

# now the color cube
print "Color cube, 6x6x6:\n";
for ($green = 0; $green < 6; $green++) {
    for ($red = 0; $red < 6; $red++) {
	for ($blue = 0; $blue < 6; $blue++) {
	    $color = 16 + ($red * 36) + ($green * 6) + $blue;
            my $c = sprintf "%03d", $color;
            if ($green >= 3) {
                 print "\x1b[0;30m";
            } else {
                 print "\x1b[1;37m";
            }
	    print "\x1b[48;5;${color}m$c ";
	}
	print "\x1b[0m";
    }
    print "\n";
}

# now the grayscale ramp
print "\nGrayscale ramp:\n";
for ($color = 232; $color < 256; $color++) {
    my $c = sprintf "%03d", $color;
    if ($color >= 244) {
         print "\x1b[0;30m";
    } else {
         print "\x1b[1;37m";
    }
    print "\x1b[48;5;${color}m$c   ";
}
print "\x1b[0m\n";
