taskwarrior_detect() {
	if command -v task >/dev/null 2>&1 ; then
		return 0
	else
		echo "   ❌ taskwarrior not detected in this system"
	fi
}

# Print a specific report using a common pattern
# Usage: taskwarrior_report "count" "emoji" "one" "many" "command" "color"
# If count is 0, it does not print anything.
# Otherwise, it prints a text using the emoji, kind and command given.
taskwarrior_report_line() {
	white=$(tput setaf 15)
	gray=$(tput setaf 8)
	normal=$(tput sgr0)
	color=$6
	if [ $1 -eq 1 ]; then
		echo "   $2 ${color}$1 task${white} is $3. Run ${gray}\`$5\`${white} to inspect it.${normal}"
	elif [ $1 -ge 1 ]; then
		echo "   $2 ${color}$1 tasks${white} are $4. Run ${gray}\`$5\`${white} to inspect them.${normal}"
	fi
}

taskwarrior_report() {
	echo
	if ! taskwarrior_detect ; then
		return 0
	fi

	taskwarrior_report_line "$(task count +OVERDUE)" "⏰" "is OVERDUE" "are OVERDUE" "task overdue" "$(tput setaf 9)"
	taskwarrior_report_line "$(task count +READY +TODAY)" "🔥" "is due today" "are due today" "task +TODAY" "$(tput setaf 11)"
	taskwarrior_report_line "$(task count +READY +TOMORROW)" "📅" "is due tomorrow" "are due tomorrow" "task +TOMORROW" "$(tput setaf 14)"
	taskwarrior_report_line "$(task count +ACTIVE)" "✅" "is active" "are active" "task active" "$(tput setaf 10)"
	echo
}

taskwarrior_report
