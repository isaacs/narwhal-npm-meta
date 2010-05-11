#!/bin/bash

d=$npm_config_root/.npm/$npm_package_name/$npm_package_version/dependencies/
# make sure that there are no conflicts first.
for i in $d/*/*.js; do
	f=$npm_config_root/$(basename $i)
	if [ -e $f ]; then
		echo "file in the way: $f" >&2
		exit 1
	fi
done
# now link into place.
for i in $d/*/*.js; do
	f=$npm_config_root/$(basename $i)
	rm $f 2>/dev/null
	ln -s $i $f
done
exit 0
