#!/bin/bash

d=$npm_config_root/.npm/$npm_package_name/$npm_package_version/dependencies/
nl=$d/narwhal-lib/narwhal
nn=$d/node-narwhal/narwhal
lib=$npm_config_root/.npm/$npm_package_name/$npm_package_version/package/lib/


# put narwhal-node in place, and then put narwhal-lib in place.
# According to kriskowal, this is the correct order.
for i in $nl/* $nn/*; do
	echo $i
	target=$lib/$(basename $i)
	rm $target 2>/dev/null
	ln -s $i $target
done
