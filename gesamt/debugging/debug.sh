
beispiel=gesamt
PROGRAM=../$beispiel

inputfile="/home/ublu21/u11808206/test/gesamt/kingD-44.0"
CALLFILE="/home/ublu21/u11808206/test/gesamt/kingD-44.call"

RESFILE="assmbler.s"
$PROGRAM < $inputfile >$RESFILE

cat $RESFILE

errnum=0
prgnum=0

#LOC=.
LOC=/usr/ftp/pub/ubvl/test/$beispiel
LOC2=~/test/$beispiel

cc -fno-pie -no-pie -g -I. -DCALL=\"$CALLFILE\" $LOC/testmain.c $LOC/callingconvention.o $RESFILE;