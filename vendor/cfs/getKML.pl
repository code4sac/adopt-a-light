#!/usr/bin/perl

use Data::Dumper;

# Delete and pickup file from google maps
unlink "streetlights.kml";
my $cmd = `wget -O streetlights.kml 'maps.google.com/maps/ms?ie=UTF8&msa=0&output=kml&msid=205396438574289348785.0004da1569e61d3f5515c'`;

# I know this is janky, I should be parsing the XML right? Yeah. I know. this is faster. 
open(KML, "streetlights.kml") || die "Cant open KML...\n";
$i = 0;
while(<KML>) {
  if(/coordinates/) {
    $i++;
    ($long, $lat, $garbage) = ($_ =~ /.*\>(.*),(.*),(.*)\<.*/igs);
    print sprintf("Thing.create(city_id:%6s, lng: $long, lat: $lat)\n", $i);
  }
}
