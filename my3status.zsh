#!/usr/bin/env zsh

# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

mydir=$(dirname $(realpath ${0}))
mymodules=()

moduledir="${mydir}/modules"
if [ ! -d ${moduledir} ]; then
	exit 1
fi

. ${mydir}/util.zsh

configfile=""
while getopts 'c:' opt; do
	case "${opt}" in
		c)
			configfile="${OPTARG}"
			;;
	esac
done

if [ -z ${configfile} ]; then
	echo "USAGE: ${0} -c /path/to/config/file" >&2
	exit 1
fi

if [ ! -f ${configfile} ]; then
	echo "Could not find config file at ${configfile}" >&2
	exit 1
fi

. ${configfile}

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
