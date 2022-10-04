#!/usr/bin/perl

use warnings;
use strict;

use Data::Dumper;
use File::Slurp;
use JSON;

# 1. Login to the world-remit website.
# 2. Open another tab and goto "https://www.worldremit.com/en/account/props/transfersStatuses"; this should return your history of transfers in JSON.
# 3. Save the JSON file in the same file as the script.
# 4. Run the script with the filename as argument. "./world_remit_json_parser.pl <jsonfilename>"

print "Usage: ./world_remit_json_parser.pl <jsonfilename>\n" and exit if @ARGV < 1;

my $json_file_name = shift;

print "opening: " . $json_file_name . "\n";

my $json_file = read_file($json_file_name);
my $decoded_json = decode_json $json_file;

my $transfer_sums = {};
my $total = 0;
my $count = 0;

for my $transfer (@{$decoded_json->{pastTransfers}}) {

    next unless $transfer->{receiveCurrency} eq "USD";

    printf("%s,%s,%d\n", $transfer->{created}, $transfer->{recipientName}, $transfer->{receiveAmount});

    if (exists $transfer_sums->{ $transfer->{recipientName} }) {

        $transfer_sums->{  $transfer->{recipientName} } += $transfer->{receiveAmount};
    }
    else {

        $transfer_sums->{ $transfer->{recipientName} } = $transfer->{receiveAmount};
    }

    $total += $transfer->{receiveAmount};
}

print "\n", "-" x 20, "\n";
print Dumper $transfer_sums;

print "\n", "-" x 20, "\n";
print "total: ", $total, "\n";
