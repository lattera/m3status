# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function mydate() {
cat<<EOF
{
	"name": "date",
	"full_text": "$(date '+%A, %d %b %Y')"
}
EOF
}
