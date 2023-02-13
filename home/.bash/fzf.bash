function git_pick_hash {
	# Presents a fzf search with the list of commits
	git log --pretty=oneline --abbrev-commit --reverse | fzf --tac | cut -d' ' -f1
}

export FZF_DEFAULT_OPTS="--color=16,border:white --preview-window='right,border-none,<50(up,50%,border-bottom)'"
