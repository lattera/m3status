#!/usr/bin/env zsh

# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

mydir=$(dirname $(realpath ${0}))
mymodules=()

moduledir="${mydir}/modules"
if [ ! -d ${moduledir} ]; then
	exit 1
fi

if [ ! -f ${mydir}/config.zsh ]; then
	exit 1
fi

. ${mydir}/util.zsh
. ${mydir}/config.zsh

do_header
while true; do
	i=0
	echo ",["
	foreach module in ${mymodules}; do
		if [ -f ${moduledir}/${module}.zsh ]; then
			. ${moduledir}/${module}.zsh

			if [ ${i} -gt 0 ]; then
				echo ","
			fi

			${module}
			i=$((${i}+1))
		fi
	done
	echo "]"
	sleep ${sleeptime}
done
