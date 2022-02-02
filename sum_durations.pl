#! /usr/bin/env perl -p

use strict;
our ($hours,$minutes,$seconds,$hundredths);

BEGIN {
  $hours = 0;
  $minutes = 0;
  $seconds = 0;
  $hundredths = 0;
}

if ( /^Duration\s*:\s*(\d\d):(\d\d):(\d\d)\.(\d\d) / ) {
  printf "At: %02d:%02d:%02d.%02d\n", $hours, $minutes, $seconds, $hundredths;
  $hundredths += $4;
  if ( $hundredths >= 100 ) { $hundredths -= 100; $seconds++ }
  $seconds += $3;
  if ( $seconds >= 60 ) { $seconds -= 60; $minutes++ }
  $minutes += $2;
  if ( $minutes >= 60 ) { $minutes -= 60; $hours++ }
  $hours += $1;
}

END {
  printf "Cross-check: %02d:%02d:%02d.%02d\n", $hours, $minutes, $seconds, $hundredths;
}
