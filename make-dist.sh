#! /bin/sh
##
## make-dist.sh:					Jun 1991
## (schoenfr)						Oct 1999
##
## use:  make-dist.sh <files for dist>
##
## Make a distribution tar-file. The file will named like:
## ``a60-x.yy.tar.gz'' and extract into such a directory.
##

set -e

if [ $# -eq 0 ] ; then
	echo 'use: make-dist.sh <files for dist>'
	exit 1
fi

##
## use version number from version.h:
##
ver=`sed -n -e 's/.* v\(.\.[^\"]*\).*$/\1/p' < version.h`
dir="a60-$ver"

echo "Version is $ver"

##
## files to be included:
##
files="$*"

##
## create appropriate directory and copy the files:
##

mkdir $dir

echo -n "Copying to $dir ... "
gtar cf - $files | (cd $dir ; gtar xBf -)
echo "done."

##
## now $dir is the distribution:
##

echo -n "Creating $dir.tar.gz ... "
gtar cvf "$dir".tar $dir
gzip -v -9 -f "$dir".tar
echo "done."

ls -l "$dir".tar*

echo -n "Cleaning up ... "
rm -rf $dir
echo "done".

exit 0
