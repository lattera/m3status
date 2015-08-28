# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function volume() {
cat<<EOF
{
	"name": "volume",
	"full_text": "Volume: $(mixer -s vol | awk '{print $2;}')"
}
EOF
}
