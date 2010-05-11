#!/bin/bash

d=$npm_config_root/.npm/$npm_package_name/$npm_package_version/dependencies/
# clean up the symlinks created by link.sh
for i in $d/*/*.js; do
	f=$npm_config_root/$(basename $i)
	[ -e $f ] && rm $f
done
exit 0
