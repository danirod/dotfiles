function git_pick_hash {
	# Presents a fzf search with the list of commits
	git log --pretty=oneline --abbrev-commit --reverse | fzf --tac | cut -d' ' -f1
}
