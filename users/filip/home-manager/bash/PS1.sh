print_hostname() {
	echo -n "$(hostname)"
}

print_path() {
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		repo_root=$(git rev-parse --show-toplevel)
		rel_path=$(realpath --relative-to="$repo_root" "$(pwd)")
		# echo -n "$(basename "$repo_root")/$rel_path"
		echo -n "/$rel_path"
	else
		echo -n "$(pwd | sed "s|^$HOME|~|")"
	fi
}

print_time() {
	echo -n "$(date +%H:%M)"
}

change_group() {
	echo -ne "\[\e[38;2;${last_group};48;2;${1};${2};${3}m\]\[\e[38;2;${4};${5};${6}m\]"
	last_group="${1};${2};${3}"
}

end_groups() {
	echo -ne "\[\e[0;38;2;${last_group}m\]\[\e[0m\]"
}

change_color_fg() {
	echo -ne "\[\e[38;2;${1};${2};${3}m\]"
}

change_color() {
	echo -ne "\[\e[38;2;${1};${2};${3};48;2;${4};${5};${6}m\]"
	last_group="${4};${5};${6}"
}

hex_to_dec() {
	hex=$1

	r=${hex:0:2}
	g=${hex:2:2}
	b=${hex:4:2}

	printf "%d %d %d\n" 0x$r 0x$g 0x$b
}

is_in_git_repo() {
	[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]
}

print_git() {
	if is_in_git_repo; then
		echo -n " "
		git rev-parse --abbrev-ref HEAD 2>/dev/null | head --bytes=-1
		return 1
	fi
}

print_shell_lvl() {
	if [ "$SHLVL" -gt 1 ]; then
		echo -n " $(($SHLVL - 1))"
		return 1
	fi
}

theme_text=$(hex_to_dec ffffff)
theme_text_dark=$(hex_to_dec 3f2f1f)

theme_one=$(hex_to_dec 492512)
theme_two=$(hex_to_dec 814D1B)
theme_three=$(hex_to_dec 958869)
theme_four=$(hex_to_dec BCA687)
theme_five=$(hex_to_dec 8F8375)

theme_error=$(hex_to_dec D03000)

group_one() {
	change_color $theme_text $theme_one
	echo -n " "
	print_hostname
	echo -n " "
}

group_two() {
	change_group $theme_two $theme_text
	echo -n " "
	print_path
	echo -n " "
}

group_three() {
	text=$(print_git)
	ret=$?
	text+=$(print_shell_lvl)
	ret+=$?

	if [ $ret -gt 0 ]; then
		change_group $theme_three $theme_text_dark
		echo -n "$text"
		echo -n " "
	fi
}

group_four() {
	change_group $theme_four $theme_text_dark
	echo -n " "
	print_time
	echo -n " "
}

groups_end() {
	end_groups
}

generate_prompt() {
	success=$?
	last_group=""
	echo
	group_one
	group_two
	group_three
	group_four
	groups_end
	echo

	if [ $success != "0" ]; then
		change_color_fg $theme_error
		echo -n "[$success] "
	fi

	change_color_fg $theme_four
	echo -n "ඞ "
	echo -en "\[\e[0m\] "
}

PROMPT_COMMAND='PS1=$(generate_prompt)'
