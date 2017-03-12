#!/usr/bin/env perl6

my $data = slurp "in1.txt", :enc("latin1");
my %info;

given $data {
    if rule {^^'Vendor:' (\w+)}                    -> { %info<vendor> = $0  }
    if rule {^^'Product:' (\w+)}                   -> { %info<product> = $0 }
    if rule {^^'Serial number:' (\w+)}             -> { %info<serial> = $0  }
    if rule {^^'SMART Health Status:' (\w+)}       -> { %info<status> = $0  }
    if rule {^^'Non-medium error count:' (\w+)}    -> { %info<nmerr> = $0   }
    if rule {^^'Drive Trip Temperature:' (\d+) }   -> { %info<trip> = $0    }
    if rule {^^'Current Drive Temperature:' (\d+)} -> { %info<temp> = $0    }
    if rule {^^'Manufactured in week' (\d+) 'of year' (\d\d\d\d) } -> {
        %info<week> = $0;
        %info<year> = $1;
    }
}

say %info;

