#!/usr/bin/perl

use File::Find;
use File::stat;
use Time::localtime;

my $ver="0.2.0";

if(@ARGV != 1) { print "backup-timestamp-tree v$ver\nUsage: backup-timestamp-tree.pl directory\nBackup an entire tree of file timestamps to a text file of touch commands.\n"; }

sub eachFile {
        my $filename = $_;
        my $fullpath = $File::Find::name;
        my $datetime_string = ctime(stat($filename)->mtime);
        print "touch -d \"$datetime_string\" \"$fullpath\"\n";
}

find (\&eachFile, "$ARGV[0]");

