# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function do_header() {
cat<<EOF
{
	"version": 1
}
[
	[]
EOF
}

function add_module() {
	module="${1}"
	mymodules+=${module}
}
