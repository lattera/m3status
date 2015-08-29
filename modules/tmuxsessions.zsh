function tmuxsessions() {
	local sessions=""

	foreach line in $(tmux ls -F '#{session_name}'); do

		if [ ! -z ${sessions} ]; then
			sessions="${sessions} "
		fi

		sessions="${sessions}${line}"
	done

	if [ -z ${sessions} ]; then
		sessionse="NONE"
	fi

	cat<<EOF
		{
			"name": "tmux_sessions",
			"full_text": "tmux sessions: ${sessions}"
		}
EOF
}
