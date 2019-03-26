#!/usr/bin/perl
# License GNU General Public License version 3.0 (GPLv3)
# (c) Copyright 2018 William Reynolds


use strict;
use warnings;
use LWP;
use HTTP::Request;

#my $s_index_date = qx/date +"%Y.%m"/;
#my $uri = 'http://my.elastic.cluster:9200/nmon-'.$s_index_date.'/doc/_bulk';
my $uri = 'http://my.elastic.cluster:9200/lsseas/doc/_bulk?pipeline=lsseas_pipeline';
my $json = `cat /opt/monitoring/lsseas.json`;
my $req = HTTP::Request->new( 'POST', $uri );
$req->header( 'Content-Type' => 'application/json' );
$req->authorization_basic('USER','PASSWORD');
$req->content( $json );
my $lwp = LWP::UserAgent->new;
#$lwp->request( $req );



my $response = $lwp->request($req);

print $response->error_as_HTML unless $response->is_success;

#print $response->as_string;
