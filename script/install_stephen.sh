#!/bin/bash
#Download and install qlstephen

FOO=`mktemp -d .XXXXXXXXX`

echo $FOO

curl -O http://cloud.github.com/downloads/whomwah/qlstephen/QLStephen.qlgenerator.zip

unzip -d $FOO QLStephen.qlgenerator.zip

mv $FOO/QLStephen.qlgenerator ~/Library/QuickLook/

qlmanage -r

rm -rf $FOO
