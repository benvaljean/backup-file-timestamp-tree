# backup-file-timestamp-tree

Backup and restore an entire directory tree of file timestamps.

`backup-timestamp-tree.pl` will backup an entire directory tree of file timestamps to a text file of touch commands, to restore in the future simply run the generated commands.  This code is quite old and becoming less useful with advent of EXIF date-shot taking greater precedence over file timestamps nowadays, but it is still useful.

###Usage / Example

    $ ./backup-timestamp-tree.pl example/ | tee timestamp-restore.sh
    touch -d "Tue Oct 13 20:24:45 2015" "example"
    touch -d "Tue Oct 13 20:24:45 2015" "example/file1"
    touch -d "Tue Oct 13 20:24:55 2015" "example/dir"
    touch -d "Tue Oct 13 20:24:51 2015" "example/dir/file2"
    touch -d "Tue Oct 13 20:24:55 2015" "example/dir/file3"
    $ touch example/file1
    $ ls -l example/file1
    -rw-r--r-- 1 user grp 0 Oct 13 20:27 example/file1
    $ chmod +x timestamp-restore.sh
    $ ./timestamp-restore.sh
    $ ls -l example/file1
    -rw-r--r-- 1 user grp 0 Oct 13 20:24 example/file1
