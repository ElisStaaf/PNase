#! /bin/sh
##
## runexamp.sh:						dec '90
##
## Erik Schoenfelder (schoenfr@tubsibr.uucp)
##
##
## run the examples one after another...
##
## use: runexamp.sh
##

a60='../a60'
tests='321.a60 prim.a60 serp.a60 teul1.a60 teul2.a60
	whetstone.a60'
tests2="rand.a60"


if [ "$1" = "test" ] ; then
	tmpres="/tmp/re$$"
	cmd="cat > $tmpres"
else
	tests="$tests $tests2"
	cmd="cat"
fi

for f in $tests ; do
	echo " "
	echo "** running $f ... "
	echo " "
	$a60 $f
	echo " "
	echo "** done ($f)"
	echo " "
done | eval $cmd

if [ "$1" = "test" ] ; then
	echo comparing:
	diff $tmpres runexamp.outp
	rm -f $tmpres
fi

echo ""
echo "ok - thats it."

exit 0
