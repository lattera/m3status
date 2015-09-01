# Copyright (c) 2015 Shawn Webb
# License: 2-clause BSD

function loadavg() {
    local avg=""
    if [ $(uname) = "Linux" ]; then
        avg=$(uptime | sed 's/.*load average: //' | awk -F\, '{print $1 $2 $3}')
    else
        avg=$(uptime | sed 's/.*load averages: //' | awk -F\, '{print $1 $2 $3}')
    fi

    cat<<EOF
    {
        "name": "loadavg",
        "full_text": "Load: ${avg}"
    }
EOF
}
