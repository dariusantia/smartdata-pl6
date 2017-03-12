#!/usr/bin/env perl6

my $data = slurp "in1.txt", :enc("latin1");

# use Grammar::Debugger;

grammar SMART {
    token TOP    { <line>+ }
    token line   { ^^ [ <valid> | \N* ] \n  }

    proto token valid {*}
    token valid:sym<date>   { 'Manufactured in week ' (\d+) ' of year ' (\d+) }
    token valid:sym<size>   { 'User Capacity:' \s* <capacity> \s* bytes \N* }
    token valid:sym<temp>   { 'Current Drive Temperature:' \s* (\d+) \N* }
    token valid:sym<trip>   { 'Drive Trip Temperature:'    \s* (\d+) \N* }
    token valid:sym<nmerr>  { 'Non-medium error count:'    \s* (\d+) \N* }
    token valid:sym<vendor> { 'Vendor:'                    \s* (\N*)     } 
    token valid:sym<prod>   { 'Product:'                   \s* (\N*)     }
    token capacity          { <[\d\,]>+ }
}


class SMARTActions {
    method TOP($/)                { make (($<line>».made).grep: Pair) }
    method line ($/)              { make $<valid>.made if $<valid> }
    method valid:sym<vendor> ($/) { make 'vendor' => $0 }
    method valid:sym<prod>   ($/) { make 'prod'   => $0 }
    method valid:sym<trip>   ($/) { make 'trip'   => $0 }
    method valid:sym<temp>   ($/) { make 'temp'   => $0 }
    method valid:sym<nmerr>  ($/) { make 'nmerr'  => $0 }
    method valid:sym<date>   ($/) { make 'date'   => [$0,$1] }
    method valid:sym<size>   ($/) { make 'size'   => $<capacity>.made  }
    method capacity          ($/) { make $/.subst(",", "", :g) / 1000000000 }
}

my $m = SMART.parse($data, :actions(SMARTActions));
say $m.made



