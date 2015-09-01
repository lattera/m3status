function vbox() {
    local boxen=""
    VBoxManage list runningvms | while read line; do
        vm=$(echo ${line} | sed 's/" .*/"/')
        vm=$(echo ${vm} | sed 's/"//g')
        if [ ! -z ${boxen} ]; then
            boxen="${boxen}, "
        fi

        boxen="${boxen}${vm}"
    done

    cat <<EOF
    {
        "name": "VBox_VMs",
        "full_text": "Running VBox VMs: ${boxen}"
    }
EOF
}
