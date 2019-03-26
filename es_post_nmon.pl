#!/usr/bin/perl
# License GNU General Public License version 3.0 (GPLv3)
# (c) Copyright 2018 William Reynolds


use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request::Common;

#my $s_index_date = qx/date +"%Y.%m"/;
#my $uri = 'http://my.elastic.cluster:9200/nmon-'.$s_index_date.'/doc/_bulk';
my $uri = 'http://my.elastic.cluster:9200/nmon/doc/_bulk?pipeline=nmon_pipeline';
my $json = `cat /opt/monitoring/nmon.json`;
my $req = HTTP::Request->new( 'POST', $uri );
$req->header( 'Content-Type' => 'application/x-ndjson' );
$req->authorization_basic('USER','PASSWORD');
$req->content( $json );
#print $json;
my $lwp = LWP::UserAgent->new;


my $response = $lwp->request($req);

print $response->error_as_HTML unless $response->is_success;

#print $response->as_string;


#$lwp->request( $req );
