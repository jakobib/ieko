#!/bin/bash


# must be called with existing directory as first argument
DIR=`realpath $1`
NAME=`basename $DIR`

[ -d "$DIR" ] || exit 1
[ -f "$DIR/$NAME.md" ] || exit 1

LIB=`realpath $DIR/..`
BUILD=$LIB/build

CSL=$LIB/chicago-author-date.csl

mkdir -p $BUILD

pushd $DIR >/dev/null

# enable output
set -x

pandoc -s --template $LIB/ieko.html --css isko.css \
    -F $LIB/filter.pl \
    -F pwcite\
	--include-before=$LIB/ieko-head.html\
	--toc --toc-depth=6\
	-F pandoc-citeproc\
	-M link-citations=true\
	-M csl=$CSL \
    -o $NAME.html $NAME.md $LIB/ieko-foot.yaml

# disable output
{ set +x ;} 2> /dev/null
 
cp $NAME.html $BUILD

# copy static files (if they exist)
cp -f *.jpg $BUILD 2>/dev/null || :
cp -f *.png $BUILD 2>/dev/null || :

popd >/dev/null

# copy common static files
cp $LIB/isko.css $BUILD

