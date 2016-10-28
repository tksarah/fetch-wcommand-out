#!/usr/bin/env perl

if($ARGV[0] eq ""){ print "Not found the file\n"; exit 1; }

my $line;
my $var_path="./roles/tksarah.fetch-command-out/vars/com_vars.yml";

open(R,"$ARGV[0]");
	open(W,">$var_path");

	print W "lists:\n";
	while (<R>){
		chomp($_);
		my $cmd = (split/,/,$_)[0];
		my $ofile = (split/,/,$_)[1];
		print W "  - { com: $cmd , ofile: $ofile }\n";
		}
	close(W);
close(R);

print "Created $var_path \n";
